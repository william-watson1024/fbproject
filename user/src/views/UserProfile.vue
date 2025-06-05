<template>
  <div class="min-h-screen bg-[#f6f7fb]">
    <AppHeader />
    <main class="main pt-20 pb-10" v-if="userInfo && userInfo.account">
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
                {{ userInfo.name || "-" }}
              </div>
              <div class="user-balance text-sm text-gray-600 mt-1">
                余额：{{ userInfo.points ?? "0" }}
              </div>
            </div>
            <nav class="user-menu flex flex-col gap-2 w-full">
              <a
                href="/user/profile"
                class="menu-item text-[#2563eb] font-semibold rounded px-3 py-2 bg-[#f3f6fa]"
                >用户信息</a
              >
              <a
                href="/user/bet"
                class="menu-item hover:bg-[#f3f6fa] rounded px-3 py-2"
                >投注历史</a
              >
              <!-- <a href="/user/recharge" class="menu-item hover:bg-[#f3f6fa] rounded px-3 py-2">存款</a>
                <a href="/user/withdraw" class="menu-item hover:bg-[#f3f6fa] rounded px-3 py-2">提款</a> -->
            </nav>
          </aside>
          <!-- 主体内容 -->
          <section class="user-content flex-1">
            <div class="profile bg-white rounded-xl shadow p-8">
              <div class="profile-header flex items-center gap-4 mb-6">
                <h2 class="text-xl font-bold">用户信息</h2>
                <div
                  class="profile-status active text-green-600 text-sm font-semibold bg-green-50 px-3 py-1 rounded"
                >
                  活动
                </div>
              </div>
              <div class="profile-content">
                <div class="profile-card">
                  <form
                    class="profile-form grid grid-cols-1 md:grid-cols-2 gap-6"
                  >
                    <div class="form-group flex flex-col">
                      <label class="mb-1 font-medium">用户名</label>
                      <div class="form-value bg-gray-100 rounded px-3 py-2">
                        {{ userInfo.account || "-" }}
                      </div>
                    </div>
                    <div class="form-group flex flex-col">
                      <label class="mb-1 font-medium">昵称</label>
                      <input
                        type="text"
                        placeholder="昵称"
                        class="form-input border rounded px-3 py-2"
                        v-model="userInfo.name"
                      />
                    </div>
                    <div class="form-group flex flex-col">
                      <label class="mb-1 font-medium">剩余</label>
                      <div
                        class="form-value balance-value bg-gray-100 rounded px-3 py-2"
                      >
                        积分：{{ userInfo.points ?? "0" }}
                      </div>
                    </div>
                    <div class="form-group flex flex-col">
                      <label class="mb-1 font-medium">角色</label>
                      <div
                        class="form-value role-value bg-gray-100 rounded px-3 py-2"
                      >
                        普通用户
                      </div>
                    </div>
                    <!-- <div class="form-group flex flex-col">
                        <label class="mb-1 font-medium">创建时间</label>
                        <div class="form-value bg-gray-100 rounded px-3 py-2">2025/5/31 10:22:53</div>
                      </div>
                      <div class="form-group flex flex-col">
                        <label class="mb-1 font-medium">邀请码</label>
                        <input type="text" placeholder="邀请码" class="form-input border rounded px-3 py-2" />
                      </div> -->
                  </form>
                  <div class="form-actions mt-6">
                    <button
                      class="save-button bg-[#2563eb] text-white px-6 py-2 rounded font-semibold hover:bg-[#1d4ed8]"
                    >
                      保存
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </section>
        </div>
      </div>
    </main>
    <div v-else class="text-center text-gray-400 py-20">加载中...</div>
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
      if (localUser.id) {
        const res = await axios.get(
          `http://localhost:8080/app/user/info/${localUser.id}`
        );
        if (res.data.code === 200 && res.data.user) {
          const user = { ...res.data.user, id: localUser.id };
          userInfo.value = user;
          localStorage.setItem("userInfo", JSON.stringify(user));
        } else {
          userInfo.value = localUser;
        }
      } else {
        userInfo.value = {};
      }
    } catch {
      userInfo.value = {};
    }
  } else {
    userInfo.value = {};
  }
}

onMounted(() => {
  loadUserInfo();
});
</script>

<style scoped>
.header {
  box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.04);
  background: #fff;
}
.user-sidebar {
  min-width: 220px;
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
}
.menu-item.active,
.menu-item.text-#2563eb {
  background: #f3f6fa;
  color: #2563eb;
}
.profile-header {
  border-bottom: 1px solid #f0f0f0;
  padding-bottom: 1rem;
  margin-bottom: 1.5rem;
}
.form-group label {
  font-weight: 500;
}
.form-input {
  border: 1px solid #e5e7eb;
  background: #fff;
}
.save-button {
  min-width: 120px;
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
