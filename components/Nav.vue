<template>
  <div class="nav">
    <nuxt-link to="/">
      <img src="/images/Logo-Crossy-Job.png" alt="" />
    </nuxt-link>
    
    <div></div>

    <div class="nav__profile">
      <button @click.prevent="disconnect()"><icon-power></icon-power></button>
    </div>
  </div>
</template>

<script>
export default {
  methods: {
    disconnect: async function () {
      await this.$auth.logout()
      this.$router.push('/login')
    },
  },
}
</script>

<style lang="scss" scoped>
.nav {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  background: white;
  padding: 1em 2em;

  .nav__content {
    display: flex;
    justify-content: center;
    align-items: center;
    column-gap: 1em;
  }

  img {
    width: 100px;
  }
  .nav__profile {
    align-self: center;
    justify-self: end;
  }
}
</style>
