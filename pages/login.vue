<template>
  <div class="login">
    <div class="login__content">
      <div class="login__logo">
        <img src="/images/Logo-Crossy-Job.png" alt="logo"/>
      </div>

      <div class="login__form">
        <h2>Sign in</h2>
        <form>
          <div class="login__form__item">
            <label for="email">Email</label>
            <input id="email" type="email" name="email"/>
          </div>

          <div class="login__form__item">
            <label for="password">Password</label>
            <input id="password" type="password" name="password"/>
          </div>

          <div class="login__form__item">
            <button>Sign in</button>
          </div>
        </form>
      </div>
    </div>
    <div class="login__illustration">
      <div class="animation" ref="animationElement">

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
  }
}


</script>

<style scoped lang="scss">

.login__logo {
  position: absolute;
  top: 0;
  left: 0;
  margin: 1em;

  img {
    width: 100px;
  }
}

.login {
  display: grid;
  justify-content: center;
  align-items: center;
  grid-template-columns: 7fr 7fr;

}

.login__form {
  display: flex;
  flex-direction: column;
  justify-content: center;

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
