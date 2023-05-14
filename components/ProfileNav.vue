<template>
  <div class="profile-nav">
    <ul>
      <li><nuxt-link to="/dashboard">Dashboard</nuxt-link></li>
      <li><nuxt-link to="/account">Account</nuxt-link></li>
    </ul>
  </div>
</template>

<style lang="scss">
.profile-nav {
  background-color: white;
  height: 100%;
  padding: 2em 0;

  ul {
    padding: 0;
    li {
      width: 100%;
      list-style: none;
      
      box-sizing: border-box;
      border-radius: 5px;

      a {
        font-weight: bolder;
        text-decoration: none;
        color: inherit;
        padding: 1em;
        display: block;
        width: 100%;
      }

      &:hover {
        background: #d8d8d8;
      }
    }
  }
}
</style>
