<template>
  <div class="homepage">
    <div class="homepage__reviews">
      <div class="homepage__reviews__filter homepage__card">
        <div class="homepage__reviews__filter__item">
          <input id="matches" type="radio" name="homepage-filter" value="best_result" v-model="offerFilters" hidden />
          <label for="matches">Meilleurs résultat</label>
        </div>

        <div class="homepage__reviews__filter__item">
          <input id="recent" type="radio" name="homepage-filter" value="most_recent" v-model="offerFilters" hidden />
          <label for="recent">Plus récent</label>
        </div>
      </div>

      <div v-if="loading">
        <icon-loader />
      </div>

      <div class="homepage__reviews__list" v-else>
        <div
          v-for="job of computeJobs"
          :key="job._id"
          class="homepage__reviews__list__element"
        >
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
          ref="searchText"
          @keypress.enter="searchJobs()"
          placeholder="Recherche une compétence, un metier, une entreprise..."
        />
        <button @click="searchJobs()"><icon-search></icon-search></button>
      </div>
      <div class="homepage__current-job homepage__card" v-if="targetJob">
        <div class="homepage__current-job__info">
          <img
            :src="targetJob.image ? targetJob.image : '/images/amazon_icon.png'"
            alt=""
            width="50"
          />
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
      loading: false,
      offerFilters: "best_result"
    }
  },

  async asyncData({ $axios }) {
    const jobs = (await $axios.$get('/api/job-offers')).data
    const jobsSite = (await $axios.$get('/api/job-sites')).data

    return { jobs, jobsSite }
  },

  computed: {
    computeJobs() { 
      
      if (this.offerFilters === "most_recent") {
        
        const newJobs = this.jobs
        newJobs.sort((a,b) => new Date(b.date) - new Date(a.date))
        console.log("computing", newJobs)
        return newJobs
      }
      return this.jobs
     }
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

    async searchJobs() {
      this.loading = true
      const res = await this.$axios.$post('/api/job-offers/search', {
        text: this.$refs.searchText.value,
      })

      this.jobs = res.data
      this.loading = false
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
    padding: 0;
    display: grid;
    grid-template-columns: 1fr auto;
    gap: 1em;

    button {
      background-color: #b7c4ef;
    }
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
        input[type='radio'] + label {
          color: black;
          font-size: 1.1em;
          padding: 0.5em 1em;
          min-width: 100%;
          transition: background .1s ease-in, color .1s ease-in;
        }
        input[type='radio']:checked + label {
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
        padding: 0.5em;
        border-radius: 50px;
        background-color: #efbeb8;
      }
    }
    &__footer {
      margin-top: 1em;
      display: flex;
      flex-direction: row;
      justify-content: space-between;
      align-items: flex-end;

      button {
        background: #b7c4ef;
      }

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
        width: 100px;
        aspect-ratio: 1;
        object-fit: contain;
        border-radius: 5px;
      }

      h3 {
        font-size: 1.2em;
      }
    }
  }
}
</style>
