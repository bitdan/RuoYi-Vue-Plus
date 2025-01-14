package com.ruoyi.game.domain.bo;

import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * 五子棋房间业务对象 gomoku_room
 *
 * @author ruoyi
 * @date 2025-01-14
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class GomokuRoomBo extends BaseEntity {

    /**
     * 主键ID
     */
    @NotNull(message = "主键ID不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 房间ID
     */
    @NotBlank(message = "房间ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private String roomId;

    /**
     * 房主用户ID
     */
    @NotBlank(message = "房主用户ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private String hostId;

    /**
     * 对手用户ID
     */
    @NotBlank(message = "对手用户ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private String guestId;

    /**
     * 房间状态：WAITING-等待中，PLAYING-游戏中，FINISHED-已结束
     */
    @NotBlank(message = "房间状态：WAITING-等待中，PLAYING-游戏中，FINISHED-已结束不能为空", groups = { AddGroup.class, EditGroup.class })
    private String status;

    /**
     * 游戏状态JSON
     */
    @NotBlank(message = "游戏状态JSON不能为空", groups = { AddGroup.class, EditGroup.class })
    private String gameState;

    /**
     * 备注
     */
    @NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;


}
