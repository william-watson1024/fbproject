package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MyfbuserMapper;
import com.ruoyi.system.domain.Myfbuser;
import com.ruoyi.system.service.IMyfbuserService;

/**
 * 投注积分用户管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-05-30
 */
@Service
public class MyfbuserServiceImpl implements IMyfbuserService 
{
    @Autowired
    private MyfbuserMapper myfbuserMapper;

    /**
     * 查询投注积分用户管理
     * 
     * @param id 投注积分用户管理主键
     * @return 投注积分用户管理
     */
    @Override
    public Myfbuser selectMyfbuserById(Long id)
    {
        return myfbuserMapper.selectMyfbuserById(id);
    }

    /**
     * 查询投注积分用户管理列表
     * 
     * @param myfbuser 投注积分用户管理
     * @return 投注积分用户管理
     */
    @Override
    public List<Myfbuser> selectMyfbuserList(Myfbuser myfbuser)
    {
        return myfbuserMapper.selectMyfbuserList(myfbuser);
    }

    /**
     * 新增投注积分用户管理
     * 
     * @param myfbuser 投注积分用户管理
     * @return 结果
     */
    @Override
    public int insertMyfbuser(Myfbuser myfbuser)
    {
        return myfbuserMapper.insertMyfbuser(myfbuser);
    }

    /**
     * 修改投注积分用户管理
     * 
     * @param myfbuser 投注积分用户管理
     * @return 结果
     */
    @Override
    public int updateMyfbuser(Myfbuser myfbuser)
    {
        return myfbuserMapper.updateMyfbuser(myfbuser);
    }

    /**
     * 批量删除投注积分用户管理
     * 
     * @param ids 需要删除的投注积分用户管理主键
     * @return 结果
     */
    @Override
    public int deleteMyfbuserByIds(Long[] ids)
    {
        return myfbuserMapper.deleteMyfbuserByIds(ids);
    }

    /**
     * 删除投注积分用户管理信息
     * 
     * @param id 投注积分用户管理主键
     * @return 结果
     */
    @Override
    public int deleteMyfbuserById(Long id)
    {
        return myfbuserMapper.deleteMyfbuserById(id);
    }
}
