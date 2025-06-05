<template>
  <div class="min-h-screen bg-[#f6f7fb]">
    <AppHeader />
    <main class="main pt-20 pb-10">
      <div class="home container mx-auto max-w-6xl px-2">
        <div class="container mx-auto">
          <h1 class="text-2xl font-bold text-[#222] text-center mb-8">
            <span class="text-base text-gray-400 font-normal">广播室列表</span>
          </h1>
          <div class="room-list">
            <div class="room-grid grid grid-cols-1 sm:grid-cols-2 md:grid-cols-2 gap-6">
              <div v-for="room in rooms" :key="room.id" class="room-card bg-white rounded-xl shadow-lg overflow-hidden flex flex-col transition-transform duration-200 hover:-translate-y-2 cursor-pointer">
                <div class="room-cover relative w-full h-48">
                  <img :src="room.image" :alt="room.title" class="w-full h-full object-cover" />
                  <div class="room-status live absolute top-2 left-2 bg-[#e53e3e] text-white text-xs px-3 py-1 rounded shadow font-bold">
                    <span class="text-white/70">广播</span>
                  </div>
                </div>
                <div class="room-info flex-1 flex flex-col justify-between p-4">
                  <h3 class="room-title font-bold text-lg mb-1 mt-0">
                    {{ room.title }}
                  </h3>
                  <p class="room-streamer text-sm text-gray-600 mb-2 mt-1">
                    <span class="text-xs text-gray-400"> {{room.title_zh}} </span>
                    <span class="text-xs text-gray-400"> {{ room.host }} </span>
                  </p>
                  <a :href="room.link" class="room-enter mt-auto bg-[#2563eb] text-white text-base px-4 py-2 rounded w-full text-center hover:bg-[#1d4ed8] transition font-semibold">
                    &nbsp;<span class="text-white/70">进入房间</span>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'
import AppHeader from '../components/AppHeader.vue'
import cover00 from '../assets/covers/00.png'
import cover01 from '../assets/covers/01.png'

const rooms = ref([])

onMounted(async () => {
  try {
    const res = await axios.get('http://localhost:8080/app/myfbweb/listAvailable')
    if (res.data.code === 200 && Array.isArray(res.data.data)) {
      console.log('rooms:', res.data.data)
      rooms.value = res.data.data.map((item, idx) => ({
        id: item.id,
        title: item.name, // 用后端的name字段
        host: item.host || '', // 后端无host字段可用'-'或空
        // 随机选择图片
        image: Math.random() > 0.5 ? cover00 : cover01,
        link: `/room/${item.id}`, // 跳转到房间详情页
        title_zh: item.description || '' // 用description作为副标题
      }))
    }
  } catch (e) {
    rooms.value = []
  }
});
</script>

<style scoped>
.header {
  box-shadow: 0 2px 8px 0 rgba(0,0,0,0.04);
  background: #fff;
}
.room-card {
  min-height: 370px;
}
.room-cover img {
  object-fit: cover;
  width: 100%;
  height: 100%;
}
.room-status.live {
  top: 12px;
  left: 12px;
  background: #e53e3e;
  color: #fff;
  font-weight: bold;
}
.room-title {
  font-size: 1.15rem;
}
.room-enter {
  display: block;
}
@media (max-width: 900px) {
  .room-grid {
    grid-template-columns: 1fr !important;
  }
}
</style>