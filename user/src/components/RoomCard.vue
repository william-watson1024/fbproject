<template>
  <div class="room-card bg-white rounded-xl shadow-lg overflow-hidden flex flex-col transition-transform duration-200 hover:-translate-y-2 cursor-pointer h-64">
    <div class="room-cover relative w-full h-36">
      <img :src="room.image" :alt="room.title" class="w-full h-full object-cover" />
      <div class="room-status live absolute top-2 right-2 bg-livered text-white text-xs px-3 py-1 rounded shadow">
        正在直播
      </div>
    </div>
    <div class="room-info flex-1 flex flex-col justify-between p-4">
      <h3 class="room-title font-normal text-base truncate mb-1 mt-0">{{ room.title }}</h3>
      <p class="room-streamer text-xs text-gray-600 mb-2 mt-1">主播：{{ room.host }}</p>
      <router-link :to="room.link" class="room-enter mt-auto">
        <button class="bg-royalblue text-xs text-white px-4 py-2 rounded w-full hover:bg-royalblue/90 transition">进入房间</button>
      </router-link>
    </div>
  </div>
</template>

<script setup>
defineProps(['room'])
</script>