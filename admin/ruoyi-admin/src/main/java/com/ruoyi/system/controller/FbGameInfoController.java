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
import com.ruoyi.system.domain.FbGameInfo;
import com.ruoyi.system.service.IFbGameInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 游戏信息管理Controller
 * 
 * @author leo
 * @date 2025-06-06
 */
@RestController
@RequestMapping("/system/gameInfo")
public class FbGameInfoController extends BaseController
{
    @Autowired
    private IFbGameInfoService fbGameInfoService;

    /**
     * 查询游戏信息管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:gameInfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(FbGameInfo fbGameInfo)
    {
        startPage();
        List<FbGameInfo> list = fbGameInfoService.selectFbGameInfoList(fbGameInfo);
        return getDataTable(list);
    }

    /**
     * 导出游戏信息管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:gameInfo:export')")
    @Log(title = "游戏信息管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FbGameInfo fbGameInfo)
    {
        List<FbGameInfo> list = fbGameInfoService.selectFbGameInfoList(fbGameInfo);
        ExcelUtil<FbGameInfo> util = new ExcelUtil<FbGameInfo>(FbGameInfo.class);
        util.exportExcel(response, list, "游戏信息管理数据");
    }

    /**
     * 获取游戏信息管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:gameInfo:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(fbGameInfoService.selectFbGameInfoById(id));
    }

    /**
     * 新增游戏信息管理
     */
    @PreAuthorize("@ss.hasPermi('system:gameInfo:add')")
    @Log(title = "游戏信息管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FbGameInfo fbGameInfo)
    {
        System.out.println("Received startTime: " + fbGameInfo.getStartTime());
        System.out.println("Received closeTime: " + fbGameInfo.getCloseTime());
        System.out.println("Received endTime: " + fbGameInfo.getEndTime());
        return toAjax(fbGameInfoService.insertFbGameInfo(fbGameInfo));
    }

    /**
     * 修改游戏信息管理
     */
    @PreAuthorize("@ss.hasPermi('system:gameInfo:edit')")
    @Log(title = "游戏信息管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FbGameInfo fbGameInfo)
    {
        return toAjax(fbGameInfoService.updateFbGameInfo(fbGameInfo));
    }

    /**
     * 删除游戏信息管理
     */
    @PreAuthorize("@ss.hasPermi('system:gameInfo:remove')")
    @Log(title = "游戏信息管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(fbGameInfoService.deleteFbGameInfoByIds(ids));
    }
}
