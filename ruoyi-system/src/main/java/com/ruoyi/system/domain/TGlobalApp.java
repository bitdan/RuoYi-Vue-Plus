package com.ruoyi.system.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 全局应用对象 t_global_app
 *
 * @author xiuer
 * @date 2024-05-08
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("t_global_app")
public class TGlobalApp extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 应用ID
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 应用标识
     */
    private String code;
    /**
     * 应用描述
     */
    private String description;
    /**
     * 认证方式 1 访问密钥  0 无认证
     */
    private Long authType;
    /**
     * 是否需要服务授权 0 否  1 是
     */
    private Long svcAuthorization;
    /**
     * 应用状态, 状态：0: 停用  1：启用
     */
    private Long status;
    /**
     * 创建时间
     */
    private Date createOn;
    /**
     * 修改时间
     */
    private Date updateOn;
    /**
     * 扩展字段1
     */
    private String extend1;
    /**
     * 扩展字段2
     */
    private String extend2;
    /**
     * 扩展字段3
     */
    private String extend3;
    /**
     * 
     */
    @Version
    private Long version;

}
