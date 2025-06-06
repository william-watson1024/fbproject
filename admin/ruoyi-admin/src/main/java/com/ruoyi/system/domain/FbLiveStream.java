package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 直播网站管理对象 fb_live_stream
 * 
 * @author leo
 * @date 2025-06-06
 */
public class FbLiveStream extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 直播ID */
    private Long id;

    /** 直播名称 */
    @Excel(name = "直播名称")
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

    /** 游戏类型 */
    @Excel(name = "游戏类型")
    private String gameType;

    /** 游戏主播名称 */
    @Excel(name = "游戏主播名称")
    private String gameHost;

    /** 游戏开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "游戏开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date gameStartTime;

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

    public void setGameType(String gameType) 
    {
        this.gameType = gameType;
    }

    public String getGameType() 
    {
        return gameType;
    }

    public void setGameHost(String gameHost) 
    {
        this.gameHost = gameHost;
    }

    public String getGameHost() 
    {
        return gameHost;
    }

    public void setGameStartTime(Date gameStartTime) 
    {
        this.gameStartTime = gameStartTime;
    }

    public Date getGameStartTime() 
    {
        return gameStartTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("description", getDescription())
            .append("url", getUrl())
            .append("isActive", getIsActive())
            .append("gameType", getGameType())
            .append("gameHost", getGameHost())
            .append("gameStartTime", getGameStartTime())
            .toString();
    }
}
