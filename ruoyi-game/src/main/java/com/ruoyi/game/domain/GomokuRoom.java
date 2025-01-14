package com.ruoyi.game.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 五子棋房间对象 gomoku_room
 *
 * @author ruoyi
 * @date 2025-01-14
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("gomoku_room")
public class GomokuRoom extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 主键ID
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 房间ID
     */
    private String roomId;
    /**
     * 房主用户ID
     */
    private String hostId;
    /**
     * 对手用户ID
     */
    private String guestId;
    /**
     * 房间状态：WAITING-等待中，PLAYING-游戏中，FINISHED-已结束
     */
    private String status;
    /**
     * 游戏状态JSON
     */
    private String gameState;
    /**
     * 备注
     */
    private String remark;
    /**
     * 删除标志
     */
    @TableLogic
    private Long delFlag;

}
