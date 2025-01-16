package com.ruoyi.game.websocket;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GomokuMessage {
    private String type;
    private String roomId;
    private Map<String, Object> data;
} 