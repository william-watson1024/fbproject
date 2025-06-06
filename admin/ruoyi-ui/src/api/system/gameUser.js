import request from '@/utils/request'

// 查询游戏用户管理列表
export function listGameUser(query) {
  return request({
    url: '/system/gameUser/list',
    method: 'get',
    params: query
  })
}

// 查询游戏用户管理详细
export function getGameUser(id) {
  return request({
    url: '/system/gameUser/' + id,
    method: 'get'
  })
}

// 新增游戏用户管理
export function addGameUser(data) {
  return request({
    url: '/system/gameUser',
    method: 'post',
    data: data
  })
}

// 修改游戏用户管理
export function updateGameUser(data) {
  return request({
    url: '/system/gameUser',
    method: 'put',
    data: data
  })
}

// 删除游戏用户管理
export function delGameUser(id) {
  return request({
    url: '/system/gameUser/' + id,
    method: 'delete'
  })
}
