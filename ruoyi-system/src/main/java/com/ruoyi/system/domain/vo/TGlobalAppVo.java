package com.ruoyi.system.domain.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.convert.ExcelDictConvert;
import lombok.Data;
import java.util.Date;

import java.io.Serializable;

/**
 * 全局应用视图对象 t_global_app
 *
 * @author xiuer
 * @date 2024-05-08
 */
@Data
@ExcelIgnoreUnannotated
public class TGlobalAppVo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 应用ID
     */
    @ExcelProperty(value = "应用ID")
    private Long id;

    /**
     * 应用标识
     */
    @ExcelProperty(value = "应用标识")
    private String code;

    /**
     * 应用描述
     */
    @ExcelProperty(value = "应用描述")
    private String description;

    /**
     * 认证方式 1 访问密钥  0 无认证
     */
    @ExcelProperty(value = "认证方式 1 访问密钥  0 无认证")
    private Long authType;

    /**
     * 是否需要服务授权 0 否  1 是
     */
    @ExcelProperty(value = "是否需要服务授权 0 否  1 是")
    private Long svcAuthorization;

    /**
     * 应用状态, 状态：0: 停用  1：启用
     */
    @ExcelProperty(value = "应用状态, 状态：0: 停用  1：启用")
    private Long status;

    /**
     * 创建时间
     */
    @ExcelProperty(value = "创建时间")
    private Date createOn;

    /**
     * 修改时间
     */
    @ExcelProperty(value = "修改时间")
    private Date updateOn;

    /**
     * 扩展字段1
     */
    @ExcelProperty(value = "扩展字段1")
    private String extend1;

    /**
     * 扩展字段2
     */
    @ExcelProperty(value = "扩展字段2")
    private String extend2;

    /**
     * 扩展字段3
     */
    @ExcelProperty(value = "扩展字段3")
    private String extend3;


}
