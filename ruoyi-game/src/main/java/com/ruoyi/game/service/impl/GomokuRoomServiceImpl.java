package com.ruoyi.game.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.domain.PageQuery;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.game.domain.GomokuRoom;
import com.ruoyi.game.domain.bo.GomokuRoomBo;
import com.ruoyi.game.domain.vo.GomokuRoomVo;
import com.ruoyi.game.mapper.GomokuRoomMapper;
import com.ruoyi.game.service.IGomokuRoomService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 五子棋房间Service业务层处理
 *
 * @author ruoyi
 * @date 2025-01-14
 */
@RequiredArgsConstructor
@Service
public class GomokuRoomServiceImpl implements IGomokuRoomService {

    private final GomokuRoomMapper baseMapper;
    
    // 内存中的房间状态缓存
    private final Map<String, GomokuRoom> roomCache = new ConcurrentHashMap<>();

    /**
     * 查询五子棋房间
     */
    @Override
    public GomokuRoomVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询五子棋房间列表
     */
    @Override
    public TableDataInfo<GomokuRoomVo> queryPageList(GomokuRoomBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<GomokuRoom> lqw = buildQueryWrapper(bo);
        Page<GomokuRoomVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询五子棋房间列表
     */
    @Override
    public List<GomokuRoomVo> queryList(GomokuRoomBo bo) {
        LambdaQueryWrapper<GomokuRoom> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<GomokuRoom> buildQueryWrapper(GomokuRoomBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<GomokuRoom> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getRoomId()), GomokuRoom::getRoomId, bo.getRoomId());
        lqw.eq(StringUtils.isNotBlank(bo.getHostId()), GomokuRoom::getHostId, bo.getHostId());
        lqw.eq(StringUtils.isNotBlank(bo.getGuestId()), GomokuRoom::getGuestId, bo.getGuestId());
        lqw.eq(StringUtils.isNotBlank(bo.getStatus()), GomokuRoom::getStatus, bo.getStatus());
        lqw.eq(StringUtils.isNotBlank(bo.getGameState()), GomokuRoom::getGameState, bo.getGameState());
        return lqw;
    }

    /**
     * 新增五子棋房间
     */
    @Override
    public Boolean insertByBo(GomokuRoomBo bo) {
        GomokuRoom add = BeanUtil.toBean(bo, GomokuRoom.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
            // 添加到缓存
            roomCache.put(add.getRoomId(), add);
        }
        return flag;
    }

    /**
     * 修改五子棋房间
     */
    @Override
    public Boolean updateByBo(GomokuRoomBo bo) {
        GomokuRoom update = BeanUtil.toBean(bo, GomokuRoom.class);
        validEntityBeforeSave(update);
        boolean success = baseMapper.updateById(update) > 0;
        if (success) {
            // 更新缓存
            roomCache.put(update.getRoomId(), update);
        }
        return success;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(GomokuRoom entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除五子棋房间
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid) {
            // 从缓存中移除
            List<GomokuRoom> rooms = baseMapper.selectBatchIds(ids);
            rooms.forEach(room -> roomCache.remove(room.getRoomId()));
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    // 游戏相关方法实现
    @Override
    public GomokuRoom getByRoomId(String roomId) {
        return roomCache.get(roomId);
    }

    @Override
    public boolean isValidMove(String roomId, Long userId, Map<String, Object> moveData) {
        GomokuRoom room = getByRoomId(roomId);
        if (room == null) {
            return false;
        }

        // 检查是否轮到该玩家
        if (!isPlayerTurn(room, userId)) {
            return false;
        }

        // 检查移动是否在棋盘范围内
        int x = ((Number) moveData.get("x")).intValue();
        int y = ((Number) moveData.get("y")).intValue();
        if (!isValidPosition(x, y)) {
            return false;
        }

        // 检查位置是否已被占用
        return !isPositionOccupied(room, x, y);
    }

    @Override
    public String createRoom(Long hostId) {
        String roomId = generateRoomId();
        GomokuRoom room = new GomokuRoom();
        room.setRoomId(roomId);
        room.setHostId(String.valueOf(hostId));
        room.setStatus("WAITING");
        room.setGameState("{}"); // 初始化游戏状态

        GomokuRoomBo bo = BeanUtil.toBean(room, GomokuRoomBo.class);
        if (insertByBo(bo)) {
            return roomId;
        }
        return null;
    }

    @Override
    public boolean joinRoom(String roomId, Long guestId) {
        GomokuRoom room = getByRoomId(roomId);
        if (room == null || !"WAITING".equals(room.getStatus())) {
            return false;
        }

        room.setGuestId(String.valueOf(guestId));
        room.setStatus("PLAYING");
        
        GomokuRoomBo bo = BeanUtil.toBean(room, GomokuRoomBo.class);
        return updateByBo(bo);
    }

    @Override
    public boolean leaveRoom(String roomId, Long userId) {
        GomokuRoom room = getByRoomId(roomId);
        if (room == null) {
            return false;
        }

        if (String.valueOf(userId).equals(room.getHostId()) || 
            String.valueOf(userId).equals(room.getGuestId())) {
            room.setStatus("ENDED");
            GomokuRoomBo bo = BeanUtil.toBean(room, GomokuRoomBo.class);
            return updateByBo(bo);
        }
        return false;
    }

    @Override
    public boolean makeMove(String roomId, Long userId, int x, int y) {
        GomokuRoom room = getByRoomId(roomId);
        if (room == null || !"PLAYING".equals(room.getStatus())) {
            return false;
        }

        Map<String, Object> moveMap = new HashMap<>();
        moveMap.put("x", x);
        moveMap.put("y", y);
        if (!isValidMove(roomId, userId, moveMap)) {
            return false;
        }

        // 更新游戏状态
        updateGameState(room, x, y, userId);
        
        GomokuRoomBo bo = BeanUtil.toBean(room, GomokuRoomBo.class);
        return updateByBo(bo);
    }

    // 辅助方法
    private String generateRoomId() {
        return "ROOM_" + UUID.randomUUID().toString().substring(0, 8);
    }

    private boolean isPlayerTurn(GomokuRoom room, Long userId) {
        // 实现判断是否轮到该玩家的逻辑
        return true; // 临时返回，需要根据实际游戏状态判断
    }

    private boolean isValidPosition(int x, int y) {
        return x >= 0 && x < 15 && y >= 0 && y < 15;
    }

    private boolean isPositionOccupied(GomokuRoom room, int x, int y) {
        // 实现判断位置是否被占用的逻辑
        return false; // 临时返回，需要根据实际游戏状态判断
    }

    private void updateGameState(GomokuRoom room, int x, int y, Long userId) {
        // 实现更新游戏状态的逻辑
    }
}
