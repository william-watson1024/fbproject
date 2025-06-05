<template>
  <div class="min-h-screen bg-[#f6f7fb]">
    <AppHeader />
    <main class="main pt-20 pb-10">
      <div class="user container mx-auto max-w-6xl px-2">
        <div class="user-container flex flex-col md:flex-row gap-8 mt-8">
          <!-- 侧边栏 -->
          <aside
            class="user-sidebar w-full md:w-64 bg-white rounded-xl shadow p-6 flex flex-col items-center"
          >
            <div class="user-info flex flex-col items-center mb-8">
              <div class="user-avatar mb-2">
                <img
                  src="https://img.clerk.com/eyJ0eXBlIjoiZGVmYXVsdCIsImlpZCI6Imluc18yeERjR1R2MFRncWRQaHJiVU1MbU5LYTRMUDYiLCJyaWQiOiJ1c2VyXzJ4cUdQdzJac0tJOG1SV1l4UGU4QlhrUmhwdCJ9"
                  alt="avatar"
                  width="56"
                  height="56"
                  class="rounded-full"
                />
              </div>
              <div class="user-name text-lg font-bold">3076678380</div>
              <div class="user-balance text-sm text-gray-600 mt-1">
                余额：0.00
              </div>
            </div>
            <nav class="user-menu flex flex-col gap-2 w-full">
              <a
                href="/user/profile"
                class="menu-item hover:bg-[#f3f6fa] rounded px-3 py-2"
                >用户信息</a
              >
              <a
                href="/user/bet"
                class="menu-item hover:bg-[#f3f6fa] rounded px-3 py-2"
                >投注历史</a
              >
              <a
                href="/user/recharge"
                class="menu-item hover:bg-[#f3f6fa] rounded px-3 py-2"
                >存款</a
              >
              <a
                href="/user/withdraw"
                class="menu-item text-[#2563eb] font-semibold rounded px-3 py-2 bg-[#f3f6fa]"
                >提款</a
              >
            </nav>
          </aside>
          <!-- 主体内容 -->
          <section class="user-content flex-1">
            <div class="withdraw bg-white rounded-xl shadow p-8">
              <div class="page-header mb-6 flex items-center justify-between">
                <h2 class="text-xl font-bold">
                  提款
                </h2>
                <div class="balance-display flex items-center gap-2">
                  <span class="balance-label text-gray-500"
                    >剩余：</span
                  >
                  <span class="balance-value text-lg font-bold text-[#2563eb]"
                    >0</span
                  >
                </div>
              </div>
              <div class="withdraw-container flex flex-col gap-8">
                <div class="withdraw-form-container">
                  <div class="section-header mb-4">
                    <h3 class="text-lg font-semibold">
                      创建提款请求
                    </h3>
                  </div>
                  <div class="withdraw-form">
                    <div class="form-group mb-4">
                      <label class="block mb-2 font-medium"
                        >提款金额</label
                      >
                      <div class="amount-options flex gap-2 mb-2">
                        <button
                          class="active amount-option-btn px-4 py-1 rounded border border-blue-500 bg-blue-50 text-[#2563eb]"
                        >
                          50k
                        </button>
                        <button
                          class="amount-option-btn px-4 py-1 rounded border border-gray-300 bg-gray-50 hover:bg-blue-50"
                        >
                          100k
                        </button>
                        <button
                          class="amount-option-btn px-4 py-1 rounded border border-gray-300 bg-gray-50 hover:bg-blue-50"
                        >
                          200k
                        </button>
                        <button
                          class="amount-option-btn px-4 py-1 rounded border border-gray-300 bg-gray-50 hover:bg-blue-50"
                        >
                          500k
                        </button>
                        <button
                          class="amount-option-btn px-4 py-1 rounded border border-gray-300 bg-gray-50 hover:bg-blue-50"
                        >
                          1m
                        </button>
                      </div>
                      <input
                        type="text"

                        class="0"
                      />
                    </div>
                    <div class="form-group mb-4">
                      <label class="block mb-2 font-medium"
                        >账户信息</label
                      >
                      <div class="manual-input">
                        <div class="structured-form">
                          <div class="form-row flex gap-4 mb-2">
                            <div class="form-field flex-1">
                              <label class="block mb-1 text-sm"
                                >银行名称</label
                              >
                              <input
                                type="text"
                                class="form-input border rounded px-3 py-2 w-full"
                              />
                            </div>
                            <div class="form-field flex-1">
                              <label class="block mb-1 text-sm"
                                >银行卡号</label
                              >
                              <input
                                type="text"
                                class="form-input border rounded px-3 py-2 w-full"
                              />
                            </div>
                          </div>
                          <div class="form-row flex gap-4 mb-2">
                            <div class="form-field flex-1">
                              <label class="block mb-1 text-sm"
                                >帐户持有人姓名</label
                              >
                              <input
                                type="text"
                                class="form-input border rounded px-3 py-2 w-full"
                              />
                            </div>
                            <div class="form-field flex-1">
                              <label class="block mb-1 text-sm"
                                >支付二维码</label
                              >
                              <div class="qrcode-upload">
                                <div class="upload-container">
                                  <div class="upload-area">
                                    <div
                                      class="upload-placeholder flex flex-col items-center justify-center border-2 border-dashed border-gray-300 rounded-lg p-6 cursor-pointer hover:bg-gray-50"
                                    >
                                      <span class="upload-icon text-3xl mb-2"
                                        >📷</span
                                      >
                                      <span class="upload-text text-gray-500"
                                        >点击上传支付二维码图片</span
                                        >
                                    </div>
                                  </div>
                                  <input
                                    type="file"
                                    accept="image/*"
                                    style="display: none"
                                  />
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="manual-input-actions mt-2">
                          <button
                            type="button"
                            class="add-account-btn bg-gray-100 hover:bg-gray-200 px-4 py-2 rounded text-gray-700 font-medium"
                          >
                            保存帐户信息
                          </button>
                        </div>
                      </div>
                      <p class="tip text-sm text-gray-500 mt-2">
                        请填写您的账户信息，包括您的银行名称、卡号、账户持有人姓名等。
                      </p>
                    </div>
                    <div class="form-actions mt-6">
                      <button
                        class="submit-btn bg-[#2563eb] text-white px-6 py-2 rounded font-semibold hover:bg-[#1d4ed8]"
                      >
                      发送
                      </button>
                    </div>
                  </div>
                </div>
                <div class="withdraw-history-container">
                  <div class="section-header mb-4 flex items-center gap-4">
                    <h3 class="text-lg font-semibold">
                      提款记录
                    </h3>
                    <div class="history-stats flex gap-4">
                      <div class="history-stat-item flex flex-col items-center">
                        <span class="history-stat-value text-lg font-bold"
                          >0</span
                        >
                      </div>
                    </div>
                  </div>
                  <div class="withdraw-history">
                    <div
                      class="no-data flex flex-col items-center justify-center py-12"
                    >
                      <div class="no-data-icon text-4xl mb-2">💸</div>
                      <div class="no-data-text text-gray-500 text-base">
                        无数据
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
        </div>
      </div>
    </main>
  </div>
</template>

<script setup>
import AppHeader from "../components/AppHeader.vue";
</script>

<style scoped>
.header {
  box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.04);
  background: #fff;
}
.user-sidebar {
  min-width: 220px;
}
.user-avatar img {
  width: 56px;
  height: 56px;
  border-radius: 50%;
}
.menu-item {
  display: block;
  padding: 8px 0;
  font-size: 1rem;
  transition: background 0.2s;
}
.menu-item.active,
.menu-item.text-#2563eb {
  background: #f3f6fa;
  color: #2563eb;
}
.page-header {
  border-bottom: 1px solid #f0f0f0;
  padding-bottom: 1rem;
  margin-bottom: 1.5rem;
}
.section-header {
  margin-bottom: 1rem;
}
.amount-option-btn {
  min-width: 70px;
  cursor: pointer;
  transition: background 0.2s, color 0.2s;
}
.amount-option-btn.active,
.amount-option-btn.text-#2563eb {
  background: #e0edff;
  color: #2563eb;
  border-color: #2563eb;
}
.upload-placeholder {
  min-height: 100px;
}
.form-input {
  border: 1px solid #e5e7eb;
  background: #fff;
}
.submit-btn {
  min-width: 120px;
}
.history-stat-value {
  color: #2563eb;
}
.no-data-icon {
  font-size: 2.5rem;
}
.no-data-text {
  font-size: 1.1rem;
}
@media (max-width: 900px) {
  .user-container {
    flex-direction: column;
  }
  .user-sidebar {
    width: 100% !important;
    margin-bottom: 1.5rem;
  }
}
</style>
