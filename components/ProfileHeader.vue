<template>
  <div class="profile-content__header mb-5">
    <div class="profile-content__grid">
      <img src="/images/user-picto.png" alt="" />
      <div>
        <h2>{{user.firstname}} {{ user.lastname }}</h2>
      </div>
    </div>
    <button>Modifier le profil</button>
  </div>
</template>

<script >
export default {
  name: 'dashboard',
  layout(context) {
    return 'profile'
  },  
  data() {
    return {
      user: {}
    }
  },

  mounted() {
    this.user = this.$auth.user
  },  
}

</script>

<style lang="scss">
.profile-content {
  &__header {
    display: flex;
    justify-content: space-between;
    img {
      width: 80px;
    }

    button {
      background-color: #b7c4ef;
    }
  }
}
</style>
