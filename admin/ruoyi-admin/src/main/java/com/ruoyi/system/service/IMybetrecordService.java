package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Mybetrecord;

/**
 * 下注信息管理Service接口
 * 
 * @author ruoyi
 * @date 2025-05-31
 */
public interface IMybetrecordService 
{
    /**
     * 查询下注信息管理
     * 
     * @param id 下注信息管理主键
     * @return 下注信息管理
     */
    public Mybetrecord selectMybetrecordById(Long id);

    /**
     * 查询下注信息管理列表
     * 
     * @param mybetrecord 下注信息管理
     * @return 下注信息管理集合
     */
    public List<Mybetrecord> selectMybetrecordList(Mybetrecord mybetrecord);

    /**
     * 新增下注信息管理
     * 
     * @param mybetrecord 下注信息管理
     * @return 结果
     */
    public int insertMybetrecord(Mybetrecord mybetrecord);

    /**
     * 修改下注信息管理
     * 
     * @param mybetrecord 下注信息管理
     * @return 结果
     */
    public int updateMybetrecord(Mybetrecord mybetrecord);

    /**
     * 批量删除下注信息管理
     * 
     * @param ids 需要删除的下注信息管理主键集合
     * @return 结果
     */
    public int deleteMybetrecordByIds(Long[] ids);

    /**
     * 删除下注信息管理信息
     * 
     * @param id 下注信息管理主键
     * @return 结果
     */
    public int deleteMybetrecordById(Long id);

    List<Mybetrecord> selectActiveRecords();
}
