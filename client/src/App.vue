<script setup lang="ts">
import {onMounted, Ref, ref} from "vue";
import UserCard from './components/UserCard.vue'
import {TUser} from "../types";

const USERS_URL = 'http://localhost:3000'
const users: Ref<TUser[]> = ref([]);
const searchParam = ref('')

onMounted(async () => {
    const result: Response = await fetch(USERS_URL);
    users.value = await result.json()
})
</script>

<template>
    <div class="container">
        <input class="search" type="text" v-model="searchParam">
        <div class="wrapper">
            <user-card v-for="user in users" :key="user.email" :user/>
        </div>
    </div>
</template>
<style scoped lang="scss">
.container{
  max-width: 1121px;
  margin: 0 auto;
  padding: 40px 0;
}
.wrapper {
  max-width: 1121px;
  margin: 0 auto;
  display: flex;
  flex-wrap: wrap;
  gap: 24px;
  padding: 20px 0;
}
.search {
  width: 1121px;
  border: 1px solid rgba(212, 222, 254, 1);
  height: 48px;
  border-radius: 24px;
  font-size: 22px;
  padding: 0 20px 0 50px;
}
</style>