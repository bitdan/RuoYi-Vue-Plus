package com.ruoyi;

import com.ruoyi.common.core.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @version 1.0
 * @description DemoTestController
 * @date 2025/1/6 16:18:25
 */
@Tag(name = "管理后台 - 赛狐Test")
@RestController
@RequestMapping("/game/test")
@Validated
public class DemoTestController {

    @GetMapping("/get")
    @Operation(summary = "获取 test 信息")
    public R<Boolean> get() {
        return R.ok(true);
    }

}
