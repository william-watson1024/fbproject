package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.FbGameRecord;

/**
 * 游戏记录管理Service接口
 * 
 * @author leo
 * @date 2025-06-06
 */
public interface IFbGameRecordService 
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
     * 批量删除游戏记录管理
     * 
     * @param ids 需要删除的游戏记录管理主键集合
     * @return 结果
     */
    public int deleteFbGameRecordByIds(Long[] ids);

    /**
     * 删除游戏记录管理信息
     * 
     * @param id 游戏记录管理主键
     * @return 结果
     */
    public int deleteFbGameRecordById(Long id);

    // domain 已支持 resultImage 字段，接口方法签名无需变
}
