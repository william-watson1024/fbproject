package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MyfbwebMapper;
import com.ruoyi.system.domain.Myfbweb;
import com.ruoyi.system.service.IMyfbwebService;

/**
 * 直播链接管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-05-30
 */
@Service
public class MyfbwebServiceImpl implements IMyfbwebService 
{
    @Autowired
    private MyfbwebMapper myfbwebMapper;

    /**
     * 查询直播链接管理
     * 
     * @param id 直播链接管理主键
     * @return 直播链接管理
     */
    @Override
    public Myfbweb selectMyfbwebById(Long id)
    {
        return myfbwebMapper.selectMyfbwebById(id);
    }

    /**
     * 查询直播链接管理列表
     * 
     * @param myfbweb 直播链接管理
     * @return 直播链接管理
     */
    @Override
    public List<Myfbweb> selectMyfbwebList(Myfbweb myfbweb)
    {
        return myfbwebMapper.selectMyfbwebList(myfbweb);
    }

    /**
     * 新增直播链接管理
     * 
     * @param myfbweb 直播链接管理
     * @return 结果
     */
    @Override
    public int insertMyfbweb(Myfbweb myfbweb)
    {
        return myfbwebMapper.insertMyfbweb(myfbweb);
    }

    /**
     * 修改直播链接管理
     * 
     * @param myfbweb 直播链接管理
     * @return 结果
     */
    @Override
    public int updateMyfbweb(Myfbweb myfbweb)
    {
        return myfbwebMapper.updateMyfbweb(myfbweb);
    }

    /**
     * 批量删除直播链接管理
     * 
     * @param ids 需要删除的直播链接管理主键
     * @return 结果
     */
    @Override
    public int deleteMyfbwebByIds(Long[] ids)
    {
        return myfbwebMapper.deleteMyfbwebByIds(ids);
    }

    /**
     * 删除直播链接管理信息
     * 
     * @param id 直播链接管理主键
     * @return 结果
     */
    @Override
    public int deleteMyfbwebById(Long id)
    {
        return myfbwebMapper.deleteMyfbwebById(id);
    }
}
