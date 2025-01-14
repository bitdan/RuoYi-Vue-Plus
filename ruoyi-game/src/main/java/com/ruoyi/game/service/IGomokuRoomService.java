package com.ruoyi.game.service;

import com.ruoyi.common.core.domain.PageQuery;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.game.domain.bo.GomokuRoomBo;
import com.ruoyi.game.domain.vo.GomokuRoomVo;

import java.util.Collection;
import java.util.List;

/**
 * 五子棋房间Service接口
 *
 * @author ruoyi
 * @date 2025-01-14
 */
public interface IGomokuRoomService {

    /**
     * 查询五子棋房间
     */
    GomokuRoomVo queryById(Long id);

    /**
     * 查询五子棋房间列表
     */
    TableDataInfo<GomokuRoomVo> queryPageList(GomokuRoomBo bo, PageQuery pageQuery);

    /**
     * 查询五子棋房间列表
     */
    List<GomokuRoomVo> queryList(GomokuRoomBo bo);

    /**
     * 新增五子棋房间
     */
    Boolean insertByBo(GomokuRoomBo bo);

    /**
     * 修改五子棋房间
     */
    Boolean updateByBo(GomokuRoomBo bo);

    /**
     * 校验并批量删除五子棋房间信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
