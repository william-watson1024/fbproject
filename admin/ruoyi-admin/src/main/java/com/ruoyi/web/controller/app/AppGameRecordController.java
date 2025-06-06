package com.ruoyi.web.controller.app;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.system.domain.FbGameRecord;
import com.ruoyi.system.service.IFbGameRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * ==================================================
 *
 * @Project : admin
 * @Package : com.ruoyi.web.controller.app
 * @Class Name  : AppGameRecordController
 * --------------------------------------------------
 * @Author : William
 * @Date : 2025-06-06 20:30:45
 * @Description : App端游戏记录查询控制器
 * ==================================================
 */
@RestController
@RequestMapping("/app/gameRecord")
public class AppGameRecordController extends BaseController {

    @Autowired
    private IFbGameRecordService fbGameRecordService;

    /**
     * 查询所有注单记录（可传 liveStreamId）
     */
    @GetMapping("/list")
    public TableDataInfo listAll(FbGameRecord fbGameRecord) {
        startPage();
        List<FbGameRecord> list = fbGameRecordService.selectFbGameRecordList(fbGameRecord);
        return getDataTable(list);
    }

    /**
     * 查询已结算注单记录（isActive = 1，可传 liveStreamId）
     */
    @GetMapping("/settled")
    public TableDataInfo listSettled(@RequestParam(required = false) Long liveStreamId) {
        FbGameRecord record = new FbGameRecord();
        record.setIsActive(1L); // 1 表示已处理
        if (liveStreamId != null) {
            record.setLiveStreamId(liveStreamId);
        }
        startPage();
        List<FbGameRecord> list = fbGameRecordService.selectFbGameRecordList(record);
        return getDataTable(list);
    }
    /**
     * 根据直播间 ID 查询所有注单记录
     */
    @GetMapping("/byLiveStream")
    public TableDataInfo listByLiveStream(@RequestParam Long liveStreamId) {
        FbGameRecord record = new FbGameRecord();
        record.setLiveStreamId(liveStreamId);
        startPage();
        List<FbGameRecord> list = fbGameRecordService.selectFbGameRecordList(record);
        return getDataTable(list);
    }

}
