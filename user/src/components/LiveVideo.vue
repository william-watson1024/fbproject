<template>
    <div class="p-4">
      <img :src="src || '/sample.jpg'" alt="Live" class="rounded w-full h-60 object-cover" />
    </div>
  </template>
  
  <script setup>
  defineProps({
    src: String
  })
  </script>