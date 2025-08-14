import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import 'materialize-css'
import 'materialize-css/dist/css/materialize.css'

const app = createApp(App)

app.use(router)

app.mount('#app')
