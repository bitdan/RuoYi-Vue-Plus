package com.ruoyi.game.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.annotation.RepeatSubmit;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.PageQuery;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.game.domain.bo.GomokuRoomBo;
import com.ruoyi.game.domain.vo.GomokuRoomVo;
import com.ruoyi.game.service.IGomokuRoomService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Arrays;
import java.util.List;

/**
 * 五子棋房间
 *
 * @author ruoyi
 * @date 2025-01-14
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/game/room")
public class GomokuRoomController extends BaseController {

    private final IGomokuRoomService iGomokuRoomService;

    /**
     * 查询五子棋房间列表
     */
    @SaCheckPermission("game:room:list")
    @GetMapping("/list")
    public TableDataInfo<GomokuRoomVo> list(GomokuRoomBo bo, PageQuery pageQuery) {
        return iGomokuRoomService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出五子棋房间列表
     */
    @SaCheckPermission("game:room:export")
    @Log(title = "五子棋房间", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(GomokuRoomBo bo, HttpServletResponse response) {
        List<GomokuRoomVo> list = iGomokuRoomService.queryList(bo);
        ExcelUtil.exportExcel(list, "五子棋房间", GomokuRoomVo.class, response);
    }

    /**
     * 获取五子棋房间详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("game:room:query")
    @GetMapping("/{id}")
    public R<GomokuRoomVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(iGomokuRoomService.queryById(id));
    }

    /**
     * 新增五子棋房间
     */
    @SaCheckPermission("game:room:add")
    @Log(title = "五子棋房间", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody GomokuRoomBo bo) {
        return toAjax(iGomokuRoomService.insertByBo(bo));
    }

    /**
     * 修改五子棋房间
     */
    @SaCheckPermission("game:room:edit")
    @Log(title = "五子棋房间", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody GomokuRoomBo bo) {
        return toAjax(iGomokuRoomService.updateByBo(bo));
    }

    /**
     * 删除五子棋房间
     *
     * @param ids 主键串
     */
    @SaCheckPermission("game:room:remove")
    @Log(title = "五子棋房间", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iGomokuRoomService.deleteWithValidByIds(Arrays.asList(ids), true));
    }
}
