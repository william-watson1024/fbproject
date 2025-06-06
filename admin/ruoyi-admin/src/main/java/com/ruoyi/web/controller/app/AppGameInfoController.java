package com.ruoyi.web.controller.app;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.FbGameInfo;
import com.ruoyi.system.domain.FbGameRecord;
import com.ruoyi.system.service.IFbGameInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

/**
 * ==================================================
 *
 * @Project : admin
 * @Package : com.ruoyi.web.controller.app
 * @Class Name  : AppGameInfoController
 * --------------------------------------------------
 * @Author : William
 * @Date : 2025-06-07 00:56:01
 * @Description : TODO
 * ==================================================
 */
@RestController
@RequestMapping("/app/gameInfo")
public class AppGameInfoController {
    @Autowired
    private IFbGameInfoService fbGameInfoService;

    @GetMapping("/listByGameRound")
    public AjaxResult listByGameRound(FbGameInfo FbGameInfo) {
        if (FbGameInfo.getGameRound() == null) {
            return AjaxResult.error("游戏局号不能为空");
        }
        return AjaxResult.success(fbGameInfoService.selectFbGameInfoList(FbGameInfo));
    }
    @GetMapping("/listMinutesBeforeNow")
    public AjaxResult listAfterTime(Long minutesBeforeNow) {
        if (minutesBeforeNow == null) {
            return AjaxResult.error("请设置x分钟前，该字段不能为空");
        }

        // 获取当前时间
        LocalDateTime now = LocalDateTime.now();

        // 计算起始时间
        LocalDateTime startTime = now.minusMinutes(minutesBeforeNow);

        return AjaxResult.success(fbGameInfoService.selectFbGameInfoListAfterTime(startTime));
    }

}
