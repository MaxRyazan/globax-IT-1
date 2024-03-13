<script setup lang="ts">
import {onMounted, Ref, ref} from "vue";
import UserCard from './components/UserCard.vue'
import {TUser} from "../types";

const USERS_URL = 'http://localhost:3000'
const cachedUsers: Ref<TUser[]> = ref([]);
const filteredUser: Ref<TUser[]> = ref([])
const searchParam = ref('')


function filterUsers(){
    if(searchParam) {
        filteredUser.value = cachedUsers.value.filter(user => user.name.toLowerCase().includes(searchParam.value.toLowerCase().trim()))
    } else {
        return cachedUsers.value
    }
}


onMounted(async () => {
    const result: Response = await fetch(USERS_URL);
    cachedUsers.value = await result.json()
    filteredUser.value = cachedUsers.value
})
</script>

<template>
    <div class="container">
        <div class="search">
            <input @input="filterUsers"  autofocus class="search__input" type="text" v-model="searchParam">
            <svg class="search__icon" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M13.8033 13.8033C10.8744 16.7322 6.12563 16.7322 3.1967 13.8033C0.267767 10.8744 0.267767 6.12563 3.1967 3.1967C6.12563 0.267767 10.8744 0.267767 13.8033 3.1967C16.7322 6.12563 16.7322 10.8744 13.8033 13.8033ZM14.1457 14.8545C10.8078 17.8256 5.69007 17.7109 2.48959 14.5104C-0.829864 11.191 -0.829864 5.80905 2.48959 2.48959C5.80905 -0.829864 11.191 -0.829864 14.5104 2.48959C17.7115 5.69065 17.8256 10.8097 14.8529 14.1475L19.4605 18.7551C19.6558 18.9504 19.6558 19.267 19.4605 19.4622C19.2653 19.6575 18.9487 19.6575 18.7534 19.4622L14.1457 14.8545Z" fill="#432EAB"/>
            </svg>
        </div>
        <div class="wrapper" v-if="filteredUser.length">
            <user-card v-for="user in filteredUser" :key="user.email" :user/>
        </div>
        <div class="fallback" v-else>
            <p>Данные о пользователях отсутствуют или недоступны!</p>
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
  position: relative;
  display: flex;
  align-items: center;
  &__input {
    width: 100%;
    border: 1px solid rgba(212, 222, 254, 1);
    height: 48px;
    border-radius: 24px;
    font-size: 22px;
    padding: 0 20px 0 50px;
  }
  &__icon {
    position: absolute;
    right: 30px;
    cursor: pointer;
    &:hover {
        transform: scale(1.2);
      transition: .3s;
    }
  }
}
.fallback {
  color: $primary-color;
  font-size: 28px;
  width: 100%;
  text-align: center;
  margin-top: 20vh;
}
</style>