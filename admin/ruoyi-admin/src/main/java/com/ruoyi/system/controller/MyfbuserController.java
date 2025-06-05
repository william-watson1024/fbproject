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
import com.ruoyi.system.domain.Myfbuser;
import com.ruoyi.system.service.IMyfbuserService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 投注积分用户管理Controller
 * 
 * @author ruoyi
 * @date 2025-05-30
 */
@RestController
@RequestMapping("/system/myfbuser")
public class MyfbuserController extends BaseController
{
    @Autowired
    private IMyfbuserService myfbuserService;

    /**
     * 查询投注积分用户管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:myfbuser:list')")
    @GetMapping("/list")
    public TableDataInfo list(Myfbuser myfbuser)
    {
        startPage();
        List<Myfbuser> list = myfbuserService.selectMyfbuserList(myfbuser);
        return getDataTable(list);
    }

    /**
     * 导出投注积分用户管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:myfbuser:export')")
    @Log(title = "投注积分用户管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Myfbuser myfbuser)
    {
        List<Myfbuser> list = myfbuserService.selectMyfbuserList(myfbuser);
        ExcelUtil<Myfbuser> util = new ExcelUtil<Myfbuser>(Myfbuser.class);
        util.exportExcel(response, list, "投注积分用户管理数据");
    }

    /**
     * 获取投注积分用户管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:myfbuser:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(myfbuserService.selectMyfbuserById(id));
    }

    /**
     * 新增投注积分用户管理
     */
    @PreAuthorize("@ss.hasPermi('system:myfbuser:add')")
    @Log(title = "投注积分用户管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Myfbuser myfbuser)
    {
        return toAjax(myfbuserService.insertMyfbuser(myfbuser));
    }

    /**
     * 修改投注积分用户管理
     */
    @PreAuthorize("@ss.hasPermi('system:myfbuser:edit')")
    @Log(title = "投注积分用户管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Myfbuser myfbuser)
    {
        return toAjax(myfbuserService.updateMyfbuser(myfbuser));
    }

    /**
     * 删除投注积分用户管理
     */
    @PreAuthorize("@ss.hasPermi('system:myfbuser:remove')")
    @Log(title = "投注积分用户管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(myfbuserService.deleteMyfbuserByIds(ids));
    }
}
