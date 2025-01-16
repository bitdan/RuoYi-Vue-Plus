package com.ruoyi.game.domain;

import lombok.Data;

@Data
public class GomokuRoom {
    /**
     * 房间ID
     */
    private String roomId;

    /**
     * 黑方玩家ID
     */
    private Long blackPlayerId;

    /**
     * 白方玩家ID
     */
    private Long whitePlayerId;

    /**
     * 当前玩家颜色
     */
    private String currentPlayer = "black";

    /**
     * 棋盘状态 0:空 1:黑子 2:白子
     */
    private int[][] board = new int[15][15];

    /**
     * 根据颜色获取玩家ID
     */
    public Long getPlayerIdByColor(String color) {
        return "black".equals(color) ? blackPlayerId : whitePlayerId;
    }

    /**
     * 检查指定位置是否有棋子
     */
    public boolean hasChess(int x, int y) {
        return board[y][x] != 0;
    }

    /**
     * 落子
     */
    public void makeMove(int x, int y) {
        board[y][x] = "black".equals(currentPlayer) ? 1 : 2;
        currentPlayer = "black".equals(currentPlayer) ? "white" : "black";
    }

    /**
     * 检查是否获胜
     */
    public boolean checkWin(int x, int y) {
        int player = board[y][x];
        int[][] directions = {
            {1, 0},   // 水平
            {0, 1},   // 垂直
            {1, 1},   // 对角线
            {1, -1}   // 反对角线
        };

        for (int[] dir : directions) {
            int count = 1;
            int dx = dir[0];
            int dy = dir[1];

            // 正向检查
            for (int i = 1; i < 5; i++) {
                int newX = x + dx * i;
                int newY = y + dy * i;
                if (newX < 0 || newX >= 15 || newY < 0 || newY >= 15 || board[newY][newX] != player) {
                    break;
                }
                count++;
            }

            // 反向检查
            for (int i = 1; i < 5; i++) {
                int newX = x - dx * i;
                int newY = y - dy * i;
                if (newX < 0 || newX >= 15 || newY < 0 || newY >= 15 || board[newY][newX] != player) {
                    break;
                }
                count++;
            }

            if (count >= 5) {
                return true;
            }
        }
        return false;
    }

    /**
     * 重新开始游戏
     */
    public void restart() {
        board = new int[15][15];
        currentPlayer = "black";
    }
}
