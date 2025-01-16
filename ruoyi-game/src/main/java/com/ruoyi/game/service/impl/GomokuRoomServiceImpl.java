package com.ruoyi.game.service.impl;

import com.ruoyi.game.domain.GomokuRoom;
import com.ruoyi.game.service.IGomokuRoomService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

@Slf4j
@Service
@RequiredArgsConstructor
public class GomokuRoomServiceImpl implements IGomokuRoomService {


    // 使用内存存储房间信息，也可以改为使用Redis
    private final Map<String, GomokuRoom> rooms = new ConcurrentHashMap<>();

    @Override
    public String createRoom(Long userId) {
        String roomId = generateRoomId();
        GomokuRoom room = new GomokuRoom();
        room.setRoomId(roomId);
        room.setBlackPlayerId(userId); // 创建者默认为黑方
        rooms.put(roomId, room);
        return roomId;
    }

    @Override
    public boolean joinRoom(String roomId, Long userId) {
        GomokuRoom room = rooms.get(roomId);
        if (room == null) {
            return false;
        }

        // 如果是房主重新加入
        if (userId.equals(room.getBlackPlayerId())) {
            return true;
        }

        // 如果已经有两个玩家了
        if (room.getWhitePlayerId() != null && !userId.equals(room.getWhitePlayerId())) {
            return false;
        }

        // 加入为白方
        room.setWhitePlayerId(userId);
        return true;
    }

    @Override
    public boolean leaveRoom(String roomId, Long userId) {
        GomokuRoom room = rooms.get(roomId);
        if (room == null) {
            return false;
        }

        // 如果是黑方离开，直接删除房间
        if (userId.equals(room.getBlackPlayerId())) {
            rooms.remove(roomId);
            return true;
        }

        // 如果是白方离开，清除白方信息
        if (userId.equals(room.getWhitePlayerId())) {
            room.setWhitePlayerId(null);
            room.restart(); // 重置游戏状态
            return true;
        }

        return false;
    }

    @Override
    public GomokuRoom getByRoomId(String roomId) {
        return rooms.get(roomId);
    }

    /**
     * 生成房间ID
     */
    private String generateRoomId() {
        return "ROOM_" + UUID.randomUUID().toString().substring(0, 8);
    }
}
