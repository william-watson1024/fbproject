package com.ruoyi.web.controller.app;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.Myfbuser;
import com.ruoyi.system.service.IMyfbuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ==================================================
 *
 * @Project : RuoYi-Vue
 * @Package : com.ruoyi.web.controller.app
 * @Class Name  : AppMyfbuserController
 * --------------------------------------------------
 * @Author : William
 * @Date : 2025-05-31 21:19:50
 * @Description : TODO
 * ==================================================
 */
@RestController
@RequestMapping("/app/user")
public class AppMyfbuserController extends BaseController {

    @Autowired
    private IMyfbuserService myfbuserService;

    @PostMapping("/register")
    public AjaxResult register(@RequestBody Myfbuser user) {
        if (user.getAccount() == null || user.getPassword() == null || user.getName() == null) {
            return AjaxResult.error("账号、密码、用户名不能为空");
        }

        // 用已有的 selectMyfbuserList 模糊查找是否已存在该账号（如果没单独查 account 的方法）
        List<Myfbuser> list = myfbuserService.selectMyfbuserList(user);
        if (!list.isEmpty()) {
            return AjaxResult.error("账号已存在");
        }

        user.setPoints(0L); // 初始积分
        return toAjax(myfbuserService.insertMyfbuser(user));
    }

    @PostMapping("/login")
    public AjaxResult login(@RequestBody Myfbuser user) {
        List<Myfbuser> list = myfbuserService.selectMyfbuserList(user);
        if (list.isEmpty()) {
            return AjaxResult.error("账号或密码错误");
        }
        return AjaxResult.success("登录成功").put("user", list.get(0));
    }

    @GetMapping("/points/{id}")
    public AjaxResult getUserPoints(@PathVariable Long id) {
        Myfbuser user = myfbuserService.selectMyfbuserById(id);
        if (user == null) {
            return AjaxResult.error("用户不存在");
        }
        return AjaxResult.success().put("points", user.getPoints());
    }

    @GetMapping("/info/{id}")
    public AjaxResult getUserInfo(@PathVariable Long id) {
        Myfbuser user = myfbuserService.selectMyfbuserById(id);
        if (user == null) {
            return AjaxResult.error("用户不存在");
        }
        // 只返回需要的属性
        Map<String, Object> data = new HashMap<>();
        data.put("id",user.getId());
        data.put("account", user.getAccount());
        data.put("name", user.getName());
        data.put("points", user.getPoints());
        return AjaxResult.success().put("user", data);
    }
}

