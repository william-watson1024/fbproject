<template>
    <div class="p-4">
      <ul class="space-y-1 text-sm text-white">
        <li v-for="(r, idx) in results" :key="idx">
          {{ r.time }} - {{ r.code }} - {{ r.result }}
        </li>
      </ul>
    </div>
  </template>
  
  <script setup>
  defineProps({
    results: {
      type: Array,
      required: true
    }
  })
  </script>