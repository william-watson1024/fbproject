<template>
  <div
    v-if="show"
    class="fixed inset-0 bg-black/40 flex items-center justify-center z-50"
  >
    <div
      class="bg-white rounded-2xl p-8 w-full max-w-md shadow-2xl relative animate-fade-in"
    >
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
        <h2 class="text-2xl font-bold mb-1 text-gray-900">注册新账号</h2>
        <p class="text-gray-500 text-sm">请输入账号注册</p>
      </div>
      <form v-if="step === 1" @submit.prevent="nextStep" class="mb-2">
        <label class="block text-gray-700 text-sm mb-1" for="account"
          >账号</label
        >
        <input
          v-model="account"
          id="account"
          type="text"
          placeholder="请输入账号"
          class="border border-gray-300 focus:border-royalblue focus:ring-royalblue/30 focus:ring-2 outline-none p-2 rounded w-full mb-3 transition"
          required
        />
        <div v-if="accountError" class="text-red-500 text-xs mb-2">
          {{ accountError }}
        </div>
        <button
          type="submit"
          class="bg-royalblue hover:bg-royalblue/90 text-white w-full py-2 rounded font-semibold shadow transition"
        >
          下一步
        </button>
      </form>
      <form v-else @submit.prevent="register" class="mb-2">
        <label class="block text-gray-700 text-sm mb-1" for="nickname"
          >昵称（可选）</label
        >
        <input
          v-model="nickname"
          id="nickname"
          type="text"
          placeholder="请输入昵称"
          class="border border-gray-300 focus:border-royalblue focus:ring-royalblue/30 focus:ring-2 outline-none p-2 rounded w-full mb-3 transition"
          maxlength="20"
        />
        <div v-if="nicknameError" class="text-red-500 text-xs mb-2">
          {{ nicknameError }}
        </div>
        <label class="block text-gray-700 text-sm mb-1" for="password"
          >密码</label
        >
        <input
          v-model="password"
          id="password"
          type="password"
          placeholder="请输入密码（6-20位，字母数字组合）"
          class="border border-gray-300 focus:border-royalblue focus:ring-royalblue/30 focus:ring-2 outline-none p-2 rounded w-full mb-3 transition"
          required
        />
        <div v-if="passwordError" class="text-red-500 text-xs mb-2">
          {{ passwordError }}
        </div>
        <button
          type="submit"
          class="bg-royalblue hover:bg-royalblue/90 text-white w-full py-2 rounded font-semibold shadow transition"
        >
          注册
        </button>
      </form>
      <div class="text-center mt-4 text-sm text-gray-500">
        已有账号？
        <a
          href="javascript:;"
          class="text-royalblue hover:underline"
          @click="handleToLogin"
          >前往登录</a
        >
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";
import axios from "axios";
import { useRouter } from "vue-router";
const props = defineProps(["show"]);
const emit = defineEmits(["close", "success", "toLogin"]);

const router = useRouter();

const step = ref(1);
const account = ref("");
const nickname = ref("");
const password = ref("");
const accountError = ref("");
const nicknameError = ref("");
const passwordError = ref("");

function close() {
  emit("close");
  reset();
}

function handleToLogin() {
  reset();
  emit("toLogin");
}

function nextStep() {
  accountError.value = "";
  // 账号校验：4-20位字母数字下划线
  if (!/^[a-zA-Z0-9_]{4,20}$/.test(account.value)) {
    accountError.value = "账号需为4-20位字母、数字或下划线";
    return;
  }
  step.value = 2;
  nickname.value = account.value;
}

async function register() {
  nicknameError.value = "";
  passwordError.value = "";
  if (nickname.value && nickname.value.length > 20) {
    nicknameError.value = "昵称不能超过20个字符";
    return;
  }
  if (!/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,20}$/.test(password.value)) {
    passwordError.value = "密码需为6-20位字母和数字组合";
    return;
  }
  try {
    const res = await axios.post("http://localhost:8080/app/user/register", {
      account: account.value,
      password: password.value,
      name: nickname.value || account.value,
    });
    if (res.data.code === 200) {
      // 注册成功后自动登录
      try {
        const loginRes = await axios.post("http://localhost:8080/app/user/login", {
          account: account.value,
          password: password.value,
        });
        if (loginRes.data.code === 200 && loginRes.data.user) {
          // 保存用户信息
          localStorage.setItem("userInfo", JSON.stringify(loginRes.data.user));
          emit("success", { user: loginRes.data.user });
          close();
          router.push("/"); // 跳转到主页
        } else {
          accountError.value = loginRes.data.msg || "自动登录失败，请手动登录";
          emit("toLogin");
        }
      } catch (e) {
        accountError.value = "自动登录失败，请手动登录";
        emit("toLogin");
      }
    } else {
      accountError.value = res.data.msg || "注册失败";
    }
  } catch (err) {
    accountError.value = err.response?.data?.msg || "注册失败";
  }
}

function reset() {
  step.value = 1;
  account.value = "";
  nickname.value = "";
  password.value = "";
  accountError.value = "";
  nicknameError.value = "";
  passwordError.value = "";
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