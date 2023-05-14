<template>
  <div class="tag-select">
    <div class="tag-select__header">
      <div class="tag-select__logo">
        <img src="/images/Logo-Crossy-Job.png" alt="logo" />
      </div>
    </div>

    <div class="tag-select__grid">
      <div class="tag-select__grid__content">
        <h2>
          Dites nous ce que <br />
          vous cherchez !
        </h2>

        <form>
          <div class="input--wrapper">
            <input
              ref="search"
              type="text"
              @keyup="computeSearch"
              placeholder="Développeur fullstack, développeur front-end..."
            />

            <ul class="tag-search__result">
              <li v-for="tag of computeTags" :key="tag" @click="addTag">{{tag}}</li>
            </ul>
          </div>

          <div class="save-tags">
            <div class="tag" v-for="(tag, index) of saveTags" :key="index" @click="removeTag(index)">
                {{ tag }}
            </div>
          </div>

          <div class="actions">
            <button type="submit">Valider mes résultats</button>
            <nuxt-link to="/">Fournir plus tard</nuxt-link>
          </div>
        </form>
      </div>

      <div class="tag-select__grid__illustration">
        <div ref="animationElement" class="animation"></div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
const tags = ['Dev', 'Développeur']

const computeTags = ref([])
const search = ref('')
const saveTags = ref([])

const addTag = (e) => {
    if(saveTags.value.includes(e.target.innerText)) return
    saveTags.value.push(e.target.innerText)
}

const removeTag = (index) => {
    saveTags.value.splice(index, 1)
    console.log(index, saveTags)
}

const computeSearch = (e) => {
    if(e.target.value === "") {
        computeTags.value = []
        return
    }
    computeTags.value = tags.filter((tag) => tag.includes(e.target.value))
    console.log(computeTags, e.target.value)
}

</script>

<style lang="scss" scoped>
.tag-select {
  display: grid;
  grid-template-rows: auto 1fr;
  min-height: 100vh;

  .input--wrapper {
    position: relative;

    ul {
      position: absolute;
      bottom: 100;
      box-shadow: 0px 0px 10px -3px rgba($color: #000000, $alpha: .2);
    }
  }

  .tag-select__logo {
    position: absolute;
    top: 0;
    left: 0;
    margin: 1em;
    img {
      width: 100px;
    }
  }
  &__header {
    background: #d8d8d8;
  }

  &__grid {
    display: grid;
    grid-template-columns: 50% 50%;
    height: 100%;

    &__illustration {
      border-radius: 8% 0 0 8%;

      background: #c1a7e1;
      display: grid;
      place-content: center;
    }

    &__content {
      display: flex;
      flex-direction: column;
      place-content: center;
      padding: 10rem;

      h2 {
        text-align: center;
      }

      form {
        display: grid;
        gap: 1em;
        grid-template-columns: 1fr;
        width: 100%;

        .actions {
          display: flex;
          flex-direction: column;
          gap: 1em;
          align-items: center;
        }

        input {
          width: 100%;
        }

        ul {
          width: 100%;
          background: white;
          list-style: none;
          box-sizing: border-box;
          padding: 0;
          border-radius: 5px;
          li {
            padding: 1em;
            border-radius: 5px;
            cursor: pointer;

            &:hover {
              background: #d8d8d8;
            }
          }
        }

        .save-tags {
            display: flex;
            flex-direction: row;
            gap: 1em;
            flex-wrap: wrap;
            justify-content: center;

            .tag {
                background-color: white;
                padding: .5em;
                border-radius: 20px;
                font-weight: bold;
                cursor: pointer;
            }
        }

        .semi-input {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 1em;
        }

        button {
          background: #c1a7e1;
          &:hover {
            background: #ba9edc;
          }
        }

        input {
          width: 100%;
          border: 0px;
          outline: 0;
          border-radius: 5px;
          box-sizing: border-box;

          &::placeholder {
            font-style: italic;
          }
        }
      }
    }
    .animation {
      width: 90%;
      height: 90%;
    }
  }
}
</style>
