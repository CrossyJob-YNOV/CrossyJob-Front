<template>
  <div class="login">
    <div class="login__content">
      <div class="login__logo">
        <img src="/images/Logo-Crossy-Job.png" alt="logo" />
      </div>

      <div class="login__form">
        <h2>Se connecter</h2>
        <form @submit.prevent="login()">
          <div class="login__form__item">
            <input
              id="email"
              ref="email"
              type="email"
              name="email"
              placeholder="Email"
            />
          </div>

          <div class="login__form__item">
            <input
              id="password"
              ref="password"
              type="password"
              name="password"
              placeholder="Password"
            />
          </div>

          <div class="login__form__item">
            <button>Se connecter</button>
          </div>
          </div>
        </form>
      </div>
    </div>
    <div class="login__illustration">
      <div ref="animationElement" class="animation"></div>
    </div>
  </div>
</template>

<script>
import lottie from 'lottie-web'

export default {
  name: 'Login',
  
  mounted() {
    lottie.loadAnimation({
      container: this.$refs.animationElement,
      renderer: 'svg',
      loop: true,
      autoplay: true,
      path: '/lottie/coffee.json',
    })
  },

  methods: {
    login: async function () {
      const username = this.$refs.email.value
      const password = this.$refs.password.value

      await this.$auth.loginWith('local', {data: {username, password}})
      this.$router.push('/')
    },
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

h2 {
  text-align: center;
}

.login {
  display: grid;
  justify-content: center;
  align-items: center;
  grid-template-columns: 7fr 7fr;
}

.login__form {
  display: grid;
  place-content: center;
  height: 100%;
  grid-template-columns: 1fr;
  width: 70%;
  place-content: center;
  margin: auto;

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
      border: 0px;
      outline: 0;
      padding: 1em;
      border-radius: 5px;
      box-sizing: border-box;

      &::placeholder {
        font-style: italic;
      }
    }

    button {
      width: 100%;
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
