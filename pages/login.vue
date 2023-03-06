<template>
  <div class="login">
    <div class="login__content">
      <div class="login__logo">
        <img src="/images/Logo-Crossy-Job.png" alt="logo" @click="redirect()"/>
      </div>

      <div class="login__form">
        <h2>Sign in</h2>
        <form>
          <div class="login__form__item">
            <input id="email" type="email" name="email" placeholder="Email"/>
          </div>

          <div class="login__form__item">
            <input id="password" type="password" name="password" placeholder="Password"/>
          </div>

          <div class="login__form__item">
            <button>Sign in</button>
          </div>
        </form>
      </div>
    </div>
    <div class="login__illustration">
      <div ref="animationElement" class="animation">

      </div>
    </div>
  </div>
</template>

<script>

import lottie from 'lottie-web'

export default {
  name: "login",
  mounted() {
    lottie.loadAnimation({
      container: this.$refs.animationElement,
      renderer: 'svg',
      loop: true,
      autoplay: true,
      path: '/lottie/coffee.json'
    })
  },

  methods: {
    redirect: () => {
      window.location.href = '/'
    }
  }


}


</script>

<style scoped lang="scss">

.login__logo {
  position: absolute;
  top: 0;
  left: 0;
  margin: 1em;
  cursor: pointer;
  img {
    width: 100px;
  }
}

h2 {
  text-align: center;
}

.login {
  display: grid;
  justify-content: center;
  align-items: center;
  grid-template-columns: 7fr 7fr;

}

.login__form{
  display: grid;
  place-content: center;
  height: 100%;
  width: 100%;

  form {
    display: grid;
    gap: 1em;
    grid-template-columns: 1fr;
    width: 100%;

    .semi-input {
      display: grid;
      grid-template-columns: 1fr;
      gap: 1em;
    }
    input {
      width: 100%;
      border: 0;
      outline: 0;
      padding: .5em;
      border-radius: 5px;
      box-sizing: border-box;

      &::placeholder {
        font-style: italic;
      }
    }
  }
}



.login__illustration {
  display: flex;
  flex-direction: column;
  justify-content: right;
  height: 100vh;
  width: 100%;
  border-radius: 8% 0 0 8%;

  background-size: cover;
  background-color: #b7c4ef;

  .animation {
    width: 80%;
    height: 80%;
    margin-left: auto;
    margin-right: auto;
  }



}
</style>
