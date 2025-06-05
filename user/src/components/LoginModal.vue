<!-- filepath: d:\nextjs-tailwind-live-platform\my-vue-live-platform\src\components\LoginModal.vue -->
<template>
    <div v-if="show" class="fixed inset-0 bg-black/40 flex items-center justify-center z-50">
      <div class="bg-white rounded-2xl p-8 w-full max-w-md shadow-2xl relative animate-fade-in">
        <button
          class="absolute top-4 right-4 text-gray-400 hover:text-gray-600 text-2xl"
          @click="close"
          aria-label="关闭"
        >
          &times;
        </button>
        <div class="flex flex-col items-center mb-6">
          <img
            src="https://cdn.jsdelivr.net/gh/twitter/twemoji@14.0.2/assets/72x72/1f512.png"
            alt="logo"
            class="w-12 h-12 mb-2"
          />
          <h2 class="text-2xl font-bold mb-1 text-gray-900">账号登录</h2>
          <p class="text-gray-500 text-sm">请输入昵称和密码登录</p>
        </div>
        <form @submit.prevent="login" class="mb-2">
          <label class="block text-gray-700 text-sm mb-1" for="nickname">昵称</label>
          <input
            v-model="nickname"
            id="nickname"
            type="text"
            placeholder="请输入昵称"
            class="border border-gray-300 focus:border-royalblue focus:ring-royalblue/30 focus:ring-2 outline-none p-2 rounded w-full mb-3 transition"
            maxlength="20"
            required
          />
          <div v-if="nicknameError" class="text-red-500 text-xs mb-2">{{ nicknameError }}</div>
          <label class="block text-gray-700 text-sm mb-1" for="password">密码</label>
          <input
            v-model="password"
            id="password"
            type="password"
            placeholder="请输入密码"
            class="border border-gray-300 focus:border-royalblue focus:ring-royalblue/30 focus:ring-2 outline-none p-2 rounded w-full mb-3 transition"
            required
          />
          <div v-if="passwordError" class="text-red-500 text-xs mb-2">{{ passwordError }}</div>
          <button
            type="submit"
            class="bg-royalblue hover:bg-royalblue/90 text-white w-full py-2 rounded font-semibold shadow transition"
          >
            登录
          </button>
        </form>
        <div class="text-center mt-4 text-sm text-gray-500">
          没有账号？
          <a href="javascript:;" class="text-royalblue hover:underline" @click="handleToRegister">前往注册</a>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref } from "vue";
  import axios from "axios";
  const props = defineProps(["show"]);
  const emit = defineEmits(["close", "success", "toRegister"]);
  
  const nickname = ref("");
  const password = ref("");
  const captcha = ref("");
  const nicknameError = ref("");
  const passwordError = ref("");
  const captchaError = ref("");
  const captchaUrl = ref(getCaptchaUrl());
  
  function close() {
    emit("close");
    reset();
  }
  
  function handleToRegister() {
    reset();
    emit("toRegister");
  }
  
  function getCaptchaUrl() {
    return `/api/captcha/image?${Date.now()}`;
  }
  
  function refreshCaptcha() {
    captchaUrl.value = getCaptchaUrl();
  }
  
  async function login() {
    nicknameError.value = "";
    passwordError.value = "";
    captchaError.value = "";
  
    if (!nickname.value) {
      nicknameError.value = "请输入昵称";
      return;
    }
    if (!/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,20}$/.test(password.value)) {
      passwordError.value = "密码需为6-20位字母和数字组合";
      return;
    }
    try {
      // 修改为完整后端地址
      const res = await axios.post("http://localhost:8080/app/user/login", {
        account: nickname.value,
        password: password.value,
      });
      if (res.data.code === 200 && res.data.user) {
        // 登录成功，保存用户信息
        localStorage.setItem("userInfo", JSON.stringify(res.data.user));
        emit("success", { user: res.data.user });
        close();
      } else {
        passwordError.value = res.data.msg || "登录失败";
      }
    } catch (err) {
      passwordError.value = err.response?.data?.msg || "登录失败";
    }
  }
  
  function reset() {
    nickname.value = "";
    password.value = "";
    captcha.value = "";
    nicknameError.value = "";
    passwordError.value = "";
    captchaError.value = "";
    refreshCaptcha();
  }
  </script>
  
  <style scoped>
  @keyframes fade-in {
    from {
      opacity: 0;
      transform: scale(0.98);
    }
    to {
      opacity: 1;
      transform: scale(1);
    }
  }
  .animate-fade-in {
    animation: fade-in 0.3s;
  }
  </style>