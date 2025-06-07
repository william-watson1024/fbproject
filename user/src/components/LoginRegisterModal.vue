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
        <h2 class="text-2xl font-bold mb-1 text-gray-900">账号登录/注册</h2>
        <p class="text-gray-500 text-sm">请输入账号和密码，未注册账号将自动注册</p>
      </div>
      <form @submit.prevent="loginOrRegister" class="mb-2">
        <label class="block text-gray-700 text-sm mb-1" for="account">账号</label>
        <input
          v-model="account"
          id="account"
          type="text"
          placeholder="请输入账号"
          class="border border-gray-300 focus:border-goodred focus:ring-goodred/30 focus:ring-2 outline-none p-2 rounded w-full mb-3 transition"
          maxlength="20"
          required
        />
        <div v-if="accountError" class="text-red-500 text-xs mb-2">{{ accountError }}</div>
        <label class="block text-gray-700 text-sm mb-1" for="password">密码</label>
        <input
          v-model="password"
          id="password"
          type="password"
          placeholder="请输入密码（6-20位字母数字组合）"
          class="border border-gray-300 focus:border-goodred focus:ring-goodred/30 focus:ring-2 outline-none p-2 rounded w-full mb-3 transition"
          required
        />
        <div v-if="passwordError" class="text-red-500 text-xs mb-2">{{ passwordError }}</div>
        <button
          type="submit"
          class="bg-goodred hover:bg-goodred text-white w-full py-2 rounded font-semibold shadow transition"
        >
          登录/注册
        </button>
      </form>
      <div v-if="tip" class="text-center mt-4 text-sm text-green-600">{{ tip }}</div>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";
import axios from "axios";
const props = defineProps(["show"]);
const emit = defineEmits(["close", "success"]);

const account = ref("");
const password = ref("");
const accountError = ref("");
const passwordError = ref("");
const tip = ref("");

function close() {
  emit("close");
  reset();
}

function reset() {
  account.value = "";
  password.value = "";
  accountError.value = "";
  passwordError.value = "";
  tip.value = "";
}

async function loginOrRegister() {
  accountError.value = "";
  passwordError.value = "";
  tip.value = "";

  if (!/^[a-zA-Z0-9_]{4,20}$/.test(account.value)) {
    accountError.value = "账号需为4-20位字母、数字或下划线";
    return;
  }
  if (!/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,20}$/.test(password.value)) {
    passwordError.value = "密码需为6-20位字母和数字组合";
    return;
  }
  try {
    const res = await axios.post("http://localhost:8080/app/user/login", {
      account: account.value,
      password: password.value,
      name: account.value, // 可选，后端会自动处理
    });
    if (res.data.code === 200 && res.data.user) {
      if (res.data.msg && res.data.msg.includes("注册")) {
        tip.value = "账号不存在，已自动注册并登录";
      } else {
        tip.value = "登录成功";
      }
      localStorage.setItem("userInfo", JSON.stringify(res.data.user));
      emit("success", { user: res.data.user });
      setTimeout(() => {
        close();
      }, 1000);
    } else {
      passwordError.value = res.data.msg || "登录失败";
    }
  } catch (err) {
    passwordError.value = err.response?.data?.msg || "登录失败";
  }
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
input {
  color: #232326 !important;
  border: 1.5px solid #e53e3e !important;
}
input:focus {
  border-color: #e53e3e !important;
  box-shadow: 0 0 0 2px #e53e3e33;
}
label {
  color: #f5f5f5 !important;
}
</style>