import request from '@/utils/request'

// 查询直播网站管理列表
export function listLiveStream(query) {
  return request({
    url: '/system/liveStream/list',
    method: 'get',
    params: query
  })
}

// 查询直播网站管理详细
export function getLiveStream(id) {
  return request({
    url: '/system/liveStream/' + id,
    method: 'get'
  })
}

// 新增直播网站管理
export function addLiveStream(data) {
  return request({
    url: '/system/liveStream',
    method: 'post',
    data: data
  })
}

// 修改直播网站管理
export function updateLiveStream(data) {
  return request({
    url: '/system/liveStream',
    method: 'put',
    data: data
  })
}

// 删除直播网站管理
export function delLiveStream(id) {
  return request({
    url: '/system/liveStream/' + id,
    method: 'delete'
  })
}
