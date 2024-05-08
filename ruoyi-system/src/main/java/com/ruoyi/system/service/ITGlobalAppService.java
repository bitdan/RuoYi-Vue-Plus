package com.ruoyi.system.service;

import com.ruoyi.system.domain.TGlobalApp;
import com.ruoyi.system.domain.vo.TGlobalAppVo;
import com.ruoyi.system.domain.bo.TGlobalAppBo;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 全局应用Service接口
 *
 * @author xiuer
 * @date 2024-05-08
 */
public interface ITGlobalAppService {

    /**
     * 查询全局应用
     */
    TGlobalAppVo queryById(Long id);

    /**
     * 查询全局应用列表
     */
    TableDataInfo<TGlobalAppVo> queryPageList(TGlobalAppBo bo, PageQuery pageQuery);

    /**
     * 查询全局应用列表
     */
    List<TGlobalAppVo> queryList(TGlobalAppBo bo);

    /**
     * 新增全局应用
     */
    Boolean insertByBo(TGlobalAppBo bo);

    /**
     * 修改全局应用
     */
    Boolean updateByBo(TGlobalAppBo bo);

    /**
     * 校验并批量删除全局应用信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
