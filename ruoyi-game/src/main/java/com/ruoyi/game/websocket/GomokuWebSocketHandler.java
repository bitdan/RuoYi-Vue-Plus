package com.ruoyi.game.websocket;

import cn.hutool.core.util.ObjectUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.websocket.holder.WebSocketSessionHolder;
import com.ruoyi.game.domain.GomokuRoom;
import com.ruoyi.game.service.IGomokuRoomService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import static com.ruoyi.common.websocket.constant.WebSocketConstants.LOGIN_USER_KEY;

@Slf4j
@Component
@RequiredArgsConstructor
public class GomokuWebSocketHandler extends TextWebSocketHandler {

    private final IGomokuRoomService gomokuRoomService;
    private final ObjectMapper objectMapper;

    // 房间ID -> WebSocketSession映射
    private final Map<String, Map<Long, WebSocketSession>> roomSessions = new ConcurrentHashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws IOException {
        LoginUser loginUser = (LoginUser) session.getAttributes().get(LOGIN_USER_KEY);
        if (ObjectUtil.isNull(loginUser)) {
            session.close(CloseStatus.BAD_DATA);
            log.info("[connect] invalid token received. sessionId: {}", session.getId());
            return;
        }
        WebSocketSessionHolder.addSession(loginUser.getUserId(), session);
        log.info("[connect] sessionId: {}, userId: {}", session.getId(), loginUser.getUserId());
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        LoginUser loginUser = (LoginUser) session.getAttributes().get(LOGIN_USER_KEY);
        String payload = message.getPayload();

        // 解析消息
        GomokuMessage gomokuMessage = objectMapper.readValue(payload, GomokuMessage.class);
        String roomId = gomokuMessage.getRoomId();
        Map<String, Object> data = gomokuMessage.getData();

        switch (gomokuMessage.getType()) {
            case "JOIN":
                handleJoin(session, loginUser, roomId);
                break;
            case "MOVE":
                handleMove(session, loginUser, roomId, data);
                break;
            case "LEAVE":
                handleLeave(session, loginUser, roomId);
                break;
            case "RESTART":
                handleRestart(session, loginUser, roomId);
                break;
            default:
                log.warn("Unknown message type: {}", gomokuMessage.getType());
        }
    }

    private void handleJoin(WebSocketSession session, LoginUser loginUser, String roomId) throws IOException {
        GomokuRoom room = gomokuRoomService.getByRoomId(roomId);
        if (room == null) {
            sendError(session, "Room not found");
            return;
        }

        // 将session加入房间
        roomSessions.computeIfAbsent(roomId, k -> new ConcurrentHashMap<>())
            .put(loginUser.getUserId(), session);

        // 通知房间内其他玩家
        Map<String, Object> data = new HashMap<>();
        data.put("userId", loginUser.getUserId());
        data.put("username", loginUser.getUsername());
        notifyRoomPlayers(roomId, new GomokuMessage("JOIN", roomId, data));
    }

    private void handleMove(WebSocketSession session, LoginUser loginUser, String roomId, Map<String, Object> data) throws IOException {
        GomokuRoom room = gomokuRoomService.getByRoomId(roomId);
        if (room == null) {
            sendError(session, "Room not found");
            return;
        }

        // 验证是否轮到该玩家
        String currentPlayer = room.getCurrentPlayer();
        if (!loginUser.getUserId().equals(room.getPlayerIdByColor(currentPlayer))) {
            sendError(session, "Not your turn");
            return;
        }

        // 验证落子位置是否合法
        Integer x = (Integer) data.get("x");
        Integer y = (Integer) data.get("y");
        if (x == null || y == null || x < 0 || x >= 15 || y < 0 || y >= 15) {
            sendError(session, "Invalid move position");
            return;
        }

        // 验证该位置是否已有棋子
        if (room.hasChess(x, y)) {
            sendError(session, "Position already occupied");
            return;
        }

        // 更新棋盘状态
        room.makeMove(x, y);
        
        // 检查是否获胜
        boolean isWin = room.checkWin(x, y);
        if (isWin) {
            data.put("winner", currentPlayer);
        }

        // 广播移动信息给房间内所有玩家
        notifyRoomPlayers(roomId, new GomokuMessage("MOVE", roomId, data));
    }

    private void handleLeave(WebSocketSession session, LoginUser loginUser, String roomId) throws IOException {
        // 从房间移除session
        Map<Long, WebSocketSession> sessions = roomSessions.get(roomId);
        if (sessions != null) {
            sessions.remove(loginUser.getUserId());
            if (sessions.isEmpty()) {
                roomSessions.remove(roomId);
            }
        }

        // 通知其他玩家
        Map<String, Object> data = new HashMap<>();
        data.put("userId", loginUser.getUserId());
        data.put("username", loginUser.getUsername());
        notifyRoomPlayers(roomId, new GomokuMessage("LEAVE", roomId, data));
    }

    private void handleRestart(WebSocketSession session, LoginUser loginUser, String roomId) throws IOException {
        GomokuRoom room = gomokuRoomService.getByRoomId(roomId);
        if (room == null) {
            sendError(session, "Room not found");
            return;
        }

        // 重置房间状态
        room.restart();

        // 通知所有玩家
        notifyRoomPlayers(roomId, new GomokuMessage("RESTART", roomId, new HashMap<>()));
    }

    private void sendError(WebSocketSession session, String message) throws IOException {
        Map<String, Object> errorData = new HashMap<>();
        errorData.put("message", message);
        session.sendMessage(new TextMessage(objectMapper.writeValueAsString(
            new GomokuMessage("ERROR", null, errorData)
        )));
    }

    private void notifyRoomPlayers(String roomId, GomokuMessage message) throws IOException {
        Map<Long, WebSocketSession> sessions = roomSessions.get(roomId);
        if (sessions != null) {
            String messageStr = objectMapper.writeValueAsString(message);
            for (WebSocketSession session : sessions.values()) {
                if (session.isOpen()) {
                    session.sendMessage(new TextMessage(messageStr));
                }
            }
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
        LoginUser loginUser = (LoginUser) session.getAttributes().get(LOGIN_USER_KEY);
        if (ObjectUtil.isNull(loginUser)) {
            log.info("[disconnect] invalid token received. sessionId: {}", session.getId());
            return;
        }

        // 清理房间session
        for (Map<Long, WebSocketSession> sessions : roomSessions.values()) {
            sessions.remove(loginUser.getUserId());
        }

        WebSocketSessionHolder.removeSession(loginUser.getUserId());
        log.info("[disconnect] sessionId: {}, userId: {}", session.getId(), loginUser.getUserId());
    }
}
