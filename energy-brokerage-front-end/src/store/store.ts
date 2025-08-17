import { defineStore } from 'pinia'

const authStore = defineStore('user', {
  state: () => {
    return {
      isAuthenticated: false,
    }
  },
})

export default authStore
