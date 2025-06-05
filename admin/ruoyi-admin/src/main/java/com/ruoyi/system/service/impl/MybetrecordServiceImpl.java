package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MybetrecordMapper;
import com.ruoyi.system.domain.Mybetrecord;
import com.ruoyi.system.service.IMybetrecordService;

/**
 * 下注信息管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-05-31
 */
@Service
public class MybetrecordServiceImpl implements IMybetrecordService 
{
    @Autowired
    private MybetrecordMapper mybetrecordMapper;

    /**
     * 查询下注信息管理
     * 
     * @param id 下注信息管理主键
     * @return 下注信息管理
     */
    @Override
    public Mybetrecord selectMybetrecordById(Long id)
    {
        return mybetrecordMapper.selectMybetrecordById(id);
    }

    /**
     * 查询下注信息管理列表
     * 
     * @param mybetrecord 下注信息管理
     * @return 下注信息管理
     */
    @Override
    public List<Mybetrecord> selectMybetrecordList(Mybetrecord mybetrecord)
    {
        return mybetrecordMapper.selectMybetrecordList(mybetrecord);
    }

    /**
     * 新增下注信息管理
     * 
     * @param mybetrecord 下注信息管理
     * @return 结果
     */
    @Override
    public int insertMybetrecord(Mybetrecord mybetrecord)
    {
        return mybetrecordMapper.insertMybetrecord(mybetrecord);
    }

    /**
     * 修改下注信息管理
     * 
     * @param mybetrecord 下注信息管理
     * @return 结果
     */
    @Override
    public int updateMybetrecord(Mybetrecord mybetrecord)
    {
        return mybetrecordMapper.updateMybetrecord(mybetrecord);
    }

    /**
     * 批量删除下注信息管理
     * 
     * @param ids 需要删除的下注信息管理主键
     * @return 结果
     */
    @Override
    public int deleteMybetrecordByIds(Long[] ids)
    {
        return mybetrecordMapper.deleteMybetrecordByIds(ids);
    }

    /**
     * 删除下注信息管理信息
     * 
     * @param id 下注信息管理主键
     * @return 结果
     */
    @Override
    public int deleteMybetrecordById(Long id)
    {
        return mybetrecordMapper.deleteMybetrecordById(id);
    }

    @Override
    public List<Mybetrecord> selectActiveRecords() {
        return mybetrecordMapper.selectActiveRecords();
    }
}
