<template>
  <div class="account">
    <profile-header></profile-header>

    <div class="user-info">
      <h3>Informations utilisateurs</h3>

      <div class="semi-input">
        <input ref="firstname" type="text" placeholder="Firstname" v-model="firstname"/>
        <input ref="lastname" type="text" placeholder="Lastname" v-model="lastname"/>
      </div>
      <input ref="email" type="email" placeholder="Email" v-model="email"/>
      <input ref="password" type="password" placeholder="Password" v-model="password"/>
      <input
        ref="confirmPassword"
        type="password"
        placeholder="Confirm Password"
        v-model="confirmPassword"
      />

      <button @click="updateUser">Mettre à jour</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'account',
  layout(context) {
    return 'profile'
  },

  data() {
    return {
      firstname: this.$auth.user.firstname,
      lastname: this.$auth.user.lastname,
      email: this.$auth.user.email,
    }
  }
}
</script>

<style lang="scss">
.user-info {
  display: grid;
  gap: 1em;
  grid-template-columns: 1fr;
  width: 70%;

  .semi-input {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1em;
  }

  button {
    width: fit-content;
    background: #b7c4ef;
    &:hover {
      background: #8298e3;
    }
  }

  input {
    width: 100%;
    border: 0px;
    outline: 0;
    border-radius: 5px;
    box-sizing: border-box;

    &::placeholder {
      font-style: italic;
    }
  }
}
</style>
