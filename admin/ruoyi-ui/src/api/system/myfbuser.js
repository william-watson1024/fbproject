import request from '@/utils/request'

// 查询投注积分用户管理列表
export function listMyfbuser(query) {
  return request({
    url: '/system/myfbuser/list',
    method: 'get',
    params: query
  })
}

// 查询投注积分用户管理详细
export function getMyfbuser(id) {
  return request({
    url: '/system/myfbuser/' + id,
    method: 'get'
  })
}

// 新增投注积分用户管理
export function addMyfbuser(data) {
  return request({
    url: '/system/myfbuser',
    method: 'post',
    data: data
  })
}

// 修改投注积分用户管理
export function updateMyfbuser(data) {
  return request({
    url: '/system/myfbuser',
    method: 'put',
    data: data
  })
}

// 删除投注积分用户管理
export function delMyfbuser(id) {
  return request({
    url: '/system/myfbuser/' + id,
    method: 'delete'
  })
}
