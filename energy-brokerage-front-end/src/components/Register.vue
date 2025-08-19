<script lang="ts" setup>
import { ref } from 'vue'
import axios from 'axios'
import { UrlBuilder } from '../url/builder.ts'
import { useRouter } from 'vue-router'

const username = ref('')
const password = ref('')

const serviceUrl = new UrlBuilder('http://localhost:8080/register')

const router = useRouter()

async function handleRegister() {
  const credentials = {
    username: username.value,
    password: password.value,
  }
  await axios
    .post(serviceUrl, credentials, {
      headers: {
        'Content-Type': 'application/json',
      },
      withCredentials: true,
    })
    .then(() => {
      notify({
        title: 'Registered successfully',
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
  <form @submit.prevent="handleRegister" class="max-w-sm mx-auto p-4 border rounded-lg shadow">
    <h2 class="text-xl font-bold mb-4">Register</h2>

    <div class="mb-3">
      <label for="username" class="block text-sm font-medium mb-1">Username</label>
      <input
        id="username"
        v-model="username"
        type="text"
        required
        class="w-full border rounded p-2"
      />
    </div>

    <div class="mb-4">
      <label for="password" class="block text-sm font-medium mb-1">Password</label>
      <input
        id="password"
        v-model="password"
        type="password"
        required
        class="w-full border rounded p-2"
      />
    </div>

    <button type="submit" class="w-full bg-blue-600 text-white rounded p-2 hover:bg-blue-700">
      Register
    </button>
  </form>
</template>

<style scoped>
/* Optional: minimal styling if not using Tailwind */
</style>
