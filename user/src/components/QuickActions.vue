<template>
  <div class="p-4">
    <div class="flex gap-4 h-20">
      <button class="bg-green-600 text-white flex-1 h-full py-2 rounded text-lg" @click="goHome">热门直播</button>
      <button class="bg-orange-500 text-white flex-1 h-full py-2 rounded text-lg" @click="goRecharge">充值</button>
      <button class="bg-red-500 text-white flex-1 h-full py-2 rounded text-lg" @click="goWithdraw">提现</button>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'
const router = useRouter()

const goHome = () => {
  router.push('/')
}
const goRecharge = () => {
  router.push('/user/recharge')
}
const goWithdraw = () => {
  router.push('/user/withdraw')
}
</script>