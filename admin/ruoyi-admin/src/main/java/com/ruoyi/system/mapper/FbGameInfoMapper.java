package com.ruoyi.system.mapper;

import java.time.LocalDateTime;
import java.util.List;
import com.ruoyi.system.domain.FbGameInfo;

/**
 * 游戏信息管理Mapper接口
 * 
 * @author leo
 * @date 2025-06-06
 */
public interface FbGameInfoMapper 
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
     * 删除游戏信息管理
     * 
     * @param id 游戏信息管理主键
     * @return 结果
     */
    public int deleteFbGameInfoById(Long id);

    /**
     * 批量删除游戏信息管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFbGameInfoByIds(Long[] ids);

    public List<FbGameInfo> selectFbGameInfoListAfterTime(LocalDateTime time);

    FbGameInfo selectFbGameInfoByGameInfo(Long gameRound);
}
