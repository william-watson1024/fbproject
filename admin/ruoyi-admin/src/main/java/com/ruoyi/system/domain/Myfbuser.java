package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 投注积分用户管理对象 myfbuser
 * 
 * @author ruoyi
 * @date 2025-05-30
 */
public class Myfbuser extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户ID
 */
    private Long id;

    /** 用户账号 */
    @Excel(name = "用户账号")
    private String account;

    /** 用户密码 */
    @Excel(name = "用户密码")
    private String password;

    /** 用户名 */
    @Excel(name = "用户名")
    private String name;

    /** 用户积分 */
    @Excel(name = "用户积分")
    private Long points;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setAccount(String account) 
    {
        this.account = account;
    }

    public String getAccount() 
    {
        return account;
    }

    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getPassword() 
    {
        return password;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }

    public void setPoints(Long points) 
    {
        this.points = points;
    }

    public Long getPoints() 
    {
        return points;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("account", getAccount())
            .append("password", getPassword())
            .append("name", getName())
            .append("points", getPoints())
            .toString();
    }
}
