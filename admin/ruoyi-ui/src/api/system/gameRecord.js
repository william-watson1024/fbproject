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
