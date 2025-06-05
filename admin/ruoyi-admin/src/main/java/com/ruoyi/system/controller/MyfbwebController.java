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
import com.ruoyi.system.domain.Myfbweb;
import com.ruoyi.system.service.IMyfbwebService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 直播链接管理Controller
 * 
 * @author ruoyi
 * @date 2025-05-30
 */
@RestController
@RequestMapping("/system/myfbweb")
public class MyfbwebController extends BaseController
{
    @Autowired
    private IMyfbwebService myfbwebService;

    /**
     * 查询直播链接管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:myfbweb:list')")
    @GetMapping("/list")
    public TableDataInfo list(Myfbweb myfbweb)
    {
        startPage();
        List<Myfbweb> list = myfbwebService.selectMyfbwebList(myfbweb);
        return getDataTable(list);
    }

    /**
     * 导出直播链接管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:myfbweb:export')")
    @Log(title = "直播链接管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Myfbweb myfbweb)
    {
        List<Myfbweb> list = myfbwebService.selectMyfbwebList(myfbweb);
        ExcelUtil<Myfbweb> util = new ExcelUtil<Myfbweb>(Myfbweb.class);
        util.exportExcel(response, list, "直播链接管理数据");
    }

    /**
     * 获取直播链接管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:myfbweb:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(myfbwebService.selectMyfbwebById(id));
    }

    /**
     * 新增直播链接管理
     */
    @PreAuthorize("@ss.hasPermi('system:myfbweb:add')")
    @Log(title = "直播链接管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Myfbweb myfbweb)
    {
        return toAjax(myfbwebService.insertMyfbweb(myfbweb));
    }

    /**
     * 修改直播链接管理
     */
    @PreAuthorize("@ss.hasPermi('system:myfbweb:edit')")
    @Log(title = "直播链接管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Myfbweb myfbweb)
    {
        return toAjax(myfbwebService.updateMyfbweb(myfbweb));
    }

    /**
     * 删除直播链接管理
     */
    @PreAuthorize("@ss.hasPermi('system:myfbweb:remove')")
    @Log(title = "直播链接管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(myfbwebService.deleteMyfbwebByIds(ids));
    }
}
