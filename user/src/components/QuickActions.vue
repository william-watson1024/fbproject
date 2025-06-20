<template>
  <div class="p-4">
    <div class="quick-actions">
      <button class="action-btn hot-live wide-btn" @click="goHome">Phát sóng nổi bật</button>
      <button class="action-btn recharge wide-btn" @click="goRecharge" disabled style="opacity:0.5;cursor:not-allowed;">Nạp tiền</button>
      <button class="action-btn withdraw wide-btn" @click="goWithdraw" disabled style="opacity:0.5;cursor:not-allowed;">Rút tiền</button>
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

<style scoped>
.quick-actions {
  width: 100%;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 1.2rem;
  flex-wrap: wrap;
}
.action-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 140px;
  max-width: 220px;
  height: 2.7rem;
  font-size: 1.08rem;
  font-weight: 600;
  border-radius: 10px;
  padding: 0.5rem 1.5rem;
  white-space: nowrap;
  transition:
    background 0.2s,
    color 0.2s,
    box-shadow 0.2s;
  box-shadow: 0 2px 8px 0 rgba(0,0,0,0.06);
  border: none;
  cursor: pointer;
}
.wide-btn {
  min-width: 200px;
  max-width: 320px;
}
.hot-live {
  background: #16a34a;
  color: #fff;
}
.hot-live:hover {
  background: #15803d;
}
.recharge {
  background: #f59e42;
  color: #fff;
}
.recharge:hover {
  background: #d97706;
}
.withdraw {
  background: #e53e3e;
  color: #fff;
}
.withdraw:hover {
  background: #b91c1c;
}
@media (max-width: 900px) {
  .quick-actions {
    gap: 0.7rem;
  }
  .action-btn {
    min-width: 110px;
    max-width: 160px;
    font-size: 0.98rem;
    height: 2.2rem;
    padding: 0.4rem 1rem;
  }
  .wide-btn {
    min-width: 150px;
    max-width: 220px;
  }
}
@media (max-width: 600px) {
  .quick-actions {
    gap: 0.4rem;
  }
  .action-btn {
    min-width: 90px;
    max-width: 120px;
    font-size: 0.92rem;
    height: 2rem;
    padding: 0.3rem 0.5rem;
  }
  .wide-btn {
    min-width: 120px;
    max-width: 150px;
  }
}
</style>