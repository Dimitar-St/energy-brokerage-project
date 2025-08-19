import { defineStore } from 'pinia'

const authStore = defineStore('user', {
  state: () => {
    return {
      isAuthenticated: false,
    }
  },
  persist: {
    enabled: true,
    strategies: [
      {
        storage: localStorage,
        paths: ['isAuthenticated'],
      }
    ]
  }
})

export default authStore
