package com.ruoyi.web.controller.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.Myfbweb;
import com.ruoyi.system.service.IMyfbwebService;

/**
 * 用户端 - 直播链接展示接口
 * 无需登录即可访问（或你想加用户登录也可以）
 *
 * @author William
 */
@RestController
@RequestMapping("/app/myfbweb")
public class AppMyfbwebController extends BaseController {

    @Autowired
    private IMyfbwebService myfbwebService;

    /**
     * 获取直播链接（开放接口，用户端使用）
     * 示例请求：GET /app/myfbweb/listAvailable
     */
    @GetMapping("/listAvailable")
    public AjaxResult listAvailable() {
        // 可以添加状态判断、时间过滤等
        Myfbweb query = new Myfbweb();
        query.setIsActive(1); // 比如只查“启用”状态的直播链接
        List<Myfbweb> list = myfbwebService.selectMyfbwebList(query);
        return success(list);
    }

    /**
     * 获取某个直播链接详情（用户端）
     * 示例请求：GET /app/myfbweb/1
     */
    @GetMapping("/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(myfbwebService.selectMyfbwebById(id));
    }
}
