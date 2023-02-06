<template>
  <div class="nav">
    <h1>CrossyJob</h1>

    <div class="nav__content">
      <h3>Dernieres offres</h3>
      <h3>Classements</h3>
      <h3>Accueil</h3>
    </div>

    <div class="nav__profile">Profile</div>
  </div>
</template>

<style lang="scss" scoped>
.nav {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  background: white;
  padding: 0 2em;

  .nav__content {
    display: flex;
    justify-content: center;
    align-items: center;
    column-gap: 1em;
  }

  .nav__profile {
    align-self: center;
    justify-self: end;
  }
}
</style>
