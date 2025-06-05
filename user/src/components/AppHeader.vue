<template>
  <header class="header bg-white shadow fixed top-0 left-0 w-full z-50">
    <div class="container mx-auto flex justify-between items-center h-16 px-4">
      <div class="logo font-bold text-xl text-[#222]">
        <a href="/" class="hover:opacity-80">
          <span class="text-gray-400 text-base font-normal">Live Lobby</span>
        </a>
      </div>
      <nav class="nav">
        <ul class="flex items-center gap-6">
          <template v-if="isLogin">
            <li>
              <span class="user-nickname text-[#2563eb] font-semibold">{{ userNickname }}</span>
            </li>
            <li>
              <a href="javascript:;" class="hover:text-[#2563eb]" @click="goProfile">
                <span class="text-xs text-gray-400">个人中心</span>
              </a>
            </li>
            <li>
              <a href="javascript:;" class="hover:text-[#2563eb]" @click="logout">
                <span class="text-xs text-gray-400">登出</span>
              </a>
            </li>
          </template>
          <template v-else>
            <li>
              <a href="javascript:;" class="hover:text-[#2563eb]" @click="showRegister = true">
                <span class="text-xs text-gray-400">日志</span>
              </a>
            </li>
            <li>
              <a href="javascript:;" class="hover:text-[#2563eb]" @click="showRegister = true">
                <span class="text-xs text-gray-400">注册</span>
              </a>
            </li>
          </template>
        </ul>
      </nav>
    </div>
    <LoginModal
      v-if="showLogin"
      :show="showLogin"
      @close="showLogin = false"
      @success="handleLoginSuccess"
      @toRegister="switchToRegister"
    />
    <RegisterModal
      v-if="showRegister"
      :show="showRegister"
      @close="showRegister = false"
      @success="handleRegisterSuccess"
      @toLogin="switchToLogin"
    />
  </header>
</template>

<script setup>
import { ref, watch, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import axios from 'axios'
import LoginModal from './LoginModal.vue'
import RegisterModal from './RegisterModal.vue'

const isLogin = ref(false)
const userNickname = ref('未登录')
const userInfo = ref({})

const showLogin = ref(false)
const showRegister = ref(false)

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
async function fetchAndStoreUserInfo(account) {
  try {
    // 你可以根据实际接口调整
    // const res = await axios.get(`http://localhost:8080/app/user/info/${account}`)
    // userInfo.value = res.data.user
    // 这里直接用 localStorage 里的 userInfo
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
  // 登录成功后已保存 user 到 localStorage
  fetchAndStoreUserInfo(payload.user.account)
  showLogin.value = false
}

function handleRegisterSuccess(payload) {
  // 注册成功后建议自动登录
  fetchAndStoreUserInfo(payload.account)
  showRegister.value = false
}

function switchToRegister() {
  showLogin.value = false
  showRegister.value = true
}

function switchToLogin() {
  showRegister.value = false
  showLogin.value = true
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
  box-shadow: 0 2px 8px 0 rgba(0,0,0,0.04);
  background: #fff;
}
</style>