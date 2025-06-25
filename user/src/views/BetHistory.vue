<template>
  <div class="min-h-screen bg-[#f6f7fb]">
    <AppHeader />
    <main class="main pt-20 pb-10">
      <div class="user container mx-auto max-w-6xl px-2">
        <div class="user-container flex flex-col md:flex-row gap-8 mt-8">
          <!-- 侧边栏 -->
          <aside
            class="user-sidebar w-full md:w-64 bg-white rounded-xl shadow p-6 flex flex-col items-center"
          >
            <div class="user-info flex flex-col items-center mb-8">
              <div class="user-avatar mb-2">
                <img
                  src="https://img.clerk.com/eyJ0eXBlIjoiZGVmYXVsdCIsImlpZCI6Imluc18yeERjR1R2MFRncWRQaHJiVU1MbU5LYTRMUDYiLCJyaWQiOiJ1c2VyXzJ4cUdQdzJac0tJOG1SV1l4UGU4QlhrUmhwdCJ9"
                  alt="avatar"
                  width="56"
                  height="56"
                  class="rounded-full"
                />
              </div>
              <div class="user-name text-lg font-bold">
                {{ userInfo.name || userInfo.account || "-" }}
              </div>
              <div class="user-balance text-sm text-gray-600 mt-1">
                Số dư: {{ userInfo.points ?? "0.00" }}
              </div>
            </div>
            <nav class="user-menu flex flex-col gap-2 w-full">
              <router-link
                to="/user/profile"
                class="menu-item hover:bg-[#801515] rounded px-3 py-2"
                >Thông tin người dùng</router-link>
              <router-link
                to="/user/bet"
                class="menu-item text-[#2563eb] font-semibold rounded px-3 py-2 bg-[#801515]"
                >Lịch sử cược</router-link>
            </nav>
          </aside>
          <!-- 主体内容 -->
          <section class="user-content flex-1">
            <div class="bet-history bg-white rounded-xl shadow p-8">
              <div class="bet-header flex items-center gap-4 mb-6">
                <h2 class="text-xl font-bold">Lịch sử cược</h2>
              </div>
              <div class="bet-history-content">
                <table class="w-full text-sm text-left">
                  <thead>
                    <tr class="border-b border-gray-700">
                      <th class="py-2 px-2">Thời gian cược</th>
                      <th class="py-2 px-2">ID phòng phát sóng</th>
                      <th class="py-2 px-2">Loại trò chơi</th>
                      <th class="py-2 px-2">Mã ván</th>
                      <th class="py-2 px-2">Nội dung cược</th>
                      <th class="py-2 px-2">Số tiền cược</th>
                      <th class="py-2 px-2">Trạng thái</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr v-if="myBets.length === 0">
                      <td colspan="7" class="text-center text-gray-400 py-4">Không có lịch sử cược</td>
                    </tr>
                    <tr
                      v-for="bet in myBets"
                      :key="bet.id"
                      class="border-b border-gray-800"
                    >
                      <td class="py-2 px-2">{{ bet.betTime || '-' }}</td>
                      <td class="py-2 px-2">{{ bet.liveStreamId || '-' }}</td>
                      <td class="py-2 px-2">{{ bet.gameType || '-' }}</td>
                      <td class="py-2 px-2">{{ bet.gameRound || '-' }}</td>
                      <td class="py-2 px-2">{{ bet.betContent || '-' }}</td>
                      <td class="py-2 px-2">{{ bet.betNum || '-' }}</td>
                      <td class="py-2 px-2">
                        <span v-if="bet.isActive === 1" class="text-yellow-400">Chưa kết toán</span>
                        <span v-else class="text-green-400">Đã kết toán</span>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </section>
        </div>
      </div>
    </main>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import AppHeader from "../components/AppHeader.vue";
import axios from "axios";

const userInfo = ref({});
const myBets = ref([]);

async function loadUserInfo() {
  const info = localStorage.getItem("userInfo");
  if (info) {
    try {
      const localUser = JSON.parse(info);
      if (localUser.account) {
        // 用 /app/gameUser/points?account=xxx 获取积分
        const res = await axios.get(
          `/api/app/gameUser/points`,
          { params: { account: localUser.account } }
        );
        if (res.data.code === 200 && typeof res.data.data === 'number') {
          const user = { ...localUser, points: res.data.data };
          userInfo.value = user;
          localStorage.setItem("userInfo", JSON.stringify(user));
        } else {
          userInfo.value = localUser;
        }
      } else {
        userInfo.value = localUser;
      }
    } catch {
      userInfo.value = {};
    }
  }
}

async function loadMyBets() {
  const info = localStorage.getItem("userInfo");
  if (!info) {
    myBets.value = [];
    return;
  }
  const user = JSON.parse(info);
  if (!user.account) {
    myBets.value = [];
    return;
  }
  try {
    // 查询当前用户的所有投注记录（不限定直播间）
    const res = await axios.get('/api/app/gameRecord/list', {
      params: {
        gameUserAccount: user.account
      }
    });
    if (res.data.code === 200 && Array.isArray(res.data.rows)) {
      myBets.value = res.data.rows;
    } else {
      myBets.value = [];
    }
  } catch (e) {
    myBets.value = [];
  }
}

onMounted(() => {
  loadUserInfo();
  loadMyBets();
});
</script>

<style scoped>
.header {
  box-shadow: 0 2px 8px 0 rgba(0,0,0,0.04);
  background: #C02638 !important;
}
.min-h-screen, body {
  background: #18181c !important;
  color: #f5f5f5 !important;
}
.user-sidebar {
  min-width: 220px;
  background: #232326 !important;
  color: #f5f5f5 !important;
}
.user-avatar img {
  width: 56px;
  height: 56px;
  border-radius: 50%;
}
.menu-item {
  display: block;
  padding: 8px 0;
  font-size: 1rem;
  transition: background 0.2s;
  color: #f5f5f5 !important;
}
.menu-item.active,
.menu-item.text-\#2563eb {
  background: #e53e3e !important;
  color: #222 !important;
}
.bet-header {
  border-bottom: 1px solid #333;
  padding-bottom: 1rem;
  margin-bottom: 1.5rem;
}
.bet-history {
  background: #232326 !important;
  color: #f5f5f5 !important;
}
.bet-history-content table {
  width: 100%;
  border-collapse: collapse;
}
.bet-history-content th, .bet-history-content td {
  background: transparent !important;
  color: #f5f5f5 !important;
}
.bet-history-content th {
  font-weight: bold;
  background: #232326 !important;
  color: #fff !important;
}
.bet-history-content tr {
  border-bottom: 1px solid #333;
}
.bet-history-content tr:last-child {
  border-bottom: none;
}
.text-green-400 {
  color: #4ade80 !important;
}
.text-yellow-400 {
  color: #facc15 !important;
}
.bet-stat-value {
  color: #e53e3e !important;
}
.no-data-icon {
  font-size: 2.5rem;
}
.no-data-text {
  font-size: 1.1rem;
  color: #888 !important;
}
@media (max-width: 900px) {
  .user-container {
    flex-direction: column;
  }
  .user-sidebar {
    width: 100% !important;
    margin-bottom: 1.5rem;
  }
}
</style>
