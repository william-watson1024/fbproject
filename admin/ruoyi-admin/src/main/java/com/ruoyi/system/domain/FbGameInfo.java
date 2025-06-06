package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 游戏信息管理对象 fb_game_info
 * 
 * @author leo
 * @date 2025-06-06
 */
public class FbGameInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 游戏ID */
    private Long id;

    /** 游戏名称 */
    @Excel(name = "游戏名称")
    private String gameName;

    /** 游戏主播 */
    @Excel(name = "游戏主播")
    private String gameHost;

    /** 房间号 */
    @Excel(name = "房间号")
    private Long liveStreamId;

    /** 当前局号 */
    @Excel(name = "当前局号")
    private Long gameRound;

    /** 开奖结果 */
    @Excel(name = "开奖结果")
    private String result;

    /** 游戏状态 */
    @Excel(name = "游戏状态")
    private String gameStatus;

    /** 游戏局流水号 */
    @Excel(name = "游戏局流水号")
    private String gameSerialNumber;

    /** 开局时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开局时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    /** 实际封盘时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "实际封盘时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date closeTime;

    /** 结算时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结算时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endTime;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setGameName(String gameName) 
    {
        this.gameName = gameName;
    }

    public String getGameName() 
    {
        return gameName;
    }

    public void setGameHost(String gameHost) 
    {
        this.gameHost = gameHost;
    }

    public String getGameHost() 
    {
        return gameHost;
    }

    public void setLiveStreamId(Long liveStreamId) 
    {
        this.liveStreamId = liveStreamId;
    }

    public Long getLiveStreamId() 
    {
        return liveStreamId;
    }

    public void setGameRound(Long gameRound) 
    {
        this.gameRound = gameRound;
    }

    public Long getGameRound() 
    {
        return gameRound;
    }

    public void setResult(String result) 
    {
        this.result = result;
    }

    public String getResult() 
    {
        return result;
    }

    public void setGameStatus(String gameStatus) 
    {
        this.gameStatus = gameStatus;
    }

    public String getGameStatus() 
    {
        return gameStatus;
    }

    public void setGameSerialNumber(String gameSerialNumber) 
    {
        this.gameSerialNumber = gameSerialNumber;
    }

    public String getGameSerialNumber() 
    {
        return gameSerialNumber;
    }

    public void setStartTime(Date startTime) 
    {
        this.startTime = startTime;
    }

    public Date getStartTime() 
    {
        return startTime;
    }

    public void setCloseTime(Date closeTime) 
    {
        this.closeTime = closeTime;
    }

    public Date getCloseTime() 
    {
        return closeTime;
    }

    public void setEndTime(Date endTime) 
    {
        this.endTime = endTime;
    }

    public Date getEndTime() 
    {
        return endTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("gameName", getGameName())
            .append("gameHost", getGameHost())
            .append("liveStreamId", getLiveStreamId())
            .append("gameRound", getGameRound())
            .append("result", getResult())
            .append("gameStatus", getGameStatus())
            .append("gameSerialNumber", getGameSerialNumber())
            .append("startTime", getStartTime())
            .append("closeTime", getCloseTime())
            .append("endTime", getEndTime())
            .toString();
    }
}
