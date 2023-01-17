<template>
  <div class="homepage__personnal-information__profile homepage__card">
    <img src="/images/brad.jpg" alt="brad omg" width="80" class="mb-2" />
    <h3 class="mb-2">John doe</h3>
    <h4 class="mb-3">Product Owner</h4>
    <button>Edit Profile</button>
  </div>
</template>

<style lang="scss" scoped>
.homepage__personnal-information__profile {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 10%;

  button {
    width: 100%;
  }

  img {
    border-radius: 50%;
    aspect-ratio: 1;
    object-fit: cover;
    object-position: center;
  }

  h4 {
    opacity: 0.7;
    font-style: italic;
  }
}
</style>
