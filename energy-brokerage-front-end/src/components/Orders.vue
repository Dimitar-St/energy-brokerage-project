<script lang="ts" setup>
import { onMounted, ref } from 'vue'
import { notify } from '@kyvg/vue3-notification'
import axios from 'axios'
import { UrlBuilder } from '../url/builder.ts'
import  useUserStore  from '../store/store.ts'

function initializeMaterialComponents() {
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

document.addEventListener('DOMContentLoaded', function () {
  const elems = document.querySelectorAll('.modal-chart')
  M.Modal.init(elems)
})

document.addEventListener('DOMContentLoaded', function () {
  const elems = document.querySelectorAll('.modal-order')
  M.Modal.init(elems)
})

document.addEventListener('DOMContentLoaded', function () {
  const elems = document.querySelectorAll('.modal-row')
  M.Modal.init(elems)
})

}
type Order = {
  type: string
  amount: number
  price: string
}

const result = ref<Order[]>([])
const currentPage = ref(0)
const serviceUrl = new UrlBuilder('http://localhost:8080/orders')
serviceUrl.setParameter('limit', '10')

const currentAmount = ref('')
const currentPrice = ref('')

async function getOrders(url: string) {
  await axios
    .get(url, { withCredentials: true })
    .then((res) => {
      result.value = res.data
      if (res.headers['x-user'] === undefined || res.headers['x-user'] === "") {
        disableContent()
      }
    })
    .catch((error) => {
      notify({
        title: 'error',
        text: error,
      })
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

function generateChart() {
  requestOrders()
  const xValues = []
  const yValues = []

  result.value.forEach((element) => {
    let i = 0
    console.log(element.price)
    yValues.push(element.price)
    xValues.push(i)
    i++
  })

  new Chart('chart', {
    type: 'line',
    data: {
      labels: xValues,
      datasets: [
        {
          backgroundColor: 'rgba(0,0,255,1.0)',
          borderColor: 'rgba(0,0,255,0.1)',
          data: yValues,
        },
      ],
    },
  })
}

function clickRow(row) {
  currentPrice.value = row.price
  currentAmount.value = row.amount

  const elems = document.querySelectorAll('.modal-row')
  const modalRow = M.Modal.init(elems)[0]
  modalRow.open()
}

function disableContent() {
  const newOrderBtn = document.getElementById('modal-order-trigger');
  const auth  = useUserStore()
  if (newOrderBtn != null && !auth.isAuthenticated) {
    newOrderBtn.classList.add('disabled');
  }
}

onMounted(() => {
  initializeMaterialComponents()
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

      <a class="waves-effect waves-light btn modal-trigger" href="#modal1" @click="generateChart()">Chart</a>
      <div id="modal1" class="modal modal-chart">
        <div class="modal-content">
          <h4>Modal Header</h4>
          <canvas id="chart"></canvas>
        </div>
        <div class="modal-footer">
          <a href="#!" class="modal-close waves-effect waves-green btn-flat">Close</a>
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

    <a class="max-w-8xl mx-auto p-4 waves-effect waves-light btn modal-trigger" id="modal-order-trigger" href="#modal-order">New Order</a>
    <div id="modal-order" class="modal modal-order">
      <div class="modal-content">
        <h4>Create Order</h4>
        <div class="mb-3">
          <label for="username" class="block text-sm font-medium mb-1">Price</label>
          <input id="price" type="text" required class="w-full border rounded p-2" />
        </div>

        <div class="mb-4">
          <label class="block text-sm font-medium mb-1">Amount</label>
          <input id="amount" type="text" required class="w-full border rounded p-2" />
        </div>

        <div class="mb-5">
          <label for="username" class="block text-sm font-medium mb-1">Type</label>
          <div class="w-40">
            <select ref="selectEl" class="browser-default order-type">
              <option value="Buy">Buy</option>
              <option value="Sell">Sell</option>
            </select>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <a href="#!" class="modal-close waves-effect waves-green btn-flat">Close</a>
        <button class="btn waves-effect waves-light" type="submit" name="action">Submit
          <i class="material-icons right">send</i>
        </button>
      </div>
    </div>

    <table class="reposive-table w-full border-collapse border border-gray-300 highlight">
      <thead>
        <tr class="bg-gray-100">
          <th class="border border-gray-300 p-2 text-left">Type</th>
          <th class="border border-gray-300 p-2 text-right">Amount</th>
          <th class="border border-gray-300 p-2 text-right">Price</th>
          <th class="border border-gray-300 p-2 text-right">Delivery Time</th>
        </tr>
      </thead>
      <tbody>
        <tr id="modal-row-trigger" href="#modal-row" v-for="(order, index) in result" :key="index" @click="clickRow(order)">
          <td class="border border-gray-300 p-2">{{ order.type }}</td>
          <td class="border border-gray-300 p-2 text-right">{{ order.amount }}</td>
          <td class="border border-gray-300 p-2 text-right">{{ order.price.toFixed(2) }}</td>
          <td class="border border-gray-300 p-2 text-right">{{ order.deliveryTime }}</td>
        </tr>
    <div id="modal-row" class="modal modal-row">
      <div class="modal-content">
        <h4>Order</h4>
        <div class="mb-3">
          <label for="username" class="block text-sm font-medium mb-1">Price</label>
          <input id="price" type="text" required class="w-full border rounded p-2"
          :value="currentPrice" />
        </div>

        <div class="mb-4">
          <label class="block text-sm font-medium mb-1">Amount</label>
          <input id="amount" type="text" required class="w-full border rounded p-2"
          :value="currentAmount"/>
        </div>

        <div class="mb-5">
          <label for="username" class="block text-sm font-medium mb-1">Type</label>
          <div class="w-40">
            <select ref="selectEl" class="browser-default order-type">
              <option value="Buy">Buy</option>
              <option value="Sell">Sell</option>
            </select>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <a href="#!" class="modal-close waves-effect waves-green btn-flat">Close</a>
        <button class="btn waves-effect waves-light" type="submit" name="action">Submit
          <i class="material-icons right">send</i>
        </button>
      </div>
    </div>
      </tbody>
    </table>
  </div>
</template>

<style scoped>
/* Optional: minimal styling if not using Tailwind */
</style>
