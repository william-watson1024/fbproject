<template>
  <div class="min-h-screen bg-[#f6f7fb]">
    <AppHeader />
    <main class="main pt-16 pb-10">
      <div class="room container mx-auto max-w-6xl px-2">
        <div class="room-content bg-white rounded-2xl shadow-xl p-0">
          <!-- 头部信息 -->
          <div class="room-header border-b px-8 pt-8 pb-4">
            <h1 class="text-2xl font-bold text-white-custom mb-2">
              {{ roomInfo.title || "Phòng phát sóng" }}
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
                Phát sóng
              </span>
              <span class="room-streamer">
                Đơn vị phát sóng: {{ roomInfo.host || "-" }}
              </span>
              <span class="room-period"> Kỳ: {{ roomInfo.code || "-" }} </span>
              <span class="room-period-status closed text-red-custom">
                {{ roomInfo.statusText || "Đã đóng" }}
              </span>
            </div>
          </div>
          <!-- 主体内容 -->
          <div class="room-main flex flex-col gap-6 px-8 py-8">
            <!-- 当前游戏和倒计时（始终显示） -->
            <div
              class="mb-4 p-4 bg-[#18181c] rounded-xl shadow game-info-bar flex flex-col items-center justify-center text-center md:flex-row md:items-center md:justify-between md:text-left md:gap-8"
            >
              <div class="flex-1 w-full md:w-auto md:text-left">
                <div class="text-lg font-bold mb-1">
                  Mã ván hiện tại:
                  {{
                    currentGame && currentGame.gameRound
                      ? currentGame.gameRound
                      : "Không có ván đang diễn ra"
                  }}
                </div>
                <div class="text-sm mb-1">
                  Trạng thái:
                  <span class="font-semibold text-goodred">
                    {{
                      currentGame && currentGame.gameStatus
                        ? gameStatusMap[currentGame.gameStatus] ||
                          currentGame.gameStatus
                        : "-"
                    }}
                  </span>
                </div>
              </div>
              <div
                class="flex flex-col items-center justify-center min-w-[120px] w-full md:w-auto md:items-end md:text-right"
              >
                <div class="text-base font-bold mb-1">Đếm ngược</div>
                <div class="text-2xl font-mono text-goodred">
                  {{ countdown }}
                </div>
              </div>
            </div>
            <!-- 视频区域 -->
            <div class="room-video mb-4 w-full">
              <div
                class="video-placeholder relative rounded-xl overflow-hidden border border-gray-200 video-responsive"
              >
                <iframe
                  v-if="roomInfo.url"
                  :src="roomInfo.url"
                  class="room-iframe w-full bg-black"
                  frameborder="0"
                  scrolling="no"
                  allowfullscreen
                  allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"
                  allowtransparency="true"
                  muted
                  playsinline
                ></iframe>
                <div v-else class="text-center text-gray-400 py-12">
                  Không có liên kết phát sóng
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
                  <h3 class="section-title">Đặt cược</h3>
                </div>
                <div class="p-6">
                  <BettingPanel
                    v-model:amount="betAmount"
                    :liveStreamId="roomInfo.id"
                    :gameType="roomInfo.gameType || ''"
                    :gameRound="
                      roomGameInfos.length > 0 ? roomGameInfos[0].gameRound : ''
                    "
                    :canBet="canBet"
                    :betDisabledReason="betDisabledReason"
                  />
                </div>
              </div>
              <div class="bg-white rounded-xl shadow p-0 w-full">
                <div class="section-title-bar">
                  <h3 class="section-title">Tác vụ nhanh</h3>
                </div>
                <div class="p-6">
                  <QuickActions />
                </div>
              </div>
            </div>
            <!-- 最近结果 -->
            <div class="bg-white rounded-xl shadow p-0 mx-0 mb-0">
              <div class="section-title-bar">
                <h3 class="section-title">Kết quả gần đây</h3>
              </div>
              <div class="p-6">
                <ResultList :results="recentResults" />
              </div>
            </div>
            <!-- 公告 -->
            <div class="bg-white rounded-xl shadow p-0 mx-0 mb-0">
              <div class="section-title-bar">
                <h3 class="section-title">Thông báo</h3>
              </div>
              <div class="p-6">
                <div class="announcements">
                  <div class="no-data text-gray-400 text-center py-4">
                    <p>Không có thông báo</p>
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
                  <h3 class="section-title">Cược của tôi</h3>
                </div>
              </div>
              <div class="p-6">
                <div class="bet-history-content">
                  <table class="w-full text-sm text-left">
                    <thead>
                      <tr class="border-b border-gray-700">
                        <th class="py-2 px-2">Thời gian cược</th>
                        <th class="py-2 px-2">Mã ván</th>
                        <th class="py-2 px-2">Nội dung cược</th>
                        <th class="py-2 px-2">Số tiền cược</th>
                        <th class="py-2 px-2">Trạng thái</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-if="myBets.length === 0">
                        <td colspan="5" class="text-center text-gray-400 py-4">
                          Không có lịch sử cược
                        </td>
                      </tr>
                      <tr
                        v-for="bet in myBets"
                        :key="bet.id"
                        class="border-b border-gray-800"
                      >
                        <td class="py-2 px-2">{{ bet.betTime || "-" }}</td>
                        <td class="py-2 px-2">{{ bet.gameRound || "-" }}</td>
                        <td class="py-2 px-2">{{ bet.betContent || "-" }}</td>
                        <td class="py-2 px-2">{{ bet.betNum || "-" }}</td>
                        <td class="py-2 px-2">
                          <span
                            v-if="bet.isActive === 1"
                            class="text-yellow-400"
                            >Chưa kết toán</span
                          >
                          <span v-else class="text-green-400">Đã kết toán</span>
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
const betAmount = ref(0);
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
const roomGameInfos = ref([]);
const myBets = ref([]);
const userInfo = ref({});
const betsApiRaw = ref(null);
let refreshTimer = null;

const gameStatusMap = {
  投注中: "Đang đặt cược",
  "Đang đặt cược": "Đang đặt cược",
  封盘: "Đã đóng",
  "Đã đóng": "Đã đóng",
  开奖中: "Đang mở thưởng",
  "Đang mở thưởng": "Đang mở thưởng",
  已结算: "Đã kết toán",
  "Đã kết toán": "Đã kết toán",
  // 可继续补充
};

// 获取当前房间的所有游戏局信息（前端兼容：先查所有 gameRound，再逐条查详情）
async function fetchRoomGameInfos() {
  try {
    // 1. 先用 listMinutesBeforeNow 查近一段时间的所有游戏局（假设5小时内，300分钟）
    const res = await axios.get(
      "http://localhost:8080/app/gameInfo/listMinutesBeforeNow",
      {
        params: { minutesBeforeNow: 10000 }, // 临时调大到约7天
      }
    );
    if (res.data.code === 200 && Array.isArray(res.data.data)) {
      // 2. 过滤出本直播间的所有 gameRound
      const allGames = res.data.data.filter(
        (g) => String(g.liveStreamId) === String(roomId)
      );
      const rounds = allGames.map((g) => g.gameRound).filter(Boolean);
      // 3. 逐条查详情
      const detailList = [];
      for (const round of rounds) {
        const detailRes = await axios.get(
          "http://localhost:8080/app/gameInfo/listByGameRound",
          {
            params: { liveStreamId: roomId, gameRound: round },
          }
        );
        if (detailRes.data.code === 200 && Array.isArray(detailRes.data.data)) {
          detailList.push(...detailRes.data.data);
        }
      }
      roomGameInfos.value = detailList;
      console.log("【调试】最终 roomGameInfos:", detailList);
      // 合并复用：直接在这里生成 recentResults
      console.log("detailList:", detailList);
      const settled = detailList
  .filter(g => g.gameStatus === "封盘" && g.result && g.endTime)
  .sort((a, b) => new Date(b.endTime) - new Date(a.endTime))
  .slice(0, 10) // 保证最多10条
  .map(g => ({
    gameSerialNumber: g.gameSerialNumber,
    startTime: g.startTime,
    result: g.result,
    resultImage: g.resultImage
  }));
console.log("settled recentResults:", settled);
recentResults.value = settled;
    } else {
      roomGameInfos.value = [];
      recentResults.value = [];
      console.log("【调试】listMinutesBeforeNow 无数据");
    }
  } catch (e) {
    roomGameInfos.value = [];
    recentResults.value = [];
    console.log("【调试】fetchRoomGameInfos 异常", e);
  }
}

// 获取当前用户在本房间的投注历史
async function fetchMyBets() {
  const info = localStorage.getItem("userInfo");
  if (!info) {
    myBets.value = [];
    betsApiRaw.value = "未登录，无userInfo";
    return;
  }
  const user = JSON.parse(info);
  userInfo.value = user;
  if (!user.account) {
    myBets.value = [];
    betsApiRaw.value = "userInfo无account";
    return;
  }
  try {
    // 查询当前房间下当前用户的所有投注记录
    const res = await axios.get("http://localhost:8080/app/gameRecord/list", {
      params: {
        gameUserAccount: user.account,
        liveStreamId: roomId,
      },
    });
    betsApiRaw.value = res.data;
    if (res.data.code === 200 && Array.isArray(res.data.rows)) {
      myBets.value = res.data.rows;
    } else {
      myBets.value = [];
    }
  } catch (e) {
    myBets.value = [];
    betsApiRaw.value = e && e.message ? e.message : e;
  }
}

const recentResults = ref([]);

// 获取开奖历史（只查封盘）
async function fetchRecentResults() {
  try {
    const token = localStorage.getItem("token") || "";
    const res = await axios.get(
      "http://localhost:8080/system/gameInfo/list",
      {
        params: {
          liveStreamId: roomId,
          gameStatus: "封盘",
          pageNum: 1,
          pageSize: 10
        },
        headers: { Authorization: "Bearer " + token }
      }
    );
    if (res.data.code === 200 && Array.isArray(res.data.rows)) {
      // 保留原始字段，便于前端直接显示
      recentResults.value = res.data.rows.map(g => ({
        gameSerialNumber: g.gameSerialNumber,
        startTime: g.startTime,
        result: g.result,
        resultImage: g.resultImage
      }));
    } else {
      recentResults.value = [];
    }
  } catch (e) {
    recentResults.value = [];
  }
}

onMounted(async () => {
  try {
    // 1. 获取直播间详情（用新接口）
    const res = await axios.get(
      `http://localhost:8080/app/liveStream/getLiveStreamById/${roomId}`
    );
    if (res.data.code === 200 && res.data.data) {
      roomInfo.value = res.data.data;
    } else {
      roomInfo.value = {};
    }
    // 2. 获取房间游戏信息
    await fetchRoomGameInfos();
    // 3. 获取我的投注历史
    await fetchMyBets();
    // 4. recentResults 只由 fetchRoomGameInfos 赋值，无需单独 fetchRecentResults
  } catch (e) {
    roomInfo.value = {};
  }
  timer = setInterval(updateCountdown, 1000);
  // 优化：定时只刷新房间游戏信息和投注历史，recentResults 只由 fetchRoomGameInfos 赋值
  refreshTimer = setInterval(async () => {
    await fetchRoomGameInfos();
    await fetchMyBets();
  }, 5000);
});

const animals = ["Hươu", "Bầu", "Gà", "Cá", "Cua", "Tôm"];
const animalIcons = {
  Hươu: "🦌",
  Bầu: "🎃",
  Gà: "🐔",
  Cá: "🐟",
  Cua: "🦀",
  Tôm: "🦐",
};

// 取当前游戏局：优先投注中，否则取最新一条（即使是封盘也显示最新一条）
const currentGame = computed(() => {
  if (!roomGameInfos.value.length) return null;
  // 优先投注中
  const bettingGame = roomGameInfos.value.find(
    (g) => g.gameStatus === "投注中"
  );
  if (bettingGame) return bettingGame;
  // 否则取最新一条（gameRound最大）
  const sorted = [...roomGameInfos.value].sort((a, b) => {
    if (a.gameRound > b.gameRound) return -1;
    if (a.gameRound < b.gameRound) return 1;
    return 0;
  });
  return sorted[0];
});

// 下注功能可用性判断：只有投注中才可下注，封盘/开奖/结算都不可下注
const canBet = computed(() => {
  return currentGame.value && currentGame.value.gameStatus === "Đang đặt cược";
});
const betDisabledReason = computed(() => {
  if (!currentGame.value)
    return "Không có ván nào đang diễn ra, không thể đặt cược";
  if (currentGame.value.gameStatus !== "Đang đặt cược")
    return (
      "Hiện tại không thể đặt cược (" +
      gameStatusMap[currentGame.value.gameStatus] +
      ")"
    );
  return "";
});

// 倒计时逻辑：只显示投注中时距离封盘的倒计时，否则显示已封盘
const countdown = ref("");
let timer = null;
function updateCountdown() {
  if (!currentGame.value) {
    countdown.value = "";
    return;
  }
  if (
    currentGame.value.gameStatus === "投注中" &&
    currentGame.value.closeTime
  ) {
    const endTime = new Date(currentGame.value.closeTime);
    const now = new Date();
    const diff = Math.max(0, Math.floor((endTime - now) / 1000));
    if (diff > 0) {
      const min = Math.floor(diff / 60);
      const sec = diff % 60;
      countdown.value = `${min > 0 ? min + " phút " : ""}${sec} giây`;
    } else {
      countdown.value = "Đã đóng";
    }
  } else {
    countdown.value = "Đã đóng";
  }
}

onMounted(() => {
  timer = setInterval(updateCountdown, 1000);
});

onUnmounted(() => {
  if (timer) clearInterval(timer);
  if (refreshTimer) clearInterval(refreshTimer);
});

watch(currentGame, updateCountdown);
</script>

<style scoped>
.header {
  box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.04);
  background: #c02638 !important;
}
.min-h-screen,
body {
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
.video-responsive {
  aspect-ratio: 16/9;
  width: 100%;
  height: auto;
  background: #000;
  position: relative;
  min-height: 320px;
  max-width: 100%;
}
@media (max-width: 900px) {
  .video-responsive {
    aspect-ratio: 16/9;
    min-height: 220px;
    height: auto !important;
    max-height: 320px;
  }
}
@media (max-width: 600px) {
  .video-responsive {
    aspect-ratio: 16/9; /* 横屏16:9比例 */
    width: 100vw; /* 占满屏幕宽度 */
    height: 56vw; /* 16:9比例，高度=宽度的56.25% */
    max-height: 80vh; /* 限制最大高度为屏幕的80% */
    min-height: 220px; /* 可根据实际需求调整 */
    margin: 0 auto;
    background: #000;
    border-radius: 10px;
  }
}
.room-iframe {
  width: 100% !important;
  height: 100% !important;
  min-height: unset !important;
  aspect-ratio: 16/9;
  display: block;
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
.text-gray-700,
.text-gray-600,
.text-gray-400,
.text-base,
.text-sm {
  color: #ccc !important;
}
.text-red-custom {
  color: #e53e3e !important;
}
@media (max-width: 900px) {
  .game-info-bar {
    margin-bottom: 0.5rem !important;
    padding: 0.75rem !important;
    border-radius: 10px;
  }
}
@media (max-width: 600px) {
  .game-info-bar {
    margin-bottom: 0.25rem !important;
    padding: 0.5rem !important;
    border-radius: 8px;
  }
}
</style>
