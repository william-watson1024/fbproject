package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FbGameUserMapper;
import com.ruoyi.system.domain.FbGameUser;
import com.ruoyi.system.service.IFbGameUserService;

/**
 * 游戏用户管理Service业务层处理
 * 
 * @author leo
 * @date 2025-06-06
 */
@Service
public class FbGameUserServiceImpl implements IFbGameUserService 
{
    @Autowired
    private FbGameUserMapper fbGameUserMapper;

    /**
     * 查询游戏用户管理
     * 
     * @param id 游戏用户管理主键
     * @return 游戏用户管理
     */
    @Override
    public FbGameUser selectFbGameUserById(Long id)
    {
        return fbGameUserMapper.selectFbGameUserById(id);
    }

    /**
     * 查询游戏用户管理列表
     * 
     * @param fbGameUser 游戏用户管理
     * @return 游戏用户管理
     */
    @Override
    public List<FbGameUser> selectFbGameUserList(FbGameUser fbGameUser)
    {
        return fbGameUserMapper.selectFbGameUserList(fbGameUser);
    }

    /**
     * 新增游戏用户管理
     * 
     * @param fbGameUser 游戏用户管理
     * @return 结果
     */
    @Override
    public int insertFbGameUser(FbGameUser fbGameUser)
    {
        return fbGameUserMapper.insertFbGameUser(fbGameUser);
    }

    /**
     * 修改游戏用户管理
     * 
     * @param fbGameUser 游戏用户管理
     * @return 结果
     */
    @Override
    public int updateFbGameUser(FbGameUser fbGameUser)
    {
        return fbGameUserMapper.updateFbGameUser(fbGameUser);
    }

    /**
     * 批量删除游戏用户管理
     * 
     * @param ids 需要删除的游戏用户管理主键
     * @return 结果
     */
    @Override
    public int deleteFbGameUserByIds(Long[] ids)
    {
        return fbGameUserMapper.deleteFbGameUserByIds(ids);
    }

    /**
     * 删除游戏用户管理信息
     * 
     * @param id 游戏用户管理主键
     * @return 结果
     */
    @Override
    public int deleteFbGameUserById(Long id)
    {
        return fbGameUserMapper.deleteFbGameUserById(id);
    }

    @Override
    public FbGameUser selectUserByAccount(String account) {
        return fbGameUserMapper.selectUserByAccount(account);
    }
}
