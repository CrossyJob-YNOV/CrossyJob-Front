<template>
  <div class="sidenav">
    <button @click="goToDashboard()">Dashboard</button>
    <button @click="goToAccount">Account</button>
    <button @click="goToSettings">Settings</button>
  </div>
</template>

<script>
  export default {
    methods: {
      goToDashboard() {
        // Code pour rediriger vers le dashboard
      },
      goToAccount() {
        // Code pour rediriger vers la page du compte
      },
      goToSettings() {
        // Code pour rediriger vers la page des paramètres
      }
    }
  };
</script>

<style>
  .sidenav {
    height: 100%; /* Pleine hauteur */
    width: 200px; /* Largeur de la barre latérale */
    position: fixed; /* Fixer la position */
    z-index: 1; /* Reste en avant-plan */
    left: 0;
    background-color: #111; /* Couleur de fond noir */
    overflow-x: hidden; /* Masquer les débordements horizontaux */
    padding-top: 100px; /* Placez du contenu sous la barre de navigation */
  }

  .sidenav button {
    display: block;
    width: 100%;
    padding: 16px;
    border: none;
    background-color: inherit;
    color: #f1f1f1;
    text-align: left;
    cursor: pointer;
    transition: 0.3s;
  }

  .sidenav button:hover {
    background-color: #ddd;
    color: black;
  }
</style>
