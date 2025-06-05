package com.ruoyi.web.controller.app;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.Mybetrecord;
import com.ruoyi.system.domain.Myfbuser;
import com.ruoyi.system.service.IMybetrecordService;
import com.ruoyi.system.service.IMyfbuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

/**
 * ==================================================
 *
 * @Project : RuoYi-Vue
 * @Package : com.ruoyi.web.controller.app
 * @Class Name  : AppMybetrecordController
 * --------------------------------------------------
 * @Author : William
 * @Date : 2025-05-31 21:15:14
 * @Description : TODO
 * ==================================================
 */
@RestController
@RequestMapping("/app/mybetrecord")
public class AppMybetrecordController extends BaseController {

    @Autowired
    private IMybetrecordService mybetrecordService;

    @Autowired
    private IMyfbuserService myfbuserService;

    @PostMapping("/add")
    public AjaxResult add(@RequestBody Mybetrecord mybetrecord) {
        Long userId = mybetrecord.getMyFbuserId();
        Long betAmount = mybetrecord.getBetNum();

        // 获取下注用户
        Myfbuser user = myfbuserService.selectMyfbuserById(userId);
        if (user == null) {
            return AjaxResult.error("下注失败：用户不存在");
        }

        Long currentPoints = user.getPoints();
        if (currentPoints == null || betAmount == null || betAmount <= 0) {
            return AjaxResult.error("下注失败：积分或下注数量非法");
        }

        if (currentPoints < betAmount) {
            return AjaxResult.error("下注失败：积分不足，当前积分为 " + currentPoints);
        }
        LocalDateTime now = LocalDateTime.now();
        mybetrecord.setBetTime(now);
        mybetrecord.setIsActive(1L);

        // 下注成功，更新用户积分并添加下注记录
        int result = mybetrecordService.insertMybetrecord(mybetrecord);
        if (result > 0) {
            user.setPoints(currentPoints - betAmount);
            myfbuserService.updateMyfbuser(user); // 更新积分
            return AjaxResult.success("下注成功，剩余积分：" + user.getPoints());
        } else {
            return AjaxResult.error("下注失败：系统错误");
        }
    }

}