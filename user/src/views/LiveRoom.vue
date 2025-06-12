<template>
  <div class="min-h-screen bg-[#f6f7fb]">
    <AppHeader />
    <main class="main pt-20 pb-10">
      <div class="room container mx-auto max-w-6xl px-2">
        <div class="room-content bg-white rounded-2xl shadow-xl p-0">
          <!-- 头部信息 -->
          <div class="room-header border-b px-8 pt-8 pb-4">
            <h1 class="text-2xl font-bold text-white-custom mb-2">
              {{ roomInfo.title || "直播间" }}
            </h1>
            <div
              class="room-info flex flex-wrap items-center gap-4 text-gray-700 text-sm"
            >
              <span
                class="room-status live flex items-center gap-1 text-red-custom font-semibold"
              >
                <span
                  class="live-dot w-2 h-2 bg-[#e53e3e] rounded-full animate-pulse"
                ></span>
                广播
              </span>
              <span class="room-streamer">
                广播公司: {{ roomInfo.host || "-" }}
              </span>
              <span class="room-period"> Ky: {{ roomInfo.code || "-" }} </span>
              <span class="room-period-status closed text-red-custom">
                {{ roomInfo.statusText || "关闭" }}
              </span>
            </div>
          </div>
          <!-- 主体内容 -->
          <div class="room-main flex flex-col gap-6 px-8 py-8">
            <!-- 当前游戏和倒计时（始终显示） -->
            <div class="mb-4 p-4 bg-[#18181c] rounded-xl shadow flex flex-col md:flex-row md:items-center md:gap-8">
              <div class="flex-1">
                <div class="text-lg font-bold mb-1">
                  当前游戏局号：{{ currentGame && currentGame.gameRound ? currentGame.gameRound : '无进行中游戏' }}
                </div>
                <div class="text-sm mb-1">
                  状态：
                  <span class="font-semibold text-goodred">
                    {{ currentGame && currentGame.gameStatus ? currentGame.gameStatus : '-' }}
                  </span>
                </div>
              </div>
              <div class="flex flex-col items-center justify-center min-w-[120px]">
                <div class="text-base font-bold mb-1">倒计时</div>
                <div class="text-2xl font-mono text-goodred">
                  {{ countdown }}
                </div>
              </div>
            </div>
            <!-- 视频区域 -->
            <div class="room-video mb-4 w-full">
              <div
                class="video-placeholder relative rounded-xl overflow-hidden border border-gray-200"
              >
                <iframe
                  v-if="roomInfo.url"
                  :src="roomInfo.url"
                  class="room-iframe w-full min-h-[600px] bg-black"
                  frameborder="0"
                  scrolling="no"
                  allowfullscreen="true"
                  allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"
                ></iframe>
                <div v-else class="text-center text-gray-400 py-12">
                  暂无直播链接
                </div>
                <div
                  class="live-badge absolute top-3 left-3 bg-[#e53e3e] text-white px-3 py-1 rounded-full flex items-center gap-2 text-xs font-bold shadow"
                >
                  <span
                    class="live-dot w-2 h-2 bg-white rounded-full animate-pulse"
                  ></span>
                  LIVE
                </div>
              </div>
            </div>
            <!-- 下注和快捷操作区域（竖直排列且全宽） -->
            <div class="w-full flex flex-col gap-6">
              <div class="bg-white rounded-xl shadow p-0 w-full">
                <div class="section-title-bar">
                  <h3 class="section-title">下注</h3>
                </div>
                <div class="p-6">
                  <BettingPanel
                    v-model:amount="betAmount"
                    :liveStreamId="roomInfo.id"
                    :gameType="roomInfo.gameType || ''"
                    :gameRound="roomGameInfos.length > 0 ? roomGameInfos[0].gameRound : ''"
                  />
                </div>
              </div>
              <div class="bg-white rounded-xl shadow p-0 w-full">
                <div class="section-title-bar">
                  <h3 class="section-title">快速操作</h3>
                </div>
                <div class="p-6">
                  <QuickActions />
                </div>
              </div>
            </div>
            <!-- 最近结果 -->
            <div class="bg-white rounded-xl shadow p-0 mx-0 mb-0">
              <div class="section-title-bar">
                <h3 class="section-title">最近的结果</h3>
              </div>
              <div class="p-6">
                <ResultList :results="recentResults" />
              </div>
            </div>
            <!-- 公告 -->
            <div class="bg-white rounded-xl shadow p-0 mx-0 mb-0">
              <div class="section-title-bar">
                <h3 class="section-title">公告</h3>
              </div>
              <div class="p-6">
                <div class="announcements">
                  <div class="no-data text-gray-400 text-center py-4">
                    <p>无通知</p>
                  </div>
                </div>
              </div>
            </div>
            <!-- 我的投注 -->
            <div class="bg-white rounded-xl shadow p-0 mx-0 mb-0">
              <div
                class="bet-history-header flex items-center justify-between mb-4"
              >
                <div class="section-title-bar">
                  <h3 class="section-title">我的投注</h3>
                </div>
              </div>
              <div class="p-6">
                <div class="bet-history-content">
                  <table class="w-full text-sm text-left">
                    <thead>
                      <tr class="border-b border-gray-700">
                        <th class="py-2 px-2">下注时间</th>
                        <th class="py-2 px-2">游戏局号</th>
                        <th class="py-2 px-2">投注内容</th>
                        <th class="py-2 px-2">下注金额</th>
                        <th class="py-2 px-2">结算状态</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-if="myBets.length === 0">
                        <td colspan="5" class="text-center text-gray-400 py-4">无投注历史</td>
                      </tr>
                      <tr
                        v-for="bet in myBets"
                        :key="bet.id"
                        class="border-b border-gray-800"
                      >
                        <td class="py-2 px-2">{{ bet.betTime || '-' }}</td>
                        <td class="py-2 px-2">{{ bet.gameRound || '-' }}</td>
                        <td class="py-2 px-2">{{ bet.betContent || '-' }}</td>
                        <td class="py-2 px-2">{{ bet.betNum || '-' }}</td>
                        <td class="py-2 px-2">
                          <span v-if="bet.isActive === 1" class="text-green-400">已结算</span>
                          <span v-else class="text-yellow-400">未结算</span>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script setup>
import { ref, onMounted, computed, onUnmounted, watch } from "vue";
import { useRoute } from "vue-router";
import axios from "axios";
import BettingPanel from "../components/BettingPanel.vue";
import QuickActions from "../components/QuickActions.vue";
import ResultList from "../components/ResultList.vue";
import AppHeader from "../components/AppHeader.vue";

const route = useRoute();
const roomId = route.params.id;
const roomInfo = ref({});
const roomGameInfos = ref([])
const myBets = ref([])
const userInfo = ref({})
const betsApiRaw = ref(null)
let refreshTimer = null

// 获取当前房间的所有游戏局信息（前端兼容：先查所有 gameRound，再逐条查详情）
async function fetchRoomGameInfos() {
  try {
    // 1. 先用 listMinutesBeforeNow 查近一段时间的所有游戏局（假设5小时内，300分钟）
    const res = await axios.get('http://localhost:8080/app/gameInfo/listMinutesBeforeNow', {
      params: { minutesBeforeNow: 10000 } // 临时调大到约7天
    })
    console.log('【调试】listMinutesBeforeNow 返回：', res.data)
    if (res.data.code === 200 && Array.isArray(res.data.data)) {
      // 2. 过滤出本直播间的所有 gameRound
      const allGames = res.data.data.filter(g => String(g.liveStreamId) === String(roomId))
      console.log('【调试】allGames:', allGames, 'roomId:', roomId)
      const rounds = allGames.map(g => g.gameRound).filter(Boolean)
      console.log('【调试】rounds:', rounds)
      // 3. 逐条查详情
      const detailList = []
      for (const round of rounds) {
        const detailRes = await axios.get('http://localhost:8080/app/gameInfo/listByGameRound', {
          params: { liveStreamId: roomId, gameRound: round }
        })
        console.log('【调试】详情 round', round, detailRes.data)
        if (detailRes.data.code === 200 && Array.isArray(detailRes.data.data)) {
          detailList.push(...detailRes.data.data)
        }
      }
      roomGameInfos.value = detailList
      console.log('【调试】最终 roomGameInfos:', detailList)
    } else {
      roomGameInfos.value = []
      console.log('【调试】listMinutesBeforeNow 无数据')
    }
  } catch (e) {
    roomGameInfos.value = []
    console.log('【调试】fetchRoomGameInfos 异常', e)
  }
}

// 获取当前用户在本房间的投注历史
async function fetchMyBets() {
  const info = localStorage.getItem('userInfo')
  if (!info) {
    myBets.value = []
    betsApiRaw.value = '未登录，无userInfo'
    return
  }
  const user = JSON.parse(info)
  userInfo.value = user
  if (!user.account) {
    myBets.value = []
    betsApiRaw.value = 'userInfo无account'
    return
  }
  try {
    // 查询当前房间下当前用户的所有投注记录
    const res = await axios.get('http://localhost:8080/app/gameRecord/list', {
      params: {
        gameUserAccount: user.account,
        liveStreamId: roomId
      }
    })
    betsApiRaw.value = res.data
    if (res.data.code === 200 && Array.isArray(res.data.rows)) {
      myBets.value = res.data.rows
    } else {
      myBets.value = []
    }
  } catch (e) {
    myBets.value = []
    betsApiRaw.value = e && e.message ? e.message : e
  }
}

onMounted(async () => {
  try {
    // 1. 获取直播间详情（用新接口）
    const res = await axios.get(`http://localhost:8080/app/liveStream/getLiveStreamById/${roomId}`);
    if (res.data.code === 200 && res.data.data) {
      roomInfo.value = res.data.data;
    } else {
      roomInfo.value = {};
    }
    // 2. 获取房间游戏信息
    await fetchRoomGameInfos();
    // 3. 获取我的投注历史
    await fetchMyBets();
  } catch (e) {
    roomInfo.value = {};
  }
  timer = setInterval(updateCountdown, 1000)
  // 新增：定时刷新游戏局和投注历史
  refreshTimer = setInterval(async () => {
    await fetchRoomGameInfos();
    await fetchMyBets();
  }, 5000)
});

const recentResults = [
  { time: "01:03:26", code: "20250530123", result: "鹿，鸡，虾" },
  { time: "00:58:47", code: "20250530122", result: "鱼，鱼，螃蟹" },
  { time: "00:53:22", code: "20250530121", result: "鹿，葫芦，螃蟹" },
  { time: "00:48:24", code: "20250530120", result: "鹿，葫芦，虾" },
  { time: "00:43:25", code: "20250530119", result: "葫芦，鱼，虾" },
  { time: "00:38:38", code: "20250530118", result: "鹿，鸡，鱼" },
  { time: "00:33:52", code: "20250530117", result: "鹿，鸡，螃蟹" },
  { time: "00:28:35", code: "20250530116", result: "鹿，鹿，鹿" },
  { time: "00:17:43", code: "20250530115", result: "鹿，葫芦，螃蟹" },
];

// 取当前进行中的游戏局（优先投注中、封盘、开奖中）
const currentGame = computed(() => {
  if (!roomGameInfos.value.length) return null
  // 优先投注中，其次封盘、开奖中、结算中
  const statusOrder = ['投注中', '封盘', '开奖中', '结算中']
  for (const status of statusOrder) {
    const found = roomGameInfos.value.find(g => g.gameStatus === status)
    if (found) return found
  }
  return roomGameInfos.value[0]
})

// 倒计时逻辑
const countdown = ref('')
let timer = null
function updateCountdown() {
  if (!currentGame.value) {
    countdown.value = ''
    return
  }
  let endTime = null
  if (currentGame.value.gameStatus === '投注中' && currentGame.value.closeTime) {
    endTime = new Date(currentGame.value.closeTime)
  } else if (currentGame.value.gameStatus === '封盘' && currentGame.value.endTime) {
    endTime = new Date(currentGame.value.endTime)
  }
  if (endTime) {
    const now = new Date()
    const diff = Math.max(0, Math.floor((endTime - now) / 1000))
    if (diff > 0) {
      const min = Math.floor(diff / 60)
      const sec = diff % 60
      countdown.value = `${min > 0 ? min + '分' : ''}${sec}秒`
    } else {
      countdown.value = '已截止'
    }
  } else {
    countdown.value = ''
  }
}

onMounted(() => {
  timer = setInterval(updateCountdown, 1000)
})

onUnmounted(() => {
  if (timer) clearInterval(timer)
  if (refreshTimer) clearInterval(refreshTimer)
})

watch(currentGame, updateCountdown)
</script>

<style scoped>
.header {
  box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.04);
  background: #18181c !important;
}
.min-h-screen, body {
  background: #18181c !important;
  color: #f5f5f5 !important;
}
.room-content {
  margin-top: 24px;
  background: #232326 !important;
  color: #f5f5f5 !important;
}
.room-header {
  border-bottom: 1px solid #333;
}
.room-info .live-dot {
  display: inline-block;
}
.room-main {
  gap: 2rem;
}
.room-video .live-badge {
  top: 12px;
  left: 12px;
  background: #e53e3e !important;
  color: #fff !important;
}
.room-iframe {
  min-height: 600px;
  background: #000;
}
.section-title-bar {
  width: 100%;
  background: #e53e3e !important;
  color: #fff !important;
  border-radius: 16px 16px 0 0;
  padding: 0.25rem 1.5rem;
  margin-bottom: 0;
  margin-top: 0;
  box-shadow: 0 2px 8px 0 rgba(229, 62, 62, 0.08);
  display: block;
}
.section-title {
  font-size: 1.1rem;
  font-weight: bold;
  color: #fff !important;
  margin: 0;
}
.p-6 {
  padding: 1.5rem !important;
}
.bg-white {
  background: #232326 !important;
  color: #f5f5f5 !important;
}
.text-white-custom {
  color: #f5f5f5 !important;
}
.text-gray-700, .text-gray-600, .text-gray-400, .text-base, .text-sm {
  color: #ccc !important;
}
.text-red-custom {
  color: #e53e3e !important;
}
@media (max-width: 900px) {
  .room-main {
    flex-direction: column;
  }
  .section-title-bar {
    margin-left: -1rem;
    margin-right: -1rem;
    padding-left: 1rem;
    padding-right: 1rem;
  }
}
</style>
