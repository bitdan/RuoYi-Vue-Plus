package com.ruoyi.system.controller;

import java.util.List;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

import lombok.RequiredArgsConstructor;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.*;
import cn.dev33.satoken.annotation.SaCheckPermission;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import com.ruoyi.common.annotation.RepeatSubmit;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.PageQuery;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.core.validate.QueryGroup;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.vo.TGlobalAppVo;
import com.ruoyi.system.domain.bo.TGlobalAppBo;
import com.ruoyi.system.service.ITGlobalAppService;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 全局应用
 *
 * @author xiuer
 * @date 2024-05-08
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/system/globalApp")
public class TGlobalAppController extends BaseController {

    private final ITGlobalAppService iTGlobalAppService;

    /**
     * 查询全局应用列表
     */
    @SaCheckPermission("system:globalApp:list")
    @GetMapping("/list")
    public TableDataInfo<TGlobalAppVo> list(TGlobalAppBo bo, PageQuery pageQuery) {
        return iTGlobalAppService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出全局应用列表
     */
    @SaCheckPermission("system:globalApp:export")
    @Log(title = "全局应用", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(TGlobalAppBo bo, HttpServletResponse response) {
        List<TGlobalAppVo> list = iTGlobalAppService.queryList(bo);
        ExcelUtil.exportExcel(list, "全局应用", TGlobalAppVo.class, response);
    }

    /**
     * 获取全局应用详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("system:globalApp:query")
    @GetMapping("/{id}")
    public R<TGlobalAppVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(iTGlobalAppService.queryById(id));
    }

    /**
     * 新增全局应用
     */
    @SaCheckPermission("system:globalApp:add")
    @Log(title = "全局应用", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody TGlobalAppBo bo) {
        return toAjax(iTGlobalAppService.insertByBo(bo));
    }

    /**
     * 修改全局应用
     */
    @SaCheckPermission("system:globalApp:edit")
    @Log(title = "全局应用", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody TGlobalAppBo bo) {
        return toAjax(iTGlobalAppService.updateByBo(bo));
    }

    /**
     * 删除全局应用
     *
     * @param ids 主键串
     */
    @SaCheckPermission("system:globalApp:remove")
    @Log(title = "全局应用", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iTGlobalAppService.deleteWithValidByIds(Arrays.asList(ids), true));
    }
}
