package com.ruoyi.game.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.helper.LoginHelper;
import com.ruoyi.game.service.IGomokuRoomService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 五子棋房间
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/game/room")
public class GomokuRoomController extends BaseController {

    private final IGomokuRoomService gomokuRoomService;



    /**
     * 创建五子棋房间
     */
    @PostMapping("/create")
    public R<String> createRoom() {
        Long userId = LoginHelper.getUserId();
        String roomId = gomokuRoomService.createRoom(userId);
        return R.ok("创建成功", roomId);
    }

    /**
     * 加入五子棋房间
     */
    @PostMapping("/join/{roomId}")
    public R<Void> joinRoom(@PathVariable String roomId) {
        Long userId = LoginHelper.getUserId();
        boolean success = gomokuRoomService.joinRoom(roomId, userId);
        if (!success) {
            return R.fail("加入房间失败，房间可能已满或不存在");
        }
        return R.ok("加入成功");
    }

    /**
     * 离开五子棋房间
     */
    @PostMapping("/leave/{roomId}")
    public R<Void> leaveRoom(@PathVariable String roomId) {
        Long userId = LoginHelper.getUserId();
        boolean success = gomokuRoomService.leaveRoom(roomId, userId);
        if (!success) {
            return R.fail("离开房间失败，房间不存在或您不在该房间中");
        }
        return R.ok("离开成功");
    }
}
