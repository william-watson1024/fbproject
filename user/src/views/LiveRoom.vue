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
                  <BettingPanel v-model:amount="betAmount" />
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
                  <div
                    class="no-data flex flex-col items-center text-gray-400 py-8"
                  >
                    <div class="no-data-icon text-3xl mb-2">📊</div>
                    <div class="no-data-text text-base">无投注历史</div>
                  </div>
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
import { ref, onMounted } from "vue";
import { useRoute } from "vue-router";
import axios from "axios";
import BettingPanel from "../components/BettingPanel.vue";
import QuickActions from "../components/QuickActions.vue";
import ResultList from "../components/ResultList.vue";
import AppHeader from "../components/AppHeader.vue";

const route = useRoute();
const roomId = route.params.id;
const roomInfo = ref({});

onMounted(async () => {
  try {
    const res = await axios.get(`http://localhost:8080/app/myfbweb/${roomId}`);
    if (res.data.code === 200 && res.data.data) {
      roomInfo.value = res.data.data;
      console.log("roomInfo:", roomInfo.value); // 调试用
    }
  } catch (e) {
    roomInfo.value = {};
  }
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
