<template>
  <div class="homepage">
    <div class="homepage__reviews">
      <div class="homepage__reviews__filter">
        <h3>Best Matches</h3>
        <h3>Featured</h3>
        <h3>Most Recent</h3>
      </div>

      <div class="homepage__reviews__list">
        <div class="homepage__reviews__list__item">

        </div>
      </div>
    </div>

    <div class="homepage__review">

    </div>

    <div class="homepage__personnal-information">

    </div>
  </div>
</template>

<script>
export default {
  name: 'IndexPage',
  layout (context) {
    return "home"
  }
}
</script>

<style lang="scss" scoped>
  .homepage {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    column-gap: 2em;
  }
</style>