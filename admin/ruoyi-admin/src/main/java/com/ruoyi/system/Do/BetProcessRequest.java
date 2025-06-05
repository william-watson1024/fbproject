package com.ruoyi.system.Do;

public class BetProcessRequest {
    private String betName;
    private Integer multiple;

    // 记得加上无参构造器（Spring 反序列化需要）
    public BetProcessRequest() { }

    public String getBetName() {
        return betName;
    }

    public void setBetName(String betName) {
        this.betName = betName;
    }

    public Integer getMultiple() {
        return multiple;
    }

    public void setMultiple(Integer multiple) {
        this.multiple = multiple;
    }
}
