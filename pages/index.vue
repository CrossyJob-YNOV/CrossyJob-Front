<template>
  <div class="homepage">
    <div class="homepage__reviews">
      <div class="homepage__reviews__filter homepage__card">
        <div class="homepage__reviews__filter__item">
          <input id="matches" type="checkbox" name="homepage-filter" hidden />
          <label for="matches">Meilleurs résultat</label>
        </div>

        <div class="homepage__reviews__filter__item">
          <input id="recent" type="checkbox" name="homepage-filter" hidden />
          <label for="recent">Plus récent</label>
        </div>
      </div>

      <div class="homepage__reviews__list">
        <div v-for="job of jobs" :key="job._id" class="homepage__reviews__list__element">
          <div @click="setTargetJob(job)">
            <JobItem :job="job" />
          </div>
        </div>
      </div>
    </div>

    <div class="homepage__main">
      <div class="homepage__search homepage__card">
        <input
          type="text"
          placeholder="Recherche une compétence, un metier, une entreprise..."
        />
        <button><icon-search></icon-search></button>
      </div>
      <div class="homepage__current-job homepage__card" v-if="targetJob">
        <div class="homepage__current-job__info">
          <img src="/images/amazon_icon.png" alt="" width="50" />
          <h3>{{ targetJob.title }}</h3>
        </div>

        <div>
          <h4>Project Overview</h4>

          <p v-if="targetJob.employment_type">
            <b>Type d'emploi: </b>{{ targetJob.employment_type }}
          </p>

          <p v-if="targetJob.location">
            <b>Localisation: </b>{{ targetJob.location }}
          </p>

          <p v-if="targetJob.years_of_experience">
            <b>Expériences: </b>{{ targetJob.years_of_experience }} ans
          </p>

          <p v-if="targetJob.positions_count">
            <b>Poste à pourvoir: </b> {{ targetJob.positions_count }} emploi(s)
          </p>

          <p v-if="targetJob.salary_range">
            <b>Salaire: </b> {{ targetJob.salary_range.min }} -
            {{ targetJob.salary_range.max }} salaire annuels
          </p>
        </div>

        <div>
          <h4>Skills and overview</h4>
          <div class="tags">
            <div v-for="skill of targetJob.skills" :key="skill" class="skill">
              {{ skill }}
            </div>
          </div>
        </div>

        <div class="homepage__current-job__footer">
          <button @click="applyOffer">Postuler</button>

          <div class="footer--link">
            Propulsé par
            <a :href="getJobSite()?.url" target="_blank">{{
              getJobSite()?.title
            }}</a>
          </div>
        </div>
      </div>
    </div>

    <div class="homepage__personnal-information">
      <Profile />
    </div>
  </div>
</template>

<script>
export default {
  name: 'IndexPage',
  layout(context) {
    return 'home'
  },

  data() {
    return {
      targetJob: null,
    }
  },

  async asyncData({ $axios }) {
    const jobs = (await $axios.$get('/api/job-offers')).data
    const jobsSite = (await $axios.$get('/api/job-sites')).data
    
    return { jobs, jobsSite }
  },

  methods: {
    setTargetJob(job) {
      this.targetJob = job
    },

    getJobSite() {
      return this.jobsSite.find(
        (site) => site.id === this.targetJob.job_site_id
      )
    },

    async applyOffer() {
      try {
        await this.$axios.$put(`/api/job-offers/apply/${this.targetJob.id}`)
        if (this.targetJob.url) {
          window.open(this.targetJob.url, '_blank')
        }
      } catch (error) {}
    },
  },
}
</script>

<style lang="scss" scoped>
.homepage {
  display: grid;
  grid-template-columns: 3fr 5fr 2fr;
  column-gap: 2em;
  padding: 3em;

  &__card {
    background: white;
    padding: 1em;
    border-radius: 5px;
  }

  &__search {
    margin-bottom: 1em;
    padding: 0 1em;
    display: grid;
    grid-template-columns: 1fr auto;
    gap: 1em;
  }

  &__reviews {
    .homepage__reviews__list {
      display: grid;
      grid-template-columns: 1fr;
      row-gap: 1em;
      max-height: 75vh;
      overflow-y: scroll;
      scroll-behavior: smooth;
      scroll-snap-type: y proximity;

      &__element {
        scroll-snap-align: start;
      }
    }

    .homepage__reviews__filter {
      display: grid;
      grid-template-columns: 1fr 1fr;
      justify-items: center;
      align-items: center;
      margin-bottom: 1em;

      .homepage__reviews__filter__item {
        min-width: 100%;
        text-align: center;
        input[type='checkbox'] + label {
          color: black;
          font-size: 1.1em;
          padding: 0.5em 1em;
          min-width: 100%;
        }
        input[type='checkbox']:checked + label {
          background: black;
          color: white;
          border-radius: 5px;
          min-width: 100%;
        }
      }
    }
  }

  &__current-job {

    .tags {
      display: flex;
      flex-direction: row;
      gap: 1em;

      .skill {
        padding: .5em;
        border-radius: 50px;
        background-color: #b7c4ef;
      }
    }
    &__footer {
      margin-top: 1em;
      display: flex;
      flex-direction: row;
      justify-content: space-between;
      align-items: flex-end;

      .footer--link {
        font-size: 0.8em;
        font-style: italic;
        opacity: 0.8;

        a {
          color: inherit;
          text-decoration: none;
          font-weight: bold;
        }
      }
    }
  }

  &__main {
    h4 {
      font-weight: bolder;
      font-size: 1.1em;
      margin-bottom: 1em;
    }

    .homepage__current-job__info {
      display: grid;
      grid-template-columns: auto 1fr;
      gap: 2em;
      align-items: center;
      margin-bottom: 2em;

      img {
        max-width: 100px;
      }

      h3 {
        font-size: 1.2em;
      }
    }
  }
}
</style>
