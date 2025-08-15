<script lang="ts" setup>
import { onMounted, ref } from 'vue'
import { notify } from '@kyvg/vue3-notification'
import axios from 'axios'
import { UrlBuilder } from '../url/builder.ts'

document.addEventListener('DOMContentLoaded', function () {
  const to = document.querySelectorAll('.datepicker-to')
  const from = document.querySelectorAll('.datepicker-from')
  M.Datepicker.init(to, {})
  M.Datepicker.init(from, {})
})

document.addEventListener('DOMContentLoaded', function () {
  const elems = document.querySelectorAll('.dropdown-trigger')
  M.Dropdown.init(elems, {})
})

type Order = {
  type: string
  amount: number
  price: string
}

const result = ref<Order[]>([])
const currentPage = ref(0)
const serviceUrl = new UrlBuilder('http://localhost:8080/orders')
serviceUrl.setParameter('limit', '10')

async function getOrders(url: string) {
  await axios
    .get(url, { withCredentials: true })
    .then((res) => {
      result.value = res.data
    })
    .catch((error) => {
      notify({
        title: 'error',
        text: error,
      })
      console.log(error)
    })
}

async function nextOrders() {
  console.log(currentPage.value)
  currentPage.value++
  serviceUrl.setParameter('page', currentPage.value.toString())
  await getOrders(serviceUrl.toString())
}

async function previousOrders() {
  if (currentPage.value > 0) {
    currentPage.value--
    serviceUrl.setParameter('page', currentPage.value.toString())
    await getOrders(serviceUrl.toString())
  }
}

async function requestOrders() {
  const to = getDateValue(document.querySelectorAll('.datepicker-to'))
  const from = getDateValue(document.querySelectorAll('.datepicker-from'))
  const dropdown = M.FormSelect.init(document.querySelectorAll('.order-type'), {})
  const type = dropdown[0].el.value

  serviceUrl.setParameter('from', from)
  serviceUrl.setParameter('to', to)
  if (type !== '') {
    serviceUrl.setParameter('type', type)
  }

  console.log(serviceUrl.toString())
  await getOrders(serviceUrl.toString())
}

function getDateValue(pickerElem) {
  if (pickerElem) {
    const instance = M.Datepicker.init(pickerElem, {
      format: 'yyyy-mm-dd',
      onSelect: (date: Date) => {
        console.log('Date selected:', date)
      },
    })

    const year = instance[0].options.defaultDate.getFullYear()
    let day = instance[0].options.defaultDate.getDate()
    if (day < 10) {
      day = '0' + day
    }
    const month = instance[0].options.defaultDate.getMonth() + 1
    let monthString: string
    if (month < 10) {
      monthString = '0' + month
    }

    const date = year + '-' + monthString + '-' + day
    return date || null
  }
  return null
}

onMounted(() => {
  getOrders(serviceUrl.toString())
})
</script>

<template>
  <div class="max-w-8xl mx-auto p-4">
    <h2 class="text-xl font-bold mb-4">Orders</h2>

    <div class="flex items-center gap-4 mb-4">
      <label class="flex items-center gap-2">
        <span>From</span>
        <input type="text" class="datepicker-from border rounded p-1" />
      </label>
      <label class="flex items-center gap-2">
        <span>To</span>
        <input type="text" class="datepicker-to border rounded p-1" />
      </label>

      <div class="flex items-center gap-2">
        TYPE
        <div class="w-40">
          <select ref="selectEl" class="browser-default order-type">
            <option value="">Empty</option>
            <option value="Buy">Buy</option>
            <option value="Sell">Sell</option>
          </select>
        </div>
      </div>

      <a class="waves-effect waves-light btn" @click="requestOrders()">Go</a>

      <a class="waves-effect waves-light btn modal-trigger" href="#modal1">Chart</a>

      <div id="modal1" class="modal">
        <div class="modal-content">
          <h4>Modal Header</h4>
          <p>A bunch of text</p>
        </div>
        <div class="modal-footer">
          <a href="#!" class="modal-close waves-effect waves-green btn-flat">Agree</a>
        </div>
      </div>

      <div class="flex justify-left mt-4 space-x-2 content-between gap-4">
        <button class="px-3 py-1 rounded" :class="'bg-blue-500 text-white'" @click="nextOrders()">
          Next
        </button>

        <button class="px-5 py-1 bg-gray-200 rounded hover:bg-gray-300" @click="previousOrders()">
          Back
        </button>
      </div>
    </div>

    <table class="reposive-table w-full border-collapse border border-gray-300">
      <thead>
        <tr class="bg-gray-100">
          <th class="border border-gray-300 p-2 text-left">Type</th>
          <th class="border border-gray-300 p-2 text-right">Amount</th>
          <th class="border border-gray-300 p-2 text-right">Price</th>
          <th class="border border-gray-300 p-2 text-right">Delivery Time</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(order, index) in result" :key="index">
          <td class="border border-gray-300 p-2">{{ order.type }}</td>
          <td class="border border-gray-300 p-2 text-right">{{ order.amount }}</td>
          <td class="border border-gray-300 p-2 text-right">{{ order.price.toFixed(2) }}</td>
          <td class="border border-gray-300 p-2 text-right">{{ order.deliveryTime }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<style scoped>
/* Optional: minimal styling if not using Tailwind */
</style>
