<template>
  <div>
    <div class="nav">
      <Nav></Nav>
    </div>
    <div class="side-nav">
      <SideNav></SideNav>
    </div>
  </div>
</template>

<script>
import SideNav from "~/components/SideNav.vue";

export default {
  name: "profile",
  components: { SideNav }
};
</script>

<style scoped>

.nav {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  background-color: #fff; /* ajustez la couleur de fond à votre convenance */
  z-index: 1; /* la nav est en avant de tout */
}


.side-nav {
  position: relative;
  z-index: 0; /* la side-nav est en arrière-plan */
}

</style>
