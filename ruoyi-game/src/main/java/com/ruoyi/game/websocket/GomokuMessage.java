package com.ruoyi.game.websocket;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GomokuMessage {
    /**
     * 消息类型
     * JOIN: 加入房间
     * MOVE: 落子
     * LEAVE: 离开房间
     * RESTART: 重新开始
     * ERROR: 错误消息
     */
    private String type;

    /**
     * 房间ID
     */
    private String roomId;

    /**
     * 消息数据
     */
    private Map<String, Object> data;
}
