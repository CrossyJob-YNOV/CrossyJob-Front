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
        <div>
          <img src="/images/amazon_icon.png" alt="" width="50" />
          <h4>Looking for figma designers</h4>
        </div>

        <div>
          <b>Project Overview</b>
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
          <strong>Skills and overview</strong>
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
  layout (context) {
    return "home"
  }
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
          font-size: 1.2em;
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
</style></style>
