<script lang="ts" setup>
import { onMounted, onBeforeUnmount, ref, watch } from 'vue'
import { notify } from '@kyvg/vue3-notification'
import axios from 'axios'
import { UrlBuilder } from '../url/builder.ts'
import useUserStore from '../store/store.ts'
import { useRouter } from 'vue-router'

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
const currentRowID = ref('')

const router = useRouter()
const auth = useUserStore()

const toDatePicker = ref({})
const fromDatePicker = ref({})
const typeDropdown = ref({})
const modalChart = ref({})
const modalOrder = ref({})
const modalRow = ref({})
const deliveryTimeDatePicker = ref({})
const updateDeliveryTimePicker = ref({})

function initializeMaterialComponents() {
  toDatePicker.value = M.Datepicker.init(
    document.querySelectorAll(".datepicker-to"),
    {}
  )
  fromDatePicker.value = M.Datepicker.init(
    document.querySelectorAll(".datepicker-from"),
    {}
  )

  typeDropdown.value = M.Dropdown.init(
    document.querySelectorAll(".dropdown-trigger"),
    {}
  )

  modalChart.value = M.Modal.init(document.querySelectorAll(".modal-chart"))
  modalOrder.value = M.Modal.init(document.querySelectorAll(".modal-order"))
  modalRow.value = M.Modal.init(document.querySelectorAll(".modal-row"))

  deliveryTimeDatePicker.value = M.Datepicker.init(
    document.querySelectorAll(".datepicker-deliveryTime")
  )
  updateDeliveryTimePicker.value = M.Datepicker.init(
    document.querySelectorAll(".update-deliveryTime")
  )
}

const currentUser = ref('')

async function getOrders(url: string) {
  if (!auth.isAuthenticated) {
    return
  }
  await axios
    .get(url, { withCredentials: true })
    .then((res) => {
      result.value = res.data
      currentUser.value = res.headers['x-user']
      disableContent()
    })
    .catch((error) => {
      notify({
        title: 'could not request orders',
        text: error.response.data.error,
      })
      if (error.response.data.error.includes('expired')) {
        router.push('/login')
      }
    })
}

async function createOrder() {
  const dropdown = M.FormSelect.init(document.querySelectorAll('.order-type'), {})

  const price = document.getElementById('price').value
  const amount = document.getElementById('amount').value
  const deliveryTime = getDateValue(document.querySelectorAll('.datepicker-deliveryTime'))
  const type = dropdown[0].el.value.toLowerCase()

  const order = {
    price: parseFloat(price),
    amount: parseFloat(amount),
    type: type,
    deliveryTime: deliveryTime,
  }

  await axios
    .post(serviceUrl, order, { withCredentials: true })
    .then((res) => {
      if (res.data.succes !== '') {
        notify({
          title: res.data.success,
        })
      }
      if (res.headers['x-user'] === undefined || res.headers['x-user'] === '') {
        disablecontent()
      }
    })
    .catch((error) => {
      notify({
        title: 'could not create request order',
        text: error.response.data.error,
      })
      if (error.response.data.error.includes('expired')) {
        router.push('/login')
      }
    })
}
async function nextOrders() {
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

  if (to !== null || from !== null) {
    serviceUrl.setParameter('from', from)
    serviceUrl.setParameter('to', to)
  }
  if (type !== '') {
    serviceUrl.setParameter('type', type)
  }

  await getOrders(serviceUrl.toString())
}

function getDateValue(pickerElem) {
  if (pickerElem) {
    const instance = M.Datepicker.init(pickerElem, {
      format: 'yyyy/mm/dd',
      onSelect: (date: Date) => {
        console.log('Date selected:', date)
      },
    })

    const selectedDate = instance[0].options.defaultDate
    if (isValidDate(selectedDate)) {
      return null
    }

    const year = selectedDate.getFullYear()

    let day = selectedDate.getDate()
    if (day < 10) {
      day = '0' + day
    }

    const month = selectedDate.getMonth() + 1
    let monthString: string
    if (month < 10) {
      monthString = '0' + month
    } else {
      monthString = month
    }

    const date = year + '-' + monthString + '-' + day
    return date || null
  }
  return null
}

function isValidDate(date: Date) {
  if (date instanceof Date) {
    const text = Date.prototype.toString.call(date)
    return text.includes('Invalid Date')
  }
  return false
}

function toSimpleDate(dateStr: string): SimpleDate {
  const d = new Date(dateStr)
  return {
    year: d.getFullYear(),
    month: d.getMonth() + 1,
    day: d.getDate(),
    toString: function () {
      return this.year + '/' + this.month + '/' + this.day
    },
  }
}

function generateChart() {
  const xValues = []
  const yValues = []

  result.value.forEach((element) => {
    yValues.push(element.price)
    const date = toSimpleDate(element.deliveryTime)
    xValues.push(date.year + '/' + date.month + '/' + date.day)
  })

  new Chart('chart', {
    type: 'line',
    data: {
      labels: xValues,
      datasets: [
        {
          label: 'Price over Time',
          backgroundColor: 'rgba(0,0,255,1.0)',
          borderColor: 'rgba(0,0,255,0.1)',
          data: yValues,
        },
      ],
    },
    options: {
      responsive: true,
      plugins: {
        legend: {
          display: true,
          position: 'top',
          labels: {
            color: 'black',
            font: {
              size: 14,
            },
          },
        },
        title: {
          display: true,
          text: 'Price History',
        },
      },
    },
  })
}

function clickRow(row) {
  if (currentUser.value !== row.user) {
    notify({
      title: "could not edit order",
      text: "you are not owner"
    })
    return
  }
  currentPrice.value = row.price
  currentAmount.value = row.amount

  currentRowID.value = row.ID

  const elems = document.querySelectorAll('.modal-row')
  const modalRow = M.Modal.init(elems)[0]
  modalRow.open()

  const dateElemt = document.querySelectorAll('.update-deliveryTime')
  const datePickerRow = M.Datepicker.init(dateElemt)[0]
  datePickerRow.setDate(new Date(toSimpleDate(row.deliveryTime).toString()))
  datePickerRow.gotoDate(new Date(toSimpleDate(row.deliveryTime).toString()))
}

async function updateRow() {
  const dropdown = M.FormSelect.init(document.querySelectorAll('.update-type'), {})

  const price = document.getElementById('update-price').value
  const amount = document.getElementById('update-amount').value
  const deliveryTime = getDateValue(document.querySelectorAll('.update-deliveryTime'))
  const type = dropdown[0].el.value

  const order = {
    price: parseFloat(price),
    amount: parseFloat(amount),
    type: type,
    deliveryTime: deliveryTime,
  }

  await axios
    .put(serviceUrl, order, { withCredentials: true })
    .then((res) => {
      if (res.data.succes !== '') {
        notify({
          title: res.data.success,
        })
      }


      if (res.headers['x-user'] === undefined || res.headers['x-user'] === '') {
        disableContent()
      }
    })
    .catch((error) => {
      notify({
        title: 'could not update order',
        text: error.response.data.error,
      })
      if (error.response.data.error.includes('expired')) {
        router.push('/login')
      }
    })
}

async function deleteRow(id) {
  await axios.delete("http://localhost:8080/orders/"+id, {
  withCredentials: true
  })
    .then((res) => {
      if (res.data.succes !== '') {
        notify({
          title: res.data.success,
        })
      }
      if (res.headers['x-user'] === undefined || res.headers['x-user'] === '') {
        disableContent()
      }
    })
    .catch((error) => {
      notify({
        title: 'could not update order',
        text: error.response.data.error,
      })
      if (error.response.data.error.includes('expired')) {
        router.push('/login')
      }
    })
}


function disableContent() {
  const elementsToDisable = [
    'modal-order-trigger',
    'chartBtn',
    'nextBtn',
    'backBtn',
    'goBtn',
    'downloadCsvBtn'
  ]


  elementsToDisable.forEach((el) => {
    const elementToDisable = document.getElementById(el)
    if (elementToDisable != null && !auth.isAuthenticated) {
      elementToDisable.classList.add('disabled')
    }
  })
}

function removeDisableContent() {
  const elementsToDisable = [
    'modal-order-trigger',
    'chartBtn',
    'nextBtn',
    'backBtn',
    'goBtn',
    'downloadCsvBtn'
  ]


  elementsToDisable.forEach((el) => {
    const elementToDisable = document.getElementById(el)
    if (elementToDisable != null) {
      elementToDisable.classList.remove('disabled')
    }
  })

}
async function downloadCSV() {
  const response = await axios.get("http://localhost:8080/orders/export?page=0&limit=1000", {
    withCredentials: true,
    responseType: 'blob'
  })

  const blob = response.data
  const url = window.URL.createObjectURL(blob)

  const link = document.createElement("a")
  link.href = url
  link.setAttribute("download", "orders.csv")
  document.body.appendChild(link)
  link.click()

  link.remove()
  window.URL.revokeObjectURL(url)
}

onMounted(() => {
 disableContent()
 initializeMaterialComponents()
 getOrders(serviceUrl.toString())
})

onBeforeUnmount(() => {
  removeDisableContent()
  const allInits = [
    toDatePicker,
    fromDatePicker,
    typeDropdown,
    modalChart,
    modalOrder,
    modalRow,
    deliveryTimeDatePicker,
    updateDeliveryTimePicker,
  ]
  allInits.forEach((el) => {
    if (el.value && el.value.forEach) {
      el.value.forEach((instance) => instance.destroy())
    }
  })
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
            <option value="Buy">Buy</option>
            <option value="Sell">Sell</option>
          </select>
        </div>
      </div>

      <a class="waves-effect waves-light btn" id="goBtn" @click="requestOrders()">Go</a>

      <a class="waves-effect waves-light btn modal-trigger" id="chartBtn" href="#modal1" @click="generateChart()">Chart</a>
      <div id="modal1" class="modal modal-chart">
        <div class="modal-content">
          <h4>Chart</h4>
          <canvas id="chart"></canvas>
        </div>
        <div class="modal-footer">
          <a href="#!" class="modal-close waves-effect waves-green btn-flat">Close</a>
        </div>
      </div>

      <div class="flex justify-left mt-4 space-x-2 content-between gap-4">
        <a class="px-3 py-1 rounded btn" :class="'bg-blue-500 text-white'" id="nextBtn" @click="nextOrders()">
          Next
        </a>

        <a class="px-5 py-1 bg-gray-200 rounded hover:bg-gray-300 btn" id="backBtn" @click="previousOrders()">
          Back
        </a>
      </div>
      <div class="flex gap-2 ml-auto">
          <a
            class="waves-effect waves-light btn modal-trigger"
            id="modal-order-trigger"
            href="#modal-order"
          >
            New Order
          </a>
          <a class="waves-effect waves-light btn" id="downloadCsvBtn" @click="downloadCSV()">
            <i class="material-icons left">cloud_download</i>
            Download CSV
          </a>
        </div>
    </div>

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
            <select ref="selectEl" class="browser-default order-type new-order-type">
              <option value="Buy">Buy</option>
              <option value="Sell">Sell</option>
            </select>
          </div>
        </div>
        <label class="flex items-center gap-2">
          <span>Delivery Time</span>
          <input type="text" class="datepicker-deliveryTime border rounded p-1" />
        </label>
      </div>
      <div class="modal-footer">
        <a href="#!" class="modal-close waves-effect waves-green btn-flat">Close</a>
        <button
          class="btn waves-effect waves-light"
          type="submit"
          name="action"
          @click="createOrder()"
        >
          Submit
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
          <th class="border border-gray-300 p-2 text-right">Status</th>
          <th class="border border-gray-300 p-2 text-right">Owned</th>
        </tr>
      </thead>
      <tbody>
        <tr
          id="modal-row-trigger"
          href="#modal-row"
          v-for="(order, index) in result"
          :key="index"
          @click="clickRow(order)"
        >
          <td class="border border-gray-300 p-2">{{ order.type }}</td>
          <td class="border border-gray-300 p-2 text-right">{{ order.amount }}</td>
          <td class="border border-gray-300 p-2 text-right">{{ order.price.toFixed(2) }}</td>
          <td class="border border-gray-300 p-2 text-right">
            {{ toSimpleDate(order.deliveryTime).toString() }}
          </td>
          <td class="border border-gray-300 p-2 text-right">
            <span
              data-badge-caption=""
              class="new badge green"
              v-if="order.status === 'Executed'"
              >{{ order.status }}</span
            >
            <span
              data-badge-caption=""
              class="new badge blue"
              v-else-if="order.status === 'Active'"
              >{{ order.status }}</span
            >
            <span data-badge-caption="" class="new badge red" v-else>{{ order.status }}</span>
          </td>
          <td class="border border-gray-300 p-2 text-right">
            <span
              data-badge-caption=""
              class="new badge green"
              v-if="order.user === currentUser"
              >{{ order.user }}</span
            >
            <span
              data-badge-caption=""
              class="new badge blue"
              v-else-if="order.user !==  currentUser"
              >Not owned</span
            >
          </td>
        </tr>
        <div id="modal-row" class="modal modal-row">
          <div class="modal-content">
            <h4>Order</h4>
            <div class="mb-3">
              <label for="username" class="block text-sm font-medium mb-1">Price</label>
              <input
                id="update-price"
                type="text"
                required
                class="w-full border rounded p-2"
                :value="currentPrice"
              />
            </div>

            <div class="mb-4">
              <label class="block text-sm font-medium mb-1">Amount</label>
              <input
                id="update-amount"
                type="text"
                required
                class="w-full border rounded p-2"
                :value="currentAmount"
              />
            </div>

            <div class="mb-5">
              <label for="username" class="block text-sm font-medium mb-1">Type</label>
              <div class="w-40">
                <select ref="selectEl" class="browser-default order-type update-type">
                  <option value="Buy">Buy</option>
                  <option value="Sell">Sell</option>
                </select>
              </div>
            </div>
            <label class="flex items-center gap-2">
              <span>Delivery Time</span>
              <input type="text" class="update-deliveryTime border rounded p-1" />
            </label>
          </div>

          <div class="modal-footer flex items-end justify-left mt-4 space-x-2 content-between gap-4">
            <a href="#!" class="modal-close waves-effect py-8 waves-green btn-flat">Close</a>
            <a href="#!" class="btn waves-effect waves-green py-8 btn-flat red" @click="deleteRow(currentRowID)">Delete</a>
            <button
              class="btn waves-effect waves-light py-8"
              type="submit"
              name="action"
              @click="updateRow()"
            >
              Submit
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
