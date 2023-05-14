<template>
  <div class="register">
    <div class="register__header">
      <div class="register__logo">
        <img src="/images/Logo-Crossy-Job.png" alt="logo"/>
      </div>
    </div>

    <div class="register__grid">
      <div class="register__grid__content">
        <h2>Créer un compte</h2>

        <form @submit.prevent="register()">
          <div class="semi-input">
            <input ref="firstname" type="text" placeholder="Firstname">
            <input ref="lastname" type="text" placeholder="Lastname">
          </div>
          <input ref="email" type="email" placeholder="Email">
          <input ref="password" type="password" placeholder="Password">
          <input ref="confirmPassword" type="password" placeholder="Confirm Password">

          <div v-if="errorMessage">
            {{ errorMessage }}
          </div>

          <button type="submit">
            S'inscrire !
          </button>

          <div v-if="errorResponse.length">
            {{ errorResponse.join(', ') }}
          </div>
        </form>
      </div>

      <div class="register__grid__illustration">
        <div ref="animationElement" class="animation">
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import lottie from 'lottie-web'

export default {
  name: "Login",
  auth: "guest",

  data() {
    return {
      errorMessage: "",
      errorResponse: []
    }
  },

  mounted() {
    lottie.loadAnimation({
      container: this.$refs.animationElement,
      renderer: 'svg',
      loop: true,
      autoplay: true,
      path: '/lottie/job-hunting.json'
    })
  },

  methods: {
    register: async function () {
      const firstName = this.$refs.firstname.value
      const lastName = this.$refs.lastname.value  
      const email = this.$refs.email.value  
      const password = this.$refs.password.value  
      const matchingPassword = this.$refs.confirmPassword.value  

      if(password !== matchingPassword) {
        this.errorMessage = "Password does not match"
        return
      }

      try {
       const res = await this.$axios.post("/api/auth/register", {
        firstname: firstName,
        lastname: lastName,
        email,
        password,
        matching_password: matchingPassword,
      })  

      console.log(res)

      await this.$auth.loginWith('local', {data: {username: email, password}})        
      this.$router.push('/tags-select')  
      
      } catch (error) {
        const res = error.response
        if(res.data.data.errors) {
          this.errorResponse = Object.values(res.data.data.errors).map((values) => values)
        }
      }

      
    },
  }
}


</script>


<style lang="scss" scoped>
.register {
  display: grid;
  grid-template-rows: auto 1fr;
  min-height: 100vh;

  .register__logo {
    position: absolute;
    top: 0;
    left: 0;
    margin: 1em;
    img {
      width: 100px;
    }
  }
  &__header {
    background: #D8D8D8;
  }

  &__grid {
    display: grid;
    grid-template-columns: 50% 50%;
    height: 100%;

    &__illustration {
      border-radius: 8% 0 0 8%;

      background: #c1a7e1;
      display: grid;
      place-content: center;
    }

    &__content {
      display: grid;
      place-content: center;
      padding: 10rem;

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

        button {
          background: #c1a7e1;
          &:hover {
            background: #ba9edc;
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
    }
.animation {
  width: 90%;
  height: 90%;

}

  }
}
</style>
