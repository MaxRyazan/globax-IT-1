<script setup lang="ts">
import {onMounted, Ref, ref} from "vue";
import UserCard from './components/UserCard.vue'
import {TUser} from "../types";

const USERS_URL = 'http://localhost:3000'
const users: Ref<TUser[]> = ref([]);

onMounted(async () => {
    const result: Response = await fetch(USERS_URL);
    users.value = await result.json()
})
</script>

<template>
    <div class="wrapper">
        <user-card v-for="user in users" :key="user.email" :user/>
    </div>
</template>
<style scoped lang="scss">
.wrapper {
  max-width: 1121px;
  margin: 0 auto;
  display: flex;
  flex-wrap: wrap;
  gap: 24px;
  padding: 20px 0;
}
</style>