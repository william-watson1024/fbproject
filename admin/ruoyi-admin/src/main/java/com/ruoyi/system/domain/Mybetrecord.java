package com.ruoyi.system.domain;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 下注信息管理对象 mybetrecord
 * 
 * @author ruoyi
 * @date 2025-05-31
 */
public class Mybetrecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 下注id */
    private Long id;

    /** 下注用户id号 */
    @Excel(name = "下注用户id号")
    private Long myFbuserId;

    /** 下注用户账号 */
    @Excel(name = "下注用户账号")
    private String myFbuserAccount;

    /** 下注数量 */
    @Excel(name = "下注数量")
    private Long betNum;

    /** 下注名 */
    @Excel(name = "下注名")
    private String betName;

    /** 下注处理状态 */
    @Excel(name = "下注处理状态")
    private Long isActive;

    /** 下注时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "下注时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime betTime;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setMyFbuserId(Long myFbuserId) 
    {
        this.myFbuserId = myFbuserId;
    }

    public Long getMyFbuserId() 
    {
        return myFbuserId;
    }

    public void setMyFbuserAccount(String myFbuserAccount) 
    {
        this.myFbuserAccount = myFbuserAccount;
    }

    public String getMyFbuserAccount() 
    {
        return myFbuserAccount;
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

    public void setIsActive(Long isActive) 
    {
        this.isActive = isActive;
    }

    public Long getIsActive() 
    {
        return isActive;
    }

    public void setBetTime(LocalDateTime betTime)
    {
        this.betTime = betTime;
    }

    public LocalDateTime getBetTime()
    {
        return betTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("myFbuserId", getMyFbuserId())
            .append("myFbuserAccount", getMyFbuserAccount())
            .append("betNum", getBetNum())
            .append("betName", getBetName())
            .append("isActive", getIsActive())
            .append("betTime", getBetTime())
            .toString();
    }
}
