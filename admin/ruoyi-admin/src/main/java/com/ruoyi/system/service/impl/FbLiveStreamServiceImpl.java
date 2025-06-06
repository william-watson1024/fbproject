package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FbLiveStreamMapper;
import com.ruoyi.system.domain.FbLiveStream;
import com.ruoyi.system.service.IFbLiveStreamService;

/**
 * 直播网站管理Service业务层处理
 * 
 * @author leo
 * @date 2025-06-06
 */
@Service
public class FbLiveStreamServiceImpl implements IFbLiveStreamService 
{
    @Autowired
    private FbLiveStreamMapper fbLiveStreamMapper;

    /**
     * 查询直播网站管理
     * 
     * @param id 直播网站管理主键
     * @return 直播网站管理
     */
    @Override
    public FbLiveStream selectFbLiveStreamById(Long id)
    {
        return fbLiveStreamMapper.selectFbLiveStreamById(id);
    }

    /**
     * 查询直播网站管理列表
     * 
     * @param fbLiveStream 直播网站管理
     * @return 直播网站管理
     */
    @Override
    public List<FbLiveStream> selectFbLiveStreamList(FbLiveStream fbLiveStream)
    {
        return fbLiveStreamMapper.selectFbLiveStreamList(fbLiveStream);
    }

    /**
     * 新增直播网站管理
     * 
     * @param fbLiveStream 直播网站管理
     * @return 结果
     */
    @Override
    public int insertFbLiveStream(FbLiveStream fbLiveStream)
    {
        return fbLiveStreamMapper.insertFbLiveStream(fbLiveStream);
    }

    /**
     * 修改直播网站管理
     * 
     * @param fbLiveStream 直播网站管理
     * @return 结果
     */
    @Override
    public int updateFbLiveStream(FbLiveStream fbLiveStream)
    {
        return fbLiveStreamMapper.updateFbLiveStream(fbLiveStream);
    }

    /**
     * 批量删除直播网站管理
     * 
     * @param ids 需要删除的直播网站管理主键
     * @return 结果
     */
    @Override
    public int deleteFbLiveStreamByIds(Long[] ids)
    {
        return fbLiveStreamMapper.deleteFbLiveStreamByIds(ids);
    }

    /**
     * 删除直播网站管理信息
     * 
     * @param id 直播网站管理主键
     * @return 结果
     */
    @Override
    public int deleteFbLiveStreamById(Long id)
    {
        return fbLiveStreamMapper.deleteFbLiveStreamById(id);
    }

    @Override
    public int changeStatus(FbLiveStream fbLiveStream) {
        // 只更新 status 字段
        return fbLiveStreamMapper.updateLiveStreamStatus(fbLiveStream.getId(), fbLiveStream.getIsActive());
    }

}
