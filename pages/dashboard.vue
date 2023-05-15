<template>
  <div class="profile-content">
    <profile-header></profile-header>

    <div class="job-apply">
      <h3 class="mb-3">Dernières offres postulées</h3>

      <div v-if="userJobs.length">
        <div class="job-items__grid">
          <div class="job-item__wrapper" v-for="job of userJobs" :key="job.id">
            <div @click.prevent="removeJob(job)">
              <icon-circle class="close" />
            </div>

            <JobItem :job="job.data" />
          </div>
        </div>
      </div>
      <div v-else>
        <p class="nothing-message">Aucune offre a afficher pour le moment...</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'dashboard',

  async asyncData({ $auth, $axios }) {
    const buffer = []
    for (const id of $auth.user.applied_offer_ids) {
      buffer.push($axios.$get(`/api/job-offers/${id}`))
    }

    const userJobs = await Promise.all(buffer)
    return { userJobs }
  },

  layout(context) {
    return 'profile'
  },

  data() {
    return {
      user: this.$auth.user,
    }
  },

  methods: {
    async removeJob(job) {
      try {
        await this.$axios.$put(`/api/job-offers/unapply/${job.data.id}`)
        this.userJobs.splice(this.userJobs.indexOf(job.data.id), 1)
      } catch (error) {
        console.error(error)
      }
    },
  },
}
</script>

<style lang="scss">
.close {
  position: absolute;
  top: 0;
  right: 0;
  transform: translate(50%, -50%);
  cursor: pointer;
}

.nothing-message {
  text-align: center;
}

.profile-content {
  padding: 2em 0;
  padding-right: 2em;

  .profile-content__grid {
    display: flex;
    gap: 1em;
    align-items: center;
  }
}

.job-apply {
  background: white;
  padding: 2em;
  border-radius: 5px;

  .job-items__grid {
    display: grid;
    gap: 1em;
    grid-template-columns: 1fr 1fr;
  }
}

.job-item__wrapper {
  position: relative;
  border: 1px solid black;
  border-radius: 5px;
  width: fit-content;
  padding: 2em;
}
</style>
