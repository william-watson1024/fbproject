package com.ruoyi.system.controller;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.system.Do.BetProcessRequest;
import com.ruoyi.system.domain.Myfbuser;
import com.ruoyi.system.service.IMyfbuserService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Mybetrecord;
import com.ruoyi.system.service.IMybetrecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 下注信息管理Controller
 * 
 * @author ruoyi
 * @date 2025-05-31
 */


@RestController
@RequestMapping("/system/mybetrecord")
public class MybetrecordController extends BaseController
{
    @Autowired
    private IMybetrecordService mybetrecordService;

    @Autowired
    private IMyfbuserService IMyfbuserService;
    /**
     * 查询下注信息管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:mybetrecord:list')")
    @GetMapping("/list")
    public TableDataInfo list(Mybetrecord mybetrecord)
    {
        startPage();
        List<Mybetrecord> list = mybetrecordService.selectMybetrecordList(mybetrecord);
        return getDataTable(list);
    }

    /**
     * 导出下注信息管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:mybetrecord:export')")
    @Log(title = "下注信息管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Mybetrecord mybetrecord)
    {
        List<Mybetrecord> list = mybetrecordService.selectMybetrecordList(mybetrecord);
        ExcelUtil<Mybetrecord> util = new ExcelUtil<Mybetrecord>(Mybetrecord.class);
        util.exportExcel(response, list, "下注信息管理数据");
    }

    /**
     * 获取下注信息管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:mybetrecord:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(mybetrecordService.selectMybetrecordById(id));
    }

    /**
     * 新增下注信息管理
     */
    @PreAuthorize("@ss.hasPermi('system:mybetrecord:add')")
    @Log(title = "下注信息管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Mybetrecord mybetrecord) {
        return toAjax(mybetrecordService.insertMybetrecord(mybetrecord));
    }

    /**
     * 修改下注信息管理
     */
    @PreAuthorize("@ss.hasPermi('system:mybetrecord:edit')")
    @Log(title = "下注信息管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Mybetrecord mybetrecord)
    {
        return toAjax(mybetrecordService.updateMybetrecord(mybetrecord));
    }

    /**
     * 删除下注信息管理
     */
    @PreAuthorize("@ss.hasPermi('system:mybetrecord:remove')")
    @Log(title = "下注信息管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(mybetrecordService.deleteMybetrecordByIds(ids));
    }


    @PreAuthorize("@ss.hasPermi('system:mybetrecord:process')")
    @Log(title = "处理下注记录", businessType = BusinessType.UPDATE)
    @PostMapping("/process")
    public AjaxResult processBetRecord(@RequestBody BetProcessRequest request) {
        String betName = request.getBetName();
        Integer multiple = request.getMultiple();

        // 如果前端没传 multiple 或 betName 为 null，可以在这里做一次非空校验：
        if (betName == null || betName.trim().isEmpty() || multiple == null) {
            return AjaxResult.error("参数 betName 或 multiple 不能为空");
        }

        // Step 1: 查找所有 is_active = 1 的记录
        List<Mybetrecord> activeRecords = mybetrecordService.selectActiveRecords();

        // Step 2: 将这些记录的 is_active 字段更新为 0
        for (Mybetrecord record : activeRecords) {
            record.setIsActive(0L);
            mybetrecordService.updateMybetrecord(record);
        }

        // Step 3: 处理 bet_name 与参数相同的记录
        for (Mybetrecord record : activeRecords) {
            if (betName.equals(record.getBetName())) {
                Long userId = record.getMyFbuserId();
                Integer betNum = record.getBetNum().intValue();

                // Step 4: 根据 my_fbuser_id 查找用户并更新积分
                Myfbuser user = IMyfbuserService.selectMyfbuserById(userId);
                if (user != null) {
                    int additionalPoints = multiple * betNum;
                    user.setPoints(user.getPoints() + additionalPoints);
                    IMyfbuserService.updateMyfbuser(user);
                }
            }
        }

        return AjaxResult.success("处理完成");
    }


}
