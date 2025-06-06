package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
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
}
