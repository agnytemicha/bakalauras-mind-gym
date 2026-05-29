<script setup>
import { Head, useForm } from "@inertiajs/vue3";
import CButton from "../Components/UI/CButton.vue";
import CTextInput from "../Components/UI/CTextInput.vue";
import CTextarea from "../Components/UI/CTextarea.vue";
import PublicLayout from "../Layouts/PublicLayout.vue";
import emailIconSrc from "@icons/contact/email.svg";
import phoneIconSrc from "@icons/contact/phone.svg";
import placeIconSrc from "@icons/events/place.svg";

defineOptions({ layout: PublicLayout });

const { prefill } = defineProps(["prefill"]);

const form = useForm({
    name: prefill.name,
    email: prefill.email,
    message: "",
});

function submit() {
    form.post("/information-about-us", {
        preserveScroll: true,
        onSuccess: () => form.reset("message"),
    });
}
</script>

<template>
    <Head title="Informacija apie mus" />

    <div class="section-shell space-y-10 pt-8">
        <section id="apie-mus" class="scroll-mt-32">
            <h1
                class="font-display text-5xl uppercase leading-[0.92] text-black"
            >
                Apie mus
            </h1>

            <div class="mt-6 space-y-6">
                <p
                    class="font-sans text-lg font-semibold leading-8 text-zinc-700"
                >
                    „MindGym“ idėja gimė visai paprastai – iš tikro pomėgio
                    stalo žaidimams. Pradėjusi vis dažniau žaisti stalo
                    žaidimus su draugėmis, pastebėjau, kad nors pats žaidimo
                    procesas būna labai smagus, prieš pradedant dažnai iškyla
                    ta pati problema. Net ir jau kažkada žaistus žaidimus po
                    kurio laiko būna sunku prisiminti: pasimiršta taisyklės,
                    eiga, tam tikros detalės ar net pats žaidimo tikslas.
                    Tuomet tenka iš naujo ieškoti instrukcijų, skaityti
                    taisykles, aiškintis žaidimo eigą ir tam skirti nemažai
                    laiko. Vietoje to, kad būtų galima greitai pradėti žaisti ir
                    mėgautis laiku kartu, nemaža dalis vakaro praeidavo bandant
                    prisiminti, „kaip čia viskas vyksta“.
                </p>

                <p
                    class="font-sans text-lg font-semibold leading-8 text-zinc-700"
                >
                    Būtent tokiose situacijose vis pagalvodavome, kaip būtų
                    patogu, jei egzistuotų viena vieta, kur būtų galima greitai
                    ir aiškiai rasti trumpus žaidimų paaiškinimus. Tokia vieta,
                    kur informacija būtų pateikta paprastai, suprantamai ir
                    patogiai, kad nereikėtų kiekvieną kartą grįžti prie ilgų
                    taisyklių aprašymų. Norėjosi sprendimo, kuris padėtų
                    sutaupyti laiko ir leistų greičiau grįžti prie svarbiausio
                    – paties žaidimo, gerų emocijų ir bendravimo.
                </p>

                <p
                    class="font-sans text-lg font-semibold leading-8 text-zinc-700"
                >
                    Atsiradus kursinio darbo temai, nusprendžiau šią idėją ne
                    tik išsaugoti, bet ir pabandyti ją išvystyti plačiau. Taip
                    pradėjo formuotis „MindGym“ – stalo žaidimų platforma,
                    skirta tiems, kurie nori vienoje vietoje rasti naudingą,
                    aiškią ir lengvai pasiekiamą informaciją apie stalo
                    žaidimus. Šios svetainės tikslas – padėti žmonėms greičiau
                    prisiminti jau žaistus žaidimus, lengviau suprasti jų
                    taisykles ir drąsiau išbandyti naujus.
                </p>

                <p
                    class="font-sans text-lg font-semibold leading-8 text-zinc-700"
                >
                    Tačiau „MindGym“ idėja neapsiriboja vien tik žaidimų
                    paaiškinimais. Kurdama šią platformą supratau, kad stalo
                    žaidimai žmonėms dažnai reiškia daug daugiau nei tik
                    taisyklių laikymąsi ar pergalę. Tai bendravimas, strateginis
                    mąstymas, emocijos, nuomonės, atradimai ir smagus laikas
                    kartu. Dėl to prie pirminės idėjos nusprendžiau pridėti ir
                    bendruomenės funkciją – erdvę, kurioje žmonės galėtų
                    bendrauti, dalintis mintimis, rekomendacijomis ir patirtimi.
                </p>

                <p
                    class="font-sans text-lg font-semibold leading-8 text-zinc-700"
                >
                    Ši bendruomenės dalis yra svarbi todėl, kad ne visada lengva
                    rasti žmonių, kurie domėtųsi stalo žaidimais taip pat, kaip
                    tu. Kartais norisi tiesiog padiskutuoti apie mėgstamą
                    žaidimą, pasidalinti savo strategija ar sužinoti, kaip kiti
                    žaidėjai sprendžia tam tikras situacijas. Juk daugelyje
                    stalo žaidimų nėra vieno teisingo kelio į pergalę – dažnai
                    egzistuoja įvairūs žaidimo stiliai, skirtingos taktikos ir
                    saviti požiūriai. Būtent tai ir daro stalo žaidimus tokiais
                    įdomiais: kiekvienas žaidimas gali tapti vis kitokia
                    patirtimi priklausomai nuo žmonių, su kuriais žaidi.
                </p>

                <p
                    class="font-sans text-lg font-semibold leading-8 text-zinc-700"
                >
                    „MindGym“ siekia tapti ne tik informacine svetaine, bet ir
                    jaukia erdve stalo žaidimų mėgėjams. Vieta, kur galima ne
                    tik greitai prisiminti žaidimo taisykles, bet ir atrasti
                    naujų žaidimų, bendrauti su bendraminčiais bei dar labiau
                    įsitraukti į stalo žaidimų pasaulį. Tai platforma, sukurta
                    iš realios patirties, tikro poreikio ir noro sukurti kažką
                    naudingo kitiems, kurie susiduria su tomis pačiomis
                    problemomis.
                </p>

                <p
                    class="font-sans text-lg font-semibold leading-8 text-zinc-700"
                >
                    Idėja parašyta su:
                    <a
                        href="https://chatgpt.com/share/69dca41a-c2dc-8385-a6bc-9f1474ae58b0"
                        class="underline decoration-black/30 underline-offset-4 transition hover:text-black"
                        target="_blank"
                        rel="noreferrer"
                    >
                        https://chatgpt.com/share/69dca41a-c2dc-8385-a6bc-9f1474ae58b0
                    </a>
                </p>
            </div>
        </section>

        <section id="kontaktai" class="scroll-mt-32">
            <h2
                class="font-display text-5xl uppercase leading-[0.92] text-black"
            >
                Kontaktai
            </h2>

            <div class="mt-6 space-y-3">
                <div class="flex items-start gap-3">
                    <img
                        :src="emailIconSrc"
                        class="mt-1 h-5 w-5 shrink-0 object-contain"
                    />
                    <p
                        class="font-sans text-lg font-semibold leading-8 text-zinc-700"
                    >
                        El. paštas: labas@mindgym.lt
                    </p>
                </div>

                <div class="flex items-start gap-3">
                    <img
                        :src="phoneIconSrc"
                        class="mt-1 h-5 w-5 shrink-0 object-contain"
                    />
                    <p
                        class="font-sans text-lg font-semibold leading-8 text-zinc-700"
                    >
                        Telefono numeris: +37060000000
                    </p>
                </div>

                <p
                    class="pt-2 font-sans text-lg font-semibold leading-8 text-zinc-700"
                >
                    Turime netgi 3 studijas:
                </p>

                <div class="space-y-3">
                    <div class="flex items-start gap-3">
                        <img
                            :src="placeIconSrc"
                            class="mt-1 h-5 w-5 shrink-0 object-contain"
                        />
                        <p
                            class="font-sans text-lg font-semibold leading-8 text-zinc-700"
                        >
                            MindGym studija, Vilnius
                        </p>
                    </div>

                    <div class="flex items-start gap-3">
                        <img
                            :src="placeIconSrc"
                            class="mt-1 h-5 w-5 shrink-0 object-contain"
                        />
                        <p
                            class="font-sans text-lg font-semibold leading-8 text-zinc-700"
                        >
                            MindGym studija, Kaunas
                        </p>
                    </div>

                    <div class="flex items-start gap-3">
                        <img
                            :src="placeIconSrc"
                            class="mt-1 h-5 w-5 shrink-0 object-contain"
                        />
                        <p
                            class="font-sans text-lg font-semibold leading-8 text-zinc-700"
                        >
                            MindGym studija, Klaipėda
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <section id="susisiekite" class="scroll-mt-32">
            <div class="grid gap-6 lg:grid-cols-[0.86fr_1.14fr]">
                <div>
                    <h2
                        class="font-display text-5xl uppercase leading-[0.92] text-black"
                    >
                        Susisiekite
                    </h2>
                    <p
                        class="mt-5 font-sans text-lg font-semibold leading-8 text-zinc-700"
                    >
                        Mielai lauksime Jūsų žinučių, jei norite pasiūlyti
                        renginio idėją, svetainės patobulinimus ar tiesiog
                        susisiekti su MindGym kūrėjais dėl kitų priežasčių.
                    </p>
                </div>

                <div
                    class="rounded-4xl bg-mg-yellow p-6 shadow-md sm:p-8"
                >
                    <form class="grid gap-4" @submit.prevent="submit">
                        <div class="grid gap-4 sm:grid-cols-2">
                            <CTextInput
                                v-model="form.name"
                                label="Vardas"
                                :error="form.errors.name"
                            />
                            <CTextInput
                                v-model="form.email"
                                type="email"
                                label="El. paštas"
                                :error="form.errors.email"
                            />
                        </div>

                        <CTextarea
                            v-model="form.message"
                            label="Žinutė"
                            :error="form.errors.message"
                            rows="7"
                        />

                        <div class="mt-2 self-center">
                            <CButton type="submit" variant="danger">
                                Siųsti žinutę
                            </CButton>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</template>
