<template>
  <div class="register">
    <div class="register__header">
      <div class="register__logo">
        <img src="/images/Logo-Crossy-Job.png" alt="logo" @click="redirect" />
      </div>
    </div>

    <div class="register__grid">
      <div class="register__grid__content">
        <h2>Register an account</h2>

        <form action="">
          <div class="semi-input">
            <input type="text" placeholder="Firstname" />
            <input type="text" placeholder="Lastname" />
          </div>
          <input type="email" placeholder="Email" />
          <input type="password" placeholder="Password" />
          <input type="password" placeholder="Confirm Password" />

          <button type="submit">Register now !</button>
        </form>
      </div>

      <div class="register__grid__illustration">
        <div ref="animationElement" class="animation"></div>
      </div>
    </div>
  </div>
</template>

<script>
import lottie from 'lottie-web'

export default {
  name: 'login',
  mounted() {
    lottie.loadAnimation({
      container: this.$refs.animationElement,
      renderer: 'svg',
      loop: true,
      autoplay: true,
      path: '/lottie/job-hunting.json',
    })
  },

  methods: {
    redirect: () => {
      window.location.href = '/'
    },
  },
}
</script>

<style lang="scss" scoped>
.register {
  display: grid;
  grid-template-rows: auto 1fr;
  min-height: 100vh;
  cursor: pointer;
  .register__logo {
    position: absolute;
    top: 0;
    left: 0;
    margin: 1em;
    img {
      width: 100px;
      @media screen and (max-width: 768px) {
        width: 150px;
      }
    }
  }
  &__header {
    background: #d8d8d8;
  }

  &__grid {
    @media screen and (min-width: 768px) {
      display: grid;
      grid-template-columns: 50% 50%;
      height: 100%;
    }

    &__illustration {
      @media screen and (max-width: 768px) {
        position: absolute;
        bottom: 0;
        border-radius: 8% 8% 0 0;
      }
      border-radius: 8% 0 0 8%;

      background: #c1a7e1;
      display: grid;
      place-content: center;

    }

    &__content {
      display: grid;
      place-content: center;
      padding: 10rem;
      @media screen and (max-width: 768px) {
        padding: 2rem;
        margin-top: 12%;
        font-size: 1.25rem;
      }

      h2 {
        text-align: center;
      }

      form {
        display: grid;
        gap: 1em;
        grid-template-columns: 1fr;
        width: 100%;

        .semi-input {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 1em;
        }

        input {
          width: 100%;
          border: 0;
          outline: 0;
          padding: 0.5em;
          border-radius: 5px;
          box-sizing: border-box;

          &::placeholder {
            font-style: italic;
          }
        }
      }
    }
    .animation {
      width: 90%;
      height: 90%;
    }
  }
}
</style>
