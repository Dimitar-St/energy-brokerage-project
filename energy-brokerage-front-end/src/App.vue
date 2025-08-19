<script setup lang="ts">
import { ref } from 'vue'
import axios from 'axios'
import { notify } from '@kyvg/vue3-notification'
import { useRouter } from 'vue-router'
import useUserStore from './store/store.ts'

const router = useRouter()
const auth = useUserStore()

async function handleLogout() {
  await axios
    .get('http://localhost:8080/logout', {
      withCredentials: true,
    })
    .then(() => {
      notify({
        title: 'Logged out successfully',
      })

      auth.$patch({
        isAuthenticated: false,
      })

      router.push('/login')
    })
    .catch((error) => {
      notify({
        title: error.response.data.error,
      })
    })
}
</script>

<template>
  <nav>
    <div class="nav-wrapper">
      <a href="#" class="brand-logo">Logo</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li>
          <router-link class="waves-effect waves-light btn-small" to="/orders">Orders</router-link
          ><br />
        </li>
        <li><router-link class="waves-effect waves-light btn-small" to="/">Home</router-link></li>
        <li>
          <router-link class="waves-effect waves-light btn-small" to="/login">Login</router-link>
        </li>
        <li>
          <a class="waves-effect waves-light btn-small" @click="handleLogout()" >Logout</a>
        </li>
        <li>
          <router-link class="waves-effect waves-light btn-small" to="/register"
            >Register</router-link
          ><br />
        </li>
      </ul>
    </div>
  </nav>
  <router-view></router-view>
  <notifications />
</template>

<style scoped></style>
