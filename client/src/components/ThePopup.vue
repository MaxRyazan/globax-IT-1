<script setup lang="ts">
import {TUser} from "../../types";

defineProps<{
    user: TUser
}>()
defineEmits<{
    (e: 'close'): void
}>()

</script>

<template>
    <div class="popup">
        <div class="popup__item" style="justify-content: space-between">
            <h2>{{ user.name }}</h2>
            <svg @click="$emit('close')" class="popup__close-btn" width="20" height="20" viewBox="0 0 20 20" fill="none"
                 xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M0.585786 0.585786C1.36683 -0.195262 2.63317 -0.195262 3.41421 0.585786L10 7.17157L16.5858 0.585786C17.3668 -0.195262 18.6332 -0.195262 19.4142 0.585786C20.1953 1.36683 20.1953 2.63317 19.4142 3.41421L12.8284 10L19.4142 16.5858C20.1953 17.3668 20.1953 18.6332 19.4142 19.4142C18.6332 20.1953 17.3668 20.1953 16.5858 19.4142L10 12.8284L3.41421 19.4142C2.63317 20.1953 1.36683 20.1953 0.585786 19.4142C-0.195262 18.6332 -0.195262 17.3668 0.585786 16.5858L7.17157 10L0.585786 3.41421C-0.195262 2.63317 -0.195262 1.36683 0.585786 0.585786Z"
                      fill="black"/>
            </svg>
        </div>
        <div class="popup__userdata">
            <div class="popup__item">
                <span class="popup__item-title">Телефон:</span>
                <input class="popup__item-value" type="tel" readonly :value="user.phone">
            </div>
            <div class="popup__item">
                <span class="popup__item-title">Почта:</span>
                <input class="popup__item-value" type="email" readonly :value="user.email">
            </div>
            <div class="popup__item">
                <span class="popup__item-title">Дата приёма:</span>
                <span class="popup__item-value">{{ user.hire_date }}</span>
            </div>
            <div class="popup__item">
                <span class="popup__item-title">Должность:</span>
                <span class="popup__item-value">{{ user.position_name }}</span>
            </div>
            <div class="popup__item">
                <span class="popup__item-title">Подразделение:</span>
                <span class="popup__item-value">{{ user.department }}</span>
            </div>
        </div>
        <div class="popup__info">
            <span class="popup__item-title">Дополнительная информация:</span>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam consequuntur dolore, est fugiat illo laborum nobis non quae quaerat qui.</p>
        </div>
    </div>
</template>

<style lang="scss" scoped>
.popup {
  cursor: default;
  background-color: white;
  z-index: 99;
  position: fixed;
  width: 500px;
  min-height: 468px;
  top: 50vh;
  left: 50vw;
  transform: translate(-50%, -50%);
  padding: 24px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  justify-content: start;
  gap: 40px;
  border-radius: 16px;

  &__userdata {
    display: flex;
    flex-direction: column;
    gap: 20px;
  }

  &__item {
    display: flex;
    align-items: center;
    gap: 24px;

    & svg {
      cursor: pointer;

      &:hover {
        path {
          fill: red;
        }
      }
    }
  }

  &__item-title {
    min-width: 137px;
    width: 137px;
    font-size: 18px;
    line-height: 24px;
    color: $primary-color;
    font-weight: 400;
  }

  &__item-value {
    color: $secondary-color;
    font-size: 16px;
    line-height: 18px;
  }

  &__info p{
    margin-top: 10px;
    font-size: 16px;
    line-height: 24px;
    color: $secondary-color;
    font-weight: 400;
  }
}
</style>