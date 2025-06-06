package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.FbGameRecord;

/**
 * 游戏记录管理Mapper接口
 * 
 * @author leo
 * @date 2025-06-06
 */
public interface FbGameRecordMapper 
{
    /**
     * 查询游戏记录管理
     * 
     * @param id 游戏记录管理主键
     * @return 游戏记录管理
     */
    public FbGameRecord selectFbGameRecordById(Long id);

    /**
     * 查询游戏记录管理列表
     * 
     * @param fbGameRecord 游戏记录管理
     * @return 游戏记录管理集合
     */
    public List<FbGameRecord> selectFbGameRecordList(FbGameRecord fbGameRecord);

    /**
     * 新增游戏记录管理
     * 
     * @param fbGameRecord 游戏记录管理
     * @return 结果
     */
    public int insertFbGameRecord(FbGameRecord fbGameRecord);

    /**
     * 修改游戏记录管理
     * 
     * @param fbGameRecord 游戏记录管理
     * @return 结果
     */
    public int updateFbGameRecord(FbGameRecord fbGameRecord);

    /**
     * 删除游戏记录管理
     * 
     * @param id 游戏记录管理主键
     * @return 结果
     */
    public int deleteFbGameRecordById(Long id);

    /**
     * 批量删除游戏记录管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFbGameRecordByIds(Long[] ids);
}
