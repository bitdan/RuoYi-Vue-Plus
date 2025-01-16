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
    private final Map<String, WebSocketSession> roomSessions = new ConcurrentHashMap<>();

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

        switch (gomokuMessage.getType()) {
            case "JOIN":
                handleJoinRoom(session, loginUser, roomId);
                break;
            case "MOVE":
                handleMove(session, loginUser, roomId, gomokuMessage.getData());
                break;
            case "LEAVE":
                handleLeaveRoom(session, loginUser, roomId);
                break;
            default:
                log.warn("Unknown message type: {}", gomokuMessage.getType());
        }
    }

    private void handleJoinRoom(WebSocketSession session, LoginUser loginUser, String roomId) throws IOException {
        GomokuRoom room = gomokuRoomService.getByRoomId(roomId);
        if (room == null) {
            sendError(session, "Room not found");
            return;
        }

        // 将session加入房间
        roomSessions.put(roomId, session);

        // 通知房间内其他玩家
        Map<String, Object> data = new HashMap<>();
        data.put("userId", loginUser.getUserId());
        data.put("username", loginUser.getUsername());
        notifyRoomPlayers(roomId, new GomokuMessage("JOIN", roomId, data));
    }

    private void handleMove(WebSocketSession session, LoginUser loginUser, String roomId, Map<String, Object> data) throws IOException {
        // 验证移动是否合法
        if (!gomokuRoomService.isValidMove(roomId, loginUser.getUserId(), data)) {
            sendError(session, "Invalid move");
            return;
        }

        // 广播移动信息给房间内所有玩家
        notifyRoomPlayers(roomId, new GomokuMessage("MOVE", roomId, data));
    }

    private void handleLeaveRoom(WebSocketSession session, LoginUser loginUser, String roomId) throws IOException {
        roomSessions.remove(roomId);
        Map<String, Object> data = new HashMap<>();
        data.put("userId", loginUser.getUserId());
        data.put("username", loginUser.getUsername());
        notifyRoomPlayers(roomId, new GomokuMessage("LEAVE", roomId, data));
    }

    private void sendError(WebSocketSession session, String message) throws IOException {
        Map<String, Object> errorData = new HashMap<>();
        errorData.put("message", message);
        session.sendMessage(new TextMessage(objectMapper.writeValueAsString(
            new GomokuMessage("ERROR", null, errorData)
        )));
    }

    private void notifyRoomPlayers(String roomId, GomokuMessage message) throws IOException {
        WebSocketSession session = roomSessions.get(roomId);
        if (session != null && session.isOpen()) {
            session.sendMessage(new TextMessage(objectMapper.writeValueAsString(message)));
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
        LoginUser loginUser = (LoginUser) session.getAttributes().get(LOGIN_USER_KEY);
        if (ObjectUtil.isNull(loginUser)) {
            log.info("[disconnect] invalid token received. sessionId: {}", session.getId());
            return;
        }
        WebSocketSessionHolder.removeSession(loginUser.getUserId());
        log.info("[disconnect] sessionId: {}, userId: {}", session.getId(), loginUser.getUserId());
    }
}
