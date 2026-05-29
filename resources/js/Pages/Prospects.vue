<script setup>
import { Head } from "@inertiajs/vue3";
import PublicLayout from "../Layouts/PublicLayout.vue";

defineOptions({ layout: PublicLayout });
</script>

<template>
    <Head title="Perspektyvos" />

    <section class="section-shell pt-8">
        <h1
            class="font-display text-5xl uppercase leading-[0.92] text-black"
        >
            PERSPEKTYVOS
        </h1>

        <div
            class="mt-6 max-w-5xl font-sans text-lg leading-8 text-zinc-700"
        >
            <p>
                Šiame puslapyje aptariamos "Mind Gym" platformos ateities
                perspektyvos:
            </p>

            <ul class="mt-5 list-disc space-y-4 pl-6">
                <li>
                    Ateityje galima matyti integruotą dirbtinį intelektą, kuris
                    padėtų vartotojams greičiau surasti tam tikrą informaciją.
                    Pavyzdžiui, vartotojas prisimena tik žaidimo idėją ar
                    situciją, bet nežino pavadinimo ir niekaip nesuranda
                    internete, tad čia dirbtinis intelektas duotų stalo žaidimų
                    variantų panašiausių į vartotojo aprašymą. Tokia funkcija
                    pagerintų paieškos patirtį.
                </li>

                <li>
                    Taip pat, ateityje būtų galima svarstyti ir apie mobiliosios
                    programėlės kūrimą. Stalo žaidimai dažniausiai žaidžiami
                    namuose ar kitose vietose, kur įprastai arti savęs turime
                    mobiliuosius telefonus, todėl programėlė leistų patogiau ir
                    greičiau pasiekti "Mind Gym" turinį.
                </li>

                <li>
                    Planuojama praplėsti bendruomenę, sukurdami atskirą
                    bendruomenės erdvę, kuriame vartotojai galėtų skelbti
                    įvairiausius diskusijos įrašus, dalintis rekomendacijomis ar
                    savo nuomonę, uždavinėti klausimus bei bendrauti su kitais
                    stalo žaidimų entuziastais.
                </li>

                <li>
                    Be to, yra idėja įgyvendinti galimybę žaisti stalo žaidimus
                    nuotoliniu būdu per internetą su kitais platformos
                    vartotojais.
                </li>
            </ul>

            <p class="mt-6">- Mind Gym komanda</p>
        </div>
    </section>
</template>
