<template>
  <div class="p-4">
    <div class="grid grid-cols-3 gap-3 mb-4">
      <button
        v-for="item in animals"
        :key="item"
        :class="[
          'bet-option-btn flex flex-col items-center justify-center px-2 py-3 rounded-lg font-semibold text-base transition-all duration-200 transform border border-transparent',
          selectedAnimal === item
            ? 'bg-royalblue text-white scale-105'
            : 'bg-white text-royalblue hover:-translate-y-1 hover:shadow-lg'
        ]"
        @click="selectAnimal(item)"
      >
        <div class="bet-option-icon text-2xl mb-1">
          {{ animalIcons[item] }}
        </div>
        <span>{{ item }}</span>
      </button>
    </div>
    <div class="grid grid-cols-4 gap-3 mb-4">
      <button
        v-for="amt in amounts"
        :key="amt"
        :class="[
          'bet-option-btn px-2 py-2 rounded-lg font-semibold text-sm transition-all duration-200 transform border border-transparent',
          selectedAmount === amt
            ? 'bg-royalblue text-white scale-105'
            : 'bg-white text-royalblue hover:-translate-y-1 hover:shadow-lg'
        ]"
        @click="selectAmount(amt)"
      >
        {{ amt }}
      </button>
    </div>
    <input
      type="text"
      placeholder="10"
      class="border border-gray-300 p-2 w-full rounded mb-2"
      v-model="displayAmount"
      @input="onInputAmount"
    />
    <div class="flex gap-2 mb-2">
      <button
        class="bg-blue-600 text-white px-4 py-2 w-full rounded"
        :disabled="betting"
        @click="handleBet"
      >{{ betting ? '下注中...' : '下注' }}</button>
      <button
        class="bg-blue-600 text-white px-4 py-2 w-full rounded"
        :disabled="refreshing"
        @click="refreshPoints"
      >
        {{ refreshing ? '刷新中...' : '刷新积分' }}
      </button>
    </div>
    <div class="text-center text-blue-600 mb-2">
      当前积分：<span class="font-bold">{{ points }}</span>
    </div>
    <div v-if="betMsg" class="text-center text-red-500 mt-2">{{ betMsg }}</div>
  </div>
</template>

<script setup>
import { ref, defineProps, watch, onMounted } from 'vue'
import axios from 'axios'

const animals = ["鹿", "葫芦", "鸡", "鱼", "蟹", "虾"];
const animalIcons = {
  "鹿": "🦌",
  "葫芦": "🎃",
  "鸡": "🐔",
  "鱼": "🐟",
  "蟹": "🦀",
  "虾": "🦐"
};
const amounts = ["100k", "500k", "1m", "5m"];
const amountMap = {
  "100k": 100000,
  "500k": 500000,
  "1m": 1000000,
  "5m": 5000000
};

const props = defineProps({
  amount: String
})
const selectedAnimal = ref('')
const selectedAmount = ref('')
const inputAmount = ref('10') // 默认有效数字10
const displayAmount = ref(formatNumber('10')) // 默认显示10
const betting = ref(false)
const betMsg = ref('')
const points = ref(0)
const refreshing = ref(false)

function selectAnimal(item) {
  selectedAnimal.value = item
}
function selectAmount(amt) {
  selectedAmount.value = amt
  inputAmount.value = amountMap[amt].toString()
  displayAmount.value = formatNumber(inputAmount.value)
}

// 输入框输入时，格式化为带逗号的数字
function onInputAmount(e) {
  let raw = e.target.value.replace(/,/g, '').replace(/[^\d]/g, '')
  inputAmount.value = raw
  displayAmount.value = formatNumber(raw)
}

// 数字转千分位
function formatNumber(val) {
  if (!val) return ''
  return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
}

// 双向绑定外部 amount
watch(() => props.amount, (val) => {
  inputAmount.value = val
  displayAmount.value = formatNumber(val)
})

// 获取用户积分
async function fetchPoints() {
  const userInfo = JSON.parse(localStorage.getItem('userInfo') || '{}')
  if (!userInfo.id) {
    points.value = 0
    return
  }
  try {
    // 用新的 /info/{id} 接口获取 account、name、points
    const res = await axios.get(`http://localhost:8080/app/user/info/${userInfo.id}`)
    if (res.data.code === 200 && res.data.user) {
      // 更新 points 变量和本地缓存
      points.value = res.data.user.points
      const newUserInfo = { ...userInfo, ...res.data.user, id: userInfo.id }
      localStorage.setItem('userInfo', JSON.stringify(newUserInfo))
    }
  } catch {
      userInfo.value = {};
    }
}

// 刷新按钮
async function refreshPoints() {
  refreshing.value = true
  await fetchPoints()
  refreshing.value = false
}

// 组件加载时自动获取积分
onMounted(() => {
  const userInfo = JSON.parse(localStorage.getItem('userInfo') || '{}')
  points.value = userInfo.points || 0
  fetchPoints()
})

// 下注按钮对接后端
async function handleBet() {
  betMsg.value = ''
  if (!selectedAnimal.value) {
    betMsg.value = '请选择下注动物'
    return
  }
  if (!inputAmount.value || isNaN(Number(inputAmount.value)) || Number(inputAmount.value) <= 0) {
    betMsg.value = '请输入有效下注金额'
    return
  }
  // 获取当前用户ID和账号
  const userInfo = JSON.parse(localStorage.getItem('userInfo') || '{}')
  if (!userInfo.id) {
    betMsg.value = '请先登录'
    return
  }
  betting.value = true
  try {
    const res = await axios.post('http://localhost:8080/app/mybetrecord/add', {
      myFbuserId: userInfo.id,
      myFbuserAccount: userInfo.account,
      betNum: Number(inputAmount.value),
      betName: selectedAnimal.value
    })
    if (res.data.code === 200) {
      betMsg.value = res.data.msg || '下注成功'
      // 下注成功后刷新积分
      await fetchPoints()
    } else {
      betMsg.value = res.data.msg || '下注失败'
    }
  } catch (e) {
    betMsg.value = '下注失败，请重试'
  }
  betting.value = false
}
</script>

<style scoped>
.bet-option-btn {
  box-shadow: 0 1px 2px 0 rgb(0 0 0 / 0.03);
  outline: none;
}
.bet-option-btn:hover {
  transition: all 0.2s;
  transform: translateY(-4px) scale(1.05);
}
.bet-option-icon {
  font-size: 2rem;
  margin-bottom: 0.25rem;
}
</style>