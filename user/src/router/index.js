import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import LiveRoom from '../views/LiveRoom.vue'
import UserProfile from '../views/UserProfile.vue'
import BetHistory from '../views/BetHistory.vue' 
import Recharge from '../views/Recharge.vue' 
import Withdraw from '../views/Withdraw.vue'


const routes = [
    { path: '/', component: Home },
    { path: '/room/:id', component: LiveRoom },
    { path: '/user/profile', component: UserProfile },
    { path: '/user/bet', component: BetHistory },
    { path: '/user/recharge', component: Recharge },
    { path: '/user/withdraw', component: Withdraw },
]

export default createRouter({
    history: createWebHistory(),
    routes,
    scrollBehavior() {
        return { top: 0 }
      }
})