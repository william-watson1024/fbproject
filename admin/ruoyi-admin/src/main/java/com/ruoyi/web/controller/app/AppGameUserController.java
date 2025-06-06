package com.ruoyi.web.controller.app;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.FbGameUser;
import com.ruoyi.system.service.IFbGameUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.*;

/**
 * ==================================================
 * @Project     : admin
 * @Package     : com.ruoyi.web.controller.app
 * @ClassName   : AppGameUserController
 * @Author      : William
 * @Date        : 2025-06-07
 * @Description : App端游戏用户控制器
 * ==================================================
 */
@RestController
@RequestMapping("/app/gameUser")
public class AppGameUserController extends BaseController {

    @Autowired
    private IFbGameUserService fbGameUserService;
    @Autowired
    private StringRedisTemplate redisTemplate;
    @Value("${app.recharge-token}")
    private String rechargeToken;

    /**
     * 登录接口
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestParam String account, @RequestParam String password) {
        FbGameUser user = fbGameUserService.selectUserByAccount(account);
        if (user == null) {
            return AjaxResult.error("账号不存在");
        }
        if (!user.getPassword().equals(password)) {
            return AjaxResult.error("密码错误");
        }
        return AjaxResult.success("登录成功", user);
    }

    /**
     * 注册接口
     */
    @PostMapping("/register")
    public AjaxResult register(@RequestParam String account, @RequestParam String password, @RequestParam String name) {
        FbGameUser existing = fbGameUserService.selectUserByAccount(account);
        if (existing != null) {
            return AjaxResult.error("账号已存在");
        }

        FbGameUser newUser = new FbGameUser();
        newUser.setAccount(account);
        newUser.setPassword(password);
        newUser.setName(name);
        newUser.setPoints(0L); // 初始积分为0

        int result = fbGameUserService.insertFbGameUser(newUser);
        return result > 0 ? AjaxResult.success("注册成功") : AjaxResult.error("注册失败");
    }

    /**
     * 注册并登录接口
     */
    @PostMapping("/registerAndLogin")
    public AjaxResult registerAndLogin(@RequestParam String account, @RequestParam String password, @RequestParam String name) {
        FbGameUser existing = fbGameUserService.selectUserByAccount(account);
        if (existing != null) {
            return AjaxResult.error("账号已存在");
        }

        FbGameUser newUser = new FbGameUser();
        newUser.setAccount(account);
        newUser.setPassword(password);
        newUser.setName(name);
        newUser.setPoints(0L);

        int result = fbGameUserService.insertFbGameUser(newUser);
        if (result > 0) {
            return AjaxResult.success("注册并登录成功", newUser);
        }
        return AjaxResult.error("注册失败");
    }

    /**
     * 查询积分接口
     */
    @GetMapping("/points")
    public AjaxResult getPoints(@RequestParam String account) {
        FbGameUser user = fbGameUserService.selectUserByAccount(account);
        if (user == null) {
            return AjaxResult.error("账号不存在");
        }
        return AjaxResult.success("查询成功", user.getPoints());
    }
    /**
     * Token积分充值接口
     */
    @PostMapping("/rechargePointsByToken")
    public AjaxResult rechargePointsByToken(@RequestParam String account, @RequestParam Long amount, @RequestParam String token) {
        // 1. 验证 Token（此处简单模拟）
        if (!rechargeToken.equals(token)) {
            return AjaxResult.error("无效的确认 Token");
        }

        // 2. 查询用户
        FbGameUser user = fbGameUserService.selectUserByAccount(account);
        if (user == null) {
            return AjaxResult.error("账号不存在");
        }

        // 3. 增加积分并更新
        long newPoints = user.getPoints() + amount;
        user.setPoints(newPoints);
        int result = fbGameUserService.updateFbGameUser(user);

        return result > 0
                ? AjaxResult.success("积分充值成功，当前积分：" + newPoints)
                : AjaxResult.error("充值失败");
    }
    /**
     * redis令牌用户积分充值接口
     */
    @PostMapping("/rechargeByRedisToken")
    public AjaxResult rechargeByRedisToken(String account, Long points, String token) {
        // 1. 从 Redis 获取存储的 token
        String redisKey = "recharge_token:" + account;
        String realToken = redisTemplate.opsForValue().get(redisKey);

        // 2. 判断是否匹配
        if (realToken == null || !realToken.equals(token)) {
            return AjaxResult.error("Token 无效或已过期");
        }

        // 3. 删除 token（防止重复使用）
        redisTemplate.delete(redisKey);

        // 4. 查询用户并充值
        FbGameUser user = fbGameUserService.selectUserByAccount(account);
        if (user == null) {
            return AjaxResult.error("用户不存在");
        }

        user.setPoints(user.getPoints() + points);
        fbGameUserService.updateFbGameUser(user);

        return AjaxResult.success("充值成功，当前积分为：" + user.getPoints());
    }


}
