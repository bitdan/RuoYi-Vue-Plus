package com.ruoyi.game.config;

import com.ruoyi.common.websocket.interceptor.PlusWebSocketInterceptor;
import com.ruoyi.game.websocket.GomokuWebSocketHandler;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class GomokuWebSocketConfig implements WebSocketConfigurer {

    private final GomokuWebSocketHandler gomokuWebSocketHandler;
    private final PlusWebSocketInterceptor webSocketInterceptor;

    public GomokuWebSocketConfig(GomokuWebSocketHandler gomokuWebSocketHandler,
                                PlusWebSocketInterceptor webSocketInterceptor) {
        this.gomokuWebSocketHandler = gomokuWebSocketHandler;
        this.webSocketInterceptor = webSocketInterceptor;
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(gomokuWebSocketHandler, "/ws/gomoku")
            .addInterceptors(webSocketInterceptor)
            .setAllowedOrigins("*");
    }
} 