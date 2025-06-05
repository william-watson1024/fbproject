import request from '@/utils/request'

// 查询下注信息管理列表
export function listMybetrecord(query) {
  return request({
    url: '/system/mybetrecord/list',
    method: 'get',
    params: query
  })
}

// 查询下注信息管理详细
export function getMybetrecord(id) {
  return request({
    url: '/system/mybetrecord/' + id,
    method: 'get'
  })
}

// 新增下注信息管理
export function addMybetrecord(data) {
  return request({
    url: '/system/mybetrecord',
    method: 'post',
    data: data
  })
}

// 修改下注信息管理
export function updateMybetrecord(data) {
  return request({
    url: '/system/mybetrecord',
    method: 'put',
    data: data
  })
}

// 删除下注信息管理
export function delMybetrecord(id) {
  return request({
    url: '/system/mybetrecord/' + id,
    method: 'delete'
  })
}
// 处理下注记录
export function processBetRecord(data) {
  return request({
    url: '/system/mybetrecord/process',
    method: 'post',
    data: data
  });
}

