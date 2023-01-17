<template>
  <div class="homepage__reviews__list__item homepage__card">
    <div class="list__item__header">
      <img src="/images/amazon_icon.png" alt="" />
      <div>
        <h4>Looking for figma designers</h4>
        <p>Une rapide description du poste et ce sur quoi il consiste</p>
      </div>
      <button>fav</button>
    </div>
    <div class="list__item__content">
      <div class="list__item__content__tags">
        <span>UI Designer</span>
        <span>figma</span>
        <span>Landing Page</span>
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped>
@import "../assets/style/variables";

.homepage__reviews__list__item {
  .list__item__header {
    display: flex;
    flex-direction: row;
    align-items: center;
    img {
      width: 50px;
    }
  }


    .list__item__content__tags {
      span {
        background: var(--bg-color);
        padding: .2em .5em;
        border-radius: 5px;
      }
    }
}
</style>
