package com.ruoyi.system.service.impl;

import java.time.LocalDateTime;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FbGameInfoMapper;
import com.ruoyi.system.domain.FbGameInfo;
import com.ruoyi.system.service.IFbGameInfoService;

/**
 * 游戏信息管理Service业务层处理
 * 
 * @author leo
 * @date 2025-06-06
 */
@Service
public class FbGameInfoServiceImpl implements IFbGameInfoService 
{
    @Autowired
    private FbGameInfoMapper fbGameInfoMapper;

    /**
     * 查询游戏信息管理
     * 
     * @param id 游戏信息管理主键
     * @return 游戏信息管理
     */
    @Override
    public FbGameInfo selectFbGameInfoById(Long id)
    {
        return fbGameInfoMapper.selectFbGameInfoById(id);
    }

    /**
     * 查询游戏信息管理列表
     * 
     * @param fbGameInfo 游戏信息管理
     * @return 游戏信息管理
     */
    @Override
    public List<FbGameInfo> selectFbGameInfoList(FbGameInfo fbGameInfo)
    {
        return fbGameInfoMapper.selectFbGameInfoList(fbGameInfo);
    }

    /**
     * 新增游戏信息管理
     * 
     * @param fbGameInfo 游戏信息管理
     * @return 结果
     */
    @Override
    public int insertFbGameInfo(FbGameInfo fbGameInfo)
    {
        return fbGameInfoMapper.insertFbGameInfo(fbGameInfo);
    }

    /**
     * 修改游戏信息管理
     * 
     * @param fbGameInfo 游戏信息管理
     * @return 结果
     */
    @Override
    public int updateFbGameInfo(FbGameInfo fbGameInfo)
    {
        return fbGameInfoMapper.updateFbGameInfo(fbGameInfo);
    }

    /**
     * 批量删除游戏信息管理
     * 
     * @param ids 需要删除的游戏信息管理主键
     * @return 结果
     */
    @Override
    public int deleteFbGameInfoByIds(Long[] ids)
    {
        return fbGameInfoMapper.deleteFbGameInfoByIds(ids);
    }

    /**
     * 删除游戏信息管理信息
     * 
     * @param id 游戏信息管理主键
     * @return 结果
     */
    @Override
    public int deleteFbGameInfoById(Long id)
    {
        return fbGameInfoMapper.deleteFbGameInfoById(id);
    }

    @Override
    public List<FbGameInfo> selectFbGameInfoListAfterTime(LocalDateTime time) {
        return fbGameInfoMapper.selectFbGameInfoListAfterTime(time);
    }

    @Override
    public FbGameInfo selectFbGameInfoByGameInfo(Long gameRound) {
        return fbGameInfoMapper.selectFbGameInfoByGameInfo(gameRound);
    }
}
