package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Myfbuser;

/**
 * 投注积分用户管理Service接口
 * 
 * @author ruoyi
 * @date 2025-05-30
 */
public interface IMyfbuserService 
{
    /**
     * 查询投注积分用户管理
     * 
     * @param id 投注积分用户管理主键
     * @return 投注积分用户管理
     */
    public Myfbuser selectMyfbuserById(Long id);

    /**
     * 查询投注积分用户管理列表
     * 
     * @param myfbuser 投注积分用户管理
     * @return 投注积分用户管理集合
     */
    public List<Myfbuser> selectMyfbuserList(Myfbuser myfbuser);

    /**
     * 新增投注积分用户管理
     * 
     * @param myfbuser 投注积分用户管理
     * @return 结果
     */
    public int insertMyfbuser(Myfbuser myfbuser);

    /**
     * 修改投注积分用户管理
     * 
     * @param myfbuser 投注积分用户管理
     * @return 结果
     */
    public int updateMyfbuser(Myfbuser myfbuser);

    /**
     * 批量删除投注积分用户管理
     * 
     * @param ids 需要删除的投注积分用户管理主键集合
     * @return 结果
     */
    public int deleteMyfbuserByIds(Long[] ids);

    /**
     * 删除投注积分用户管理信息
     * 
     * @param id 投注积分用户管理主键
     * @return 结果
     */
    public int deleteMyfbuserById(Long id);
}
