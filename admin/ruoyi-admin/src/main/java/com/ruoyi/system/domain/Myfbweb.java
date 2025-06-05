package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 直播链接管理对象 myfbweb
 * 
 * @author ruoyi
 * @date 2025-05-30
 */
public class Myfbweb extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 直播id
 */
    private Long id;

    /** 直播名 */
    @Excel(name = "直播名")
    private String name;

    /** 直播描述 */
    @Excel(name = "直播描述")
    private String description;

    /** 直播链接 */
    @Excel(name = "直播链接")
    private String url;

    /** 直播状态 */
    @Excel(name = "直播状态")
    private Integer isActive;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }

    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }

    public void setUrl(String url) 
    {
        this.url = url;
    }

    public String getUrl() 
    {
        return url;
    }

    public void setIsActive(Integer isActive) 
    {
        this.isActive = isActive;
    }

    public Integer getIsActive() 
    {
        return isActive;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("description", getDescription())
            .append("url", getUrl())
            .append("isActive", getIsActive())
            .toString();
    }
}
