package com.ruoyi.system.controller;

import java.io.Console;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.StyledEditorKit;

import com.ruoyi.system.domain.FbGameInfo;
import com.ruoyi.system.domain.FbGameUser;
import com.ruoyi.system.service.IFbGameInfoService;
import com.ruoyi.system.service.IFbGameUserService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.FbGameRecord;
import com.ruoyi.system.service.IFbGameRecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 游戏记录管理Controller
 * 
 * @author leo
 * @date 2025-06-06
 */
@RestController
@RequestMapping("/system/gameRecord")
public class FbGameRecordController extends BaseController
{
    @Autowired
    private IFbGameRecordService fbGameRecordService;

    @Autowired
    private IFbGameUserService fbGameUserService;

    @Autowired
    private IFbGameInfoService fbGameInfoService;

    /**
     * 查询游戏记录管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:gameRecord:list')")
    @GetMapping("/list")
    public TableDataInfo list(FbGameRecord fbGameRecord)
    {
        startPage();
        List<FbGameRecord> list = fbGameRecordService.selectFbGameRecordList(fbGameRecord);
        return getDataTable(list);
    }

    /**
     * 导出游戏记录管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:gameRecord:export')")
    @Log(title = "游戏记录管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FbGameRecord fbGameRecord)
    {
        List<FbGameRecord> list = fbGameRecordService.selectFbGameRecordList(fbGameRecord);
        ExcelUtil<FbGameRecord> util = new ExcelUtil<FbGameRecord>(FbGameRecord.class);
        util.exportExcel(response, list, "游戏记录管理数据");
    }

    /**
     * 获取游戏记录管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:gameRecord:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(fbGameRecordService.selectFbGameRecordById(id));
    }

    /**
     * 新增游戏记录管理
     */
    @PreAuthorize("@ss.hasPermi('system:gameRecord:add')")
    @Log(title = "游戏记录管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FbGameRecord fbGameRecord)
    {
        return toAjax(fbGameRecordService.insertFbGameRecord(fbGameRecord));
    }

    /**
     * 修改游戏记录管理
     */
    @PreAuthorize("@ss.hasPermi('system:gameRecord:edit')")
    @Log(title = "游戏记录管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FbGameRecord fbGameRecord)
    {
        return toAjax(fbGameRecordService.updateFbGameRecord(fbGameRecord));
    }

    /**
     * 删除游戏记录管理
     */
    @PreAuthorize("@ss.hasPermi('system:gameRecord:remove')")
    @Log(title = "游戏记录管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(fbGameRecordService.deleteFbGameRecordByIds(ids));
    }
    /*
     * 结算游戏记录
     */
    @PreAuthorize("@ss.hasPermi('system:gameRecord:settle')")
    @Log(title = "结算", businessType = BusinessType.UPDATE)
    @PostMapping("/settle")
    public AjaxResult settle(@RequestBody com.ruoyi.system.Do.SettleGameDTO dto) {
        Long liveStreamId = dto.getLiveStreamId();
        List<String> resultList = dto.getResult(); // 3个骰子结果
        Map<String, Long> oddsMap = dto.getOdds(); // 赔率map
        Boolean nextRoundEnabled = dto.getNextRoundEnabled();
        String resultImage = dto.getResultImage(); // 图片URL，可做存储备用

        if (liveStreamId == null || resultList == null || resultList.size() != 3 || oddsMap == null) {
            return AjaxResult.error("直播间ID、开奖结果和赔率不能为空，且开奖结果需包含3个元素");
        }

        // 直接将开奖结果列表转为字符串存储（你也可以改为用JSON存储）
        String betContent = String.join(",", resultList);

        // 查询所有 is_active = 1 并且直播间ID匹配的记录
        FbGameRecord fbGameRecord = new FbGameRecord();
        fbGameRecord.setIsActive(1L);
        fbGameRecord.setLiveStreamId(liveStreamId);
        List<FbGameRecord> records = fbGameRecordService.selectFbGameRecordList(fbGameRecord);

        // 批量将记录置为已处理
        for (FbGameRecord record : records) {
            record.setIsActive(0L);
            fbGameRecordService.updateFbGameRecord(record);
        }

        Long gameRound = null;
        for (FbGameRecord record : records) {
            gameRound = record.getGameRound();

            // 判断当前记录是否中奖
            int hitCount = 0;
            for (String diceResult : resultList) {
                if (diceResult.equals(record.getBetName())) {
                    hitCount++;
                }
                System.out.println("投注内容: " + record.getBetName() + ", 骰子结果: " + diceResult);
            }
            System.out.println("命中数量: " + hitCount + "，投注内容: " + record.getBetName());

            if (hitCount > 0) {
                Long userId = record.getGameUserId();
                Integer betNum = record.getBetNum().intValue();
                FbGameUser user = fbGameUserService.selectFbGameUserById(userId);
                if (user != null) {
                    // 计算获得的积分，根据命中数量取赔率
                    Long odds = 0L;
                    if (hitCount == 1) {
                        odds = oddsMap.getOrDefault("one", 0L);
                    } else if (hitCount == 2) {
                        odds = oddsMap.getOrDefault("two", 0L);
                    } else if (hitCount == 3) {
                        odds = oddsMap.getOrDefault("three", 0L);
                    }
                    Long additionalPoints = odds * betNum;
                    user.setPoints(user.getPoints() + additionalPoints);
                    fbGameUserService.updateFbGameUser(user);
                }
            }
        }

        // 更新游戏记录表
        if (gameRound != null) {
            FbGameInfo existingGameInfo = fbGameInfoService.selectFbGameInfoByGameInfo(gameRound);
            existingGameInfo.setResult(betContent);
            existingGameInfo.setCloseTime(java.time.LocalDateTime.now());
//            existingGameInfo.setResultImage(resultImage); // 你可以在GameInfo表新增一个字段来存储图片URL
            fbGameInfoService.updateFbGameInfo(existingGameInfo);

            if (nextRoundEnabled != null && nextRoundEnabled) {
                FbGameInfo newGameInfo = new FbGameInfo();
                newGameInfo.setGameName(existingGameInfo.getGameName());
                newGameInfo.setGameHost(existingGameInfo.getGameHost());
                newGameInfo.setLiveStreamId(liveStreamId);
                newGameInfo.setGameStatus("投注中");
                newGameInfo.setStartTime(java.time.LocalDateTime.now());
                newGameInfo.setGameRound(gameRound + 1);
                fbGameInfoService.insertFbGameInfo(newGameInfo);
            }
        }

        return AjaxResult.success("处理完成");
    }
}
