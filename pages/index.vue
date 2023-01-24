<template>
  <div class="homepage">
    <div class="homepage__reviews">
      <div class="homepage__reviews__filter homepage__card">
        <div class="homepage__reviews__filter__item">
          <input id="matches" type="checkbox" name="homepage-filter" hidden />
          <label for="matches">Best Matches</label>
        </div>

        <div class="homepage__reviews__filter__item">
          <input id="featured" type="checkbox" name="homepage-filter" hidden />
          <label for="featured">Featured</label>
        </div>

        <div class="homepage__reviews__filter__item">
          <input id="recent" type="checkbox" name="homepage-filter" hidden />
          <label for="recent">Most Recent</label>
        </div>
      </div>

      <div class="homepage__reviews__list">
        <JobItem />

        <JobItem />

        <JobItem />
      </div>
    </div>

    <div class="homepage__main">
      <div class="homepage__search homepage__card">
        <input
          type="text"
          placeholder="Recherche une compétence, un metier, une entreprise..."
        />
        <button>search</button>
      </div>
      <div class="homepage__current-job homepage__card">
        <div class="homepage__current-job__info">
          <img src="/images/amazon_icon.png" alt="" width="50" />
          <h3>Looking for figma designers</h3>
        </div>

        <div>
          <h4>Project Overview</h4>
          <p>
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Voluptas
            libero laborum cumque ullam vero eius est eligendi quis! Inventore
            nemo voluptate doloribus harum ratione perferendis non vero porro
            modi, deleniti impedit nisi praesentium consectetur repellendus
            eligendi nesciunt. Perspiciatis facere, quidem dolorum unde quo qui
            eos repellat? Dolore fugit numquam ex animi in sequi incidunt iusto
            alias architecto voluptatem? Blanditiis fugiat vel dolores.
            Laboriosam tenetur vitae at voluptates modi, veritatis repudiandae
            dolor maxime quod perferendis commodi quae. Quis vel doloribus quam,
            deserunt maiores beatae corrupti quia error impedit consequuntur
            quasi quidem quos magnam dicta tenetur. Necessitatibus deserunt
            placeat sit doloremque, error maiores. Quam eligendi voluptates in
            quae mollitia dolore perferendis, enim fugiat magnam quia placeat!
            Adipisci repudiandae perferendis minus, eos aliquid omnis ullam!
            Numquam officia saepe unde, nobis tenetur cumque, sit laborum qui
            ipsa obcaecati molestias. Eaque aliquid aut, ut reiciendis, rem unde
            quidem neque recusandae doloribus est doloremque eveniet ad?
          </p>
        </div>

        <div>
          <h4>Skills and overview</h4>
          <div class="tags">
            <div>UI Designer</div>

            <div>Figma</div>
          </div>
        </div>

        <div>
          <strong>Details</strong>
          <input type="text" value="https://google.com" disabled />
          <button>Postuler</button>
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
  }

  &__reviews {
    .homepage__reviews__list {
      display: grid;
      grid-template-columns: 1fr;
      row-gap: 1em;
    }

    .homepage__reviews__filter {
      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
      justify-items: center;
      align-items: center;
      margin-bottom: 1em;

      .homepage__reviews__filter__item {
        min-width: 100%;
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
