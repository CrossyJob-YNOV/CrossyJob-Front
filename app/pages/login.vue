<template>
  <div class="login">
    <div class="login__content">
      <div class="login__logo">
        <img src="/images/logoRoonies.png" alt="logo"/>
      </div>

      <div class="login__form">
        <h2>Sign in</h2>
        <form>
          <div class="login__form__item">
            <label for="email">Email</label>
            <input type="email" name="email" id="email"/>
          </div>

          <div class="login__form__item">
            <label for="password">Password</label>
            <input type="password" name="password" id="password"/>
          </div>

          <div class="login__form__item">
            <button>Sign in</button>
          </div>
        </form>
      </div>
    </div>
    <div class="login__illustration">

      <img src="/images/logoRoonies.png" alt="logo">
    </div>
  </div>
</template>

<script>
export default {
  name: "login"
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
  grid-template-columns: 7fr 13fr;

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

  background-image: url("/images/abstract.jpg");
  background-size: cover;

  img {
    width: 100%;
    height: 100%;
    object-position: center;
  }

}
</style>
