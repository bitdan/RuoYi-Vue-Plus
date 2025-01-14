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

import java.util.Collection;
import java.util.List;
import java.util.Map;

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
        return baseMapper.updateById(update) > 0;
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
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
