<template>
  <div class="homepage__personnal-information__profile homepage__card">
    <img src="/images/brad.jpg" alt="brad omg" width="80" class="mb-2" />
    <h3 class="mb-2">{{user.firstname}} {{ user.lastname }}</h3>
    <nuxt-link to="/dashboard"><button>Modifier le profil</button></nuxt-link>
  </div>
</template>

<style lang="scss" scoped>
.homepage__personnal-information__profile {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 10%;

  button {
    width: 100%;
  }

  img {
    border-radius: 50%;
    aspect-ratio: 1;
    object-fit: cover;
    object-position: center;
  }

  h4 {
    opacity: 0.7;
    font-style: italic;
  }
}
</style>

<script>
export default {
  name: 'Profile',

  data() {
    return {
      user: {}
    }
  },

  mounted() {
    this.user = this.$auth.$state.user
  }
}
</script>
