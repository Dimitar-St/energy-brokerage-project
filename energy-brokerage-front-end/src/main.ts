import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import 'materialize-css'
import 'materialize-css/dist/css/materialize.css'
import Notifications from '@kyvg/vue3-notification'
import { createPinia } from 'pinia'

const app = createApp(App)
const pinia = createPinia()

app.use(router)
app.use(pinia)
app.use(Notifications)

app.mount('#app')
