<template>
  <transition name="layout" mode="out-in">
    <div class="layout-context">
      <Nav></Nav>

      <div class="profile">
        <profile-nav />
        <Nuxt />
      </div>
    </div>
  </transition>
</template>

<style lang="scss">

.layout-context {
  height: 100vh;
}
.profile {
  display: grid;
  grid-template-columns: 1fr 4fr;
  gap: 1em;
  height: 100%;
}
</style>
