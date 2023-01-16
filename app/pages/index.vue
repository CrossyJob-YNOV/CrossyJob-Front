<template>
  <div class="homepage">
    <div class="homepage__reviews">
      <div class="homepage__reviews__filter homepage__card">
        <div class="homepage__reviews__filter__item">
          <input type="checkbox" name="homepage-filter" id="matches" hidden />
          <label for="matches">Best Matches</label>
        </div>

        <div class="homepage__reviews__filter__item">
          <input type="checkbox" name="homepage-filter" id="featured" hidden />
          <label for="featured">Featured</label>
        </div>

        <div class="homepage__reviews__filter__item">
          <input type="checkbox" name="homepage-filter" id="recent" hidden />
          <label for="recent">Most Recent</label>
        </div>
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