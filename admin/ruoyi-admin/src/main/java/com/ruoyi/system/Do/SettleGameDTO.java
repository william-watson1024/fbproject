package com.yourcompany.project.dto;

/**
 * 用于接收结算请求的 DTO
 */
public class SettleGameDTO {

    /**
     * 直播房间 ID
     */
    private Long liveStreamId;

    /**
     * 赔率（整型，使用 Long 表示）
     */
    private Long odds;

    /**
     * 投注内容（开奖结果）
     */
    private String betContent;

    /**
     * 是否开启下一局
     */
    private Boolean nextRoundEnabled;

    public SettleGameDTO() {
    }

    public SettleGameDTO(Long liveStreamId, Long odds, String betContent, Boolean nextRoundEnabled) {
        this.liveStreamId = liveStreamId;
        this.odds = odds;
        this.betContent = betContent;
        this.nextRoundEnabled = nextRoundEnabled;
    }

    public Long getLiveStreamId() {
        return liveStreamId;
    }

    public void setLiveStreamId(Long liveStreamId) {
        this.liveStreamId = liveStreamId;
    }

    public Long getOdds() {
        return odds;
    }

    public void setOdds(Long odds) {
        this.odds = odds;
    }

    public String getBetContent() {
        return betContent;
    }

    public void setBetContent(String betContent) {
        this.betContent = betContent;
    }

    public Boolean getNextRoundEnabled() {
        return nextRoundEnabled;
    }

    public void setNextRoundEnabled(Boolean nextRoundEnabled) {
        this.nextRoundEnabled = nextRoundEnabled;
    }

    @Override
    public String toString() {
        return "SettleGameDTO{" +
                "liveStreamId=" + liveStreamId +
                ", odds=" + odds +
                ", betContent='" + betContent + '\'' +
                ", nextRoundEnabled=" + nextRoundEnabled +
                '}';
    }
}
