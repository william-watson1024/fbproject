<template>
  <header class="header shadow fixed top-0 left-0 w-full z-50">
    <div class="container mx-auto flex justify-between items-center h-16 px-4">
      <div class="logo font-bold text-xl">
        <a href="/" class="hover:opacity-80">
          <span class="logo-highlight px-3 py-1 rounded-lg font-bold text-lg whitespace-nowrap"
            >Sảnh trực tiếp</span
          >
        </a>
      </div>
      <nav class="nav">
        <ul class="flex items-center gap-2 md:gap-6 flex-wrap md:flex-nowrap">
          <template v-if="isLogin">
            <li>
              <span class="user-nickname text-[#e53e3e] font-semibold whitespace-nowrap">{{
                userNickname
              }}</span>
            </li>
            <li>
              <a href="javascript:;" class="nav-btn" @click="goProfile">
                <span class="whitespace-nowrap">Trang cá nhân</span>
              </a>
            </li>
            <li>
              <a href="javascript:;" class="nav-btn" @click="logout">
                <span class="whitespace-nowrap">Đăng xuất</span>
              </a>
            </li>
          </template>
          <template v-else>
            <li>
              <a href="javascript:;" class="nav-btn" @click="showLogin = true">
                <span class="whitespace-nowrap">Đăng ký</span>
              </a>
            </li>
          </template>
        </ul>
      </nav>
    </div>
    <LoginRegisterModal
      v-if="showLogin"
      :show="showLogin"
      @close="showLogin = false"
      @success="handleLoginSuccess"
    />
  </header>
</template>

<script setup>
import { ref, watch, onMounted } from "vue";
import { useRouter } from "vue-router";
import LoginRegisterModal from "./LoginRegisterModal.vue";

const isLogin = ref(false);
const userNickname = ref("未登录");
const userInfo = ref({});

const showLogin = ref(false);

const router = useRouter();

const goProfile = () => {
  router.push("/user/profile");
};

const logout = () => {
  isLogin.value = false;
  userNickname.value = "未登录";
  userInfo.value = {};
  localStorage.removeItem("isLogin");
  localStorage.removeItem("userNickname");
  localStorage.removeItem("userInfo");
  router.push("/"); // 登出后返回主页
};

// 登录/注册后获取用户信息并持久化
async function fetchAndStoreUserInfo() {
  try {
    const info = localStorage.getItem("userInfo");
    if (info) {
      userInfo.value = JSON.parse(info);
      userNickname.value =
        userInfo.value.name || userInfo.value.account || "用户";
      isLogin.value = true;
    }
  } catch (e) {
    userInfo.value = {};
    userNickname.value = "未登录";
    isLogin.value = false;
  }
}

function handleLoginSuccess(payload) {
  if (payload.closeModal) {
    showLogin.value = false;
  }
  fetchAndStoreUserInfo(); // 刷新用户信息
  // 如需强制刷新页面可加：window.location.reload();
  // router.push('/') 如需跳转
}

// 页面加载时自动读取用户信息
onMounted(() => {
  fetchAndStoreUserInfo();
});

// 监听登录状态变化，保持 localStorage 同步
watch(isLogin, (val) => {
  localStorage.setItem("isLogin", val ? "true" : "false");
});
watch(userNickname, (val) => {
  localStorage.setItem("userNickname", val);
});
</script>

<style scoped>
.header {
  box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.04);
  background: #e53e3e !important;
  height: 3.2rem !important;
  min-height: 3.2rem !important;
  max-height: 3.2rem !important;
  display: flex;
  align-items: center;
}
.logo-highlight {
  background: #fff;
  color: #e53e3e;
  font-weight: bold;
  letter-spacing: 2px;
  box-shadow: 0 2px 8px 0 rgba(229, 62, 62, 0.1);
  height: 1.8rem;
  line-height: 1.8rem;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1rem;
}
.header .container {
  height: 3.2rem !important;
  min-height: 3.2rem !important;
  max-height: 3.2rem !important;
  display: flex;
  flex-direction: row !important;
  align-items: center !important;
  justify-content: space-between;
  padding-top: 0 !important;
  padding-bottom: 0 !important;
  gap: 0;
}
.logo {
  display: flex;
  align-items: center;
  height: 3.2rem;
}
.nav {
  height: 3.2rem;
  display: flex;
  align-items: center;
}
.nav ul {
  display: flex;
  align-items: center;
  gap: 0.15rem;
  height: 3.2rem;
  overflow-x: auto;
  flex-wrap: nowrap !important;
  padding: 0;
  margin: 0;
}
.nav-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  height: 1.8rem;
  min-height: 1.8rem;
  max-height: 1.8rem;
  padding: 0 4px;
  margin: 0 2px;
  border-radius: 8px;
  background: #fff;
  color: #e53e3e;
  border: 2px solid #e53e3e;
  font-weight: 600;
  font-size: 12px;
  line-height: 1.2;
  transition: background 0.2s, color 0.2s, border 0.2s;
  box-shadow: 0 2px 8px 0 rgba(229, 62, 62, 0.08);
  white-space: nowrap;
}
.nav-btn span {
  white-space: nowrap;
}
.nav-btn:hover {
  background: #e53e3e;
  color: #fff;
  border-color: #e53e3e;
}
.user-nickname {
  color: #000000 !important;
  font-weight: bold;
  font-size: 12px;
  white-space: nowrap;
  height: 1.8rem;
  display: flex;
  align-items: center;
}
@media (max-width: 900px) {
  .header, .header .container {
    height: 3.2rem !important;
    min-height: 3.2rem !important;
    max-height: 3.2rem !important;
    padding-left: 2px;
    padding-right: 2px;
  }
  .nav ul {
    gap: 0.15rem !important;
    font-size: 12px;
  }
  .nav-btn {
    font-size: 12px;
    height: 1.8rem;
    min-width: 60px;
    padding: 0 4px;
  }
  .logo-highlight {
    font-size: 0.95rem;
    height: 1.8rem;
    line-height: 1.8rem;
  }
  .user-nickname {
    font-size: 12px;
    height: 1.8rem;
  }
}
@media (max-width: 600px) {
  .header, .header .container {
    height: 2.6rem !important;
    min-height: 2.6rem !important;
    max-height: 2.6rem !important;
    padding-left: 1px;
    padding-right: 1px;
  }
  .nav ul {
    gap: 0.1rem !important;
    font-size: 11px;
  }
  .nav-btn {
    font-size: 11px;
    height: 1.4rem;
    min-width: 48px;
    padding: 0 2px;
  }
  .logo-highlight {
    font-size: 0.85rem;
    height: 1.4rem;
    line-height: 1.4rem;
  }
  .user-nickname {
    font-size: 11px;
    height: 1.4rem;
  }
}
</style>
