package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.FbGameUser;

/**
 * 游戏用户管理Mapper接口
 * 
 * @author leo
 * @date 2025-06-06
 */
public interface FbGameUserMapper 
{
    /**
     * 查询游戏用户管理
     * 
     * @param id 游戏用户管理主键
     * @return 游戏用户管理
     */
    public FbGameUser selectFbGameUserById(Long id);

    /**
     * 查询游戏用户管理列表
     * 
     * @param fbGameUser 游戏用户管理
     * @return 游戏用户管理集合
     */
    public List<FbGameUser> selectFbGameUserList(FbGameUser fbGameUser);

    /**
     * 新增游戏用户管理
     * 
     * @param fbGameUser 游戏用户管理
     * @return 结果
     */
    public int insertFbGameUser(FbGameUser fbGameUser);

    /**
     * 修改游戏用户管理
     * 
     * @param fbGameUser 游戏用户管理
     * @return 结果
     */
    public int updateFbGameUser(FbGameUser fbGameUser);

    /**
     * 删除游戏用户管理
     * 
     * @param id 游戏用户管理主键
     * @return 结果
     */
    public int deleteFbGameUserById(Long id);

    /**
     * 批量删除游戏用户管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFbGameUserByIds(Long[] ids);

    FbGameUser selectUserByAccount(String account);
}
