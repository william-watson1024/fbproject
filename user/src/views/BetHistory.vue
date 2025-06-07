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
                余额：{{ userInfo.points ?? "0.00" }}
              </div>
            </div>
            <nav class="user-menu flex flex-col gap-2 w-full">
              <a
                href="/user/profile"
                class="menu-item hover:bg-[#f3f6fa] rounded px-3 py-2"
                >用户信息</a
              >
              <a
                href="/user/bet"
                class="menu-item text-[#2563eb] font-semibold rounded px-3 py-2 bg-[#f3f6fa]"
                >投注历史</a
              >
              <!-- <a href="/user/recharge" class="menu-item hover:bg-[#f3f6fa] rounded px-3 py-2">存款</a>
              <a href="/user/withdraw" class="menu-item hover:bg-[#f3f6fa] rounded px-3 py-2">提款</a> -->
            </nav>
          </aside>
          <!-- 主体内容 -->
          <section class="user-content flex-1">
            <div class="bet-history bg-white rounded-xl shadow p-8">
              <div class="bet-header flex items-center gap-4 mb-6">
                <h2 class="text-xl font-bold">投注历史</h2>
                <div class="bet-stats flex gap-4">
                  <div class="bet-stat-item flex flex-col items-center">
                    <span class="bet-stat-value text-lg font-bold">0</span>
                  </div>
                </div>
              </div>
              <div class="bet-content">
                <div
                  class="no-data flex flex-col items-center justify-center py-16"
                >
                  <div class="no-data-icon text-4xl mb-2">📊</div>
                  <div class="no-data-text text-gray-500 text-base">无数据</div>
                </div>
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

async function loadUserInfo() {
  const info = localStorage.getItem("userInfo");
  if (info) {
    try {
      const localUser = JSON.parse(info);
      // 优先用 localUser.id，如果没有则尝试 user.account
      if (localUser.id) {
        // 使用 /info/{id} 接口获取 account、name、points
        const res = await axios.get(
          `http://localhost:8080/app/user/info/${localUser.id}`
        );
        if (res.data.code === 200 && res.data.user) {
          // 补充 id 字段，防止后端未返回
          const user = { ...res.data.user, id: localUser.id };
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

onMounted(() => {
  loadUserInfo();
});
</script>

<style scoped>
.header {
  box-shadow: 0 2px 8px 0 rgba(0,0,0,0.04);
  background: #18181c !important;
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
  background: #2d2d2d !important;
  color: #e53e3e !important;
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
