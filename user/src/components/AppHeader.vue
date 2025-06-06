<template>
  <header class="header shadow fixed top-0 left-0 w-full z-50">
    <div class="container mx-auto flex justify-between items-center h-16 px-4">
      <div class="logo font-bold text-xl">
        <a href="/" class="hover:opacity-80">
          <span class="logo-highlight px-3 py-1 rounded-lg font-bold text-lg">Live Lobby</span>
        </a>
      </div>
      <nav class="nav">
        <ul class="flex items-center gap-6">
          <template v-if="isLogin">
            <li>
              <span class="user-nickname text-[#e53e3e] font-semibold">{{ userNickname }}</span>
            </li>
            <li>
              <a href="javascript:;" class="nav-btn" @click="goProfile">
                <span>个人中心</span>
              </a>
            </li>
            <li>
              <a href="javascript:;" class="nav-btn" @click="logout">
                <span>登出</span>
              </a>
            </li>
          </template>
          <template v-else>
            <li>
              <a href="javascript:;" class="nav-btn" @click="showLogin = true">
                <span>登录</span>
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
import { ref, watch, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import LoginRegisterModal from './LoginRegisterModal.vue'

const isLogin = ref(false)
const userNickname = ref('未登录')
const userInfo = ref({})

const showLogin = ref(false)

const router = useRouter()

const goProfile = () => {
  router.push('/user/profile')
}

const logout = () => {
  isLogin.value = false
  userNickname.value = '未登录'
  userInfo.value = {}
  localStorage.removeItem('isLogin')
  localStorage.removeItem('userNickname')
  localStorage.removeItem('userInfo')
  router.push('/') // 登出后返回主页
}

// 登录/注册后获取用户信息并持久化
async function fetchAndStoreUserInfo() {
  try {
    const info = localStorage.getItem('userInfo')
    if (info) {
      userInfo.value = JSON.parse(info)
      userNickname.value = userInfo.value.name || userInfo.value.account || '用户'
      isLogin.value = true
    }
  } catch (e) {
    userInfo.value = {}
    userNickname.value = '未登录'
    isLogin.value = false
  }
}

function handleLoginSuccess(payload) {
  fetchAndStoreUserInfo()
  showLogin.value = false
}

// 页面加载时自动读取用户信息
onMounted(() => {
  fetchAndStoreUserInfo()
})

// 监听登录状态变化，保持 localStorage 同步
watch(isLogin, (val) => {
  localStorage.setItem('isLogin', val ? 'true' : 'false')
})
watch(userNickname, (val) => {
  localStorage.setItem('userNickname', val)
})
</script>

<style scoped>
.header {
  box-shadow: 0 2px 8px 0 rgba(0,0,0,0.10);
  background: #18181c !important;
}
.logo-highlight {
  background: #e53e3e;
  color: #fff;
  font-weight: bold;
  letter-spacing: 2px;
  box-shadow: 0 2px 8px 0 rgba(229,62,62,0.10);
}
.nav-btn {
  display: inline-block;
  padding: 6px 18px;
  margin: 0 2px;
  border-radius: 8px;
  background: #FFFF;
  color: #e53e3e;
  border: 2px solid #e53e3e;
  font-weight: 600;
  font-size: 15px;
  transition: background 0.2s, color 0.2s, border 0.2s;
  box-shadow: 0 2px 8px 0 rgba(229,62,62,0.08);
}
.nav-btn:hover {
  background: #e53e3e;
  color: #fff;
  border-color: #e53e3e;
}
.user-nickname {
  color: #e53e3e !important;
  font-weight: bold;
  font-size: 16px;
}
</style>