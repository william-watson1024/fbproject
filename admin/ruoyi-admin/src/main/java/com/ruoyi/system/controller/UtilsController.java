package com.ruoyi.system.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/system/utils")
public class UtilsController extends BaseController {

    @Autowired
    private StringRedisTemplate redisTemplate;

    /**
     * 管理员生成一次性充值 token（有效期 5 分钟）
     */
    @PostMapping("/generateToken")
    public AjaxResult generateRechargeToken(String account) {
        String token = UUID.randomUUID().toString();
        redisTemplate.opsForValue().set("recharge_token:" + account, token, 5, TimeUnit.MINUTES);
        return AjaxResult.success("生成成功", token);
    }
}

