<template>
  <div class="homepage__reviews__list__item homepage__card">
    <div class="list__item__header">
      <img src="/images/amazon_icon.png" alt="" />
      <div>
        <h4>{{job.title}}</h4>
        <p><b>{{ job.employment_type }}</b> - {{ job.location }} - <i>({{ job.salary_range.min }} -
            {{ job.salary_range.max }})€</i></p>
      </div>
    </div>
    <div class="list__item__content">
      <div class="list__item__content__tags">
        <span v-for="skill of job.skills" :key="skill">{{skill}}</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['job']
}
</script>

<style lang="scss" scoped>
@import '../assets/style/variables';

.homepage__reviews__list__item {
  .list__item__header {
    display: flex;
    flex-direction: row;
    align-items: center;
    img {
      width: 50px;
    }
  }

  .list__item__content {
        flex-wrap: wrap;
        margin-top: 0.5em;
      }
  .list__item__content__tags {
    display: flex;
    flex-direction: row;
    gap: 0.5em;
    span {
      background: #efbeb8;
      padding: 0.2em 0.5em;
      border-radius: 5px;
    }
  }
}
</style>
