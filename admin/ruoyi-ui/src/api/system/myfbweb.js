import request from '@/utils/request'

// 查询直播链接管理列表
export function listMyfbweb(query) {
  return request({
    url: '/system/myfbweb/list',
    method: 'get',
    params: query
  })
}

// 查询直播链接管理详细
export function getMyfbweb(id) {
  return request({
    url: '/system/myfbweb/' + id,
    method: 'get'
  })
}

// 新增直播链接管理
export function addMyfbweb(data) {
  return request({
    url: '/system/myfbweb',
    method: 'post',
    data: data
  })
}

// 修改直播链接管理
export function updateMyfbweb(data) {
  return request({
    url: '/system/myfbweb',
    method: 'put',
    data: data
  })
}

// 删除直播链接管理
export function delMyfbweb(id) {
  return request({
    url: '/system/myfbweb/' + id,
    method: 'delete'
  })
}
