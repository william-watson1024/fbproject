import request from '@/utils/request'

// 查询游戏记录管理列表
export function listGameRecord(query) {
  return request({
    url: '/system/gameRecord/list',
    method: 'get',
    params: query
  })
}

// 查询游戏记录管理详细
export function getGameRecord(id) {
  return request({
    url: '/system/gameRecord/' + id,
    method: 'get'
  })
}

// 新增游戏记录管理
export function addGameRecord(data) {
  return request({
    url: '/system/gameRecord',
    method: 'post',
    data: data
  })
}

// 修改游戏记录管理
export function updateGameRecord(data) {
  return request({
    url: '/system/gameRecord',
    method: 'put',
    data: data
  })
}

// 删除游戏记录管理
export function delGameRecord(id) {
  return request({
    url: '/system/gameRecord/' + id,
    method: 'delete'
  })
}
