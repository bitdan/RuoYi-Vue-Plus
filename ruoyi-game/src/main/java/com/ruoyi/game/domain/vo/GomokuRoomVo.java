package com.ruoyi.game.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * 五子棋房间视图对象 gomoku_room
 *
 * @author ruoyi
 * @date 2025-01-14
 */
@Data
@ExcelIgnoreUnannotated
public class GomokuRoomVo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @ExcelProperty(value = "主键ID")
    private Long id;

    /**
     * 房间ID
     */
    @ExcelProperty(value = "房间ID")
    private String roomId;

    /**
     * 房主用户ID
     */
    @ExcelProperty(value = "房主用户ID")
    private String hostId;

    /**
     * 对手用户ID
     */
    @ExcelProperty(value = "对手用户ID")
    private String guestId;

    /**
     * 房间状态：WAITING-等待中，PLAYING-游戏中，FINISHED-已结束
     */
    @ExcelProperty(value = "房间状态：WAITING-等待中，PLAYING-游戏中，FINISHED-已结束")
    private String status;

    /**
     * 游戏状态JSON
     */
    @ExcelProperty(value = "游戏状态JSON")
    private String gameState;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
