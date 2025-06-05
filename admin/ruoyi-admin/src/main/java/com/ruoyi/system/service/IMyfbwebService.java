package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Myfbweb;

/**
 * 直播链接管理Service接口
 * 
 * @author ruoyi
 * @date 2025-05-30
 */
public interface IMyfbwebService 
{
    /**
     * 查询直播链接管理
     * 
     * @param id 直播链接管理主键
     * @return 直播链接管理
     */
    public Myfbweb selectMyfbwebById(Long id);

    /**
     * 查询直播链接管理列表
     * 
     * @param myfbweb 直播链接管理
     * @return 直播链接管理集合
     */
    public List<Myfbweb> selectMyfbwebList(Myfbweb myfbweb);

    /**
     * 新增直播链接管理
     * 
     * @param myfbweb 直播链接管理
     * @return 结果
     */
    public int insertMyfbweb(Myfbweb myfbweb);

    /**
     * 修改直播链接管理
     * 
     * @param myfbweb 直播链接管理
     * @return 结果
     */
    public int updateMyfbweb(Myfbweb myfbweb);

    /**
     * 批量删除直播链接管理
     * 
     * @param ids 需要删除的直播链接管理主键集合
     * @return 结果
     */
    public int deleteMyfbwebByIds(Long[] ids);

    /**
     * 删除直播链接管理信息
     * 
     * @param id 直播链接管理主键
     * @return 结果
     */
    public int deleteMyfbwebById(Long id);
}
