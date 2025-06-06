import request from '@/utils/request'

// 查询游戏信息管理列表
export function listGameInfo(query) {
  return request({
    url: '/system/gameInfo/list',
    method: 'get',
    params: query
  })
}

// 查询游戏信息管理详细
export function getGameInfo(id) {
  return request({
    url: '/system/gameInfo/' + id,
    method: 'get'
  })
}

// 新增游戏信息管理
export function addGameInfo(data) {
  return request({
    url: '/system/gameInfo',
    method: 'post',
    data: data
  })
}

// 修改游戏信息管理
export function updateGameInfo(data) {
  return request({
    url: '/system/gameInfo',
    method: 'put',
    data: data
  })
}

// 删除游戏信息管理
export function delGameInfo(id) {
  return request({
    url: '/system/gameInfo/' + id,
    method: 'delete'
  })
}
