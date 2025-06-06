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
import com.ruoyi.system.domain.FbGameUser;
import com.ruoyi.system.service.IFbGameUserService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 游戏用户管理Controller
 * 
 * @author leo
 * @date 2025-06-06
 */
@RestController
@RequestMapping("/system/gameUser")
public class FbGameUserController extends BaseController
{
    @Autowired
    private IFbGameUserService fbGameUserService;

    /**
     * 查询游戏用户管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:gameUser:list')")
    @GetMapping("/list")
    public TableDataInfo list(FbGameUser fbGameUser)
    {
        startPage();
        List<FbGameUser> list = fbGameUserService.selectFbGameUserList(fbGameUser);
        return getDataTable(list);
    }

    /**
     * 导出游戏用户管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:gameUser:export')")
    @Log(title = "游戏用户管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FbGameUser fbGameUser)
    {
        List<FbGameUser> list = fbGameUserService.selectFbGameUserList(fbGameUser);
        ExcelUtil<FbGameUser> util = new ExcelUtil<FbGameUser>(FbGameUser.class);
        util.exportExcel(response, list, "游戏用户管理数据");
    }

    /**
     * 获取游戏用户管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:gameUser:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(fbGameUserService.selectFbGameUserById(id));
    }

    /**
     * 新增游戏用户管理
     */
    @PreAuthorize("@ss.hasPermi('system:gameUser:add')")
    @Log(title = "游戏用户管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FbGameUser fbGameUser)
    {
        return toAjax(fbGameUserService.insertFbGameUser(fbGameUser));
    }

    /**
     * 修改游戏用户管理
     */
    @PreAuthorize("@ss.hasPermi('system:gameUser:edit')")
    @Log(title = "游戏用户管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FbGameUser fbGameUser)
    {
        return toAjax(fbGameUserService.updateFbGameUser(fbGameUser));
    }

    /**
     * 删除游戏用户管理
     */
    @PreAuthorize("@ss.hasPermi('system:gameUser:remove')")
    @Log(title = "游戏用户管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(fbGameUserService.deleteFbGameUserByIds(ids));
    }
}
