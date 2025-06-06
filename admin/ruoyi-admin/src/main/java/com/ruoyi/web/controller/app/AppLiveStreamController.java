package com.ruoyi.web.controller.app;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.FbLiveStream;
import com.ruoyi.system.service.IFbLiveStreamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * ==================================================
 *
 * @Project : admin
 * @Package : com.ruoyi.web.controller.app
 * @Class Name  : AppLiveStreamController
 * --------------------------------------------------
 * @Author : William
 * @Date : 2025-06-06 22:13:25
 * @Description : TODO
 * ==================================================
 */
@RestController
@RequestMapping("/app/liveStream")
public class AppLiveStreamController extends BaseController {

    @Autowired
    private IFbLiveStreamService fbLiveStreamService;
    /**
     * 更改直播间状态
     */

    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody FbLiveStream fbLiveStream) {
        return toAjax(fbLiveStreamService.changeStatus(fbLiveStream));
    }
}
