package com.ruoyi.system.Do;

import java.util.List;
import java.util.Map;

/**
 * 用于接收结算请求的 DTO
 */
public class SettleGameDTO {

    /**
     * 直播房间 ID
     */
    private Long liveStreamId;

    /**
     * 开奖结果（三个骰子的结果，使用 List<String>）
     */
    private List<String> result;

    /**
     * 赔率（包含中一只、中两只、中三只的赔率）
     */
    private Map<String, Long> odds;

    /**
     * 是否开启下一局
     */
    private Boolean nextRoundEnabled;

    /**
     * 结果图片（可以是图片的 URL）
     */
    private String resultImage;

    public SettleGameDTO() {
    }

    public Long getLiveStreamId() {
        return liveStreamId;
    }

    public void setLiveStreamId(Long liveStreamId) {
        this.liveStreamId = liveStreamId;
    }

    public List<String> getResult() {
        return result;
    }

    public void setResult(List<String> result) {
        this.result = result;
    }

    public Map<String, Long> getOdds() {
        return odds;
    }

    public void setOdds(Map<String, Long> odds) {
        this.odds = odds;
    }

    public Boolean getNextRoundEnabled() {
        return nextRoundEnabled;
    }

    public void setNextRoundEnabled(Boolean nextRoundEnabled) {
        this.nextRoundEnabled = nextRoundEnabled;
    }

    public String getResultImage() {
        return resultImage;
    }

    public void setResultImage(String resultImage) {
        this.resultImage = resultImage;
    }

    @Override
    public String toString() {
        return "SettleGameDTO{" +
                "liveStreamId=" + liveStreamId +
                ", result=" + result +
                ", odds=" + odds +
                ", nextRoundEnabled=" + nextRoundEnabled +
                ", resultImage='" + resultImage + '\'' +
                '}';
    }
}
