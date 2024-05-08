package com.ruoyi.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.system.domain.bo.TGlobalAppBo;
import com.ruoyi.system.domain.vo.TGlobalAppVo;
import com.ruoyi.system.domain.TGlobalApp;
import com.ruoyi.system.mapper.TGlobalAppMapper;
import com.ruoyi.system.service.ITGlobalAppService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 全局应用Service业务层处理
 *
 * @author xiuer
 * @date 2024-05-08
 */
@RequiredArgsConstructor
@Service
public class TGlobalAppServiceImpl implements ITGlobalAppService {

    private final TGlobalAppMapper baseMapper;

    /**
     * 查询全局应用
     */
    @Override
    public TGlobalAppVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询全局应用列表
     */
    @Override
    public TableDataInfo<TGlobalAppVo> queryPageList(TGlobalAppBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<TGlobalApp> lqw = buildQueryWrapper(bo);
        Page<TGlobalAppVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询全局应用列表
     */
    @Override
    public List<TGlobalAppVo> queryList(TGlobalAppBo bo) {
        LambdaQueryWrapper<TGlobalApp> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<TGlobalApp> buildQueryWrapper(TGlobalAppBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<TGlobalApp> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getCode()), TGlobalApp::getCode, bo.getCode());
        lqw.eq(StringUtils.isNotBlank(bo.getDescription()), TGlobalApp::getDescription, bo.getDescription());
        lqw.eq(bo.getAuthType() != null, TGlobalApp::getAuthType, bo.getAuthType());
        lqw.eq(bo.getSvcAuthorization() != null, TGlobalApp::getSvcAuthorization, bo.getSvcAuthorization());
        lqw.eq(bo.getStatus() != null, TGlobalApp::getStatus, bo.getStatus());
        lqw.eq(bo.getCreateOn() != null, TGlobalApp::getCreateOn, bo.getCreateOn());
        lqw.eq(bo.getUpdateOn() != null, TGlobalApp::getUpdateOn, bo.getUpdateOn());
        lqw.eq(StringUtils.isNotBlank(bo.getExtend1()), TGlobalApp::getExtend1, bo.getExtend1());
        lqw.eq(StringUtils.isNotBlank(bo.getExtend2()), TGlobalApp::getExtend2, bo.getExtend2());
        lqw.eq(StringUtils.isNotBlank(bo.getExtend3()), TGlobalApp::getExtend3, bo.getExtend3());
        return lqw;
    }

    /**
     * 新增全局应用
     */
    @Override
    public Boolean insertByBo(TGlobalAppBo bo) {
        TGlobalApp add = BeanUtil.toBean(bo, TGlobalApp.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改全局应用
     */
    @Override
    public Boolean updateByBo(TGlobalAppBo bo) {
        TGlobalApp update = BeanUtil.toBean(bo, TGlobalApp.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(TGlobalApp entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除全局应用
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
