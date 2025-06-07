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

export function changeLiveStreamStatus(id, isActive) {
  const data = {
    id,
    isActive
  }
  return request({
    url: '/app/liveStream/changeStatus',
    method: 'put',
    data
  })
}

/**
 * 结算游戏记录
 * @param {{liveStreamId: null, odds: null, betContent: *}} data - 请求参数
 * @param {number|string} data.liveStreamId - 直播间 ID
 * @param {number|string} data.odds - 赔率
 * @param {string} data.betContent - 投注内容（即开奖结果）
 * @param {boolean} data.nextRound - 是否开启下一轮
 * @returns {Promise<Object>} 后端返回的响应对象
 */
export function settleGameRecord(data) {
  return request({
    url: '/system/gameRecord/settle',
    method: 'post',
    data: data // 使用 request body 传参
  });
}
