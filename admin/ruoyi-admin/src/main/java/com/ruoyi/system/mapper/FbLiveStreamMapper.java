package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.FbLiveStream;

/**
 * 直播网站管理Mapper接口
 * 
 * @author leo
 * @date 2025-06-06
 */
public interface FbLiveStreamMapper 
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
     * 删除直播网站管理
     * 
     * @param id 直播网站管理主键
     * @return 结果
     */
    public int deleteFbLiveStreamById(Long id);

    /**
     * 批量删除直播网站管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFbLiveStreamByIds(Long[] ids);
}
