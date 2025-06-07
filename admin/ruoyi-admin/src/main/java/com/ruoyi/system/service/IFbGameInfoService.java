package com.ruoyi.system.service;

import java.time.LocalDateTime;
import java.util.List;
import com.ruoyi.system.domain.FbGameInfo;

/**
 * 游戏信息管理Service接口
 * 
 * @author leo
 * @date 2025-06-06
 */
public interface IFbGameInfoService 
{
    /**
     * 查询游戏信息管理
     * 
     * @param id 游戏信息管理主键
     * @return 游戏信息管理
     */
    public FbGameInfo selectFbGameInfoById(Long id);

    /**
     * 查询游戏信息管理列表
     * 
     * @param fbGameInfo 游戏信息管理
     * @return 游戏信息管理集合
     */
    public List<FbGameInfo> selectFbGameInfoList(FbGameInfo fbGameInfo);

    /**
     * 新增游戏信息管理
     * 
     * @param fbGameInfo 游戏信息管理
     * @return 结果
     */
    public int insertFbGameInfo(FbGameInfo fbGameInfo);

    /**
     * 修改游戏信息管理
     * 
     * @param fbGameInfo 游戏信息管理
     * @return 结果
     */
    public int updateFbGameInfo(FbGameInfo fbGameInfo);

    /**
     * 批量删除游戏信息管理
     * 
     * @param ids 需要删除的游戏信息管理主键集合
     * @return 结果
     */
    public int deleteFbGameInfoByIds(Long[] ids);

    /**
     * 删除游戏信息管理信息
     * 
     * @param id 游戏信息管理主键
     * @return 结果
     */
    public int deleteFbGameInfoById(Long id);

    public List<FbGameInfo> selectFbGameInfoListAfterTime(LocalDateTime time);

    FbGameInfo selectFbGameInfoByGameInfo(Long gameRound);
}
