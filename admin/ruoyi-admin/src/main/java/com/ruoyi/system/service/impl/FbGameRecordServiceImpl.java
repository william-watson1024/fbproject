package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FbGameRecordMapper;
import com.ruoyi.system.domain.FbGameRecord;
import com.ruoyi.system.service.IFbGameRecordService;

/**
 * 游戏记录管理Service业务层处理
 * 
 * @author leo
 * @date 2025-06-06
 */
@Service
public class FbGameRecordServiceImpl implements IFbGameRecordService 
{
    @Autowired
    private FbGameRecordMapper fbGameRecordMapper;

    /**
     * 查询游戏记录管理
     * 
     * @param id 游戏记录管理主键
     * @return 游戏记录管理
     */
    @Override
    public FbGameRecord selectFbGameRecordById(Long id)
    {
        return fbGameRecordMapper.selectFbGameRecordById(id);
    }

    /**
     * 查询游戏记录管理列表
     * 
     * @param fbGameRecord 游戏记录管理
     * @return 游戏记录管理
     */
    @Override
    public List<FbGameRecord> selectFbGameRecordList(FbGameRecord fbGameRecord)
    {
        return fbGameRecordMapper.selectFbGameRecordList(fbGameRecord);
    }

    /**
     * 新增游戏记录管理
     * 
     * @param fbGameRecord 游戏记录管理
     * @return 结果
     */
    @Override
    public int insertFbGameRecord(FbGameRecord fbGameRecord)
    {
        return fbGameRecordMapper.insertFbGameRecord(fbGameRecord);
    }

    /**
     * 修改游戏记录管理
     * 
     * @param fbGameRecord 游戏记录管理
     * @return 结果
     */
    @Override
    public int updateFbGameRecord(FbGameRecord fbGameRecord)
    {
        return fbGameRecordMapper.updateFbGameRecord(fbGameRecord);
    }

    /**
     * 批量删除游戏记录管理
     * 
     * @param ids 需要删除的游戏记录管理主键
     * @return 结果
     */
    @Override
    public int deleteFbGameRecordByIds(Long[] ids)
    {
        return fbGameRecordMapper.deleteFbGameRecordByIds(ids);
    }

    /**
     * 删除游戏记录管理信息
     * 
     * @param id 游戏记录管理主键
     * @return 结果
     */
    @Override
    public int deleteFbGameRecordById(Long id)
    {
        return fbGameRecordMapper.deleteFbGameRecordById(id);
    }
}
