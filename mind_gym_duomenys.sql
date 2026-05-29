-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: May 29, 2026 at 11:26 AM
-- Server version: 8.4.8
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mind_gym`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Mind Gym',
  `reading_time_minutes` smallint UNSIGNED NOT NULL DEFAULT '5',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `slug`, `excerpt`, `content`, `author`, `reading_time_minutes`, `created_at`, `updated_at`) VALUES
(25, 'Kaip išsirinkti stalo žaidimą vakarui: nuo lengvo juoko iki rimtos strategijos', 'kaip-issirinkti-stalo-zaidima-vakarui', 'Ne visi stalo žaidimai tinka kiekvienam vakarui. Kartais norisi juoko ir lengvumo, o kartais – taktikos, įtampos ir ilgesnio įsitraukimo. Šiame straipsnyje aptariama, kaip išsirinkti tinkamiausią žaidimą pagal žmonių skaičių, nuotaiką, patirtį ir vakaro tikslą.', 'Stalo žaidimų vakaras dažnai skamba kaip labai paprasta idėja: susitinki su draugais, išsitrauki žaidimą ir smagiai praleidi laiką. Tačiau realybėje viskas ne visada vyksta taip sklandžiai. Vieni nori greito ir juokingo žaidimo, kiti tikisi rimtos strategijos, treti apskritai nenori ilgai klausytis taisyklių. Būtent todėl tinkamo stalo žaidimo pasirinkimas gali nulemti viso vakaro sėkmę.\r\nPirmiausia verta pagalvoti apie tai, kiek žmonių žais. Kai kurie žaidimai puikiai veikia dviese, tačiau tampa nuobodūs didesnėje grupėje. Kiti, atvirkščiai, atsiskleidžia tik tada, kai susirenka bent penki ar šeši žaidėjai. Jeigu planuojamas vakarėlis, kuriame bus daug kalbų, juoko ir neformalumo, dažniausiai labiausiai tinka party tipo žaidimai. Jie reikalauja mažiau pasiruošimo, taisyklės dažnai būna aiškios, o visas dėmesys krypsta į bendravimą, reakciją ir smagias situacijas. Tokie žaidimai ypač tinka tada, kai ne visi dalyviai yra patyrę stalo žaidimų mėgėjai.\r\nJeigu vakaras ramesnis ir norisi labiau įsigilinti, verta rinktis strateginius ar taktinius žaidimus. Tokie žaidimai paprastai reikalauja daugiau dėmesio, planavimo ir kartais net kelių ėjimų į priekį numatymo. Jie puikiai tinka tiems, kurie mėgsta logiką, konkurenciją ir ilgesnį įsitraukimą. Vis dėlto svarbu nepamiršti, kad pernelyg sudėtingas žaidimas gali atbaidyti naujokus. Jei tarp žaidėjų yra žmonių, kurie retai žaidžia stalo žaidimus, geriau rinktis vidutinio sudėtingumo variantą, o ne iš karto labai taisyklių gausų žaidimą.\r\nDar vienas svarbus aspektas – vakaro nuotaika. Kartais po ilgos dienos žmonės nori tiesiog atsipalaiduoti, todėl sunki strategija gali tapti ne malonumu, o našta. Tokiu atveju geresnis pasirinkimas yra trumpesni, greičiau perprantami žaidimai. O jei susitikimas suplanuotas kaip pagrindinė vakaro veikla, tuomet jau galima rinktis ir sudėtingesnius žaidimus, kuriems reikia daugiau laiko bei kantrybės.\r\nSvarbu įvertinti ir žaidimo trukmę. Ant dėžutės nurodytas laikas ne visada atitinka realybę, ypač jei žaidžia nauji žmonės. Jei ant dėžutės parašyta 30 minučių, pirmasis žaidimas kartu su taisyklių aiškinimu gali trukti ir valandą. Todėl verta būti realistams. Jei norisi išbandyti kelis žaidimus per vieną vakarą, geriau rinktis trumpesnius variantus. Jei planuojamas vienas pagrindinis žaidimas, galima skirti laiko ir ilgesnei partijai.\r\nLabai naudinga atsižvelgti ir į tai, kokio tipo patirtis norisi sukurti. Ar norisi daug juoko? Ar norisi įtampos ir konkurencijos? O gal bendradarbiavimo? Kooperaciniai žaidimai yra puikus sprendimas, kai nenorima pernelyg stiprios tarpusavio konkurencijos. Juose žaidėjai dažniausiai veikia kaip komanda prieš patį žaidimą, todėl atsiranda daugiau bendro planavimo ir mažiau nusivylimo dėl pralaimėjimo vienas kitam.\r\nDar viena dažna klaida – rinktis žaidimą vien todėl, kad jis populiarus. Populiarumas dar nereiškia, kad jis tiks būtent jūsų grupei. Vieni žaidimai puikiai vertinami tarp patyrusių žaidėjų, bet visiškai nesužavi žmonių, kurie nori lengvo ir paprasto vakaro. Todėl geriausias žaidimas nėra tas, kuris visur giriamas, o tas, kuris tinka konkrečiai situacijai.\r\nJeigu abejojama, verta turėti bent du ar tris skirtingus variantus. Pavyzdžiui, vieną lengvą ir greitą, vieną vidutinio sudėtingumo ir vieną „rimtesniam“ žaidimui. Taip vakaro metu bus galima lanksčiai prisitaikyti prie žmonių nuotaikos ir energijos. Kartais net geriausiai suplanuotas pasirinkimas pasikeičia vos susėdus prie stalo.\r\nGalų gale, geriausias stalo žaidimas vakarui yra tas, kuris padeda žmonėms gerai jaustis, įsitraukti ir smagiai praleisti laiką. Ne visada reikia ieškoti sudėtingiausio ar originaliausio varianto. Dažnai geriausi vakarai būna tada, kai pasirinkimas paprastas, bet tinkamas būtent tai kompanijai ir tam momentui.\r\n\r\nTekstas parašytas su dirbtiniu intelektu: https://chatgpt.com/share/69e220db-e9a0-83eb-a4ac-bf5d8a01e323\r\nNuotrauka iš: https://www.skillpointtherapy.com/wp-content/uploads/2024/06/creative_storytelling_through_improvisation.jpg', 'Mind Gym komanda', 7, '2026-04-17 14:58:00', '2026-04-17 17:04:32'),
(26, 'Dažniausios pradedančiųjų klaidos stalo žaidimuose ir kaip jų išvengti', 'pradedanciuju-klaidos-stalo-zaidimuose', 'Pradėjus žaisti stalo žaidimus lengva pasimesti tarp taisyklių, simbolių ir sprendimų. Tačiau dauguma klaidų yra visiškai normalios ir jų galima išvengti. Šiame straipsnyje aptariamos dažniausios pradedančiųjų klaidos bei patarimai, kurie padės greičiau perprasti žaidimus ir labiau jais mėgautis.', 'Pradėjus domėtis stalo žaidimais labai lengva susidaryti įspūdį, kad visi aplink jau viską supranta, o tik tu vienas bandai susigaudyti, ką reiškia lentos simboliai, kortelių efektai ar veiksmų seka. Iš tiesų beveik visi žaidėjai pradžioje daro panašias klaidas. Tai visiškai normalu. Svarbiausia nebijoti jų ir suprasti, kad pirmieji žaidimai dažniau yra mokymosi procesas nei tobulas žaidimas.\r\nViena dažniausių klaidų – bandymas laimėti dar net iki galo nesupratus, kaip veikia pats žaidimas. Pradedantieji kartais taip susitelkia į pergalę, kad nebeskaito kortelių, praleidžia svarbias taisykles ar daro sprendimus nesuprasdami jų pasekmių. Daug naudingiau pirmą partiją vertinti kaip susipažinimą su žaidimu. Nebūtina iš karto sužaisti idealiai. Kur kas svarbiau suprasti bendrą logiką: kaip gaunami taškai, kas labiausiai riboja veiksmus, kokios strategijos apskritai įmanomos.\r\nKita labai dažna klaida – taisyklių neklausymas iki galo. Kai tik žaidimas atrodo „aiškus“, žmonės nustoja klausyti aiškinimą, o vėliau paaiškėja, kad būtent paskutinė taisyklių dalis buvo pati svarbiausia. Pavyzdžiui, gali būti, kad tam tikras veiksmas atliekamas tik vieną kartą per raundą, kad žaidimo pabaigos sąlyga aktyvuojama netikėtai arba kad taškai skaičiuojami visiškai kitaip, nei iš pradžių atrodė. Todėl pradžioje naudinga ne tik klausytis, bet ir užduoti klausimus.\r\nDar viena klaida – žaidimo tempo neįvertinimas. Pradedantieji neretai per ilgai svarsto kiekvieną ėjimą, net kai žaidimas tam nėra skirtas. Ypač tai pastebima lengvesniuose ar greitesniuose žaidimuose, kur didelė dalis smagumo slypi spontaniškume. Žinoma, strateginiuose žaidimuose planavimas yra svarbus, tačiau pernelyg ilgas mąstymas gali sulėtinti visą grupę ir sumažinti malonumą visiems. Kartais geriau priimti ne tobulą, bet pakankamai gerą sprendimą ir judėti toliau.\r\nPradedantieji taip pat dažnai nepakankamai stebi kitus žaidėjus. Dėmesys būna sutelktas tik į savo kortas, savo lentą ar savo ėjimus, tačiau daugelyje žaidimų labai svarbu matyti, ką daro kiti. Galbūt kažkas jau renka tam tikrą strategiją, užsiima reikalingas vietas ar ruošiasi užbaigti žaidimą. Net jei pats žaidimas nėra itin konfliktinis, kitų veiksmų stebėjimas padeda priimti geresnius sprendimus.\r\nDažnai pasitaiko ir emocinė klaida – nusivylimas po pirmos nesėkmės. Kai kurie žmonės po pirmo pralaimėjimo nusprendžia, kad žaidimas jiems netinka arba kad jis per sunkus. Tačiau daugelis stalo žaidimų atsiskleidžia tik sužaidus antrą ar trečią kartą. Pirmasis kartas dažnai būna skirtas suprasti struktūrą, o tik vėliau atsiranda galimybė iš tiesų pradėti planuoti. Todėl nereikėtų spręsti apie žaidimą vien iš pirmos partijos.\r\nDar viena klaida – per mažas dėmesys žaidimo tikslui. Kartais žaidėjai labai susikoncentruoja į tai, kas atrodo smagu ar naudinga tuo momentu, bet pamiršta, kaip iš tiesų renkama pergalė. Pavyzdžiui, gali būti, kad žaidėjas renka daug resursų, atlieka įdomių veiksmų, tačiau jie beveik neneša taškų. Todėl visada verta savęs paklausti: ar tai, ką dabar darau, iš tikrųjų artina prie pergalės?\r\nPradedantiesiems taip pat naudinga suprasti, kad ne visi žaidimai jiems patiks vienodai. Vieni labiau mėgsta strategiją, kiti – bendravimą, treti – dedukciją ar sėkmės elementą. Jei vienas žaidimas nesužavėjo, tai dar nereiškia, kad stalo žaidimai apskritai „ne tavo“. Dažnai tiesiog reikia atrasti tinkamą žanrą.\r\nGeriausias būdas tobulėti – žaisti, stebėti, klausti ir nebijoti klysti. Stalo žaidimai nėra egzaminas. Jie skirti malonumui, bendravimui ir įdomiai patirčiai. O klaidos yra natūrali to dalis. Kuo mažiau baimės suklysti, tuo daugiau smagumo ir tuo greičiau ateina supratimas, kaip žaisti geriau.\r\n\r\nTekstas parašytas su dirbtiniu intelektu: https://chatgpt.com/share/69e220db-e9a0-83eb-a4ac-bf5d8a01e323\r\nNuotrauka iš: https://upload.wikimedia.org/wikipedia/commons/b/bf/Go_%2813%C3%9713%29_--_2021_--_6728.jpg', 'Mind Gym redakcija', 8, '2026-04-17 15:05:00', '2026-04-20 11:27:50'),
(27, 'Kodėl strateginiai stalo žaidimai taip įtraukia: ne tik pramoga, bet ir mąstymo treniruotė', 'kodel-strateginiai-stalo-zaidimai-taip-itraukia', 'Strateginiai stalo žaidimai jau seniai nebėra tik siauro rato hobis. Jie traukia vis daugiau žmonių, nes suteikia ne tik konkurencijos, bet ir galimybę planuoti, analizuoti bei išbandyti skirtingus sprendimus. Straipsnyje aptariama, kodėl tokie žaidimai taip įtraukia ir kuo jie vertingi.', 'Strateginiai stalo žaidimai iš pirmo žvilgsnio kai kam gali pasirodyti sudėtingi ar net kiek bauginantys. Daug taisyklių, ilgesnė trukmė, įvairūs simboliai, kortelės, resursai ir sprendimai gali sudaryti įspūdį, kad tai veikla tik patyrusiems žaidėjams. Vis dėlto būtent strateginiai žaidimai neretai tampa mėgstamiausiais tiems, kurie juos išbando bent kelis kartus. Jie suteikia ne tik pramogą, bet ir gilesnį įsitraukimą, kuris dažnai skiriasi nuo paprastesnių žaidimų patirties.\r\nViena iš pagrindinių priežasčių, kodėl strateginiai žaidimai taip traukia, yra sprendimų reikšmė. Tokiuose žaidimuose dažniausiai beveik kiekvienas pasirinkimas turi pasekmes. Ar verta dabar investuoti į ilgalaikę naudą, ar geriau pasiimti momentinį pranašumą? Ar koncentruotis į vieną stiprią kryptį, ar bandyti derinti kelias? Tokie klausimai sukuria nuolatinį mąstymo procesą, dėl kurio žaidimas tampa ne pasyvia veikla, o aktyviu dalyvavimu.\r\nStrateginiai žaidimai taip pat suteikia stiprų progresavimo jausmą. Kuo daugiau kartų žaidi, tuo daugiau pradedi pastebėti. Iš pradžių tiesiog bandai suprasti taisykles, vėliau pradedi atpažinti veiksmingas kombinacijas, o dar vėliau mokaisi prisitaikyti prie kitų žaidėjų planų ir numatyti jų sprendimus. Todėl net tas pats žaidimas gali išlikti įdomus ilgą laiką. Kiekviena partija tampa šiek tiek kitokia, nes keičiasi žmonės, sprendimai ir situacijos.\r\nNe mažiau svarbi ir kontrolės iliuzijos bei neapibrėžtumo pusiausvyra. Geri strateginiai žaidimai dažniausiai nėra visiškai nuspėjami, bet kartu leidžia jausti, kad tavo sprendimai turi realią reikšmę. Jei žaidime viską lemtų tik sėkmė, jis nebūtų strategiškas. Jei viskas būtų visiškai apskaičiuojama, jis galėtų tapti pernelyg sausas. Būtent balansas tarp planavimo ir prisitaikymo suteikia daug įtampos ir malonumo.\r\nDar vienas svarbus aspektas – strateginiai žaidimai padeda treniruoti tam tikrus gebėjimus. Žinoma, tai nėra formalus mokymasis, tačiau žaidžiant dažnai lavinamas planavimas, dėmesio paskirstymas, prioritetų nustatymas, rizikos vertinimas ir gebėjimas priimti sprendimus turint ribotą informaciją. Kai kuriuose žaidimuose svarbus ir resursų valdymas, kituose – erdvinis mąstymas, derybos ar priešininkų elgesio skaitymas.\r\nStrateginiai žaidimai gali būti vertingi ir socialine prasme. Nors iš šono atrodo, kad tai tik „sėdėjimas ir galvojimas“, iš tiesų jie dažnai sukuria įdomias diskusijas, emocijas, netikėtas situacijas ir bendrą istoriją. Po partijos žmonės dažnai aptaria, kur padarė klaidų, kas suveikė, kokį sprendimą buvo galima priimti kitaip. Tai paverčia žaidimą ne vien momentine veikla, bet ir patirtimi, kuri tęsiasi net jam pasibaigus.\r\nĮdomu ir tai, kad strateginiai žaidimai leidžia išbandyti skirtingus vaidmenis ar mąstymo stilius. Vieni žaidėjai mėgsta žaisti agresyviai, kiti renkasi atsargų kaupimą, treti – lankstų prisitaikymą. Tokie žaidimai leidžia geriau pažinti ne tik kitus, bet ir save. Ilgainiui tampa aišku, kokie sprendimo būdai žmogui artimiausi, kur jis linkęs rizikuoti, o kur – vengti neapibrėžtumo.\r\nNereikėtų manyti, kad strateginiai žaidimai yra skirti tik „labai protingiems“ žmonėms. Daug svarbiau yra smalsumas, kantrybė ir noras įsigilinti. Pradėti galima nuo vidutinio sudėtingumo žaidimų, kurie nėra pernelyg ilgi ar perkrauti taisyklėmis. Svarbiausia duoti sau laiko priprasti. Kai pradedi suprasti žaidimo logiką, pats procesas tampa labai malonus.\r\nGalų gale, strateginiai stalo žaidimai taip įtraukia todėl, kad jie sujungia konkurenciją, kūrybiškumą, analizę ir žmogišką bendravimą. Jie leidžia ne tik gerai praleisti laiką, bet ir patirti tą malonų jausmą, kai planas pavyksta, kai sprendimas pasiteisina arba kai net po nesėkmės norisi iškart žaisti dar kartą ir pabandyti kitaip. Būtent dėl to daugelis žmonių atradę strateginius žaidimus prie jų vis sugrįžta.\r\n\r\nTekstas parašytas su dirbtiniu intelektu: https://chatgpt.com/share/69e220db-e9a0-83eb-a4ac-bf5d8a01e323\r\nNuotrauka: https://www.skillpointtherapy.com/wp-content/uploads/2024/11/working_together_in_games.jpg', 'Mind Gym redakcija', 9, '2026-04-17 15:08:00', '2026-04-21 09:32:25'),
(28, 'Trumpi taisyklių paaiškinimai prieš žaidimą: kaip aiškinti, kad visi suprastų', 'kaip-trumpai-ir-aiskiai-paaiskinti-zaidimo-taisykles', 'Vienas žmogus skaito taisykles, kiti laukia, kol pagaliau bus galima pradėti žaisti – pažįstama situacija daugelyje stalo žaidimų vakarų. Šiame straipsnyje aptariama, kaip taisykles paaiškinti trumpiau, aiškiau ir taip, kad žmonės neprarastų dėmesio.', 'Taisyklių aiškinimas dažnai yra ta stalo žaidimų vakaro dalis, kurią daugelis ištveria, bet ne itin mėgsta. Vieni pradeda nuobodžiauti, kiti pasimeta, treti jau po pirmų kelių minučių nebežino, apie ką kalbama. Dėl to net ir labai geras žaidimas gali palikti prastesnį pirmą įspūdį. Tačiau problema dažnai slypi ne pačiame žaidime, o tame, kaip jis pristatomas.\r\nPirmas svarbus principas – pradėti ne nuo smulkmenų, o nuo bendro tikslo. Žmonėms daug lengviau suprasti taisykles, kai jie iš karto žino, ką apskritai bando pasiekti. Jei pradžioje išvardijamos visos kortelių rūšys, fazės ir simboliai, bet nepasakoma, kaip laimima, klausytojams sunku susidėlioti bendrą vaizdą. Todėl pats pirmas sakinys turėtų atsakyti į klausimą: koks yra žaidimo tikslas?\r\nPo to naudinga trumpai paaiškinti žaidimo eigą. Pavyzdžiui: ką žaidėjas daro savo ėjimo metu, kokia yra tipinė veiksmo seka, ir kada žaidimas baigiasi. Žmonėms nebūtina iš karto žinoti visų išimčių. Pirmiausia jiems reikia suprasti pagrindinį ritmą. Tik tada galima pereiti prie detalių.\r\nDar viena dažna klaida – aiškinti taisykles tokia tvarka, kokia jos parašytos taisyklių knygelėje. Taisyklių knygelė skirta pilnam informacijos rinkiniui, bet ne visada geriausiai tinka gyvam paaiškinimui. Daug veiksmingiau taisykles perteikti logine seka: tikslas, ėjimas, svarbiausi veiksmai, kaip renkami taškai, ir tik tada papildomos detalės.\r\nLabai padeda ir vaizdinis aiškinimas. Jei įmanoma, verta rodyti realius komponentus, korteles, lentą ar pavyzdinį ėjimą. Žmonės dažnai daug greičiau supranta matydami, nei vien klausydamiesi. Net paprastas sakinys „žiūrėkite, štai čia dedama korta, štai iš čia gaunate resursą“ gali būti daug veiksmingesnis nei ilgas teorinis paaiškinimas.\r\nSvarbu nepersistengti ir su detalėmis. Pradedant partiją nebūtina paaiškinti absoliučiai kiekvieno simbolio ar reto atvejo. Jei iškart pateikiama per daug informacijos, klausytojai tiesiog nustoja viską laikyti galvoje. Kur kas geriau pradėti žaisti tada, kai jau aiškūs pagrindai, o likusias smulkmenas paaiškinti eigoje. Daugeliui žmonių taip lengviau mokytis.\r\nNaudinga ir kalbėti paprastais sakiniais. Kartais taisykles aiškinantis žmogus pats gerai moka žaidimą, todėl nejučia pradeda vartoti per daug specifinių terminų arba aiškinti per greitai. Tačiau naujam žaidėjui net tokie žodžiai kaip „akcija“, „fazė“, „resursų konversija“ ar „triggerinasi efektas“ gali skambėti pernelyg abstrakčiai. Paprastesnė kalba beveik visada yra geresnis pasirinkimas.\r\nReikia prisiminti ir tai, kad žmonės informaciją įsimena skirtingai. Vieniems svarbiausia išgirsti viską iš anksto, kiti supranta tik pradėję žaisti. Todėl nereikėtų nervintis, jei po aiškinimo vis tiek kyla klausimų. Tai normalu. Geras taisyklių paaiškinimas nėra tas, po kurio niekam nieko nebereikia klausti. Geras paaiškinimas yra tas, po kurio žmonės jaučiasi pasiruošę pradėti.\r\nLabai padeda ir draugiškas tonas. Jei taisyklės aiškinamos taip, lyg visi privalėtų viską suprasti iš pirmo karto, naujokai gali jaustis nejaukiai. O jei iškart pasakoma, kad pirmi ėjimai visada būna mokymosi dalis ir kad klausimai yra visiškai normalūs, žmonės daug labiau atsipalaiduoja. Tada ir pats žaidimas vyksta sklandžiau.\r\nGalutinis tikslas nėra padaryti tobulą paskaitą apie taisykles. Tikslas yra padėti žmonėms kuo greičiau pradėti mėgautis žaidimu. Kuo aiškesnis ir paprastesnis paaiškinimas, tuo didesnė tikimybė, kad žaidimas paliks gerą įspūdį ir norėsis prie jo sugrįžti.\r\n\r\nTekstas parašytas su dirbtiniu intelektu: https://chatgpt.com/share/69e220db-e9a0-83eb-a4ac-bf5d8a01e323', 'Mind Gym komanda', 6, '2026-04-17 15:09:00', '2026-04-20 11:27:38'),
(29, 'Įdomūs faktai apie stalo žaidimus: nuo senovės istorijos iki šiuolaikinių vakarų tradicijų', 'idomus-faktai-apie-stalo-zaidimus', 'Stalo žaidimai turi daug ilgesnę istoriją, nei gali pasirodyti iš pirmo žvilgsnio. Jie lydėjo žmones nuo senovės civilizacijų laikų iki šiuolaikinių draugų vakarų. Šiame straipsnyje apžvelgiami įdomūs faktai apie stalo žaidimų kilmę, raidą ir jų vietą šiandieninėje kultūroje.', 'Šiandien stalo žaidimai daugeliui asocijuojasi su jaukiu vakaru, draugais, arbata ar užkandžiais ir smagiu laiku prie vieno stalo. Tačiau jų istorija yra kur kas senesnė ir įdomesnė, nei dažnai pagalvojame. Stalo žaidimai nėra vien šiuolaikinė pramoga – jie lydi žmoniją jau tūkstančius metų ir įvairiais laikotarpiais atliko ne tik linksminimo, bet ir socialinę, kultūrinę ar net simbolinę funkciją.\r\nVienas įdomiausių faktų yra tas, kad stalo žaidimų ištakos siekia senovės civilizacijas. Archeologai yra radę itin senų žaidimų lentų ir figūrėlių, kurios rodo, kad žmonės žaidė dar prieš tūkstančius metų. Tokie žaidimai ne tik padėdavo leisti laiką, bet galėjo turėti ir ritualinę ar statuso reikšmę. Tai rodo, kad noras varžytis, planuoti, spėlioti ir bendrauti per žaidimą yra labai sena žmogaus patirties dalis.\r\nKitas įdomus aspektas – stalo žaidimai laikui bėgant labai keitėsi. Seniau daugelis jų buvo labiau susiję su sėkme, kauliukais ar paprastesnėmis lenktynių mechanikomis. Vėliau atsirado daugiau strategijos, ekonomikos, teritorijų kontrolės, vaidmenų, bendradarbiavimo ir pasakojimo elementų. Šiandien stalo žaidimų pasaulis yra toks platus, kad kiekvienas gali rasti sau tinkamą tipą: nuo labai greitų vakarėlių žaidimų iki sudėtingų kelių valandų strateginių sistemų.\r\nĮdomu ir tai, kad šiuolaikiniai stalo žaidimai dažnai padeda grįžti prie gyvo bendravimo. Skaitmeninėje kasdienybėje, kur daug laiko praleidžiama prie ekranų, stalo žaidimai sukuria visai kitokį bendravimo formatą. Žmonės sėdi vienoje erdvėje, reaguoja vieni į kitus čia ir dabar, juokiasi, ginčijasi, derasi, bendradarbiauja. Dėl to stalo žaidimai daugeliui tampa ne tik hobiu, bet ir būdu stiprinti ryšį su kitais.\r\nDar vienas įdomus faktas – daugelis populiarių žaidimų išpopuliarėjo ne iš karto. Kai kurie iš jų ilgą laiką buvo žinomi tik mažesnėse bendruomenėse, kol galiausiai juos atrado platesnė auditorija. Dažnai didelę reikšmę turi rekomendacijos iš lūpų į lūpas, žaidimų klubai, turinio kūrėjai ar draugų vakarai. Kitaip nei kai kurios greitai praeinančios pramogos, geri stalo žaidimai dažnai išlieka aktualūs daugelį metų.\r\nTaip pat verta paminėti, kad stalo žaidimai dažnai atspindi tam tikras kultūrines tendencijas. Vienu laikotarpiu labiau populiarėja konkurenciniai ekonominiai žaidimai, kitu – kooperaciniai, kuriuose visi žaidžia prieš sistemą. Tai rodo, kad žaidimai neatsiranda vakuume. Jie yra susiję su tuo, kas tuo metu žmonėms įdomu, kokių patirčių jie ieško ir kaip nori leisti laiką.\r\nĮdomu ir tai, kad nemaža dalis žaidėjų vertina ne tik patį žaidimą, bet ir jo estetiką. Šiuolaikiniai stalo žaidimai dažnai pasižymi gražiu dizainu, kokybiškomis iliustracijomis, apgalvotais komponentais ir stipria atmosfera. Dėl to jie tampa ne vien mechanine veikla, bet ir estetine patirtimi. Kai kuriems žmonėms tai yra vienas iš svarbiausių aspektų, padedančių labiau įsitraukti.\r\nDar viena įdomi detalė – stalo žaidimai dažnai atskleidžia žmonių charakterio bruožus. Vieni žaidžia labai atsargiai, kiti mėgsta rizikuoti, treti nuolat derasi ar bando nuspėti kitų elgesį. Dėl to žaidimai tampa savotišku socialiniu veidrodžiu. Žinoma, tai nėra tikslus žmogaus portretas, tačiau tam tikri polinkiai tikrai gali išryškėti.\r\nPastaraisiais metais stalo žaidimai vis dažniau tampa ir edukacine priemone. Jie naudojami mokymuisi, komandiniam darbui, kritiniam mąstymui, kalbėjimo įgūdžiams ar net emociniam intelektui ugdyti. Kai kurie žaidimai padeda geriau suprasti istorinius, ekonominius ar loginius procesus. Kiti moko bendradarbiauti, susitarti ir prisitaikyti prie netikėtų situacijų.\r\nGaliausiai, bene svarbiausias faktas yra tas, kad stalo žaidimai išlieka aktualūs todėl, kad jie sujungia labai žmogiškus dalykus: smalsumą, žaismę, bendravimą, konkurenciją ir bendrą patirtį. Nesvarbu, ar tai būtų greitas party žaidimas, ar ilga strateginė partija – svarbiausia ne tik taisyklės ar rezultatas, bet ir tai, ką žmonės patiria žaisdami kartu. Galbūt būtent todėl stalo žaidimai, nepaisant technologijų kaitos, nepraranda savo žavesio ir šiandien.\r\n\r\nTekstas parašytas su dirbtiniu intelektu: https://chatgpt.com/share/69e220db-e9a0-83eb-a4ac-bf5d8a01e323\r\nNuotrauka iš: https://www.worldhistory.org/uploads/images/20944.jpg', 'Mind Gym komanda', 8, '2026-04-17 15:12:00', '2026-04-17 17:01:56');

-- --------------------------------------------------------

--
-- Table structure for table `article_comments`
--

CREATE TABLE `article_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `article_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_comments`
--

INSERT INTO `article_comments` (`id`, `article_id`, `user_id`, `body`, `created_at`, `updated_at`, `deleted_at`) VALUES
(17, 29, 17, 'Labai įdomus ir įtraukiantis straipsnis!', '2026-04-17 15:24:19', '2026-04-17 15:24:19', NULL),
(18, 29, 16, 'Patiko mintis apie „gyvą bendravimą“. Tikrai jaučiasi, kad žaidimai sugrąžina žmones prie vieno stalo.', '2026-04-21 09:15:46', '2026-04-21 09:15:46', NULL),
(19, 27, 15, 'Labai gerai pataikyta apie tai, kad strateginiuose žaidimuose sprendimai turi pasekmes – būtent dėl to norisi „dar vienos partijos“, nes vis galvoji, ką būtum padaręs kitaip', '2026-04-21 09:17:29', '2026-04-21 09:17:29', NULL),
(20, 27, 18, 'Geras nuraminimas, kad strateginiai žaidimai nėra tik „labai protingiems“. Manau, daug kas bijo pradėti, o iš tikro užtenka kantrybės ir gero pirmo žaidimo pasirinkimo', '2026-04-21 09:18:10', '2026-04-21 09:18:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `article_comment_replies`
--

CREATE TABLE `article_comment_replies` (
  `id` bigint UNSIGNED NOT NULL,
  `article_comment_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_comment_replies`
--

INSERT INTO `article_comment_replies` (`id`, `article_comment_id`, `user_id`, `body`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 20, 18, 'Tikrai taip!!', '2026-04-24 07:52:55', '2026-04-24 07:52:55', NULL),
(2, 20, 17, 'Sutinku', '2026-05-25 12:46:14', '2026-05-25 12:46:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `article_tag`
--

CREATE TABLE `article_tag` (
  `id` bigint UNSIGNED NOT NULL,
  `article_id` bigint UNSIGNED NOT NULL,
  `article_tag_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_tag`
--

INSERT INTO `article_tag` (`id`, `article_id`, `article_tag_id`, `created_at`, `updated_at`) VALUES
(1, 25, 1, '2026-04-17 17:04:32', '2026-04-17 17:04:32'),
(2, 25, 2, '2026-04-17 17:04:32', '2026-04-17 17:04:32'),
(3, 25, 3, '2026-04-17 17:04:32', '2026-04-17 17:04:32'),
(4, 25, 4, '2026-04-17 17:04:32', '2026-04-17 17:04:32'),
(5, 28, 5, '2026-04-20 11:27:38', '2026-04-20 11:27:38'),
(6, 28, 2, '2026-04-20 11:27:38', '2026-04-20 11:27:38'),
(7, 28, 6, '2026-04-20 11:27:38', '2026-04-20 11:27:38'),
(8, 28, 4, '2026-04-20 11:27:38', '2026-04-20 11:27:38'),
(9, 26, 5, '2026-04-20 11:27:50', '2026-04-20 11:27:50'),
(10, 26, 2, '2026-04-20 11:27:50', '2026-04-20 11:27:50'),
(11, 26, 7, '2026-04-20 11:27:50', '2026-04-20 11:27:50'),
(12, 26, 6, '2026-04-20 11:27:50', '2026-04-20 11:27:50'),
(13, 27, 8, '2026-04-21 09:32:25', '2026-04-21 09:32:25'),
(14, 27, 9, '2026-04-21 09:32:25', '2026-04-21 09:32:25'),
(15, 27, 3, '2026-04-21 09:32:25', '2026-04-21 09:32:25'),
(16, 27, 7, '2026-04-21 09:32:25', '2026-04-21 09:32:25'),
(17, 29, 10, '2026-04-21 16:21:02', '2026-04-21 16:21:02'),
(18, 29, 11, '2026-04-21 16:21:02', '2026-04-21 16:21:02'),
(19, 29, 3, '2026-04-21 16:21:02', '2026-04-21 16:21:02'),
(20, 29, 8, '2026-04-21 16:21:02', '2026-04-21 16:21:02');

-- --------------------------------------------------------

--
-- Table structure for table `article_tags`
--

CREATE TABLE `article_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_tags`
--

INSERT INTO `article_tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'party', 'party', '2026-04-17 17:04:32', '2026-04-17 17:04:32'),
(2, 'pradedantiesiems', 'pradedantiesiems', '2026-04-17 17:04:32', '2026-04-17 17:04:32'),
(3, 'stalozaidimai', 'stalozaidimai', '2026-04-17 17:04:32', '2026-04-17 17:04:32'),
(4, 'vakaro-idejos', 'vakaro-idejos', '2026-04-17 17:04:32', '2026-04-17 17:04:32'),
(5, 'patarimai', 'patarimai', '2026-04-20 11:27:38', '2026-04-20 11:27:38'),
(6, 'taisykles', 'taisykles', '2026-04-20 11:27:38', '2026-04-20 11:27:38'),
(7, 'strategijos', 'strategijos', '2026-04-20 11:27:50', '2026-04-20 11:27:50'),
(8, 'idomusfaktai', 'idomusfaktai', '2026-04-21 09:32:25', '2026-04-21 09:32:25'),
(9, 'mastymas', 'mastymas', '2026-04-21 09:32:25', '2026-04-21 09:32:25'),
(10, 'kultura', 'kultura', '2026-04-21 16:21:02', '2026-04-21 16:21:02'),
(11, 'naujienos', 'naujienos', '2026-04-21 16:21:02', '2026-04-21 16:21:02');

-- --------------------------------------------------------

--
-- Table structure for table `cms_users`
--

CREATE TABLE `cms_users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_users`
--

INSERT INTO `cms_users` (`id`, `name`, `email`, `role`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(15, 'Agnė Marija', 'admin@mindgym.lt', 'admin', '$2y$12$Tg.zPlYmvenWUPNUKjrr6eRGD5nwLSTkB0gJuuKmbZbjQbnB6UTjy', NULL, '2026-03-25 14:29:10', '2026-04-17 10:56:17');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `user_id`, `message`, `deleted_at`, `created_at`) VALUES
(1, 'Erika', 'erica333@gmail.com', 17, 'Test1111', '2026-04-20 16:33:50', '2026-04-13 09:53:10'),
(2, 'Agne', 'agne@gmail.com', NULL, 'pypt pypt', '2026-04-21 16:18:43', '2026-04-13 09:53:56'),
(3, 'Erika', 'erica333@gmail.com', 17, 'Laiškas laiškas', '2026-04-21 15:58:21', '2026-04-20 15:39:35'),
(4, 'Erika', 'erica333@gmail.com', 17, 'hjmvgbjk', '2026-04-20 18:44:59', '2026-04-20 15:44:25'),
(5, 'Erika', 'erica333@gmail.com', 17, 'laba fauhsbfuhasfdbauskdhjbafaakaakakaaaaaaaaaaaaaaakakakakakakaaaaaaaaaaaaaaaakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakakaaaaasfhyuabsfhusbfhuasvbfeyufnasifjkfa', '2026-04-20 18:44:56', '2026-04-20 16:29:48'),
(6, 'Erika', 'erica333@gmail.com', 17, 'Labai gražus laiškas. Pypt bum bum', '2026-04-21 16:22:39', '2026-04-21 15:59:41'),
(7, 'Valera', 'valerivic@gmail.com', NULL, 'Laba, turiu daug klausimu', NULL, '2026-04-25 16:18:01'),
(8, 'Valera', 'valerivic@g', NULL, 'fghj', NULL, '2026-04-25 16:18:10'),
(9, 'Erika', 'erica333@gmail.com', 17, 'zinute', NULL, '2026-04-26 19:16:29'),
(10, 'Erika', 'erica333@gmail.com', 17, 'laiskas', NULL, '2026-04-26 19:30:57'),
(11, 'Erika', 'erica333@gmail.com', 17, 'laba', '2026-04-26 19:40:13', '2026-04-26 19:35:50'),
(12, 'Erika', 'erica333@gmail.com', 17, 'laba', '2026-05-25 12:48:10', '2026-05-25 12:45:43');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `starts_at` datetime NOT NULL,
  `ends_at` datetime DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `difficulty_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'everyone',
  `price_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'free',
  `seats_total` int UNSIGNED NOT NULL DEFAULT '20',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'upcoming',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `slug`, `description`, `starts_at`, `ends_at`, `location`, `difficulty_level`, `price_type`, `seats_total`, `status`, `created_at`, `updated_at`) VALUES
(25, 'Strateginių žaidimų vakaras: „Catan“ ir „Carcassonne“', 'strateginiu-zaidimu-vakaras-catan-carcassonne', 'Kviečiame į strateginių stalo žaidimų vakarą „Mind Gym“ studijoje! Renginio pradžioje trumpai pristatysime žaidimus ir aiškiai paaiškinsime taisykles, todėl drąsiai gali ateiti net jei dar nesi žaidęs(-usi). Vėliau susiskirstysime į grupes ir žaisime „Catan“ bei „Carcassonne“ (pagal dalyvių skaičių gali atsirasti ir papildomas žaidimas).\r\nAteik susipažinti su bendraminčiais, išbandyti strategiškus sprendimus ir smagiai praleisti vakarą. Jei turi mėgstamą strateginį žaidimą, gali atsinešti – jei liks laiko, pabandysime ir jį.\r\nSvarbu: vietų skaičius ribotas, todėl rekomenduojame registruotis iš anksto.\r\nNuotrauka iš: https://www.boardgamehalv.com/catan-vs-carcassonne/\r\nVisa informacija parašyta dirbtinio intelekto pagalba: https://chatgpt.com/share/69dcb0bd-9ac4-8384-aa27-af17f41c6f92', '2026-06-07 12:00:00', NULL, 'Mind Gym studija, Kaunas', 'everyone', 'paid', 20, 'upcoming', '2026-04-07 15:15:00', '2026-04-13 09:02:30'),
(26, 'Stalo žaidimų vakaras draugams', 'stalo-zaidimu-vakaras-draugams', 'Kviečiame į jaukų stalo žaidimų vakarą, skirtą visiems, kurie nori smagiai praleisti laiką, susipažinti su naujais žmonėmis ir išbandyti įvairius žaidimus. Vakaro metu bus galima rinktis iš skirtingų tipų žaidimų: nuo lengvų vakarėlių ir komandinių žaidimų iki strateginių bei loginio mąstymo iššūkių.\r\nRenginys puikiai tinka tiek tiems, kurie žaidžia dažnai, tiek visiškiems naujokams. Mind Gym komanda padės išsirinkti tinkamą žaidimą, paaiškins taisykles ir pasirūpins, kad visi įsitrauktų. Tai puiki proga atsipalaiduoti po savaitės darbų ar studijų ir atrasti naujų mėgstamų stalo žaidimų.\r\nDalyvio mokestis – 5 Eur. Į kainą įskaičiuota vieta renginyje, žaidimų biblioteka ir arbata.\r\nNuotrauka: https://www.pexels.com/photo/close-up-photo-of-monopoly-board-game-776654/\r\nVisa informacija parašyta dirbtinio intelekto pagalba: https://chatgpt.com/share/69dcb0bd-9ac4-8384-aa27-af17f41c6f92', '2026-07-12 19:00:00', '2026-07-12 21:00:00', 'Mind Gym studija, Kaunas', 'everyone', 'paid', 26, 'upcoming', '2026-04-08 10:43:00', '2026-04-13 09:02:52'),
(27, 'Pradedančiųjų vakaras: kaip pradėti žaisti stalo žaidimus?', 'pradedanciuju-vakaras-stalo-zaidimai', 'Šis renginys skirtas tiems, kurie nori susipažinti su stalo žaidimų pasauliu nuo pačių pagrindų. Jei visada atrodė, kad stalo žaidimai yra per daug sudėtingi, ilgi ar skirti tik patyrusiems žaidėjams – šis vakaras padės pakeisti nuomonę.\r\nRenginio metu pristatysime keletą lengvai perprantamų ir įtraukiančių žaidimų, paaiškinsime pagrindinius mechanikų tipus, patarsime, kaip išsirinkti žaidimą pagal žmonių skaičių, nuotaiką ar patirtį. Viskas vyks draugiškoje, neformalioje aplinkoje, todėl nebus jokio spaudimo „mokėti žaisti gerai“.\r\nRenginys yra nemokamas, tačiau vietų skaičius ribotas, todėl rekomenduojama registruotis iš anksto.\r\nNuotrauka: https://www.facebook.com/groups/38346732308/posts/10161581230712309/\r\nVisa informacija parašyta dirbtinio intelekto pagalba: https://chatgpt.com/share/69dcb0bd-9ac4-8384-aa27-af17f41c6f92', '2026-09-30 17:00:00', '2026-09-30 20:00:00', 'Mind Gym studija, Kaunas', 'beginner', 'free', 20, 'upcoming', '2026-04-08 09:01:26', '2026-04-13 09:03:14'),
(28, 'Strategijų turnyras: tikslumas, planavimas ir pergalė', 'strategiju-turnyras-pergale', 'Jeigu mėgstate planuoti kelis žingsnius į priekį, analizuoti situaciją ir ieškoti geriausio sprendimo – šis renginys kaip tik jums. Strategijų turnyras skirtas žaidėjams, kurie nori išbandyti savo gebėjimus konkurencinėje, bet draugiškoje aplinkoje.\r\nRenginio metu dalyviai varžysis keliais etapais, žaisdami kruopščiai atrinktus strateginius stalo žaidimus. Bus vertinamas ne tik galutinis rezultatas, bet ir gebėjimas prisitaikyti prie situacijos, priimti sprendimus spaudimo metu ir efektyviai valdyti turimus išteklius. Tarp partijų numatytos trumpos pertraukos, o pabaigoje laukia simboliniai prizai geriausiai pasirodžiusiems dalyviams.\r\nDalyvio mokestis – 10 Eur. Į kainą įskaičiuotas dalyvavimas turnyre, organizavimas ir prizinis fondas.\r\nVisa informacija parašyta dirbtinio intelekto pagalba: https://chatgpt.com/share/69dcb0bd-9ac4-8384-aa27-af17f41c6f92', '2026-06-22 12:00:00', '2026-06-22 17:00:00', 'Mind Gym studija, Kaunas', 'intermediate', 'paid', 16, 'upcoming', '2026-04-08 09:04:48', '2026-04-13 09:02:43'),
(29, 'Pažengusiųjų žaidimų sesija: gilios mechanikos ir ilgesnės partijos', 'pazengusiuju-zaidimu-sesija', 'Ši sesija skirta pažengusiems stalo žaidimų mėgėjams, ieškantiems sudėtingesnių sprendimų, gilesnių mechanikų ir ilgesnio, labiau įtraukiančio žaidimo proceso. Renginyje bus žaidžiami sudėtingesni strateginiai ir ekonominiai stalo žaidimai, reikalaujantys planavimo, dėmesio detalėms ir ilgesnio įsitraukimo.\r\nTai puikus pasirinkimas tiems, kurie jau turi patirties su modernesniais stalo žaidimais ir nori ne tik smagiai praleisti laiką, bet ir patirti tikrą intelektinį iššūkį. Sesijos metu bus skiriama laiko taisyklių paaiškinimui, tačiau renginys orientuotas į dalyvius, kurie nebijo sudėtingesnių žaidimo sistemų.\r\nDalyvio mokestis – 15 Eur. Į kainą įskaičiuota vieta renginyje, pasirinkti premium klasės žaidimai ir užkandžiai.\r\nVisa informacija parašyta dirbtinio intelekto pagalba: https://chatgpt.com/share/69dcb0bd-9ac4-8384-aa27-af17f41c6f92', '2026-07-14 15:00:00', '2026-07-14 20:30:00', 'Mind Gym klubas, Klaipėda', 'advanced', 'paid', 20, 'upcoming', '2026-04-08 09:08:25', '2026-04-13 09:03:07'),
(30, 'Šeimų sekmadienis: žaidimai vaikams ir tėvams', 'seimu-sekmadienis-zaidimai', '„Šeimų sekmadienis“ – tai renginys, skirtas kokybiškam laikui kartu. Į jį kviečiamos šeimos su vaikais, norinčios smagiai ir prasmingai praleisti sekmadienio dieną. Renginyje bus pristatomi šeimoms pritaikyti stalo žaidimai, lavinantys bendradarbiavimą, dėmesingumą, kūrybiškumą ir loginį mąstymą.\r\nMind Gym komanda parinks žaidimus pagal vaikų amžių ir šeimos poreikius, todėl dalyvauti galės tiek jaunesni, tiek vyresni vaikai su tėvais ar globėjais. Tai puiki galimybė atrasti bendrą veiklą, stiprinti ryšį šeimoje ir pamatyti, kaip žaidimai gali tapti ne tik pramoga, bet ir mokymosi forma.\r\nRenginys yra nemokamas, tačiau dėl riboto vietų skaičiaus būtina išankstinė registracija.\r\nNuotrauka: https://www.pexels.com/photo/a-group-of-people-playing-board-game-8111367/\r\nVisa informacija parašyta dirbtinio intelekto pagalba: https://chatgpt.com/share/69dcb0bd-9ac4-8384-aa27-af17f41c6f92', '2026-05-24 12:00:00', '2026-05-24 17:00:00', 'Mind Gym studija, Vilnius', 'everyone', 'free', 30, 'upcoming', '2026-04-08 09:10:00', '2026-04-13 09:02:21'),
(31, 'Naujokų susipažinimo vakaras', 'naujoku-susipazinimo-vakaras', '„Naujokų susipažinimo vakaras“ – tai jaukus ir draugiškas renginys, skirtas visiems, kurie nori pirmą kartą susipažinti su „Mind Gym“ bendruomene, stalo žaidimų pasauliu ir smagiai praleisti laiką neįpareigojančioje aplinkoje.\r\n\r\nVakaro metu dalyviai turės galimybę susipažinti vieni su kitais, išbandyti lengvai perprantamus stalo žaidimus, pabendrauti su organizatoriais bei užduoti rūpimus klausimus apie būsimus renginius, žaidimų vakarus ir bendruomenės veiklas. Tai puiki proga tiems, kurie galbūt dar nedrįso ateiti vieni, neturi daug patirties stalo žaidimuose ar tiesiog ieško naujos, jaukios ir įtraukiančios veiklos.\r\n\r\nRenginio tikslas – sukurti šiltą atmosferą, kurioje kiekvienas jaustųsi laukiamas. Čia nereikia jokios ankstesnės patirties ar specialių žinių – svarbiausia noras susipažinti, pabandyti ir gerai praleisti laiką. Vakaro metu bus pasirūpinta draugiška aplinka, lengvais žaidimais ir gera nuotaika.\r\n\r\nVisa informacija parašyta dirbtinio intelekto pagalba: https://chatgpt.com/share/69dcb0bd-9ac4-8384-aa27-af17f41c6f92', '2026-02-17 16:30:00', '2026-02-17 20:30:00', 'Mind Gym studija, Kaunas', 'everyone', 'free', 30, 'completed', '2026-04-13 08:56:44', '2026-04-13 09:01:55'),
(32, 'Sekmadienio strategų planas', 'sekmadienio-strategu-stalas', '„Sekmadienio strategų planas“ – tai renginys, skirtas tiems, kurie mėgsta apgalvotus sprendimus, planavimą ir azartišką, bet intelektualų stalo žaidimų procesą. Čia kviečiami visi, norintys sekmadienio popietę praleisti prasmingai – lavinant strateginį mąstymą, išbandant įdomesnius žaidimų scenarijus ir pasineriant į ilgesnes, labiau įtraukiančias partijas.\r\n\r\nRenginio metu dalyviai turės galimybę išbandyti įvairius strateginius stalo žaidimus, kuriuose svarbus ne tik sėkmės faktorius, bet ir gebėjimas planuoti kelis ėjimus į priekį, prisitaikyti prie situacijos ir numatyti priešininkų veiksmus. Tai puikus pasirinkimas tiems, kurie mėgsta iššūkius, taktinius sprendimus ir nori atrasti gilesnį stalo žaidimų pasaulį.\r\n\r\nVakaro atmosfera bus draugiška ir įtraukianti, todėl renginys tiks tiek jau mėgstantiems strateginius žaidimus, tiek tiems, kurie nori po truputį į juos įsilieti. Organizatoriai padės išsirinkti tinkamą žaidimą, paaiškins taisykles ir pasirūpins, kad kiekvienas dalyvis jaustųsi patogiai.\r\n\r\nVisa informacija parašyta dirbtinio intelekto pagalba: https://chatgpt.com/share/69dcb0bd-9ac4-8384-aa27-af17f41c6f92', '2026-03-20 10:00:00', '2026-03-20 20:00:00', 'Mind Gym studija, Klaipėda', 'intermediate', 'free', 20, 'completed', '2026-04-13 08:58:26', '2026-04-13 09:02:03'),
(33, 'Penktadienio Party žaidimų vakaras', 'penktadienio-party-zaidimu-vakaras', '„Penktadienio Party žaidimų vakaras“ – tai smagus, lengvas ir energingas renginys, skirtas gerai nuotaikai, juokui ir bendravimui. Čia svarbiausia ne sudėtingos taisyklės ar ilgas planavimas, o linksmas laikas kartu, greitos užduotys, netikėtos situacijos ir daug gerų emocijų.\r\n\r\nVakaro metu dalyviai žais populiarius party tipo stalo žaidimus, kurie puikiai tinka didesnėms grupėms, naujoms pažintims ir neįpareigojančiam vakarui po darbų ar studijų. Renginys ypač tinka tiems, kurie nori atsipalaiduoti, smagiai praleisti penktadienio vakarą ir išbandyti žaidimus, kurie skatina bendravimą, kūrybiškumą bei spontaniškumą.\r\n\r\nTai puiki proga ateiti su draugais arba prisijungti vienam ir greitai įsilieti į bendrą atmosferą. Nereikia jokios ankstesnės patirties – visi žaidimai bus lengvai suprantami, o organizatoriai pasirūpins, kad vakaras būtų kupinas juoko, energijos ir smagių įspūdžių.\r\n\r\nVisa informacija parašyta dirbtinio intelekto pagalba: https://chatgpt.com/share/69dcb0bd-9ac4-8384-aa27-af17f41c6f92', '2026-04-03 17:00:00', '2026-04-03 22:00:00', 'Mind Gym studija, Vilnius', 'everyone', 'free', 35, 'completed', '2026-04-13 09:00:30', '2026-04-13 09:02:11');

-- --------------------------------------------------------

--
-- Table structure for table `event_registrations`
--

CREATE TABLE `event_registrations` (
  `id` bigint UNSIGNED NOT NULL,
  `event_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'confirmed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_registrations`
--

INSERT INTO `event_registrations` (`id`, `event_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(11, 25, 18, 'confirmed', '2026-04-10 07:15:38', '2026-04-10 07:15:38'),
(20, 30, 18, 'confirmed', '2026-04-21 09:18:30', '2026-04-21 09:18:30'),
(21, 28, 18, 'confirmed', '2026-04-21 09:18:33', '2026-04-21 09:18:33'),
(22, 29, 18, 'confirmed', '2026-04-21 09:18:35', '2026-04-21 09:18:35'),
(23, 27, 18, 'confirmed', '2026-04-21 09:18:37', '2026-04-21 09:18:37'),
(24, 30, 15, 'confirmed', '2026-04-21 09:18:54', '2026-04-21 09:18:54'),
(25, 26, 15, 'confirmed', '2026-04-21 09:19:00', '2026-04-21 09:19:00'),
(26, 29, 15, 'confirmed', '2026-04-21 09:19:01', '2026-04-21 09:19:01'),
(28, 30, 16, 'confirmed', '2026-04-21 09:19:14', '2026-04-21 09:19:14'),
(30, 29, 16, 'confirmed', '2026-04-21 09:19:20', '2026-04-21 09:19:20'),
(33, 25, 15, 'confirmed', '2026-04-21 18:24:36', '2026-04-21 18:24:36'),
(34, 28, 20, 'confirmed', '2026-04-24 13:32:22', '2026-04-24 13:32:22'),
(38, 25, 17, 'confirmed', '2026-04-26 19:29:50', '2026-04-26 19:29:50'),
(40, 28, 16, 'confirmed', '2026-05-25 12:18:43', '2026-05-25 12:18:43');

-- --------------------------------------------------------

--
-- Table structure for table `favorite_games`
--

CREATE TABLE `favorite_games` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `game_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorite_games`
--

INSERT INTO `favorite_games` (`id`, `user_id`, `game_id`, `created_at`, `updated_at`) VALUES
(15, 15, 33, '2026-03-25 14:29:11', '2026-03-25 14:29:11'),
(16, 15, 35, '2026-03-25 14:29:11', '2026-03-25 14:29:11'),
(34, 15, 39, '2026-04-21 08:51:33', '2026-04-21 08:51:33'),
(35, 16, 34, '2026-04-21 09:08:36', '2026-04-21 09:08:36'),
(36, 16, 43, '2026-04-21 09:08:39', '2026-04-21 09:08:39'),
(40, 17, 39, '2026-04-21 16:10:01', '2026-04-21 16:10:01'),
(43, 20, 43, '2026-04-24 13:01:11', '2026-04-24 13:01:11'),
(44, 20, 38, '2026-04-24 13:31:57', '2026-04-24 13:31:57'),
(45, 20, 35, '2026-04-24 13:33:02', '2026-04-24 13:33:02'),
(46, 20, 34, '2026-04-24 13:33:07', '2026-04-24 13:33:07'),
(48, 17, 43, '2026-04-26 19:16:59', '2026-04-26 19:16:59'),
(52, 21, 40, '2026-05-19 17:52:59', '2026-05-19 17:52:59'),
(53, 21, 43, '2026-05-19 17:55:32', '2026-05-19 17:55:32'),
(54, 16, 38, '2026-05-25 12:17:57', '2026-05-25 12:17:57'),
(55, 17, 38, '2026-05-25 12:44:58', '2026-05-25 12:44:58');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_players` tinyint UNSIGNED NOT NULL,
  `max_players` tinyint UNSIGNED NOT NULL,
  `age_rating` tinyint UNSIGNED NOT NULL,
  `duration_minutes` smallint UNSIGNED DEFAULT NULL,
  `difficulty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` decimal(3,2) NOT NULL DEFAULT '0.00',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `play_tips_blocks` json DEFAULT NULL,
  `video_blocks` json DEFAULT NULL,
  `rules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rulebook_files` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `title`, `slug`, `description`, `min_players`, `max_players`, `age_rating`, `duration_minutes`, `difficulty`, `rating`, `featured`, `play_tips_blocks`, `video_blocks`, `rules`, `rulebook_files`, `created_at`, `updated_at`) VALUES
(33, '6 ima!', '6-ima', '„6 Nimmt!“ yra greitas skaičių ir rizikos valdymo kortų žaidimas, kuriame visi žaidėjai vienu metu renkasi, kurią kortą sužaisti iš savo rankos. Kortos dedamos į vieną iš keturių eilių pagal skaičių tvarką, tačiau jei tavo korta tampa šeštąja toje eilėje, turi pasiimti pirmąsias penkias kortas ir jų neigiamus taškus. Taip pat, jei tavo korta yra mažesnė už visų keturių eilių paskutines kortas, turi pasirinkti vieną eilę ir pasiimti ją visą. Tikslas yra surinkti kuo mažiau baudos taškų, žymimų jaučio galvomis. Visa informacija parašyta su dirbtinio intelekto pagalba: https://chatgpt.com/share/69dca83b-d574-8395-b393-5dcbef676dc5', 2, 10, 8, 45, '2/5', 5.00, 0, '[{\"body\": \"Iš pirmo žvilgsnio gali atrodyti, kad reikia tiesiog dėti kortą ten, kur mažiausia tikimybė paimti eilę. Tačiau kartais visi žaidėjai mato tą pačią „saugią“ vietą, todėl būtent ji tampa pavojinga. Naudinga galvoti ne tik apie savo kortą, bet ir apie tai, kokias kortas greičiausiai gali būti pasirinkę kiti.\", \"title\": \"Ne visada verta žaisti „saugiausią“ kortą\"}, {\"body\": \"Ne visos eilės vienodai blogos. Kartais viena eilė turi labai daug jaučio galvų, o kita beveik nieko. Jei matai, kad gali tekti ką nors pasiimti, geriau planuoti taip, kad blogiausiu atveju paimtum pigesnę eilę, o ne tą, kurioje sukrauta daugiausia baudos taškų.\", \"title\": \"Stebėk eiles, kuriose daug baudos taškų\"}, {\"body\": \"Jei tavo korta vis tiek per maža ir teks rinktis eilę, kartais geriau tai padaryti tada, kai ant stalo dar nėra daug blogų kortų. Tokiu būdu gali išvengti dar skaudesnio paėmimo vėliau. Kitaip tariant, kartais mažas nuostolis dabar išgelbsti nuo daug didesnio nuostolio po kelių ėjimų.\", \"title\": \"Kartais naudinga specialiai pasiimti mažiau pavojingą eilę\"}, {\"body\": \"Labai mažos kortos dažnai pavojingos, nes jos lengvai būna mažesnės už visas eiles. Labai didelės kortos irgi gali būti rizikingos, nes dažnai tampa šeštąja korta eilėje. Todėl vidutinės vertės kortos dažnai yra lanksčiausios, ir verta jas pasilikti tam momentui, kai situacija ant stalo taps sudėtingesnė.\", \"title\": \"Išsaugok vidutines kortas vėlesniam laikui\"}, {\"body\": \"„6 Nimmt!“ laimi ne tas, kuris vieną kartą sužaidžia tobulai, o tas, kuris nuosekliai išvengia blogų situacijų. Rinkdamasis kortą, pagalvok, kas liks tavo rankoje po šio ėjimo. Kartais geresnis sprendimas yra sužaisti ne pačią patogiausią kortą dabar, bet palikti sau saugesnes galimybes kitam ėjimui.\", \"title\": \"Galvok apie ėjimų seką, ne apie vieną ėjimą\"}]', '[{\"title\": \"Žaiskime 6 NIMMT | Stalo žaidimų klubas (angl.)\", \"author\": \"No Rolls Barred\", \"youtube_id\": \"MvgLf_N71to\", \"youtube_url\": \"https://www.youtube.com/watch?v=MvgLf_N71to\"}, {\"title\": \"Kaip žaisti 6 ima? (angl.)\", \"author\": \"Games Explained\", \"youtube_id\": \"fF0lnDygoes\", \"youtube_url\": \"https://www.youtube.com/watch?v=fF0lnDygoes\"}]', 'Žaidime naudojamos 104 kortos, sunumeruotos nuo 1 iki 104. Kiekvienas žaidėjas gauna po 10 kortų, o dar 4 kortos padedamos atverstos ant stalo kaip keturių eilių pradžia.\r\n\r\nKiekviename ėjime visi žaidėjai iš savo rankos pasirenka po vieną kortą ir padeda ją užverstą. Kai visi pasirenka, kortos atverčiamos ir jos sužaidžiamos didėjimo tvarka — nuo mažiausios iki didžiausios.\r\n\r\nKorta turi būti dedama prie tos eilės, kurios paskutinė korta yra mažesnė už žaidžiamą kortą ir yra arčiausiai jos pagal vertę. Pavyzdžiui, jei tavo korta yra 33, ji dedama prie 30, o ne prie 29, jei abi galimybės egzistuoja.\r\n\r\nJei pasirinktoje eilėje jau yra 5 kortos, tavo korta tampa šeštąja. Tokiu atveju turi pasiimti pirmas 5 kortas kaip baudos taškus, o tavo sužaista korta lieka kaip nauja tos eilės pradžia.\r\n\r\nJei tavo korta mažesnė už visas keturių eilių paskutines kortas, negali jos normaliai padėti. Tada privalai pasirinkti vieną iš eilių, pasiimti visas jos kortas, o savo kortą padėti kaip naują tos eilės pradžią.\r\n\r\nPo 10 ėjimų raundas baigiasi, žaidėjai suskaičiuoja surinktų kortų jaučių galvas kaip baudos taškus, ir žaidžiamas naujas raundas. Žaidimas baigiasi, kai bent vienas žaidėjas pasiekia 66 ar daugiau taškų; laimi tas, kuris tuo metu turi mažiausiai taškų.', '[{\"name\": \"6ima_taisyklės_LT.pdf\", \"path\": \"games/33/rule-books/Lu9CvTWnZ5SzFhne9UMlcNcuf4GVmub1spzMf0lm.pdf\"}, {\"name\": \"6_Nimmt_rules_EN.pdf\", \"path\": \"games/33/rule-books/wx9qM0nLUJQ0Yx2l4tyygfvLvLPiT3OPcWeeMpFS.pdf\"}]', '2026-03-25 14:29:11', '2026-04-23 16:54:23'),
(34, 'Saboteur', 'saboteur', '„Saboteur“ yra slaptų vaidmenų kortų žaidimas, kuriame žaidėjai tampa nykštukais: vieni yra aukso ieškotojai, o kiti – sabotuotojai. Aukso ieškotojai stengiasi nutiesti kelią iki lobio, o sabotuotojai bando slapta jiems trukdyti gadindami įrankius, griaudami kelią ar klaidindami kitus žaidėjus. Kadangi vaidmenys slepiami iki raundo pabaigos, žaidime labai svarbūs įtarimai, blefavimas ir komandinis darbas. Po trijų raundų laimi tas žaidėjas, kuris surenka daugiausia aukso grynuolių. Visa informacija parašyta su dirbtinio intelekto pagalba: https://chatgpt.com/share/69dca83b-d574-8395-b393-5dcbef676dc5', 3, 10, 8, 30, '3/5', 4.00, 0, '[{\"body\": \"Jei esi aukso ieškotojas, neverta per daug atvirai rodyti savo ketinimų, nes sabotuotojai greitai supras, ką blokuoti. Jei esi sabotuotojas, pernelyg ankstyvas trukdymas taip pat greitai išduoda tavo vaidmenį. Geriausiai sekasi tiems, kurie kurį laiką išlieka „pilkoje zonoje“.\", \"title\": \"Nebūk per daug akivaizdus\"}, {\"body\": \"Galimybė slapta pamatyti vieną iš tikslo kortų yra labai stipri. Ji leidžia ne tik pačiam suprasti, kur verta kasti, bet ir stebėti, kaip reaguoja kiti, kai bandai nukreipti kelią į teisingą pusę. Informacija šiame žaidime dažnai yra vertingesnė už vieną gerą tunelio kortą.\", \"title\": \"Žemėlapio korta dažnai verta daugiau nei atrodo\"}, {\"body\": \"Kartais norisi iškart pataisyti kitam žaidėjui įrankį, bet ne visada aišku, ar tas žaidėjas tikrai tavo pusėje. Geriau bent trumpai įvertinti situaciją ir pažiūrėti, kieno veiksmai labiausiai naudingi bendram tikslui. Kitaip gali netyčia padėti sabotuotojui.\", \"title\": \"Nešvaistyk taisymo kortų per anksti\"}, {\"body\": \"Kadangi dalis kortų gali būti sunaikintos griūties kortomis arba užblokuotos aklavietėmis, naudinga palikti sau galimybę pasukti kitu keliu. Žaidėjai, kurie stato per daug tiesiai ir nepalieka alternatyvų, dažnai vienu blogu ėjimu praranda visą progresą.\", \"title\": \"Mąstyk ne tik apie kelią į priekį, bet ir apie atsarginį maršrutą\"}, {\"body\": \"Vienas geriausių būdų atspėti vaidmenis yra ne vien žiūrėti, kas padeda keliui, o kas ir kam trukdo. Jei kažkas nuolat laužo įrankius tiems, kurie akivaizdžiai stumia kelią pirmyn, tai daug pasako. Kuo geriau skaitysi kitų veiksmus, tuo tiksliau pasirinksi, kam padėti, o kam nepasitikėti.\", \"title\": \"Stebėk, kas kam kenkia\"}]', '[{\"title\": \"Kaip žaisti Saboteur? 4 min. paaiškinimas (angl.)\", \"author\": \"Tabletop Duo\", \"youtube_id\": \"G6avDieg_2Q\", \"youtube_url\": \"https://www.youtube.com/watch?v=G6avDieg_2Q\"}]', 'Žaidimo pradžioje žaidėjams slapta išdalijamos vaidmenų kortos: dalis tampa aukso ieškotojais, dalis – sabotuotojais. Ant stalo padedama pradžios korta ir trys tikslo kortos, iš kurių tik viena slepia auksą. Taip pat išdalijamos žaidimo kortos; jų skaičius priklauso nuo žaidėjų skaičiaus: 3–5 žaidėjams po 6, 6–7 žaidėjams po 5, o 8–10 žaidėjų partijose po 4 kortas.\r\n\r\nPer savo ėjimą žaidėjas turi sužaisti vieną kortą. Jis gali padėti tunelio kortą į bendrą kasyklos kelią, sužaisti veiksmo kortą prieš save ar kitą žaidėją arba nusimesti vieną kortą užverstą. Po to jis traukia naują kortą iš kaladės. Tunelio kortos turi būti dedamos taip, kad jų takai sutaptų ir sudarytų nenutrūkstamą jungtį su pradžios korta.\r\n\r\nVeiksmo kortos leidžia trukdyti ar padėti. Sugedusių įrankių kortos neleidžia žaidėjui dėti tunelio kortų, taisymo kortos pataiso įrankius, žemėlapio korta leidžia slapta pažiūrėti vieną iš tikslo kortų, o griūties korta leidžia pašalinti vieną tunelio kortą iš kelio. Dėl to žaidime nuolat keičiasi situacija, o kitų tikrieji ketinimai lieka neaiškūs.\r\n\r\nRaundas baigiasi, kai iki lobio nutiesiamas nenutrūkstantis kelias arba kai baigiasi kaladė ir niekas nebegali atlikti naudingo ėjimo. Jei auksas pasiektas, laimi aukso ieškotojai; jei ne, laimi sabotuotojai. Žaidžiami trys raundai, o po jų suskaičiuojami aukso grynuoliai.', '[{\"name\": \"saboteur_rulebook_EN.pdf\", \"path\": \"games/34/rule-books/WHqoQlJOG7E7aZhquCYH2tFe53islHFaNJ19GSKZ.pdf\"}]', '2026-03-25 14:29:11', '2026-04-23 16:54:23'),
(35, 'Bohnanza', 'bohnanza', '„Bohnanza“ yra kortų žaidimas apie pupelių sodinimą, prekybą ir derliaus nuėmimą. Žaidėjai bando užsidirbti kuo daugiau monetų sodindami vienodų rūšių pupeles savo laukuose ir vėliau jas parduodami. Viena iš išskirtiniausių žaidimo savybių yra ta, kad kortų rankoje negalima perrikiuoti — jas reikia žaisti tokia tvarka, kokia jos buvo paimtos. Dėl to žaidime labai svarbios derybos, mainai ir gebėjimas prisitaikyti prie nepatogios situacijos. Visa informacija parašyta su dirbtinio intelekto pagalba: https://chatgpt.com/share/69dca83b-d574-8395-b393-5dcbef676dc5', 2, 7, 10, 45, '3/5', 4.00, 0, '[{\"body\": \"Didžiausia klaida šiame žaidime yra žiūrėti tik į tai, ką norėtum pasodinti dabar, o ne į tai, kas ateina toliau. Kadangi rankos negalima perrikiuoti, verta visada įvertinti bent kelias artimiausias kortas. Taip lengviau suprasi, ar verta dabar prekiauti, ar geriau pasilikti vietos tam, kas tuoj pasirodys rankos priekyje.\", \"title\": \"Planuok pagal savo rankos eilę\"}, {\"body\": \"Kartais žaidėjai bando sudaryti tik idealius mainus, bet „Bohnanza“ dažnai verta mainytis vien tam, kad išvengtum blogesnės situacijos kitame ėjime. Net jei mainai neatneša tobulo pelno, jie gali išgelbėti nuo ankstyvo gero lauko nuėmimo. Čia labai svarbu ne tik uždirbti, bet ir sumažinti nuostolius.\", \"title\": \"Mainyk ne tik dėl naudos, bet ir dėl problemų mažinimo\"}, {\"body\": \"Kuo daugiau vienodos rūšies pupelių sukaupsi lauke, tuo daugiau monetų gausi. Todėl dažnai apsimoka palaukti ir nerauti lauko per anksti. Žinoma, kartais dėl rankos tvarkos to išvengti nepavyksta, bet jei turi progą išlaikyti lauką ilgiau, dažniausiai tai atsiperka.\", \"title\": \"Neskubėk nuimti derliaus\"}, {\"body\": \"Geri mainai atsiranda tada, kai supranti ne tik savo, bet ir kitų poreikius. Jei matai, kad kitam žaidėjui labai reikia tam tikros pupelės, tavo siūloma korta tampa daug vertingesnė. Tokiose situacijose galima išsiderėti palankesnius mainus arba gauti pagalbą atsikratant tau nenaudingų kortų.\", \"title\": \"Stebėk, ko reikia kitiems žaidėjams\"}, {\"body\": \"„Bohnanza“ yra žaidimas, kuriame kiti žaidėjai nenori nuolat padėti tam, kuris visada pasiima didžiausią naudą. Jei tavo pasiūlymai atrodo sąžiningi ir naudingi abiem pusėms, kiti dažniau norės su tavimi prekiauti. Ilgainiui tai gali duoti daugiau naudos negu vienas labai gudrus, bet nepatikimumą sukeliantis sandoris.\", \"title\": \"Palik gerą įspūdį per derybas\"}]', NULL, 'Kiekvienas žaidėjas pradeda su dviem pupelių laukais ir keliomis kortomis rankoje. Savo ėjimo pradžioje žaidėjas privalo pasodinti pirmą kortą iš rankos, o tada gali pasodinti ir antrą. Kadangi viename lauke galima auginti tik vienos rūšies pupeles, kartais tenka nuimti jau turimą lauką anksčiau, nei norėtųsi.\r\n\r\nPo sodinimo atverčiamos dvi kortos iš kaladės. Tada prasideda prekybos fazė — žaidėjas gali siūlyti mainus kitiems, kad gautų sau naudingesnių pupelių arba atsikratytų nepatogių kortų. Išmainytos ir atverstos kortos turi būti iš karto pasodintos, jų negalima pasilikti rankoje vėlesniam laikui.\r\n\r\nKai žaidėjas nusprendžia nuimti derlių, jis suskaičiuoja, kiek tos rūšies pupelių yra lauke, ir pagal kortoje esančią pupelių skalę gauna monetų. Dalį kortų jis pasilieka kaip uždarbį, o likusios keliauja į išmetimo krūvą. Žaidimo pabaigoje laimi tas, kuris turi daugiausia monetų.\r\n\r\nŽaidimas baigiasi, kai kaladė baigiasi trečią kartą. Tada visi žaidėjai nuima likusį derlių, suskaičiuoja savo uždirbtas monetas ir išrenkamas laimėtojas.', '[{\"name\": \"Bohnanza_Rules_EN.pdf\", \"path\": \"games/35/rule-books/OPUFoiI0jpUANov7aDj6WaFr1ZQb4RIqyhviC8L4.pdf\"}]', '2026-03-25 14:29:11', '2026-04-23 16:54:23'),
(36, 'Jungle Speed', 'jungle-speed', '„Jungle Speed“ yra greitas reakcijos ir pastabumo kortų žaidimas, kuriame žaidėjai verčia kortas ir stebi, ar ant dviejų atverstų kortų pasirodo vienodi simboliai. Jei simboliai sutampa, tie žaidėjai turi kuo greičiau pagriebti stalo viduryje stovintį totemą. Lėtesnis žaidėjas pasiima kortas, todėl pagrindinis tikslas yra kuo greičiau atsikratyti visų savo kortų. Žaidime taip pat yra specialios kortos, kurios pakeičia įprastas taisykles ir sukelia dar daugiau chaoso. Visa informacija parašyta su dirbtinio intelekto pagalba: https://chatgpt.com/share/69dca83b-d574-8395-b393-5dcbef676dc5', 2, 10, 7, 15, '2/5', 5.00, 1, '[{\"body\": \"Pagrindinėje žaidimo dalyje svarbiausia atpažinti simbolio formą, nes dvikovas dažniausiai sukelia vienodi ženklai, net jei jų spalvos skiriasi. Jei per daug koncentruosiesi į spalvas, dažnai sureaguosi per vėlai arba klaidingai.\", \"title\": \"Žiūrėk į formą, ne į spalvą\"}, {\"body\": \"Naudinga sėdėti pasiruošus greitai griebti totemą, tačiau per ankstyvas rankos trūkčiojimas dažnai baigiasi klaida. Geriausia turėti neutralią, patogią poziciją, iš kurios gali greitai reaguoti, bet neprovokuosi neteisingo judesio.\", \"title\": \"Laikyk ranką pasiruošusią, bet ne per anksti\"}, {\"body\": \"Šiame žaidime daug simbolių atrodo beveik vienodi, tik su mažais skirtumais. Kuo greičiau priprasi pastebėti smulkias detales, tuo mažiau neteisingai griebsi totemą ir tuo dažniau priversi klaidą padaryti kitus.\", \"title\": \"Išmok atskirti labai panašius simbolius\"}, {\"body\": \"Specialios kortos akimirksniu pakeičia situaciją, todėl verta jas įsiminti dar prieš pirmą partiją. Kai jau iš anksto žinai, ką reiškia rodyklės, nereikia gaišti laiko galvojant, ir tavo reakcija tampa daug greitesnė.\", \"title\": \"Ypač saugokis specialių kortų\"}, {\"body\": \"Daug kortų atrodo apgaulingai panašios, todėl dažnas impulsyvus bandymas baigiasi bauda ir papildomomis kortomis. Saugiau pusę sekundės įsitikinti, kad sutapimas tikras, nei pasiimti visą stalo krūvą dėl skubotos klaidos.\", \"title\": \"Neverta griebti totemo iš baimės, kad pavėluosi\"}]', NULL, 'Stalo viduryje pastatomas totemas. Kortos išmaišomos ir kuo tolygiau išdalijamos visiems žaidėjams. Kiekvienas savo kortas laiko užverstas priešais save.\r\n\r\nŽaidimas vyksta paeiliui pagal laikrodžio rodyklę. Savo ėjimo metu žaidėjas atverčia viršutinę kortą ant savo atverstų kortų krūvelės. Kortą reikia versti nuo savęs, kad kiti žaidėjai ją pamatytų pirmi. Žaidžiama tik viena ranka.\r\n\r\nKai dviejų žaidėjų viršutinės atverstos kortos rodo tą patį simbolį, nepaisant spalvos, prasideda dvikova. Abu žaidėjai turi kuo greičiau sugriebti totemą. Tas, kuris nespėja, pasiima savo, varžovo ir centre esančias atverstas kortas ir deda jas po savo užversta kalade.\r\n\r\nJei žaidėjas neteisingai pagriebia totemą arba jį numeta, jis turi pasiimti visas ant stalo atverstas kortas.\r\n\r\nSpecialios kortos keičia žaidimą:\r\n\r\nInward-Facing Arrows – visi žaidėjai bando pagriebti totemą; laimėtojas padeda savo atverstas kortas į stalo vidurį po totemu.\r\nColored Arrows – nuo tos akimirkos dvikovas sukelia ne vienodi simboliai, o vienodos spalvos, kol efektas pasibaigia.\r\nOutward-Facing Arrows – visi žaidėjai vienu metu atverčia po kortą, ir jei atsiranda sutapimas, iškart vyksta dvikova.\r\n\r\nŽaidėjas nelaimi vien tik atsikratęs užverstų kortų — jis taip pat turi nebeturėti atverstų kortų krūvelės. Laimi tas, kuris pirmas visiškai atsikrato savo kortų.', NULL, '2026-03-25 14:29:11', '2026-04-21 08:55:30'),
(37, 'Taco Cat Goat Cheese Pizza', 'taco-cat-goat-cheese-pizza', '„Taco Cat Goat Cheese Pizza“ yra greitas, linksmas ir chaotiškas reakcijos kortų žaidimas, kuriame žaidėjai paeiliui verčia kortas ir garsiai sako žodžius „Taco“, „Cat“, „Goat“, „Cheese“, „Pizza“. Kai ištartas žodis sutampa su atversta korta, visi turi kuo greičiau pliaukštelėti per centrinę kortų krūvą. Paskutinis sureagavęs žaidėjas pasiima visas kortas, todėl tikslas yra kuo greičiau atsikratyti savo kortų ir neprarasti dėmesio. Žaidime taip pat yra specialios kortos, kurios priverčia atlikti papildomus veiksmus prieš pliaukštelint krūvą. Visa informacija parašyta su dirbtinio intelekto pagalba: https://chatgpt.com/share/69dca83b-d574-8395-b393-5dcbef676dc5', 2, 8, 8, 10, '2/5', 3.00, 0, '[{\"body\": \"Daugelis pralaimi ne todėl, kad yra lėti, o todėl, kad pasimeta žodžių sekoje. Jei mintyse visą laiką seki „Taco–Cat–Goat–Cheese–Pizza“ ritmą, greičiau atpažinsi sutapimą ir mažiau klysi. Šiame žaidime labai svarbu ne maksimalus skubėjimas, o pastovus tempas ir koncentracija.\", \"title\": \"Išlaikyk ritmą, ne tik greitį\"}, {\"body\": \"Natūralu sekti, kada kiti jau ruošiasi pliaukštelėti, bet tai dažnai tik suklaidina. Geriau visą dėmesį laikyti ties centrine krūva ir atversta korta. Taip tavo reakcija bus paremta tuo, ką matai, o ne kitų žaidėjų judesiais.\", \"title\": \"Žiūrėk į kortą, ne į kitų rankas\"}, {\"body\": \"Jei prieš žaidimą įsiminsi, kad gorila = krūtinė, švilpikas = stalas, narvalas = ragas virš galvos, reakcija taps automatinė. Tada nereikės galvoti, ką daryti, ir išvengsi bereikalingų baudų.\", \"title\": \"Išmok specialias kortas kaip refleksą\"}, {\"body\": \"Šiame žaidime net trūkčiojimas link krūvos gali kainuoti, nes klaidingas ar per ankstyvas judesys baudžiamas. Todėl geriau sureaguoti vos trupučiu vėliau, bet teisingai, nei nuolat rizikuoti pasiimti visą krūvą.\", \"title\": \"Neverta „feikinti“ judesio\"}, {\"body\": \"Net atsikračius visų kortų, dar reikia pirmam pliaukštelėti tinkamu momentu, kad tikrai laimėtum. Todėl paskutinėmis akimirkomis nereikia atsipalaiduoti — būtent tada daug kas pralaimi pergalę per vieną sekundę.\", \"title\": \"Kai nebeturi kortų, dar neatsipalaiduok\"}]', NULL, 'Visos kortos išdalijamos žaidėjams užverstos. 2–5 žaidėjų partijoje kiekvienas gauna po 12 kortų, 6 žaidėjų partijoje – po 10, o 7–8 žaidėjų partijoje – po 8 kortas; likusios grąžinamos į dėžę. Žaidėjai nežiūri į savo kortas ir laiko jas užverstas prieš save.\r\n\r\nPirmas žaidėjas verčia viršutinę savo kortą į centrinę krūvą ir sako „Taco“. Kitas žaidėjas verčia savo kortą ir sako „Cat“, tada kitas – „Goat“, po to „Cheese“, tada „Pizza“, ir ši seka kartojasi visą žaidimą.\r\n\r\nKai ištartas žodis sutampa su atverstos kortos tipu, visi žaidėjai turi kuo greičiau pliaukštelėti ranka per centrinę krūvą. Paskutinis tai padaręs žaidėjas pasiima visą krūvą ir pasideda ją po savo asmenine kortų krūvele.\r\n\r\nJei pasirodo speciali korta, prieš pliaukštelint reikia atlikti veiksmą:\r\nGorila (angl. gorilla) – visi turi mušti sau į krūtinę,\r\nŠvilpikas (angl. groundhog) – visi turi pabelsti į stalą abiem rankomis,\r\nNarvalas (angl. narwhal) – visi turi virš galvos rankomis suformuoti „ragą“.\r\n\r\nJei žaidėjas supainioja eilę, per anksti pliaukšteli, imituoja pliaukštelėjimą arba peržiūri kortą prieš atversdamas, jis baudžiamas ir turi pasiimti centrinę krūvą.\r\n\r\nLaimi tas žaidėjas, kuris pirmas atsikrato visų kortų ir tada pirmas pliaukšteli per centrinę krūvą, kai įvyksta sutapimas arba pasirodo speciali korta.', NULL, '2026-03-27 17:27:39', '2026-04-17 09:23:28'),
(38, 'Azul mini', 'azul-mini', '„Azul Mini“ yra kompaktiška kelioninė klasikinio „Azul“ versija. Žaidėjai renka vienodos spalvos plyteles iš fabrikų arba iš bendro stalo centro, dėlioja jas į savo raštų eilutes, o vėliau perkelia ant sienos, kad pelnytų taškus. Mini versija išlaiko tą patį pagrindinį žaidimą kaip originalas, tačiau yra mažesnio formato ir pritaikyta patogiau žaisti kelionėje. Visa informacija parašyta su dirbtinio intelekto pagalba: https://chatgpt.com/share/69dca83b-d574-8395-b393-5dcbef676dc5', 2, 4, 8, 40, '3/5', 5.00, 0, '[{\"body\": \"Pradedantieji dažnai per daug susikoncentruoja į gražų sienos dėliojimą ir pamiršta, kad netilpusios plytelės labai skaudžiai baudžia. Kartais geriau paimti ne idealias plyteles, bet išvengti minusinių taškų. Ilgainiui būtent grindų eilė dažnai nulemia, kas laimi.\", \"title\": \"Venk grindų eilės bet kokia kaina\"}, {\"body\": \"„Azul Mini“ yra ne tik savo dėlionės dėliojimas. Jei matai, kad kitam žaidėjui trūksta vienos konkrečios spalvos, dažnai verta ją paimti pačiam arba palikti jam nepatogų pasirinkimą. Tokie blokavimo ėjimai gali būti net vertingesni už vieną papildomą tašką sau.\", \"title\": \"Žiūrėk ne tik į savo lentą, bet ir į kitų\"}, {\"body\": \"Kartais atrodo, kad svarbiausia kuo greičiau pilnai užpildyti rašto eilutes, bet tai ne visada geriausia strategija. Naudingiau galvoti, kur ant sienos atsiras nauja plytelė ir kiek kontaktų ji sukurs su jau esančiomis. Viena gerai padėta plytelė gali duoti daug daugiau taškų nei keli atsitiktiniai užpildymai.\", \"title\": \"Ne visada verta užpildyti bet kurią eilutę\"}, {\"body\": \"Jei nuo pat pradžių bandysi vaikytis tik vienos spalvos ar vieno plano, dažnai pats save įsprausi į kampą. Geriau prisitaikyti prie to, kas iškrenta fabrikuose ir kas jau vyksta ant stalo. Lankstumas šiame žaidime beveik visada stipresnis už per didelį užsispyrimą.\", \"title\": \"Rink spalvas lanksčiai, ne užsispyrusiai\"}, {\"body\": \"Kadangi žaidimas baigiasi užpildžius horizontalią eilę, verta stebėti, kada artėja pabaiga ir kas iš to išloš. Kartais naudinga pačiam paspartinti pabaigą, o kartais geriau ją atitolinti, jei tavo lenta dar nepasiruošusi galutiniam taškų skaičiavimui. Laimi ne tas, kas vieną ėjimą padaro gražiausiai, o tas, kas geriau suvaldo visą tempą.\", \"title\": \"Planuok pabaigą, ne tik dabartinį ėjimą\"}]', '[{\"title\": \"Kaip kiekviną kartą laimėti Azul? (angl.)\", \"author\": \"StrataGames\", \"youtube_id\": \"YL40XxcN4OI\", \"youtube_url\": \"https://www.youtube.com/watch?v=YL40XxcN4OI\"}, {\"title\": \"Azul žaidimo taisyklės\", \"author\": \"Game On Table\", \"youtube_id\": \"Y7c6T1A6mT0\", \"youtube_url\": \"https://www.youtube.com/watch?v=Y7c6T1A6mT0\"}]', 'Kiekvienas žaidėjas gauna savo lentelę ir taškų žymeklį. Priklausomai nuo žaidėjų skaičiaus, ant stalo padedami fabrikai: 2 žaidėjams – 5, 3 žaidėjams – 7, 4 žaidėjams – 9. Į kiekvieną fabriką sudedamos po 4 plyteles.\r\n\r\nPer savo ėjimą žaidėjas pasiima visas vienos spalvos plyteles iš vieno fabriko arba iš stalo centro. Jei plytelės imamos iš fabriko, likusios to fabriko plytelės perkeliamos į stalo centrą. Paimtas plyteles žaidėjas deda į vieną pasirinktą savo rašto eilutę, o netilpusios plytelės keliauja į grindų eilę ir vėliau duoda minusinius taškus.\r\n\r\nKai visos plytelės paimtos, vyksta sienos dėliojimo fazė. Iš kiekvienos pilnai užpildytos rašto eilutės viena plytelė perkeliama į atitinkamą vietą sienoje, o likusios tos eilutės plytelės išmetamos. Padėjus plytelę ant sienos, skaičiuojami taškai pagal gretimas horizontales ir vertikales. Po to už minusines grindų eilės plyteles taškai atimami.\r\n\r\nŽaidimas baigiasi, kai bent vienas žaidėjas užpildo bent vieną horizontalią sienos eilę. Tada suskaičiuojami papildomi pabaigos taškai už užbaigtas eiles, stulpelius ir visas surinktas vienos spalvos plyteles. Laimi daugiausia taškų surinkęs žaidėjas.', '[{\"name\": \"azul_rulebook_EN.pdf\", \"path\": \"games/38/rule-books/rWF4eDWMeXRkDsZv1hUDrQmLM7RtHoerottgfQom.pdf\"}]', '2026-04-08 13:12:04', '2026-04-21 10:51:46'),
(39, 'Dobble', 'dobble', '„Dobble“ (arba dar kitaip „Spot it“ ) yra greitas pastabumo ir reakcijos žaidimas, sudarytas iš 55 kortų, ant kurių kiekvienoje pavaizduoti 8 simboliai. Svarbiausia žaidimo idėja ta, kad tarp bet kurių dviejų kortų visada yra vienas ir tik vienas sutampantis simbolis. Žaidėjai turi kuo greičiau jį pastebėti ir įvardyti. Žaidimas garsėja tuo, kad vienoje dėžutėje pateikiami net 5 skirtingi mini žaidimai, bet visų jų pagrindas yra tas pats — kuo greičiau rasti vienodą simbolį. Visa informacija parašyta su dirbtinio intelekto pagalba: https://chatgpt.com/share/69dca83b-d574-8395-b393-5dcbef676dc5', 2, 8, 6, 15, '1/5', 4.50, 0, '[{\"body\": \"Daug žaidėjų pralaimi laiką bandydami „perskaityti“ visą kortą. Greičiau sekasi tiems, kurie akimi ieško bendro silueto ar ryškesnio simbolio. Pirmiausia gaudyk dideles formas ir tik tada tikrink detales.\", \"title\": \"Žiūrėk į bendrą formą, ne į smulkmenas\"}, {\"body\": \"Labai padeda turėti savo sistemą, pavyzdžiui, visada akimis eiti nuo viršaus į apačią arba pagal laikrodžio rodyklę. Taip mažiau blaškaisi ir greičiau randi sutapimą. Chaotiškas žiūrėjimas dažnai tik sulėtina\", \"title\": \"Visada pradėk nuo vienos pusės\"}, {\"body\": \"Net jei pamatei sutapimą pirmas, laimėsi tik tada, jei jį aiškiai įvardysi pagal taisykles. Todėl verta ne tik pamatyti, bet ir greitai garsiai pasakyti, ką radai. Kartais užtikrintas pasakymas yra beveik toks pat svarbus kaip pati reakcija.\", \"title\": \"Sakyk simbolį aiškiai ir iškart\"}, {\"body\": \"Reikia matyti abi lyginamas kortas kaip vieną porą. Jei per daug „užstringi“ ties viena korta, akis lėčiau pagauna sutapimą. Geriau greitai šokinėti tarp abiejų vaizdų ir ieškoti to vienintelio bendro ženklo\", \"title\": \"Nesusikoncentruok tik į savo kortą\"}, {\"body\": \"Kartais smegenys sugaišta laiką bandydamos „įvardyti“ simbolį galvoje dar prieš jį pasakant. Greitesnis kelias yra tiesiog atpažinti vaizdą ir iškart ištarti pirmą tinkamą žodį. Kuo mažiau vidinio galvojimo, tuo greitesnė reakcija\", \"title\": \"Treniruokis atpažinti ne pavadinimą, o vaizdą\"}]', '[{\"title\": \"Kaip veikia Dobble žaidimas? (angl.)\", \"author\": \"Stand-up Maths\", \"youtube_id\": \"VTDKqW_GLkw\", \"youtube_url\": \"https://www.youtube.com/watch?v=VTDKqW_GLkw\"}, {\"title\": \"Kaip kiekvieną kartą laimėti Dobble? (angl.)\", \"author\": \"Way Too Simple\", \"youtube_id\": \"QbIQq9PaYh0\", \"youtube_url\": \"https://www.youtube.com/watch?v=QbIQq9PaYh0\"}, {\"title\": \"Kaip žaisti Dobble? (angl.)\", \"author\": \"Brimley Games\", \"youtube_id\": \"Y6N6UmsNGsk\", \"youtube_url\": \"https://www.youtube.com/watch?v=Y6N6UmsNGsk\"}]', '„Dobble“ galima žaisti keliais būdais, tačiau klasikinis ir dažniausiai naudojamas variantas yra toks: kiekvienam žaidėjui padedama po vieną užverstą kortą, o kaladė lieka stalo centre atversta. Visi vienu metu apverčia savo kortą ir bando kuo greičiau surasti tokį pat simbolį tarp savo kortos ir centrinės kortos. Kas pirmas teisingai pasako simbolį, pasiima centro kortą sau. Tada atverčiama kita centrinė korta, ir žaidimas tęsiasi.\r\n\r\nKituose mini žaidimuose taisyklės šiek tiek keičiasi: kartais reikia atsikratyti savo kortų, kartais perduoti jas kitam, o kartais surinkti kuo daugiau. Tačiau visuose variantuose galioja tas pats principas — tarp dviejų kortų visada yra vienas vienodas simbolis, kurį reikia kuo greičiau pastebėti.\r\n\r\nŽaidimas paprastai baigiasi tada, kai baigiasi kaladė arba kai pagal pasirinktą mini žaidimą paaiškėja laimėtojas. Kadangi skirtingi režimai turi skirtingus tikslus, prieš partiją svarbu susitarti, kurį variantą žaisite. Oficialiose taisyklėse pateikiami penki žaidimo variantai.', '[{\"name\": \"dobble_rulebook_EN.pdf\", \"path\": \"games/39/rule-books/4TUqEMHXWv2esTAPZnGrqO2ImTXv7GOGFFqs1jok.pdf\"}]', '2026-04-08 13:28:24', '2026-04-21 14:46:46'),
(40, 'Exploding kittens (NSFW edition)', 'exploding-kittens-nsfw-edition', '„Exploding Kittens: NSFW Edition“ yra suaugusiesiems skirta originalaus „Exploding Kittens“ versija su eksplicitišku humoru ir iliustracijomis, kurios nebuvo įtrauktos į šeimai skirtą leidimą. Žaidimo esmė labai paprasta: žaidėjai paeiliui traukia kortas, kol kas nors ištraukia „Exploding Kitten“ kortą ir iškrenta iš žaidimo. To galima išvengti naudojant „Defuse“ kortą arba kitomis veiksmų kortomis bandant perkelti, išvengti ar numatyti pavojų. Laimi paskutinis likęs neišsprogęs žaidėjas. Visa informacija parašyta su dirbtinio intelekto pagalba: https://chatgpt.com/share/69dca83b-d574-8395-b393-5dcbef676dc5', 2, 5, 17, 15, '2/5', 5.00, 0, '[{\"body\": \"Dažna klaida yra išmesti geras veiksmų kortas vos tik jas gavus. Geriau jas pasilikti momentui, kai kaladėje jau mažiau kortų ir rizika ištraukti „Exploding Kitten“ tampa didesnė. Tada viena gera korta gali visiškai pakeisti žaidimo eigą.\", \"title\": \"Nenaudok stiprių kortų per anksti\"}, {\"body\": \"Kai kas nors panaudoja „Defuse“, jis grąžina „Exploding Kitten“ atgal į kaladę. Net jei tiksliai nematei vietos, verta sekti, kiek po to buvo traukta kortų ir maišyta kaladė. Tokia informacija leidžia daug tiksliau numatyti, kada pavojus artėja.\", \"title\": \"Bandyk prisiminti, kur buvo padėtas sprogstantis kačiukas\"}, {\"body\": \"Kortos, leidžiančios netraukti iš kaladės arba perkeliančios riziką kitam, yra vertingiausios tada, kai beveik esi tikras, jog viršuje slypi bloga korta. Anksti panaudotos jos dažnai duoda mažai naudos, o pabaigoje gali tiesiog išgelbėti partiją.\", \"title\": \"„Skip“ ar panašias apsaugines kortas taupyk pavojingam momentui\"}, {\"body\": \"Žaidėjas be „Defuse“ yra daug pažeidžiamesnis. Jei matai, kad kažkas jau išnaudojo savo pagrindinę apsaugą, jis tampa lengvesniu taikiniu spaudimui. Tokį žaidėją galima versti dažniau traukti kortas arba palikti jam rizikingesnę situaciją.\", \"title\": \"Stebėk, kas jau naudojo savo „Defuse“\"}, {\"body\": \"Šį žaidimą laimi ne tas, kuris vien tik saugosi, o tas, kuris moka laiku spausti kitus. Jei turi galimybę priversti varžovą traukti papildomai ar palikti jam pavojingą kaladės viršų, verta tuo naudotis. Kartais geriausia gynyba yra gerai parinktas puolimas.\", \"title\": \"Ne tik ginkis, bet ir kurk nepatogias situacijas kitiems\"}]', '[{\"title\": \"Kaip žaisti Exploding Kittens? (angl.)\", \"author\": \"Triple S Games\", \"youtube_id\": \"O3BDwMx3FpE\", \"youtube_url\": \"https://www.youtube.com/watch?v=O3BDwMx3FpE\"}, {\"title\": \"Kittens Board Game!! (angl.)\", \"author\": \"Team Edge\", \"youtube_id\": \"cvAn6EQcjwA\", \"youtube_url\": \"https://www.youtube.com/watch?v=cvAn6EQcjwA\"}, {\"title\": \"Oficialus Netflix Exploding Kittens serialo treileris (angl.)\", \"author\": \"Netflix\", \"youtube_id\": \"T3F0Nt6ssLU\", \"youtube_url\": \"https://www.youtube.com/watch?v=T3F0Nt6ssLU\"}]', 'Kiekvienas žaidėjas pradeda su kortomis rankoje, tarp jų gauna po vieną „Defuse“ kortą, kuri leidžia išgyventi ištraukus sprogstančio kačiuko kortą. Likusios „Exploding Kitten“ kortos įmaišomos į kaladę taip, kad jų būtų viena mažiau nei žaidėjų. Tuomet žaidėjai paeiliui atlieka savo ėjimus.\r\n\r\nPer savo ėjimą žaidėjas gali sužaisti tiek veiksmų kortų, kiek nori, o tada turi ištraukti vieną kortą iš bendros kaladės. Veiksmų kortos leidžia, pavyzdžiui, praleisti ėjimą, priversti kitą žaidėją traukti daugiau kortų, pažiūrėti kelias viršutines kaladės kortas ar sumaišyti kaladę. Jei žaidėjas ištraukia „Exploding Kitten“ ir neturi kuo apsiginti, jis iškrenta iš žaidimo.\r\n\r\nJei žaidėjas turi „Defuse“ kortą, jis gali neutralizuoti sprogstantį kačiuką ir įdėti tą kortą atgal į kaladę pasirinktoje vietoje. Dėl to labai svarbu ne tik išgyventi, bet ir mėginti suklaidinti kitus žaidėjus, kur pavojinga korta dabar yra. Žaidimas tęsiasi tol, kol lieka tik vienas žaidėjas.', '[{\"name\": \"Exploding_Kittens_rulebook_EN.pdf\", \"path\": \"games/40/rule-books/9DtwaA90GXdRrA3Uy6LjGomQ8uZ2k0Qroo1be2OB.pdf\"}]', '2026-04-08 13:42:00', '2026-04-21 10:47:08'),
(41, 'Magnetic', 'magnetic', '„Magnetic“ yra greitas magnetų dėliojimo žaidimas, kuriame žaidėjai paeiliui deda savo magnetinius akmenėlius į virvės suformuotą žaidimo zoną. Svarbiausia užduotis — padėti magnetą taip, kad jis neprisitrauktų prie kitų jau esančių magnetų. Jei tavo ėjimo metu magnetai susijungia, turi pasiimti visus susijungusius magnetus atgal į savo atsargas. Laimi tas žaidėjas, kuris pirmas atsikrato visų savo magnetų. Visa informacija parašyta su dirbtinio intelekto pagalba: https://chatgpt.com/share/69dca83b-d574-8395-b393-5dcbef676dc5', 1, 4, 14, 15, '1/5', 0.00, 0, '[{\"body\": \"Didžiausia pradedančiųjų klaida yra bandyti taupyti vietą ir dėti magnetus per arti. Šiame žaidime saugiau nuo pat pradžių išnaudoti visą virvės plotą ir palikti kuo daugiau tarpo tarp akmenėlių. Taip sumažėja tikimybė, kad naujai dedamas magnetas staiga „pašoks“ prie kito.\", \"title\": \"Dėk magnetus kuo toliau vieną nuo kito\"}, {\"body\": \"Magnetai reaguoja ne vien į atstumą, bet ir į tai, kokiu kampu juos prineši. Jei magnetą leisi per greitai arba neatsargiai pakreipsi, jis gali prisitraukti net tada, kai atrodė, jog vietos užtenka. Todėl verta ne mesti, o labai lėtai nuleisti magnetą.\", \"title\": \"Stebėk ne tik padėjimo vietą, bet ir kryptį\"}, {\"body\": \"Jei matai, kad viena virvės zonos dalis jau pilna magnetų, stenkitės pats ten nelįsti per anksti. Daug naudingiau užimti saugesnes vietas ir palikti ankštas, rizikingas zonas kitiems žaidėjams. Tokiu būdu jie dažniau suklys ir turės pasiimti magnetus atgal.\", \"title\": \"Palik sudėtingiausias vietas varžovams\"}, {\"body\": \"Šitas žaidimas baudžia ne už blogą planą, o už per didelį pasitikėjimą savimi. Dažnai vienas skubotas judesys sugadina kelis gerus ėjimus iš eilės. Geriau padaryti lėtesnį, bet tikslų ėjimą, nei vienu neatsargiu veiksmu susigrąžinti visą krūvelę magnetų.\", \"title\": \"Neskubėk, net jei žaidimas atrodo paprastas\"}, {\"body\": \"Arčiau virvės krašto dažnai lengviau rasti saugią vietą, nes magnetai ten turi mažiau pusių, iš kurių gali būti veikiami kitų magnetų. Jei centras jau darosi pavojingas, kraštai gali būti geriausia vieta išgyventi dar kelis ėjimus ir greičiau atsikratyti savo akmenėlių.\", \"title\": \"Naudok virvės kraštus savo naudai\"}]', NULL, 'Pirmiausia ant stalo padedama virvė, kuri suformuoja uždarą žaidimo zoną. Tada visi magnetai padalijami žaidėjams kuo po lygiai.\r\n\r\nŽaidėjai paeiliui deda po vieną savo magnetą į virvės viduje esančią zoną. Magnetą reikia padėti atsargiai, nes visi magnetai tarpusavyje traukia vieni kitus.\r\n\r\nJeigu padėjus magnetą vienas ar keli magnetai susijungia į krūvelę, tas žaidėjas turi pasiimti visus susijungusius magnetus ir grąžinti juos į savo turimus magnetus. Tai yra pagrindinė šio žaidimo baudos taisyklė.\r\n\r\nŽaidimas tęsiasi tol, kol vienas žaidėjas nebeturi nė vieno magneto rankoje. Tas žaidėjas ir tampa laimėtoju.', NULL, '2026-04-08 13:53:08', '2026-04-13 08:28:21'),
(42, 'Poezija neandertalietiškai', 'poezija-neandertalietiskai', '„Poezija neandertalietiškai“ yra komandinis žodžių spėjimo žaidimas, kuriame vienas žaidėjas bando priversti savo komandą atspėti žodį ar frazę, tačiau aiškinti gali vieno ar dviejų skiemenų žodžiais. Jei pasako ilgesnį žodį, priešininkai gali jį „nubausti“ pripučiama kuoka. Žaidimas savo idėja primena „Taboo“, bet čia humoras kyla būtent iš labai ribotos kalbos ir absurdiškų bandymų sudėtingus dalykus paaiškinti kuo primityviau. Visa informacija parašyta su dirbtinio intelekto pagalba: https://chatgpt.com/share/69dca83b-d574-8395-b393-5dcbef676dc5', 2, 12, 7, 10, '2/5', 3.00, 0, '[{\"body\": \"Didžiausia klaida šiame žaidime yra bandyti kalbėti „normaliai“. Taip daug lengviau netyčia pasakyti ilgesnį žodį ir gauti baudą. Geriau galvoti labai trumpais, grubiais vaizdiniais: kas tai yra, ką daro, kaip atrodo, su kuo susiję. Kuo paprastesnis aiškinimo modelis, tuo saugiau ir greičiau tavo komanda supras.\", \"title\": \"Mąstyk ne pilnais sakiniais, o trumpais vaizdais\"}, {\"body\": \"Jei visada pradėsi nuo panašios schemos, pavyzdžiui „tai yra...“, „tu tai darai...“, „tai kaip...“, tavo komandai bus lengviau pagauti mintį. Toks ritmas padeda ir tau pačiam mažiau pasimesti. Šiame žaidime svarbu ne gražiai kalbėti, o aiškiai ir stabiliai vesti komandą link atsakymo.\", \"title\": \"Naudok pasikartojančią struktūrą\"}, {\"body\": \"Kartais atrodo, kad jau radai gerą pakaitinį žodį, bet jis gali būti per ilgas ir kainuoti taškus. Todėl verta rinktis ne gudriausią, o saugiausią variantą. Geriau pasakyti labai paprastai ir net juokingai, negu prarasti laiką ar tašką dėl vieno neatsargaus žodžio.\", \"title\": \"Venk rizikingų sinonimų\"}, {\"body\": \"Vienos komandos geriau gaudo veiksmus, kitos — daiktus, trečios — emocinius palyginimus. Jei greitai perprasi, kokio tipo užuominos tavo komandai veikia geriausiai, pradėsi rinkti taškus daug sparčiau. Šiame žaidime laimi ne tik žodyno kontrolė, bet ir gebėjimas prisitaikyti prie savo žmonių. Tai yra išvada iš pačios žaidimo mechanikos.\", \"title\": \"Stebėk, kaip mąsto tavo komanda\"}, {\"body\": \"Kadangi taisyklė labai ribojanti, visi kartais suklysta. Svarbiausia neįstrigti po vienos baudos ar nepavykusio aiškinimo. Greitas tempas čia labai svarbus, todėl geriau iškart pereiti prie naujo paprasto kampo ir tęsti, negu per ilgai galvoti apie idealų paaiškinimą. Tai praktinis patarimas, kylantis iš greito vakarėlio žaidimo formato.\", \"title\": \"Nesustok po vienos nesėkmės\"}]', NULL, 'Žaidėjai pasiskirsto į komandas. Aktyvus žaidėjas paima kortą ir per nustatytą laiką bando priversti savo komandą atspėti žodį ar frazę. Svarbiausia taisyklė — aiškinant galima vartoti vieno ar dviejų skiemens žodžius. Jei žaidėjas pasako „didelį“ žodį, kita komanda gali jį tuoj pat sustabdyti ir skirti baudą.\r\n\r\nKai komanda atspėja teisingai, pereinama prie kitos kortos ir bandoma surinkti kuo daugiau taškų iki laiko pabaigos. Po to eilė pereina kitai komandai. Žaidimo pabaigoje laimi komanda, surinkusi daugiausia taškų.', NULL, '2026-04-08 14:01:59', '2026-04-21 08:54:10'),
(43, 'Sosig', 'sosig', '„Sosig“ yra greitas, šeimai pritaikytas kortų dėliojimo žaidimas, kuriame žaidėjai kuria savo dešreles iš skirtingų galvos ir kūno dalių kortų. Tikslas yra surinkti geriausią(-ias) dešrelę(-es), vykdyti užsakymų kortas, laimėti apdovanojimus ir tuo pačiu trukdyti varžovams naudojant „Mystery Meat“ kortas. Žaidimas akcentuoja trumpą trukmę, daug tarpusavio sąveikos ir lengvą taktiką. Visa informacija parašyta su dirbtinio intelekto pagalba: https://chatgpt.com/share/69dca83b-d574-8395-b393-5dcbef676dc5', 2, 4, 10, 15, '2/5', 5.00, 0, '[{\"body\": \"Kadangi taškai ateina ne vien už gražią ar ilgą dešrelę, svarbu nuo pradžių žiūrėti į aktyvius tikslus. Jei pradėsi dėlioti be plano, gali greitai suprasti, kad tavo turima forma netinka nei užsakymui, nei apdovanojimui. Geriau kiekvieną naują dalį dėti tik tada, kai ji artina prie konkretaus tikslo.\", \"title\": \"Nestatyk dešrelės atsitiktinai\"}, {\"body\": \"Trumpame žaidime dažnai apsimoka pirmiau pasiimti paprastesnius taškus, o ne iškart siekti sudėtingiausio derinio. Jei greitai įvykdysi vieną ar du tikslus, gausi tempą ir priversi kitus vytis. Tokiuose žaidimuose ankstyvas pranašumas dažnai labai svarbus.\", \"title\": \"Pirmiausia gaudyk lengviausiai įvykdomus tikslus\"}, {\"body\": \"Jei matai, kad kažkas aiškiai stato ilgą, lenktą ar kitaip specifinę dešrelę, gali numatyti, kokio užsakymo ar apdovanojimo jis siekia. Tada lengviau nuspręsti, kada verta panaudoti „Mystery Meat“ ar kada pačiam perimti naudingą tikslą. Šiame žaidime daug duoda ne tik savo planas, bet ir kitų planų skaitymas.\", \"title\": \"Stebėk, ko siekia kiti žaidėjai\"}, {\"body\": \"Kenkti kitam žaidėjui verta tada, kai jo progresas jau beveik atneša taškus. Jei sabotuoji per anksti, poveikis gali būti menkas, nes jis dar spės persitvarkyti. Daug naudingiau smogti tada, kai varžovas beveik užbaigė svarbų tikslą\", \"title\": \"Mystery Meat naudok laiku, ne bet kada\"}, {\"body\": \"Kartais žaidėjai per daug prisiriša prie vienos idealios konstrukcijos. Bet jei iškrenta nepalankios kortos ar pasikeičia situacija, toks planas greitai subyra. Geriau kurti taip, kad tavo dešrelė galėtų tikti keliems skirtingiems tikslams, o ne tik vienam.\", \"title\": \"Lankstumas svarbiau už tobulą vieną dešrelę\"}]', NULL, 'Kiekvienas žaidėjas savo žaidimo zonoje dėlioja dešreles iš galvos ir kūno dalių kortų. Žaidimo metu žaidėjai renka ir jungia kortas taip, kad jų dešrelė atitiktų skirtingų tikslų reikalavimus. Tikslai gali būti susiję su ilgiu, forma ar specialiais apdovanojimais, pavyzdžiui, „3 Card Sosig“, „Hooky Sosig“ ar „Most Sosigs“. \r\n\r\nŽaidime naudojamos kelios tikslų rūšys: Body tikslai, Head tikslai, Order tikslai, Award tikslai ir Mystery Meat kortos. Žaidėjai turi vykdyti maisto užsakymus, siekti apdovanojimų ir sabotuoti kitus.\r\n\r\n„Mystery Meat“ kortos leidžia kenkti varžovams ar kitaip keisti situaciją žaidime, todėl vien savo dešrelės statyti neužtenka - reikia stebėti ir kitų progresą. Laimi tas žaidėjas, kuris geriausiai įvykdo tikslus ir surenka daugiausia naudos iš savo sukurtų dešrelių.', NULL, '2026-04-08 14:09:21', '2026-05-22 21:56:14');

-- --------------------------------------------------------

--
-- Table structure for table `game_reviews`
--

CREATE TABLE `game_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `game_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `rating` tinyint UNSIGNED NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `game_reviews`
--

INSERT INTO `game_reviews` (`id`, `game_id`, `user_id`, `rating`, `body`, `created_at`, `updated_at`, `deleted_at`) VALUES
(15, 33, 15, 5, 'Labai smagus pasirinkimas vakarui, kai norisi greito tempo ir daug juoko.', '2026-03-25 14:29:11', '2026-03-25 14:29:11', NULL),
(16, 34, 16, 4, 'Puikus blefo žaidimas, tik labai priklauso nuo kompanijos energijos.', '2026-03-25 14:29:11', '2026-03-25 14:29:11', NULL),
(18, 34, 17, 4, 'Geras žaidimas, bet įdomus tik tada kai žaidėjų kiekis didesnis. Tryse jau ne taip įdomu žaisti, nes akivaizdu', '2026-04-01 13:12:17', '2026-04-16 14:29:14', NULL),
(19, 42, 18, 3, 'Linksmas chaosas, daug juoko, bet jei ieškai rimtos strategijos – čia ne tas.', '2026-04-10 11:03:46', '2026-04-21 08:54:10', NULL),
(20, 40, 16, 5, 'NUOSTABUS ŽAIDIMAS! Labai iliustracijos juokingos', '2026-04-16 14:31:15', '2026-04-16 14:31:37', NULL),
(21, 37, 17, 3, 'Geras žaidimas, bet susitrankėme rankas...', '2026-04-17 09:23:28', '2026-04-17 09:23:28', NULL),
(22, 39, 18, 5, 'Smagus lengvas žaidimas, tinka vaikams', '2026-04-17 09:24:31', '2026-04-17 09:24:31', NULL),
(23, 43, 17, 5, 'Labai smagus ir kompaktiškas žaidimas', '2026-04-20 15:31:50', '2026-04-20 15:31:50', NULL),
(24, 43, 16, 5, 'Labai smagus ir greitas, taisyklės perprantamos per 5 minutes. Puikiai tinka vakarui su draugais', '2026-04-21 08:51:00', '2026-04-21 08:51:00', NULL),
(25, 39, 15, 4, 'Mums su šeima buvo super, vaikai greit įsivažiavo. Tik gaila, kad dėžutėje nėra aiškesnio taisyklių pavyzdžio.', '2026-04-21 08:51:45', '2026-04-21 08:51:45', NULL),
(26, 38, 15, 5, 'Strategijos daugiau nei tikėjausi – pirmą kartą pralaimėjau, bet norisi žaisti dar', '2026-04-21 08:52:09', '2026-04-21 08:52:09', NULL),
(27, 35, 15, 3, 'Ne man – per daug priklauso nuo sėkmės. Norėjosi daugiau kontrolės', '2026-04-21 08:52:49', '2026-04-21 08:52:49', NULL),
(28, 35, 18, 5, 'Puikiai veikia dviese! Nustebino, kad taip gerai balansuoja ir mažam žaidėjų skaičiui', '2026-04-21 08:53:44', '2026-04-21 08:53:44', NULL),
(29, 36, 16, 5, 'Patiko, kad nereikia ilgai ruoštis – išsitraukei ir žaidi. Idealu, kai nėra laiko', '2026-04-21 08:55:30', '2026-04-21 08:55:30', NULL),
(30, 38, 17, 5, 'Wow', '2026-05-25 12:45:28', '2026-05-25 12:45:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `game_review_comments`
--

CREATE TABLE `game_review_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `game_review_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `game_review_comments`
--

INSERT INTO `game_review_comments` (`id`, `game_review_id`, `user_id`, `body`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 22, 16, 'Visiškai pritariu! Siūlyčiau pažaisti Magnetic žaidimą', '2026-04-17 09:26:33', '2026-04-17 09:26:33', NULL),
(2, 22, 18, 'Ačiū labai už patarimą!', '2026-04-17 09:27:25', '2026-04-17 09:27:25', NULL),
(3, 19, 17, 'Gal žinai kokių panašių žaidimų?', '2026-04-17 17:07:21', '2026-04-17 17:07:21', NULL),
(4, 23, 15, 'Puikiai tinka ir \"Dobble\"!!!', '2026-04-21 18:24:45', '2026-04-21 18:24:45', NULL),
(5, 26, 20, 'Aš irgi taip pradžioje galvojau - dabar mėgstamiausias žaidimas', '2026-04-24 13:01:55', '2026-04-24 13:01:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `game_tag`
--

CREATE TABLE `game_tag` (
  `id` bigint UNSIGNED NOT NULL,
  `game_id` bigint UNSIGNED NOT NULL,
  `game_tag_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `game_tag`
--

INSERT INTO `game_tag` (`id`, `game_id`, `game_tag_id`, `created_at`, `updated_at`) VALUES
(75, 33, 37, '2026-03-25 14:29:11', '2026-03-25 14:29:11'),
(76, 33, 36, '2026-03-25 14:29:11', '2026-03-25 14:29:11'),
(77, 33, 38, '2026-03-25 14:29:11', '2026-03-25 14:29:11'),
(79, 34, 40, '2026-03-25 14:29:11', '2026-03-25 14:29:11'),
(80, 35, 39, '2026-03-25 14:29:11', '2026-03-25 14:29:11'),
(81, 35, 36, '2026-03-25 14:29:11', '2026-03-25 14:29:11'),
(82, 35, 38, '2026-03-25 14:29:11', '2026-03-25 14:29:11'),
(83, 36, 37, '2026-03-25 14:29:11', '2026-03-25 14:29:11'),
(84, 36, 36, '2026-03-25 14:29:11', '2026-03-25 14:29:11'),
(85, 37, 37, '2026-03-27 17:27:39', '2026-03-27 17:27:39'),
(86, 37, 39, '2026-03-27 17:27:39', '2026-03-27 17:27:39'),
(87, 37, 36, '2026-03-27 17:27:39', '2026-03-27 17:27:39'),
(95, 37, 40, '2026-04-08 10:54:13', '2026-04-08 10:54:13'),
(96, 36, 39, '2026-04-08 11:03:12', '2026-04-08 11:03:12'),
(97, 36, 40, '2026-04-08 11:03:12', '2026-04-08 11:03:12'),
(98, 35, 40, '2026-04-08 12:17:04', '2026-04-08 12:17:04'),
(99, 34, 39, '2026-04-08 12:24:04', '2026-04-08 12:24:04'),
(100, 34, 38, '2026-04-08 12:24:04', '2026-04-08 12:24:04'),
(101, 34, 36, '2026-04-08 12:24:04', '2026-04-08 12:24:04'),
(102, 33, 39, '2026-04-08 12:56:21', '2026-04-08 12:56:21'),
(103, 38, 38, '2026-04-08 13:12:04', '2026-04-08 13:12:04'),
(104, 38, 36, '2026-04-08 13:12:04', '2026-04-08 13:12:04'),
(105, 39, 37, '2026-04-08 13:28:24', '2026-04-08 13:28:24'),
(106, 39, 36, '2026-04-08 13:28:24', '2026-04-08 13:28:24'),
(107, 39, 39, '2026-04-08 13:28:24', '2026-04-08 13:28:24'),
(108, 40, 39, '2026-04-08 13:42:00', '2026-04-08 13:42:00'),
(109, 40, 37, '2026-04-08 13:42:00', '2026-04-08 13:42:00'),
(110, 40, 38, '2026-04-08 13:42:00', '2026-04-08 13:42:00'),
(111, 40, 40, '2026-04-08 13:42:00', '2026-04-08 13:42:00'),
(112, 41, 37, '2026-04-08 13:53:08', '2026-04-08 13:53:08'),
(113, 41, 36, '2026-04-08 13:53:08', '2026-04-08 13:53:08'),
(114, 41, 38, '2026-04-08 13:53:08', '2026-04-08 13:53:08'),
(115, 41, 40, '2026-04-08 13:53:08', '2026-04-08 13:53:08'),
(116, 42, 40, '2026-04-08 14:01:59', '2026-04-08 14:01:59'),
(117, 42, 37, '2026-04-08 14:01:59', '2026-04-08 14:01:59'),
(118, 42, 36, '2026-04-08 14:01:59', '2026-04-08 14:01:59'),
(119, 42, 39, '2026-04-08 14:01:59', '2026-04-08 14:01:59'),
(120, 43, 36, '2026-04-08 14:09:21', '2026-04-08 14:09:21'),
(121, 43, 37, '2026-04-08 14:09:21', '2026-04-08 14:09:21'),
(122, 43, 38, '2026-04-08 14:09:21', '2026-04-08 14:09:21'),
(123, 43, 39, '2026-04-08 14:09:22', '2026-04-08 14:09:22');

-- --------------------------------------------------------

--
-- Table structure for table `game_tags`
--

CREATE TABLE `game_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `game_tags`
--

INSERT INTO `game_tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(36, 'Tinka šeimai', 'seimai', '2026-03-25 14:29:11', '2026-03-25 14:29:11'),
(37, 'Party žaidimas', 'party', '2026-03-25 14:29:11', '2026-03-25 14:29:11'),
(38, 'Strateginis', 'strategija', '2026-03-25 14:29:11', '2026-03-25 14:29:11'),
(39, 'Kortų žaidimas', 'kortos', '2026-03-25 14:29:11', '2026-03-25 14:29:11'),
(40, 'Komunikacijos', 'komunikacija', '2026-03-25 14:29:11', '2026-03-25 14:29:11'),
(41, 'Bendradarbiavimas (Co-op)', 'bendradarbiavimas-co-op', '2026-03-26 12:26:54', '2026-03-26 12:26:54'),
(42, 'Klausimai/viktorinos', 'klausimai-viktorinos', '2026-03-26 12:26:54', '2026-03-26 12:26:54'),
(43, 'Kariniai', 'kariniai', '2026-03-26 12:26:54', '2026-03-26 12:26:54'),
(44, 'Nuotykių', 'nuotykiu', '2026-03-26 12:26:54', '2026-03-26 12:26:54'),
(45, 'Rolės (RPG)', 'roles-rpg', '2026-03-26 12:26:54', '2026-03-26 12:26:54');

-- --------------------------------------------------------

--
-- Table structure for table `media_images`
--

CREATE TABLE `media_images` (
  `id` bigint UNSIGNED NOT NULL,
  `imageable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageable_id` bigint UNSIGNED NOT NULL,
  `disk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint UNSIGNED NOT NULL DEFAULT '0',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_images`
--

INSERT INTO `media_images` (`id`, `imageable_type`, `imageable_id`, `disk`, `path`, `original_name`, `mime_type`, `size`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Game', 36, 'public', 'images/games/69/79/697967d1bcab3bd83c06c636f0be3108afae3a47.jpg', 'IMG_20251118_145809689_HDR~2.jpg', 'image/jpeg', 2615253, 1, '2026-03-26 16:34:11', '2026-03-26 16:34:11'),
(2, 'App\\Models\\Game', 36, 'public', 'images/games/e5/67/e567d006d621683ac4882dc23ce780b662b889a7.jpg', 'IMG_20251118_150015679_HDR~2.jpg', 'image/jpeg', 2887326, 2, '2026-03-26 16:34:11', '2026-03-26 16:34:11'),
(3, 'App\\Models\\Game', 36, 'public', 'images/games/e7/e4/e7e4aaa3f46947ddd3e7cbb174e08258dd7d1f81.jpg', 'IMG_20251118_150033505_HDR~2.jpg', 'image/jpeg', 2754264, 3, '2026-03-26 16:34:11', '2026-03-26 16:34:11'),
(4, 'App\\Models\\Game', 36, 'public', 'images/games/60/0f/600fbdae749d73377e947f28806dd27d310e9591.jpg', 'IMG_20251118_150257099_HDR~2.jpg', 'image/jpeg', 2188018, 4, '2026-03-26 16:34:11', '2026-03-26 16:34:11'),
(5, 'App\\Models\\Game', 36, 'public', 'images/games/5a/18/5a18b90bfc73ded11fdb28dfeb02c1bc1ae79da6.jpg', 'IMG_20251118_150302557_HDR~2.jpg', 'image/jpeg', 2549852, 5, '2026-03-26 16:34:11', '2026-03-26 16:34:11'),
(6, 'App\\Models\\Game', 35, 'public', 'images/games/93/2b/932b28f5df9db3a23eb5094bee0704a1a29b690e.jpg', 'IMG_20251118_135539576_HDR~2.jpg', 'image/jpeg', 2531582, 1, '2026-03-27 17:02:59', '2026-03-27 17:02:59'),
(7, 'App\\Models\\Game', 35, 'public', 'images/games/a7/48/a74817909492c2334d5466932eea945e81c18b15.jpg', 'IMG_20251118_135624554_HDR~2.jpg', 'image/jpeg', 2627255, 2, '2026-03-27 17:02:59', '2026-03-27 17:02:59'),
(8, 'App\\Models\\Game', 35, 'public', 'images/games/7c/33/7c33662e9870f57546c7475d91bf0f8fd71e0085.jpg', 'IMG_20251118_135932416_HDR~2.jpg', 'image/jpeg', 3113526, 3, '2026-03-27 17:02:59', '2026-03-27 17:02:59'),
(9, 'App\\Models\\Game', 35, 'public', 'images/games/f1/53/f1533417e410330bc1af0dac0ff52594dd71e19c.jpg', 'IMG_20251118_140626498_HDR~2.jpg', 'image/jpeg', 2669426, 4, '2026-03-27 17:02:59', '2026-03-27 17:02:59'),
(10, 'App\\Models\\Game', 34, 'public', 'images/games/5b/f1/5bf17ea98909f64f07eb11e284da1862b4e53799.jpg', 'IMG_20251118_141520688_HDR~2.jpg', 'image/jpeg', 2675914, 1, '2026-03-27 17:03:33', '2026-03-27 17:03:33'),
(11, 'App\\Models\\Game', 34, 'public', 'images/games/62/22/622286f22caa7e525bb5d0f2e11d032869729f35.jpg', 'IMG_20251118_141540468_HDR~2.jpg', 'image/jpeg', 2518013, 2, '2026-03-27 17:03:33', '2026-03-27 17:03:33'),
(12, 'App\\Models\\Game', 34, 'public', 'images/games/05/10/05109d7362edb469ad06f801c81995014397c68b.jpg', 'IMG_20251118_141907334_HDR~2.jpg', 'image/jpeg', 3192075, 3, '2026-03-27 17:03:33', '2026-03-27 17:03:33'),
(13, 'App\\Models\\Game', 34, 'public', 'images/games/0a/4d/0a4d4ed022613fca6991223bb70638024ddbfebe.jpg', 'IMG_20251118_142504470_HDR~2.jpg', 'image/jpeg', 2968787, 4, '2026-03-27 17:03:33', '2026-03-27 17:03:33'),
(14, 'App\\Models\\Game', 34, 'public', 'images/games/17/da/17da1ae49241bca6b7cb9c7839b4de628c4d13bc.jpg', 'IMG_20251118_142512110_HDR~2.jpg', 'image/jpeg', 2934899, 5, '2026-03-27 17:03:33', '2026-03-27 17:03:33'),
(15, 'App\\Models\\Game', 33, 'public', 'images/games/6b/a9/6ba993b38a507527bc46458fad0fb168fe1a45f6.jpg', 'IMG_20251118_144617724_HDR~2.jpg', 'image/jpeg', 2766271, 1, '2026-03-27 17:03:49', '2026-03-27 17:03:49'),
(16, 'App\\Models\\Game', 33, 'public', 'images/games/7d/5a/7d5a4abd9c83384357f0145d47f685daf251876a.jpg', 'IMG_20251118_144637970_HDR~2.jpg', 'image/jpeg', 3026190, 2, '2026-03-27 17:03:49', '2026-03-27 17:03:49'),
(17, 'App\\Models\\Game', 33, 'public', 'images/games/7b/f3/7bf38fb2f0c8a5cc54b5924ad38bf8e8d11bafc2.jpg', 'IMG_20251118_144938821_HDR~2.jpg', 'image/jpeg', 2457433, 3, '2026-03-27 17:03:49', '2026-03-27 17:03:49'),
(18, 'App\\Models\\Game', 33, 'public', 'images/games/19/3f/193faf9a3b9cf73678d3e6539f069fc56dd80766.jpg', 'IMG_20251118_144943424_HDR~2.jpg', 'image/jpeg', 2718509, 4, '2026-03-27 17:03:49', '2026-03-27 17:03:49'),
(19, 'App\\Models\\Game', 33, 'public', 'images/games/00/d6/00d6a4ece6abd4c90f7ca9ae2480729db717c69a.jpg', 'IMG_20251118_145249552_HDR~2.jpg', 'image/jpeg', 2503167, 5, '2026-03-27 17:03:49', '2026-03-27 17:03:49'),
(20, 'App\\Models\\Game', 37, 'public', 'images/games/70/4e/704e923124b52f210e96bcaf86ed0105fcdae906.jpg', 'IMG_20251118_142705255_HDR~2.jpg', 'image/jpeg', 2234799, 1, '2026-03-27 17:27:40', '2026-03-27 17:27:40'),
(21, 'App\\Models\\Game', 37, 'public', 'images/games/93/17/9317a0b26ea5106e25aa0bee46319767ebf25c46.jpg', 'IMG_20251118_142722423_HDR~2.jpg', 'image/jpeg', 2426410, 2, '2026-03-27 17:27:40', '2026-03-27 17:27:40'),
(22, 'App\\Models\\Game', 37, 'public', 'images/games/4e/19/4e1983fa2be8d6281d6de0787a455b412aada6e3.jpg', 'IMG_20251118_142816983_HDR~2.jpg', 'image/jpeg', 2206284, 3, '2026-03-27 17:27:40', '2026-03-27 17:27:40'),
(23, 'App\\Models\\Game', 37, 'public', 'images/games/92/38/92380650b685d52f1821338ef9f189fd18157c01.jpg', 'IMG_20251118_144218917_HDR~2.jpg', 'image/jpeg', 2633728, 4, '2026-03-27 17:27:40', '2026-03-27 17:27:40'),
(24, 'App\\Models\\Game', 37, 'public', 'images/games/db/0c/db0c9adae54f0167fe4bdab2f6820675f00c70b9.jpg', 'IMG_20251118_144444901_HDR~2.jpg', 'image/jpeg', 2397256, 5, '2026-03-27 17:27:40', '2026-03-27 17:27:40'),
(25, 'App\\Models\\Event', 25, 'public', 'images/events/99/e3/99e302a9aa4b0b5b1caa0d0d9630f24da439623f.jpg', 'CatanVSCarcassonne-1024x683.jpg', 'image/jpeg', 101315, 1, '2026-04-07 09:19:44', '2026-04-07 09:19:44'),
(26, 'App\\Models\\Event', 26, 'public', 'images/events/6e/d6/6ed6925ffd91bde6c7c29971fb1757f884f8e9de.jpeg', 'pexels-photo-776654.jpeg', 'image/jpeg', 709146, 1, '2026-04-08 07:45:03', '2026-04-08 07:45:03'),
(27, 'App\\Models\\Event', 27, 'public', 'images/events/a6/59/a6598b2ec894abe21dee53034be69f9e4ddf3b21.jpg', 'images.jpg', 'image/jpeg', 8542, 1, '2026-04-08 10:14:14', '2026-04-08 10:14:14'),
(28, 'App\\Models\\Event', 30, 'public', 'images/events/19/3a/193a20e9ed6a4684890f45163df5981fa95da6c6.jpeg', 'pexels-photo-8111367.jpeg', 'image/jpeg', 1869864, 1, '2026-04-08 10:15:59', '2026-04-08 10:15:59'),
(29, 'App\\Models\\Game', 38, 'public', 'images/games/83/aa/83aa86adc43167937ce76be2b09ecaaccfa58ddf.jpg', 'IMG_20251118_124150496_HDR~2.jpg', 'image/jpeg', 2573247, 1, '2026-04-08 13:12:04', '2026-04-08 13:12:04'),
(30, 'App\\Models\\Game', 38, 'public', 'images/games/3e/0e/3e0e4fa58cba36e5e8e6a8e368d7e0583c7eb916.jpg', 'IMG_20251118_124555163_HDR~2.jpg', 'image/jpeg', 3267954, 2, '2026-04-08 13:12:04', '2026-04-08 13:12:04'),
(31, 'App\\Models\\Game', 38, 'public', 'images/games/24/76/24763e8af75b4b18692048ff1ad835935660b960.jpg', 'IMG_20251118_125025459_HDR~2.jpg', 'image/jpeg', 2818208, 3, '2026-04-08 13:12:04', '2026-04-08 13:12:04'),
(32, 'App\\Models\\Game', 38, 'public', 'images/games/98/26/9826cea3504e4e9859046c85e5c26e8ecfeac061.jpg', 'IMG_20251118_125044131_HDR~2.jpg', 'image/jpeg', 2289502, 4, '2026-04-08 13:12:04', '2026-04-08 13:12:04'),
(33, 'App\\Models\\Game', 39, 'public', 'images/games/03/3b/033bb5bda5e524315b6929559dc8874cd8081801.jpg', 'IMG_20251117_172219651_HDR~2 (1).jpg', 'image/jpeg', 1939987, 1, '2026-04-08 13:28:24', '2026-04-08 13:28:24'),
(34, 'App\\Models\\Game', 39, 'public', 'images/games/e6/3d/e63da2248b8091c51b6ec56388f4fc74edcbbc2a.jpg', 'IMG_20251117_172240319_HDR~2 (1).jpg', 'image/jpeg', 2145950, 2, '2026-04-08 13:28:24', '2026-04-08 13:28:24'),
(35, 'App\\Models\\Game', 39, 'public', 'images/games/7a/f3/7af3d812f7bc51af463b187137d74305ae58b38f.jpg', 'IMG_20251117_172307845_HDR~2 (1).jpg', 'image/jpeg', 2199467, 3, '2026-04-08 13:28:24', '2026-04-08 13:28:24'),
(36, 'App\\Models\\Game', 39, 'public', 'images/games/d0/5e/d05e9634ef1cd2c568afb92c2d81c0854951b297.jpg', 'IMG_20251117_172348566_HDR~2 (1).jpg', 'image/jpeg', 2602476, 4, '2026-04-08 13:28:24', '2026-04-08 13:28:24'),
(37, 'App\\Models\\Game', 40, 'public', 'images/games/27/e1/27e1a2f61d01cf64924793e0fc5d5adc4c11490c.jpg', 'IMG_20251118_125456054_HDR~2.jpg', 'image/jpeg', 2243850, 1, '2026-04-08 13:42:00', '2026-04-08 13:42:00'),
(38, 'App\\Models\\Game', 40, 'public', 'images/games/bb/63/bb63080059d6aad1c8d44bbd2be049c9e8e09d4f.jpg', 'IMG_20251118_125805073_HDR~2.jpg', 'image/jpeg', 2056880, 2, '2026-04-08 13:42:00', '2026-04-08 13:42:00'),
(39, 'App\\Models\\Game', 40, 'public', 'images/games/7e/ef/7eef476d305b3578d7a1177c091c2d5d1bf2b5f0.jpg', 'IMG_20251118_130300399_HDR~2.jpg', 'image/jpeg', 2751819, 3, '2026-04-08 13:42:00', '2026-04-08 13:42:00'),
(40, 'App\\Models\\Game', 40, 'public', 'images/games/ea/62/ea620a3d8da275eecaf9ab2727f34d9c637fa6dd.jpg', 'IMG_20251118_130829917_HDR~2.jpg', 'image/jpeg', 2598058, 4, '2026-04-08 13:42:00', '2026-04-08 13:42:00'),
(41, 'App\\Models\\Game', 40, 'public', 'images/games/d0/25/d02571a395198305985e79a68146e92ce87f7558.jpg', 'IMG_20251118_130850577_HDR~2.jpg', 'image/jpeg', 2504329, 5, '2026-04-08 13:42:00', '2026-04-08 13:42:00'),
(42, 'App\\Models\\Game', 41, 'public', 'images/games/5f/35/5f3543b0bb1662619a19391df14130c0c4466c27.jpg', 'IMG_20251118_141138347_HDR~2.jpg', 'image/jpeg', 1867327, 1, '2026-04-08 13:53:08', '2026-04-08 13:53:08'),
(43, 'App\\Models\\Game', 41, 'public', 'images/games/2f/70/2f70a253fd81d7280dde37d705fcf1119735c9da.jpg', 'IMG_20251118_141325215_HDR~2.jpg', 'image/jpeg', 2387035, 2, '2026-04-08 13:53:08', '2026-04-08 13:53:08'),
(44, 'App\\Models\\Game', 41, 'public', 'images/games/34/12/3412f72aa63d4842c113e62f6389786fb31ccd50.jpg', 'IMG_20251118_141426130_HDR~2.jpg', 'image/jpeg', 2565951, 3, '2026-04-08 13:53:08', '2026-04-08 13:53:08'),
(45, 'App\\Models\\Game', 42, 'public', 'images/games/e1/54/e154b0df82efdcfc757fec97e64ceeb4052e413f.jpg', 'IMG_20251118_135204741_HDR~2.jpg', 'image/jpeg', 2121652, 1, '2026-04-08 14:01:59', '2026-04-08 14:01:59'),
(46, 'App\\Models\\Game', 42, 'public', 'images/games/c1/a4/c1a4cf9b9b42f658422bf1b5da03380a4cb38559.jpg', 'IMG_20251118_135247293_HDR~2.jpg', 'image/jpeg', 2049411, 2, '2026-04-08 14:01:59', '2026-04-08 14:01:59'),
(47, 'App\\Models\\Game', 42, 'public', 'images/games/c0/12/c0120f8bfeffe0a3a6214169eb7d1786f443772d.jpg', 'IMG_20251118_135347191_HDR~2.jpg', 'image/jpeg', 2192007, 3, '2026-04-08 14:01:59', '2026-04-08 14:01:59'),
(48, 'App\\Models\\Game', 42, 'public', 'images/games/a0/33/a033a47d146e5ebdc05a0771d3637f9942f7bd2b.jpg', 'IMG_20251118_135426625_HDR~2.jpg', 'image/jpeg', 2495227, 4, '2026-04-08 14:01:59', '2026-04-08 14:01:59'),
(49, 'App\\Models\\Game', 43, 'public', 'images/games/2c/ea/2cea6bb923599f8449ea0c5b062d484f0927de12.jpg', 'IMG_20251118_134025547_HDR~2.jpg', 'image/jpeg', 1915301, 1, '2026-04-08 14:09:22', '2026-05-22 21:56:14'),
(50, 'App\\Models\\Game', 43, 'public', 'images/games/29/0b/290b8b989625c929dc0124d085236a4793f3d367.jpg', 'IMG_20251118_134058956_HDR~2.jpg', 'image/jpeg', 1853481, 3, '2026-04-08 14:09:22', '2026-05-22 21:56:14'),
(51, 'App\\Models\\Game', 43, 'public', 'images/games/00/8c/008cfcfdb0927d69192d3a6e29327cc3c5d71d66.jpg', 'IMG_20251118_134114725_HDR~2.jpg', 'image/jpeg', 2022407, 2, '2026-04-08 14:09:22', '2026-05-22 21:56:14'),
(52, 'App\\Models\\Game', 43, 'public', 'images/games/a7/c5/a7c50031d8488b91ba107ebd371b910400827405.jpg', 'IMG_20251118_134633765_HDR~2.jpg', 'image/jpeg', 3174021, 5, '2026-04-08 14:09:22', '2026-05-22 21:56:14'),
(53, 'App\\Models\\Game', 43, 'public', 'images/games/2b/18/2b187be499ee5cae3d015e07c3062fffa1a644aa.jpg', 'IMG_20251118_134922249_HDR~2.jpg', 'image/jpeg', 2752283, 4, '2026-04-08 14:09:22', '2026-05-22 21:56:14'),
(55, 'App\\Models\\Article', 25, 'public', 'images/articles/c1/73/c17386d2feb50e3a51dcae40dfb8e7a57736cd26.jpg', 'creative_storytelling_through_improvisation.jpg', 'image/jpeg', 70637, 1, '2026-04-17 12:03:31', '2026-04-17 12:03:31'),
(56, 'App\\Models\\Article', 26, 'public', 'images/articles/cd/19/cd1967e4728e98dea1657ef88e0611928a563d8b.jpg', 'Go_(13×13)_--_2021_--_6728.jpg', 'image/jpeg', 13243598, 1, '2026-04-17 12:08:28', '2026-04-17 12:08:28'),
(57, 'App\\Models\\Article', 29, 'public', 'images/articles/ee/6a/ee6a38dbc13c99326b00eff078943969b8e65cb5.jpg', '20944.jpg', 'image/jpeg', 536038, 1, '2026-04-17 12:14:28', '2026-04-17 12:14:28'),
(58, 'App\\Models\\Article', 27, 'public', 'images/articles/22/ff/22ff0e58e45946f5ab408410741eea1229f4d6eb.jpg', 'working_together_in_games.jpg', 'image/jpeg', 139535, 1, '2026-04-21 09:32:25', '2026-04-21 09:32:25');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2026_02_08_101742_create_users_table', 1),
(2, '2026_02_13_154118_add_profile_fields_to_users_table', 2),
(3, '2026_02_17_112936_create_games_table', 3),
(4, '2026_02_17_153804_create_game_tags_table', 3),
(5, '2026_02_17_160921_create_game_tag_table', 3),
(6, '2026_02_18_110513_create_favorite_games_table', 4),
(7, '2026_02_25_104318_create_articles_table', 5),
(8, '2026_02_27_142019_create_events_table', 6),
(9, '2026_02_27_165533_create_event_registrations_table', 6),
(10, '2026_03_03_111629_create_game_reviews_table', 7),
(11, '2026_03_03_150846_create_article_comments_table', 7),
(12, '2026_03_04_103257_create_contact_messages_table', 8),
(13, '2026_03_04_160412_create_cms_users_table', 8),
(14, '2026_03_09_112044_add_rulebook_files_to_games_table', 9),
(15, '2026_03_10_144827_create_media_images_table', 10),
(16, '2026_03_12_183516_create_owned_and_wishlist_game_tables', 11),
(17, '2026_03_16_131522_add_play_tips_blocks_to_games_table', 12),
(18, '2026_03_18_170904_add_difficulty_and_price_to_events_table', 13),
(19, '2026_03_24_111208_add_profile_personalization_fields_to_users_table', 14),
(20, '2026_03_27_154447_add_notification_preferences_to_users_table', 15),
(21, '2026_04_03_102415_create_game_review_comments_table', 16),
(22, '2026_04_07_145826_create_article_tags_table', 17),
(23, '2026_04_09_163012_create_article_comment_replies_table', 18),
(24, '2026_04_13_181736_add_video_blocks_to_games_table', 19),
(25, '2026_04_15_151336_add_deleted_at_to_contact_messages_table', 20),
(26, '2026_04_16_104922_add_user_id_to_contact_messages_table', 21),
(27, '2026_05_16_114238_create_article_tag_table', 22);

-- --------------------------------------------------------

--
-- Table structure for table `owned_games`
--

CREATE TABLE `owned_games` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `game_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `owned_games`
--

INSERT INTO `owned_games` (`id`, `user_id`, `game_id`, `created_at`, `updated_at`) VALUES
(11, 17, 33, '2026-04-15 11:28:23', '2026-04-15 11:28:23'),
(13, 17, 42, '2026-04-15 11:28:31', '2026-04-15 11:28:31'),
(14, 17, 41, '2026-04-15 11:28:35', '2026-04-15 11:28:35'),
(21, 15, 40, '2026-04-21 14:07:10', '2026-04-21 14:07:10'),
(24, 20, 43, '2026-04-24 13:01:08', '2026-04-24 13:01:08'),
(26, 20, 40, '2026-04-24 13:33:04', '2026-04-24 13:33:04'),
(27, 20, 34, '2026-04-24 13:33:10', '2026-04-24 13:33:10'),
(28, 20, 38, '2026-04-24 13:34:02', '2026-04-24 13:34:02'),
(32, 17, 38, '2026-05-25 12:44:55', '2026-05-25 12:44:55');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Ac111gI3z18CoS3BLekVkBX1az2JmZ9OLEnz55Yj', 17, '172.18.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiIzU3l0TnNHOHcwMm1ZRGZwdWN4RDZiRkF3UGJDZHFtTEpCZUdOQzlxIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDAwIiwicm91dGUiOiJob21lIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjE3fQ==', 1780053940);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `profile_photo_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wants_newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `wants_event_notifications` tinyint(1) NOT NULL DEFAULT '0',
  `wants_game_notifications` tinyint(1) NOT NULL DEFAULT '0',
  `wants_learning_notifications` tinyint(1) NOT NULL DEFAULT '0',
  `wants_event_reminders` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `username`, `birth_date`, `role`, `profile_photo_path`, `wants_newsletter`, `wants_event_notifications`, `wants_game_notifications`, `wants_learning_notifications`, `wants_event_reminders`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(15, 'Mantas', 'Mantelis', 'mantaszaidzia', '2003-03-05', 'member', 'users/15/profile-photo/5c0WHnLmmee51DPijRDSC7PMArskqkQhtatlMyZj.jpg', 1, 1, 1, 1, 0, 'mantas@gmail.com', NULL, '$2y$12$0pc9IHF7bNUSWzNBoeSwZu2Lhm52alIyPRvGYUMzftgZOm9FiOUZG', NULL, '2026-03-25 14:29:10', '2026-04-24 08:55:25'),
(16, 'Ieva', NULL, 'ievute', '2000-01-10', 'member', NULL, 1, 1, 1, 1, 1, 'ieva@gmail.com', NULL, '$2y$12$yJ0.595dozEd.xqJF02peet5sNPyxREvGNjamtXkgqQ44JWhYDlI.', NULL, '2026-03-25 14:29:11', '2026-04-24 08:07:42'),
(17, 'Erika', 'Erikaitiene', 'erica333', '2004-12-20', 'member', 'users/17/profile-photo/3zECwHIewcobuSayue3CXwMprjNahj7D367erskk.jpg', 1, 1, 1, 1, 1, 'erica333@gmail.com', NULL, '$2y$12$As/J81q7F0PExFth1d5.E.U7TjObKShZnW8f8tCG67LPWfOpPjLXO', NULL, '2026-03-30 10:48:40', '2026-05-25 12:46:51'),
(18, 'Lukas', 'Lukelis', 'lukas777', '2006-09-03', 'member', NULL, 1, 1, 1, 0, 0, 'lukas777@gmail.com', NULL, '$2y$12$MEVf.86ncZCNsRg7qm3YkO4X1Pxui4j/pXR3jfkXltsasQtupVBye', NULL, '2026-04-10 07:14:50', '2026-04-15 09:10:20'),
(20, 'Sofija', NULL, 'sofifi', '1997-10-05', 'member', NULL, 1, 1, 1, 0, 0, 'sofiso@gmail.com', NULL, '$2y$12$Xfbt4HArb7RAa.vUelzVhOhe3KY.TeQtK/5XUrb/pK5yQw1sXtP/.', NULL, '2026-04-24 08:27:55', '2026-04-24 13:34:42'),
(21, 'Valerija', NULL, 'valerija', '2003-06-19', 'member', NULL, 0, 0, 0, 0, 0, 'valerija@gmail.com', NULL, '$2y$12$9tuMn4SOEWzvjCPOsg.TKOhV835mAF29NR2wq6Orbol9pV29xX6f6', NULL, '2026-05-19 17:43:12', '2026-05-19 17:43:12');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_games`
--

CREATE TABLE `wishlist_games` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `game_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlist_games`
--

INSERT INTO `wishlist_games` (`id`, `user_id`, `game_id`, `created_at`, `updated_at`) VALUES
(7, 17, 33, '2026-04-15 07:25:07', '2026-04-15 07:25:07'),
(12, 15, 39, '2026-04-21 08:51:33', '2026-04-21 08:51:33'),
(19, 17, 39, '2026-04-21 16:10:01', '2026-04-21 16:10:01'),
(25, 20, 40, '2026-04-24 13:33:05', '2026-04-24 13:33:05'),
(27, 20, 38, '2026-04-24 13:34:03', '2026-04-24 13:34:03'),
(29, 17, 43, '2026-04-26 19:31:11', '2026-04-26 19:31:11'),
(31, 16, 38, '2026-05-25 12:17:57', '2026-05-25 12:17:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_slug_unique` (`slug`);

--
-- Indexes for table `article_comments`
--
ALTER TABLE `article_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_comments_article_id_foreign` (`article_id`),
  ADD KEY `article_comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `article_comment_replies`
--
ALTER TABLE `article_comment_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_comment_replies_article_comment_id_foreign` (`article_comment_id`),
  ADD KEY `article_comment_replies_user_id_foreign` (`user_id`);

--
-- Indexes for table `article_tag`
--
ALTER TABLE `article_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `article_tag_article_id_article_tag_id_unique` (`article_id`,`article_tag_id`),
  ADD KEY `article_tag_article_tag_id_foreign` (`article_tag_id`);

--
-- Indexes for table `article_tags`
--
ALTER TABLE `article_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `article_tags_name_unique` (`name`),
  ADD UNIQUE KEY `article_tags_slug_unique` (`slug`);

--
-- Indexes for table `cms_users`
--
ALTER TABLE `cms_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cms_users_email_unique` (`email`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_messages_user_id_foreign` (`user_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `events_slug_unique` (`slug`);

--
-- Indexes for table `event_registrations`
--
ALTER TABLE `event_registrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `event_registrations_event_id_user_id_unique` (`event_id`,`user_id`),
  ADD KEY `event_registrations_user_id_foreign` (`user_id`);

--
-- Indexes for table `favorite_games`
--
ALTER TABLE `favorite_games`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `favorite_games_user_id_game_id_unique` (`user_id`,`game_id`),
  ADD KEY `favorite_games_game_id_foreign` (`game_id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `games_slug_unique` (`slug`);

--
-- Indexes for table `game_reviews`
--
ALTER TABLE `game_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_reviews_game_id_foreign` (`game_id`),
  ADD KEY `game_reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `game_review_comments`
--
ALTER TABLE `game_review_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_review_comments_game_review_id_foreign` (`game_review_id`),
  ADD KEY `game_review_comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `game_tag`
--
ALTER TABLE `game_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `game_tag_game_id_game_tag_id_unique` (`game_id`,`game_tag_id`),
  ADD KEY `game_tag_game_tag_id_foreign` (`game_tag_id`);

--
-- Indexes for table `game_tags`
--
ALTER TABLE `game_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `game_tags_name_unique` (`name`),
  ADD UNIQUE KEY `game_tags_slug_unique` (`slug`);

--
-- Indexes for table `media_images`
--
ALTER TABLE `media_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_images_imageable_type_imageable_id_index` (`imageable_type`,`imageable_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owned_games`
--
ALTER TABLE `owned_games`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `owned_games_user_id_game_id_unique` (`user_id`,`game_id`),
  ADD KEY `owned_games_game_id_foreign` (`game_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `wishlist_games`
--
ALTER TABLE `wishlist_games`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wishlist_games_user_id_game_id_unique` (`user_id`,`game_id`),
  ADD KEY `wishlist_games_game_id_foreign` (`game_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `article_comments`
--
ALTER TABLE `article_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `article_comment_replies`
--
ALTER TABLE `article_comment_replies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `article_tag`
--
ALTER TABLE `article_tag`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `article_tags`
--
ALTER TABLE `article_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cms_users`
--
ALTER TABLE `cms_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `event_registrations`
--
ALTER TABLE `event_registrations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `favorite_games`
--
ALTER TABLE `favorite_games`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `game_reviews`
--
ALTER TABLE `game_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `game_review_comments`
--
ALTER TABLE `game_review_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `game_tag`
--
ALTER TABLE `game_tag`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `game_tags`
--
ALTER TABLE `game_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `media_images`
--
ALTER TABLE `media_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `owned_games`
--
ALTER TABLE `owned_games`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `wishlist_games`
--
ALTER TABLE `wishlist_games`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article_comments`
--
ALTER TABLE `article_comments`
  ADD CONSTRAINT `article_comments_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `article_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `article_comment_replies`
--
ALTER TABLE `article_comment_replies`
  ADD CONSTRAINT `article_comment_replies_article_comment_id_foreign` FOREIGN KEY (`article_comment_id`) REFERENCES `article_comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `article_comment_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `article_tag`
--
ALTER TABLE `article_tag`
  ADD CONSTRAINT `article_tag_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `article_tag_article_tag_id_foreign` FOREIGN KEY (`article_tag_id`) REFERENCES `article_tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD CONSTRAINT `contact_messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `event_registrations`
--
ALTER TABLE `event_registrations`
  ADD CONSTRAINT `event_registrations_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_registrations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorite_games`
--
ALTER TABLE `favorite_games`
  ADD CONSTRAINT `favorite_games_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorite_games_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `game_reviews`
--
ALTER TABLE `game_reviews`
  ADD CONSTRAINT `game_reviews_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `game_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `game_review_comments`
--
ALTER TABLE `game_review_comments`
  ADD CONSTRAINT `game_review_comments_game_review_id_foreign` FOREIGN KEY (`game_review_id`) REFERENCES `game_reviews` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `game_review_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `game_tag`
--
ALTER TABLE `game_tag`
  ADD CONSTRAINT `game_tag_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `game_tag_game_tag_id_foreign` FOREIGN KEY (`game_tag_id`) REFERENCES `game_tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `owned_games`
--
ALTER TABLE `owned_games`
  ADD CONSTRAINT `owned_games_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `owned_games_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist_games`
--
ALTER TABLE `wishlist_games`
  ADD CONSTRAINT `wishlist_games_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_games_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
