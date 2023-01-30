<template>
    <div class="register">
        <div class="register__header">
            <h1>Crossy job</h1>
        </div>

        <div class="register__grid">
            <div class="register__grid__content">
                <h2>Register an account</h2>

                <form action="">
                    <input type="text" placeholder="Firstname">
                    <input type="text" placeholder="Lastname">
                    <input type="text" placeholder="Email">
                    <input type="text" placeholder="Password">
                    <input type="text" placeholder="Confirm Password">

                    <button type="submit">
                        Register now !
                    </button>
                </form>
            </div>

            <div class="register__grid__illustration"></div>
        </div>
    </div>
</template>


<style lang="scss" scoped>
.register {
    display: grid;
    grid-template-rows: auto 1fr;
    min-height: 100vh;
    
    &__header {
        background: #D8D8D8;
    }

    &__grid {
        display: grid;
        grid-template-columns: 50% 50%;
        height: 100%;

        &__illustration {
            background: #D8D8D8;
            display: grid;
            place-content: center;
        }

        &__content {
            display: grid;
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
                input {
                    width: 100%;
                    border: 0px;
                    outline: 0;
                    padding: .5em;
                    border-radius: 5px;

                    &::placeholder {
                        font-style: italic;
                    }
                }
            }
        }
    }
}
</style>