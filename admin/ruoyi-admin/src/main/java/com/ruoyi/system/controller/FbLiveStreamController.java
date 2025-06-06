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
import com.ruoyi.system.domain.FbLiveStream;
import com.ruoyi.system.service.IFbLiveStreamService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 直播网站管理Controller
 * 
 * @author leo
 * @date 2025-06-06
 */
@RestController
@RequestMapping("/system/liveStream")
public class FbLiveStreamController extends BaseController
{
    @Autowired
    private IFbLiveStreamService fbLiveStreamService;

    /**
     * 查询直播网站管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:liveStream:list')")
    @GetMapping("/list")
    public TableDataInfo list(FbLiveStream fbLiveStream)
    {
        startPage();
        List<FbLiveStream> list = fbLiveStreamService.selectFbLiveStreamList(fbLiveStream);
        return getDataTable(list);
    }

    /**
     * 导出直播网站管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:liveStream:export')")
    @Log(title = "直播网站管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FbLiveStream fbLiveStream)
    {
        List<FbLiveStream> list = fbLiveStreamService.selectFbLiveStreamList(fbLiveStream);
        ExcelUtil<FbLiveStream> util = new ExcelUtil<FbLiveStream>(FbLiveStream.class);
        util.exportExcel(response, list, "直播网站管理数据");
    }

    /**
     * 获取直播网站管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:liveStream:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(fbLiveStreamService.selectFbLiveStreamById(id));
    }

    /**
     * 新增直播网站管理
     */
    @PreAuthorize("@ss.hasPermi('system:liveStream:add')")
    @Log(title = "直播网站管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FbLiveStream fbLiveStream)
    {
        return toAjax(fbLiveStreamService.insertFbLiveStream(fbLiveStream));
    }

    /**
     * 修改直播网站管理
     */
    @PreAuthorize("@ss.hasPermi('system:liveStream:edit')")
    @Log(title = "直播网站管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FbLiveStream fbLiveStream)
    {
        return toAjax(fbLiveStreamService.updateFbLiveStream(fbLiveStream));
    }

    /**
     * 删除直播网站管理
     */
    @PreAuthorize("@ss.hasPermi('system:liveStream:remove')")
    @Log(title = "直播网站管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(fbLiveStreamService.deleteFbLiveStreamByIds(ids));
    }
}
