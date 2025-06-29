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
        <h2 class="text-2xl font-bold mb-1 text-gray-900">Đăng nhập/Đăng ký tài khoản</h2>
        <p class="text-gray-500 text-sm">Vui lòng nhập tài khoản và mật khẩu, tài khoản chưa đăng ký sẽ được tự động đăng ký</p>
      </div>
      <form @submit.prevent="loginOrRegister" class="mb-2">
        <label class="block text-gray-700 text-sm mb-1" for="account">Tài khoản</label>
        <input
          v-model="account"
          id="account"
          type="text"
          placeholder="Vui lòng nhập tài khoản"
          class="border border-gray-300 focus:border-goodred focus:ring-goodred/30 focus:ring-2 outline-none p-2 rounded w-full mb-3 transition"
          maxlength="20"
          required
        />
        <div v-if="accountError" class="text-red-500 text-xs mb-2">{{ accountError }}</div>
        <label class="block text-gray-700 text-sm mb-1" for="password">Mật khẩu</label>
        <input
          v-model="password"
          id="password"
          type="password"
          placeholder="Vui lòng nhập mật khẩu (6-20 ký tự gồm chữ và số)"
          class="border border-gray-300 focus:border-goodred focus:ring-goodred/30 focus:ring-2 outline-none p-2 rounded w-full mb-3 transition"
          required
        />
        <div v-if="passwordError" class="text-red-500 text-xs mb-2">{{ passwordError }}</div>
        <button
          type="submit"
          class="bg-goodred hover:bg-goodred text-white w-full py-2 rounded font-semibold shadow transition"
        >
          Đăng nhập/Đăng ký
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
    accountError.value = "Tài khoản phải từ 4-20 ký tự, chỉ gồm chữ, số hoặc gạch dưới";
    return;
  }
  if (!/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,20}$/.test(password.value)) {
    passwordError.value = "Mật khẩu phải từ 6-20 ký tự, gồm cả chữ và số";
    return;
  }
  try {
    // 先尝试登录
    const res = await axios.post("/api/app/gameUser/login", null, {
      params: {
        account: account.value,
        password: password.value
      }
    });
    if (res.data.code === 200 && res.data.data) {
      tip.value = "Đăng nhập thành công";
      localStorage.setItem("userInfo", JSON.stringify(res.data.data));
      emit("success", { user: res.data.data });
      setTimeout(() => {
        close();
      }, 1000);
    } else {
      // 登录失败，尝试注册并登录
      if (res.data.msg && res.data.msg.includes("不存在")) {
        await tryRegisterAndLogin();
      } else {
        passwordError.value = res.data.msg || "登录失败";
      }
    }
  } catch (err) {
    // 登录接口报错，尝试注册并登录
    if (err.response && err.response.data && err.response.data.msg && err.response.data.msg.includes("不存在")) {
      await tryRegisterAndLogin();
    } else {
      passwordError.value = err.response?.data?.msg || "登录失败";
    }
  }
}

async function tryRegisterAndLogin() {
  try {
    const res = await axios.post("/api/app/gameUser/registerAndLogin", null, {
      params: {
        account: account.value,
        password: password.value,
        name: account.value
      }
    });
    if (res.data.code === 200 && res.data.data) {
      tip.value = "Tài khoản chưa tồn tại, đã tự động đăng ký và đăng nhập";
      localStorage.setItem("userInfo", JSON.stringify(res.data.data));
      emit("success", { user: res.data.data });
      setTimeout(() => {
        close();
      }, 1000);
    } else {
      passwordError.value = res.data.msg || "Đăng ký thất bại";
    }
  } catch (err) {
    passwordError.value = err.response?.data?.msg || "Đăng ký thất bại";
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
  color: #232326 !important;
}
</style>