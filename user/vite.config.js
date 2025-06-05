import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';

export default defineConfig({
  server: {
    proxy: {
      '/login': {
        target: 'http://localhost:8080', // 你的后端地址
        changeOrigin: true,
      },
      // 其他接口...
    }
  },
  plugins: [vue()],
});