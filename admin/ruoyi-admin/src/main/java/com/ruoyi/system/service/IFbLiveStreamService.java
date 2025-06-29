package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.FbLiveStream;

/**
 * 直播网站管理Service接口
 * 
 * @author leo
 * @date 2025-06-06
 */
public interface IFbLiveStreamService 
{
    /**
     * 查询直播网站管理
     * 
     * @param id 直播网站管理主键
     * @return 直播网站管理
     */
    public FbLiveStream selectFbLiveStreamById(Long id);

    /**
     * 查询直播网站管理列表
     * 
     * @param fbLiveStream 直播网站管理
     * @return 直播网站管理集合
     */
    public List<FbLiveStream> selectFbLiveStreamList(FbLiveStream fbLiveStream);

    /**
     * 新增直播网站管理
     * 
     * @param fbLiveStream 直播网站管理
     * @return 结果
     */
    public int insertFbLiveStream(FbLiveStream fbLiveStream);

    /**
     * 修改直播网站管理
     * 
     * @param fbLiveStream 直播网站管理
     * @return 结果
     */
    public int updateFbLiveStream(FbLiveStream fbLiveStream);

    /**
     * 批量删除直播网站管理
     * 
     * @param ids 需要删除的直播网站管理主键集合
     * @return 结果
     */
    public int deleteFbLiveStreamByIds(Long[] ids);

    /**
     * 删除直播网站管理信息
     * 
     * @param id 直播网站管理主键
     * @return 结果
     */
    public int deleteFbLiveStreamById(Long id);

    int changeStatus(FbLiveStream fbLiveStream);
}
