<template>
  <div class="p-4">
    <ul class="space-y-1 text-sm">
      <li v-for="(r, idx) in results" :key="idx">
        <button
          style="color:red;background:ghostwhite;font-weight:bold;"
          class="px-2 py-1 rounded transition"
          @click="showImage(r)"
        >
          {{ r.gameSerialNumber }} - {{ r.startTime ? r.startTime.replace(/[-: ]/g, '') : '' }} - {{ r.result }}
        </button>
      </li>
    </ul>
    <div v-if="showModal" class="fixed inset-0 bg-black bg-opacity-60 flex items-center justify-center z-50">
      <div class="bg-white rounded-lg p-4 relative max-w-lg w-full">
        <button class="absolute top-2 right-2 text-black" @click="showModal = false">✕</button>
        <img :src="imageUrl" alt="Kết quả" class="w-full rounded" />
        <div class="mt-2 text-center text-black">{{ selectedResult?.gameSerialNumber }} - {{ selectedResult?.result }}</div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, watchEffect } from "vue";
const props = defineProps({
  results: {
    type: Array,
    required: true
  }
});

const showModal = ref(false);
const imageUrl = ref("");
const selectedResult = ref(null);

function showImage(result) {
  selectedResult.value = result;
  imageUrl.value = result.resultImage || `/assets/covers/${result.gameSerialNumber}.jpg`;
  showModal.value = true;
}

// 调试：监听 results 变化
watchEffect(() => {
  console.log("[ResultList] props.results:", props.results);
});
</script>