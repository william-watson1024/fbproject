package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 游戏记录管理对象 fb_game_record
 * 
 * @author leo
 * @date 2025-06-06
 */
public class FbGameRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 下注ID */
    private Long id;

    /** 下注用户ID */
    @Excel(name = "下注用户ID")
    private Long gameUserId;

    /** 下注用户账号 */
    @Excel(name = "下注用户账号")
    private String gameUserAccount;

    /** 直播房间ID */
    @Excel(name = "直播房间ID")
    private Long liveStreamId;

    /** 游戏类型 */
    @Excel(name = "游戏类型")
    private String gameType;

    /** 游戏局号 */
    @Excel(name = "游戏局号")
    private Long gameRound;

    /** 下注金额 */
    @Excel(name = "下注金额")
    private Long betNum;

    /** 下注名称 */
    @Excel(name = "下注名称")
    private String betName;

    /** 投注内容 */
    @Excel(name = "投注内容")
    private String betContent;

    /** 下注状态 */
    @Excel(name = "下注状态")
    private Long isActive;

    /** 下注时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "下注时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date betTime;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setGameUserId(Long gameUserId) 
    {
        this.gameUserId = gameUserId;
    }

    public Long getGameUserId() 
    {
        return gameUserId;
    }

    public void setGameUserAccount(String gameUserAccount) 
    {
        this.gameUserAccount = gameUserAccount;
    }

    public String getGameUserAccount() 
    {
        return gameUserAccount;
    }

    public void setLiveStreamId(Long liveStreamId) 
    {
        this.liveStreamId = liveStreamId;
    }

    public Long getLiveStreamId() 
    {
        return liveStreamId;
    }

    public void setGameType(String gameType) 
    {
        this.gameType = gameType;
    }

    public String getGameType() 
    {
        return gameType;
    }

    public void setGameRound(Long gameRound) 
    {
        this.gameRound = gameRound;
    }

    public Long getGameRound() 
    {
        return gameRound;
    }

    public void setBetNum(Long betNum) 
    {
        this.betNum = betNum;
    }

    public Long getBetNum() 
    {
        return betNum;
    }

    public void setBetName(String betName) 
    {
        this.betName = betName;
    }

    public String getBetName() 
    {
        return betName;
    }

    public void setBetContent(String betContent) 
    {
        this.betContent = betContent;
    }

    public String getBetContent() 
    {
        return betContent;
    }

    public void setIsActive(Long isActive) 
    {
        this.isActive = isActive;
    }

    public Long getIsActive() 
    {
        return isActive;
    }

    public void setBetTime(Date betTime) 
    {
        this.betTime = betTime;
    }

    public Date getBetTime() 
    {
        return betTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("gameUserId", getGameUserId())
            .append("gameUserAccount", getGameUserAccount())
            .append("liveStreamId", getLiveStreamId())
            .append("gameType", getGameType())
            .append("gameRound", getGameRound())
            .append("betNum", getBetNum())
            .append("betName", getBetName())
            .append("betContent", getBetContent())
            .append("isActive", getIsActive())
            .append("betTime", getBetTime())
            .toString();
    }
}
