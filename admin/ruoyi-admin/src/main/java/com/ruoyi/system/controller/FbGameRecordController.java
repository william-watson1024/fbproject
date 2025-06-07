package com.ruoyi.system.controller;

import java.math.BigDecimal;
import java.util.List;
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
    public AjaxResult settle(
            @RequestParam("liveStreamId") Long liveStreamId,
            @RequestParam("odds") Long odds,
            @RequestParam("nextRoundEnabled") Boolean nextRoundEnabled,
            @RequestParam("betContent") String betContent){
        if (liveStreamId == null || odds == null || !StringUtils.hasText(betContent)) {
            return AjaxResult.error("直播间ID、赔率和投注内容不能为空");
        }
        // Step 1: 查找所有 is_active = 0的记录并且直播间id = liveStreamId
        FbGameRecord fbGameRecord = new FbGameRecord();
        fbGameRecord.setIsActive(1L);
        fbGameRecord.setLiveStreamId(liveStreamId);
        List<FbGameRecord> records = fbGameRecordService.selectFbGameRecordList(fbGameRecord);
        // Step 2: 设置为已处理
        for (FbGameRecord record : records) {
            record.setIsActive(0L);
            fbGameRecordService.updateFbGameRecord(record);
        }
        Long gameRound = null;
        // Step 3: 处理参数相同的记录
        for (FbGameRecord record : records) {
            gameRound=record.getGameRound();
            if (betContent.equals(record.getBetName())) {
                Long userId = record.getGameUserId();
                Integer betNum = record.getBetNum().intValue();
                FbGameUser user = fbGameUserService.selectFbGameUserById(userId);
                if (user != null) {
                    Long additionalPoints = odds * betNum;
                    user.setPoints(user.getPoints() + additionalPoints);
                    fbGameUserService.updateFbGameUser(user);
                }
            }
        }
        //Step 4：处理游戏记录,如果gameRound不等于空的话
        if (gameRound != null) {
            FbGameInfo existingGameInfo = fbGameInfoService.selectFbGameInfoByGameInfo(gameRound);
            existingGameInfo.setResult(betContent);
            fbGameInfoService.updateFbGameInfo(existingGameInfo);
            if(nextRoundEnabled){
                FbGameInfo newGameInfo = new FbGameInfo();
                newGameInfo.setGameName(existingGameInfo.getGameName());
                newGameInfo.setGameHost(existingGameInfo.getGameHost());
                newGameInfo.setLiveStreamId(liveStreamId);
                newGameInfo.setGameStatus("投注中");
                newGameInfo.setStartTime(java.time.LocalDateTime.now());
                newGameInfo.setGameRound(gameRound + 1);
                fbGameInfoService.insertFbGameInfo(existingGameInfo);
            }
        }

        return AjaxResult.success("处理完成");
    }
}
