<script setup lang="ts"></script>

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
          <router-link class="waves-effect waves-light btn-small" to="/register"
            >Register</router-link
          ><br />
        </li>
      </ul>
    </div>
  </nav>
  <router-view></router-view>
</template>

<style scoped></style>
