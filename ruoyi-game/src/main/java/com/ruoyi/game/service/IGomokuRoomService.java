package com.ruoyi.game.service;

import com.ruoyi.game.domain.GomokuRoom;

public interface IGomokuRoomService {


    /**
     * 创建房间
     *
     * @param userId 创建者ID
     * @return 房间ID
     */
    String createRoom(Long userId);

    /**
     * 加入房间
     *
     * @param roomId 房间ID
     * @param userId 用户ID
     * @return 是否成功
     */
    boolean joinRoom(String roomId, Long userId);

    /**
     * 离开房间
     *
     * @param roomId 房间ID
     * @param userId 用户ID
     * @return 是否成功
     */
    boolean leaveRoom(String roomId, Long userId);

    /**
     * 根据房间ID获取房间
     *
     * @param roomId 房间ID
     * @return 房间信息
     */
    GomokuRoom getByRoomId(String roomId);
}
