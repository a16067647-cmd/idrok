// Kiberxavfsizlik: hamma uchun asoslar, ilg‘or va ustalar ligasi uchun chuqur darslar.
// Кибербезопасность: основы для всех, глубокие уроки для продвинутой и мастер-лиги.
// Faqat himoya va axloq: hech qanday hujum ko‘rsatmasi yo‘q.
// Только защита и этика: никаких инструкций для атак.
import 'model.dart';

const kAdvMaster = {'advanced', 'master'};

RenderEl _e(String tag, String text, int line, [Map<String, String> style = const {}]) => RenderEl(tag, text, line, style: style);

const _watch = Tr('Ko‘k tugmani bosing yoki barmoq bilan suring — har bir qadamni ko‘rasiz.',
    'Нажмите синюю кнопку или листайте пальцем — увидите каждый шаг.');

const _names = ['Aziza', 'Bekzod', 'Laylo', 'Sardor', 'Madina', 'Jasur'];

// ================================================================ HAMMA UCHUN / ДЛЯ ВСЕХ
// ---------------------------------------------------------------- 1. Kiberxavfsizlik nima
List<LessonStep> cy1(Gen g) => [
      const LessonStep.read(
        h: Tr('Kiberxavfsizlik nima?', 'Что такое кибербезопасность?'),
        p: Tr(
            'Kiberxavfsizlik — ma’lumot, qurilma va odamlarni raqamli xavflardan himoya qilish. Uchta asosiy maqsad (CIA): '
                'Maxfiylik (Confidentiality) — sirni begona ko‘rmasin; Butunlik (Integrity) — ma’lumotni hech kim yashirincha o‘zgartirmasin; '
                'Mavjudlik (Availability) — kerak paytda ishlasin. Kiberxavfsizlik mutaxassisi — “oq shlyapali” himoyachi: u tizimlarni ruxsat bilan tekshiradi va tuzatadi.',
            'Кибербезопасность — защита данных, устройств и людей от цифровых угроз. Три главные цели (CIA): '
                'Конфиденциальность — секрет не видят чужие; Целостность — данные никто тайно не меняет; '
                'Доступность — всё работает, когда нужно. Специалист по кибербезопасности — «белая шляпа»: проверяет системы с разрешения и чинит их.'),
      ),
      ...g.from([
        Q(1, (g) => g.quiz(const Tr('Kimdir maktab saytidagi baholarni yashirincha o‘zgartirdi. Qaysi maqsad buzildi?', 'Кто-то тайно изменил оценки на сайте школы. Какая цель нарушена?'),
            const Tr('Butunlik (Integrity)', 'Целостность (Integrity)'),
            const [Tr('Mavjudlik', 'Доступность'), Tr('Tezlik', 'Скорость'), Tr('Dizayn', 'Дизайн')])),
        Q(1, (g) => g.quiz(const Tr('Sayt ko‘p so‘rovdan “yiqildi”, hech kim kira olmayapti. Nima buzildi?', 'Сайт «упал» от потока запросов, никто не может зайти. Что нарушено?'),
            const Tr('Mavjudlik (Availability)', 'Доступность (Availability)'),
            const [Tr('Maxfiylik', 'Конфиденциальность'), Tr('Butunlik', 'Целостность'), Tr('Hech narsa', 'Ничего')])),
        Q(2, (g) => g.quiz(const Tr('Do‘stingizning yozishmalari begonaga ko‘rinib qoldi. Nima buzildi?', 'Переписка друга стала видна чужим. Что нарушено?'),
            const Tr('Maxfiylik (Confidentiality)', 'Конфиденциальность (Confidentiality)'),
            const [Tr('Mavjudlik', 'Доступность'), Tr('Butunlik', 'Целостность'), Tr('Tezlik', 'Скорость')])),
        Q(2, (g) => g.quiz(const Tr('“Oq shlyapali” xaker kim?', 'Кто такой «белый» хакер?'),
            const Tr('Ruxsat bilan tekshirib, zaifliklarni tuzatishga yordam beradigan mutaxassis', 'Специалист, который с разрешения ищет уязвимости и помогает их исправить'),
            const [Tr('Oq kiyimli har qanday odam', 'Любой человек в белом'), Tr('Begona akkauntlarni buzuvchi', 'Тот, кто взламывает чужие аккаунты'), Tr('Faqat o‘yin o‘ynaydigan', 'Тот, кто только играет')])),
        Q(3, (g) => g.quiz(const Tr('Eng zaif bo‘g‘in ko‘pincha nima?', 'Что чаще всего самое слабое звено?'), const Tr('Inson (ehtiyotsizlik, ishonuvchanlik)', 'Человек (невнимательность, доверчивость)'),
            const [Tr('Monitor', 'Монитор'), Tr('Klaviatura', 'Клавиатура'), Tr('Elektr toki', 'Электричество')],
            e: const Tr('Shuning uchun xavfsizlik — avvalo odatlar.', 'Поэтому безопасность — прежде всего привычки.'))),
        Q(3, (g) => g.quiz(const Tr('Zaxira nusxa (backup) qaysi maqsadga xizmat qiladi?', 'Какой цели служит резервная копия (бэкап)?'), const Tr('Mavjudlik — fayl yo‘qolsa ham tiklanadi', 'Доступность — даже при потере файл восстановится'),
            const [Tr('Faqat tezlikka', 'Только скорости'), Tr('Hech qaysiga', 'Никакой'), Tr('Faqat dizaynga', 'Только дизайну')])),
        Q(1, (g) => g.quiz(const Tr('Kiberxavfsizlik nimani himoya qiladi?', 'Что защищает кибербезопасность?'), const Tr('Ma’lumot, qurilma va odamlarni', 'Данные, устройства и людей'),
            const [Tr('Faqat monitorni', 'Только монитор'), Tr('Faqat internet kabelini', 'Только интернет-кабель'), Tr('Hech narsani', 'Ничего')])),
        Q(2, (g) => g.quiz(const Tr('CIA qisqartmasidagi “A” nima?', 'Что значит «A» в CIA?'), const Tr('Availability — mavjudlik', 'Availability — доступность'),
            const [Tr('Antivirus', 'Антивирус'), Tr('Admin', 'Админ'), Tr('Akkaunt', 'Аккаунт')])),
], 3),
      g.order(const Tr('Xavfsizlik qoidasi — tartiblang:', 'Правило безопасности — упорядочьте:'), ['Xavfni ko‘rish', 'Himoyani o‘ylash', 'Himoyani qo‘yish', 'Tekshirib turish']),
    ];

// ---------------------------------------------------------------- 2. Parol va 2FA
List<LessonStep> cy2(Gen g) {
  final n = g.pick(_names);
  return [
    const LessonStep.read(
      h: Tr('Kuchli parol va 2FA', 'Надёжный пароль и 2FA'),
      p: Tr(
          'Kuchli parol — uzun (12+ belgi), tasodifiy va har sayt uchun boshqa. Eslab qolish oson usul — parol-ibora: “Kitob!Olma7Bulut”. '
              'Bir xil parolni hamma joyda ishlatish xavfli: bitta sayt sizsa, hammasi ochiladi. 2FA (ikki bosqichli tasdiq) — paroldan tashqari telefon kodi ham so‘raladi. '
              'Parolni hech kim, hatto “admin” ham so‘ramaydi.',
          'Надёжный пароль — длинный (12+ символов), случайный и разный для каждого сайта. Легко запомнить пароль-фразу: «Kitob!Olma7Bulut». '
              'Один пароль везде — опасно: утечёт один сайт — откроются все. 2FA (двухфакторная проверка) — кроме пароля нужен ещё код с телефона. '
              'Пароль не просит никто, даже «админ».'),
    ),
    ...g.from([
      Q(1, (g) => g.quiz(const Tr('Eng kuchli parol:', 'Самый надёжный пароль:'), const Tr('Bulut7!Kitob#Anor', 'Bulut7!Kitob#Anor'),
          [Tr('${n}2010', '${n}2010'), const Tr('qwerty', 'qwerty'), const Tr('11111111', '11111111')])),
      Q(1, (g) => g.quiz(const Tr('2FA nima?', 'Что такое 2FA?'), const Tr('Parol + telefondagi kod', 'Пароль + код с телефона'),
          const [Tr('Ikki marta parol yozish', 'Дважды ввести пароль'), Tr('Ikkita akkaunt', 'Два аккаунта'), Tr('Parolsiz kirish', 'Вход без пароля')])),
      Q(2, (g) => g.quiz(const Tr('Bitta parol hamma saytda. Bitta sayt buzildi. Natija?', 'Один пароль на всех сайтах. Один сайт взломали. Итог?'),
          const Tr('Barcha akkauntlar xavf ostida', 'Все аккаунты под угрозой'),
          const [Tr('Faqat o‘sha sayt', 'Только этот сайт'), Tr('Hech narsa bo‘lmaydi', 'Ничего не будет'), Tr('Kompyuter o‘chadi', 'Компьютер выключится')])),
      Q(2, (g) => g.quiz(const Tr('SMS’da kelgan 2FA kodini “bank xodimi” so‘radi. Nima qilasiz?', '«Сотрудник банка» просит код 2FA из SMS. Что делать?'),
          const Tr('Hech kimga aytmayman — bu firibgar', 'Никому не говорю — это мошенник'),
          const [Tr('Aytaman, u xodim-ku', 'Скажу, он же сотрудник'), Tr('Yarmini aytaman', 'Скажу половину'), Tr('Ijtimoiy tarmoqqa yozaman', 'Напишу в соцсети')])),
      Q(3, (g) => g.quiz(const Tr('Ko‘p parolni xavfsiz saqlashning eng yaxshi usuli:', 'Лучший способ хранить много паролей:'), const Tr('Parol menejeri dasturi', 'Менеджер паролей'),
          const [Tr('Monitorga yopishtirilgan qog‘oz', 'Бумажка на мониторе'), Tr('Telefon zametkasi “parollar”', 'Заметка «пароли» в телефоне'), Tr('Hammasi bir xil', 'Все одинаковые')])),
      Q(3, (g) => g.quiz(const Tr('Nega uzun parol qisqasidan kuchliroq?', 'Почему длинный пароль надёжнее короткого?'), const Tr('Variantlar soni juda tez o‘sadi', 'Число вариантов растёт очень быстро'),
          const [Tr('Chiroyliroq ko‘rinadi', 'Красивее выглядит'), Tr('Tezroq yoziladi', 'Быстрее печатается'), Tr('Farqi yo‘q', 'Разницы нет')])),
            Q(1, (g) => g.quiz(const Tr('Parolni kimga aytish mumkin?', 'Кому можно сказать пароль?'), const Tr('Hech kimga', 'Никому'),
            const [Tr('Eng yaqin do‘stga', 'Лучшему другу'), Tr('“Admin”ga', '«Админу»'), Tr('Sinfdoshga', 'Однокласснику')])),
        Q(2, (g) => g.quiz(const Tr('Parol kamida necha belgi bo‘lgani yaxshi?', 'Сколько символов минимум лучше в пароле?'), const Tr('12 va undan ko‘p', '12 и больше'),
            const [Tr('4', '4'), Tr('6', '6'), Tr('Farqi yo‘q', 'Без разницы')])),
], 3),
    g.order(const Tr('2FA yoqish:', 'Включить 2FA:'), ['Sozlamalar', 'Xavfsizlik', '2FA ni yoqish', 'Telefon kodini kiritish']),
  ];
}

// ---------------------------------------------------------------- 3. Fishing
List<LessonStep> cy3(Gen g) => [
      const LessonStep.read(
        h: Tr('Fishing — “qarmoq”ga ilinmang', 'Фишинг — не попадитесь на «удочку»'),
        p: Tr(
            'Fishing — soxta xabar yoki sayt orqali parol, karta yoki kodni o‘g‘irlash. Belgilar: shoshiltirish (“10 daqiqa qoldi!”), juda yaxshi va’da (“iPhone yutdingiz”), '
                'qo‘rqitish (“akkauntingiz bloklanadi”), g‘alati manzil (instagram-login.xyz), imlo xatolari. Qoida: to‘xta → tekshir → rasmiy ilova orqali kir.',
            'Фишинг — кража пароля, карты или кода через поддельное сообщение или сайт. Признаки: спешка («осталось 10 минут!»), слишком хорошее обещание («вы выиграли iPhone»), '
                'запугивание («аккаунт заблокируют»), странный адрес (instagram-login.xyz), ошибки в тексте. Правило: стоп → проверь → заходи через официальное приложение.'),
      ),
      ...g.from([
        Q(1, (g) => g.quiz(const Tr('Qaysi manzil haqiqiy Telegram?', 'Какой адрес — настоящий Telegram?'), const Tr('telegram.org', 'telegram.org'),
            const [Tr('telegram-free-premium.xyz', 'telegram-free-premium.xyz'), Tr('te1egram.org', 'te1egram.org'), Tr('telegram.org.login-check.ru', 'telegram.org.login-check.ru')],
            e: const Tr('Asosiy domen — oxiridagi qism: login-check.ru — bu begona sayt.', 'Главный домен — в конце: login-check.ru — это чужой сайт.'))),
        Q(1, (g) => g.quiz(const Tr('Fishingning eng ko‘p belgisi:', 'Самый частый признак фишинга:'), const Tr('Shoshiltirish va qo‘rqitish', 'Спешка и запугивание'),
            const [Tr('Chiroyli dizayn', 'Красивый дизайн'), Tr('Uzun matn', 'Длинный текст'), Tr('Rasm borligi', 'Наличие картинки')])),
        Q(2, (g) => g.quiz(const Tr('“Bank”dan SMS: “Kartangiz bloklandi, havolaga kiring”. To‘g‘ri harakat:', 'SMS от «банка»: «Карта заблокирована, перейдите по ссылке». Правильно:'),
            const Tr('Havolani bosmay, bankning rasmiy ilovasi yoki raqamiga murojaat qilish', 'Не нажимать, а связаться через официальное приложение или номер банка'),
            const [Tr('Tezda havolaga kirish', 'Быстро перейти по ссылке'), Tr('Karta raqamini javobga yozish', 'Ответить номером карты'), Tr('Do‘stlarga yuborish', 'Переслать друзьям')])),
        Q(2, (g) => g.quiz(const Tr('Do‘stingiz akkauntidan: “Menga ovoz ber, kodni yubor”. Nima bo‘lishi mumkin?', 'С аккаунта друга: «Проголосуй за меня, пришли код». Что может быть?'),
            const Tr('Do‘stning akkaunti buzilgan, endi sizni nishonga olishyapti', 'Аккаунт друга взломан, теперь цель — вы'),
            const [Tr('Bu oddiy tanlov', 'Обычный конкурс'), Tr('Kod yuborish xavfsiz', 'Код отправлять безопасно'), Tr('Hech narsa', 'Ничего')])),
        Q(3, (g) => g.quiz(const Tr('Havolani bosmasdan qayerga olib borishini qanday bilasiz (kompyuterda)?', 'Как узнать, куда ведёт ссылка, не нажимая (на компьютере)?'),
            const Tr('Sichqonchani ustiga olib borib, manzilni ko‘rish', 'Навести мышку и посмотреть адрес'),
            const [Tr('Bosib ko‘rish', 'Нажать и посмотреть'), Tr('Bilib bo‘lmaydi', 'Никак'), Tr('Rangiga qarab', 'По цвету')])),
        Q(3, (g) => g.quiz(const Tr('Fishingga ilindingiz (parol yozib qo‘ydingiz). Birinchi qadam:', 'Попались на фишинг (ввели пароль). Первый шаг:'),
            const Tr('Darhol parolni almashtirish va 2FA yoqish', 'Сразу сменить пароль и включить 2FA'),
            const [Tr('Hech kimga aytmaslik', 'Никому не говорить'), Tr('Kutish', 'Подождать'), Tr('Telefonni sotish', 'Продать телефон')])),
        Q(1, (g) => g.quiz(const Tr('Fishingning maqsadi:', 'Цель фишинга:'), const Tr('Parol, karta yoki kodni o‘g‘irlash', 'Украсть пароль, карту или код'),
            const [Tr('Sovg‘a berish', 'Подарить подарок'), Tr('Dars o‘rgatish', 'Научить уроку'), Tr('Internetni tezlatish', 'Ускорить интернет')])),
        Q(2, (g) => g.quiz(const Tr('Qaysi xabar ko‘proq fishingga o‘xshaydi?', 'Какое сообщение больше похоже на фишинг?'), const Tr('“Tabriklaymiz! 1 000 000 so‘m yutdingiz, karta raqamingizni yozing”', '«Поздравляем! Вы выиграли 1 000 000 сумов, напишите номер карты»'),
            const [Tr('“Ertaga dars soat 9 da”', '«Завтра урок в 9»'), Tr('“Uy vazifasi: 5-mashq”', '«Домашнее задание: упражнение 5»'), Tr('“Tug‘ilgan kuning bilan!”', '«С днём рождения!»')])),
], 3),
      g.order(const Tr('Shubhali xabar kelsa:', 'Пришло подозрительное сообщение:'), ['To‘xtash', 'Manzilni tekshirish', 'Rasmiy yo‘l bilan aniqlash', 'Spam deb belgilash']),
    ];

// ---------------------------------------------------------------- 4. Shaxsiy ma'lumot
List<LessonStep> cy4(Gen g) => [
      const LessonStep.read(
        h: Tr('Raqamli iz va maxfiylik', 'Цифровой след и приватность'),
        p: Tr(
            'Internetga qo‘yilgan narsa deyarli abadiy qoladi — bu raqamli iz. Hech qachon ochiq joyda yozmang: uy manzili, maktab va sinf, telefon raqami, pasport, karta. '
                'Rasmlarda ham ma’lumot bor: deraza tashqarisi, mashina raqami, joylashuv (geoteg). Akkauntlarni “yopiq” qiling, ilovalarga keraksiz ruxsat bermang.',
            'Всё, что попало в интернет, остаётся почти навсегда — это цифровой след. Никогда не пишите открыто: домашний адрес, школу и класс, телефон, паспорт, карту. '
                'В фото тоже есть данные: вид из окна, номер машины, геолокация (геотег). Делайте аккаунты закрытыми, не давайте приложениям лишних разрешений.'),
      ),
      ...g.from([
        Q(1, (g) => g.quiz(const Tr('Qaysi ma’lumotni ochiq profilga yozish xavfsiz?', 'Что безопасно писать в открытом профиле?'), const Tr('Qiziqishlar: shaxmat, kod', 'Интересы: шахматы, код'),
            const [Tr('Uy manzili', 'Домашний адрес'), Tr('Telefon raqami', 'Номер телефона'), Tr('Karta raqami', 'Номер карты')])),
        Q(1, (g) => g.quiz(const Tr('Raqamli iz nima?', 'Что такое цифровой след?'), const Tr('Internetda qoldirgan barcha izlaringiz', 'Все следы, что вы оставили в интернете'),
            const [Tr('Sichqoncha izi', 'След мышки'), Tr('Monitor changi', 'Пыль на мониторе'), Tr('Faqat parol', 'Только пароль')])),
        Q(2, (g) => g.quiz(const Tr('Fonar ilovasi kontaktlar va joylashuvga ruxsat so‘rayapti. Nima qilasiz?', 'Приложение-фонарик просит доступ к контактам и геолокации. Что делать?'),
            const Tr('Rad etaman — fonarga bu kerak emas', 'Отказать — фонарику это не нужно'),
            const [Tr('Hammasiga ruxsat', 'Разрешить всё'), Tr('Faqat kontaktlarga', 'Только контакты'), Tr('Farqi yo‘q', 'Без разницы')])),
        Q(2, (g) => g.quiz(const Tr('Rasmdagi geoteg nimani ochib beradi?', 'Что раскрывает геотег на фото?'), const Tr('Rasm olingan aniq joyni', 'Точное место съёмки'),
            const [Tr('Kamera narxini', 'Цену камеры'), Tr('Hech narsani', 'Ничего'), Tr('Ob-havoni', 'Погоду')])),
        Q(3, (g) => g.quiz(const Tr('Ommaviy (tekin) Wi-Fi’da qaysi ishni qilmagan ma’qul?', 'Что лучше не делать в публичном (бесплатном) Wi-Fi?'),
            const Tr('Bank yoki muhim akkauntga kirish', 'Входить в банк или важный аккаунт'),
            const [Tr('Ob-havoni ko‘rish', 'Смотреть погоду'), Tr('Yangilik o‘qish', 'Читать новости'), Tr('Xarita ochish', 'Открыть карту')])),
        Q(3, (g) => g.quiz(const Tr('Begona odam onlayn o‘yinda maktabingiz va manzilingizni so‘rayapti:', 'Незнакомец в онлайн-игре спрашивает школу и адрес:'),
            const Tr('Aytmayman, bloklayman, kattalarga xabar beraman', 'Не говорю, блокирую, сообщаю взрослым'),
            const [Tr('Aytaman, u do‘st-ku', 'Скажу, он же друг'), Tr('Faqat maktabni aytaman', 'Скажу только школу'), Tr('Rasm yuboraman', 'Отправлю фото')])),
        Q(1, (g) => g.quiz(const Tr('Internetga joylangan rasmni to‘liq o‘chirib bo‘ladimi?', 'Можно ли полностью удалить фото из интернета?'), const Tr('Ko‘pincha yo‘q — kimdir saqlab qolgan bo‘lishi mumkin', 'Чаще нет — кто-то мог сохранить'),
            const [Tr('Ha, har doim', 'Да, всегда'), Tr('Ha, ertasi kuni', 'Да, на следующий день'), Tr('Faqat kechasi', 'Только ночью')])),
        Q(2, (g) => g.quiz(const Tr('Profilni “yopiq” qilish nima beradi?', 'Что даёт «закрытый» профиль?'), const Tr('Postlarni faqat siz ruxsat berganlar ko‘radi', 'Посты видят только те, кому вы разрешили'),
            const [Tr('Profil o‘chadi', 'Профиль удалится'), Tr('Telefon tezlashadi', 'Телефон ускорится'), Tr('Hech narsa', 'Ничего')])),
], 3),
      g.order(const Tr('Akkauntni himoyalash:', 'Защита аккаунта:'), ['Profilni yopiq qilish', 'Kuchli parol', '2FA yoqish', 'Ruxsatlarni tekshirish']),
    ];

// ---------------------------------------------------------------- 5. Qurilma xavfsizligi
List<LessonStep> cy5(Gen g) => [
      const LessonStep.read(
        h: Tr('Qurilmani himoyalash', 'Защита устройства'),
        p: Tr(
            'Yangilanishlar (update) — zaifliklarni yopuvchi “yamoq”, ularni kechiktirmang. Ilovalarni faqat rasmiy do‘kondan (Play Market, App Store) o‘rnating. '
                'Ekran qulfi (PIN, barmoq izi) qo‘ying. Muhim fayllarning zaxira nusxasini (backup) saqlang. Notanish fleshkani kompyuterga ulamang.',
            'Обновления — «заплатки», закрывающие уязвимости, не откладывайте их. Ставьте приложения только из официального магазина (Play Market, App Store). '
                'Включите блокировку экрана (PIN, отпечаток). Делайте резервные копии важных файлов. Не вставляйте в компьютер чужую флешку.'),
      ),
      ...g.from([
        Q(1, (g) => g.quiz(const Tr('Nega yangilanish muhim?', 'Почему важны обновления?'), const Tr('Ular xavfsizlik teshiklarini yopadi', 'Они закрывают дыры в безопасности'),
            const [Tr('Faqat yangi rang uchun', 'Только для новых цветов'), Tr('Telefonni sekinlatadi', 'Замедляют телефон'), Tr('Hech narsa bermaydi', 'Ничего не дают')])),
        Q(1, (g) => g.quiz(const Tr('Ilovani qayerdan o‘rnatgan ma’qul?', 'Откуда лучше ставить приложения?'), const Tr('Rasmiy do‘kondan', 'Из официального магазина'),
            const [Tr('Notanish saytdan .apk', '.apk с незнакомого сайта'), Tr('Telegram kanaldagi “mod”dan', '«Мода» из Telegram-канала'), Tr('Farqi yo‘q', 'Без разницы')])),
        Q(2, (g) => g.quiz(const Tr('Yo‘lda fleshka topdingiz. Nima qilasiz?', 'Нашли флешку на улице. Что делать?'), const Tr('Ulamayman — unda zararli dastur bo‘lishi mumkin', 'Не вставляю — там может быть вирус'),
            const [Tr('Darrov ochib ko‘raman', 'Сразу открою'), Tr('Maktab kompyuteriga ulayman', 'Вставлю в школьный компьютер'), Tr('Do‘stimga beraman', 'Отдам другу')])),
        Q(2, (g) => g.quiz(const Tr('Zaxira nusxaning “3-2-1” qoidasi: 3 nusxa, 2 xil joy, 1 tasi…', 'Правило бэкапа «3-2-1»: 3 копии, 2 разных носителя, 1 из них…'),
            const Tr('boshqa joyda (masalan, bulutda)', 'в другом месте (например, в облаке)'),
            const [Tr('ko‘chada', 'на улице'), Tr('o‘chirilgan', 'удалена'), Tr('xuddi shu fleshkada', 'на той же флешке')])),
        Q(3, (g) => g.quiz(const Tr('Ransomware (to‘lov talab qiluvchi virus) fayllarni shifrladi. Eng yaxshi himoya avvaldan:', 'Ransomware зашифровал файлы. Лучшая защита заранее:'),
            const Tr('Alohida saqlangan zaxira nusxa', 'Отдельно хранящийся бэкап'),
            const [Tr('Ekran yorqinligi', 'Яркость экрана'), Tr('Chiroyli fon rasmi', 'Красивые обои'), Tr('Ko‘p ilova', 'Много приложений')])),
        Q(3, (g) => g.quiz(const Tr('Telefoningiz yo‘qoldi. Birinchi navbatda:', 'Потерялся телефон. В первую очередь:'), const Tr('“Qurilmani topish” orqali qulflash va parollarni almashtirish', 'Заблокировать через «Найти устройство» и сменить пароли'),
            const [Tr('Hech narsa qilmaslik', 'Ничего не делать'), Tr('Yangi o‘yin o‘rnatish', 'Установить новую игру'), Tr('Faqat kutish', 'Только ждать')])),
        Q(1, (g) => g.quiz(const Tr('Ekran qulfi nima uchun kerak?', 'Зачем блокировка экрана?'), const Tr('Telefon yo‘qolsa, begona ichiga kira olmasligi uchun', 'Чтобы чужой не вошёл, если телефон потерян'),
            const [Tr('Chiroy uchun', 'Для красоты'), Tr('Batareya uchun', 'Для батареи'), Tr('Kerak emas', 'Не нужна')])),
        Q(2, (g) => g.quiz(const Tr('Antivirus nima qiladi?', 'Что делает антивирус?'), const Tr('Zararli dasturlarni topadi va to‘xtatadi', 'Находит и останавливает вредоносные программы'),
            const [Tr('Internetni tekin qiladi', 'Делает интернет бесплатным'), Tr('Parol yaratadi', 'Создаёт пароли'), Tr('O‘yin o‘rnatadi', 'Ставит игры')])),
], 3),
      g.order(const Tr('Yangi telefon sozlash:', 'Настройка нового телефона:'), ['Ekran qulfi', 'Yangilanishlar', 'Rasmiy ilovalar', 'Zaxira nusxa']),
    ];

// ================================================================ ILG‘OR / ПРОДВИНУТЫЕ
// ---------------------------------------------------------------- 6. Internet qanday ishlaydi
List<LessonStep> cy6(Gen g) => [
      const LessonStep.read(
        h: Tr('Internet ichidan: IP, DNS, port', 'Интернет изнутри: IP, DNS, порт'),
        p: Tr(
            'Har bir qurilmaning IP manzili bor (masalan 192.168.1.5) — xuddi uy manzili. DNS — “telefon kitobi”: idrok.uz nomini IP ga aylantiradi. '
                'Port — bitta kompyuterdagi “eshik” raqami: 443 — HTTPS (xavfsiz sayt), 80 — HTTP, 22 — SSH. Ma’lumot paketlarga bo‘linib, routerlar orqali yo‘l topadi. '
                'Himoyachi uchun: keraksiz eshik (port) yopiq bo‘lishi kerak.',
            'У каждого устройства есть IP-адрес (например, 192.168.1.5) — как адрес дома. DNS — «телефонная книга»: превращает имя idrok.uz в IP. '
                'Порт — номер «двери» на одном компьютере: 443 — HTTPS (защищённый сайт), 80 — HTTP, 22 — SSH. Данные делятся на пакеты и идут через роутеры. '
                'Для защитника: лишние двери (порты) должны быть закрыты.'),
      ),
      ...g.from([
        Q(1, (g) => g.quiz(const Tr('DNS nima qiladi?', 'Что делает DNS?'), const Tr('Sayt nomini IP manzilga aylantiradi', 'Превращает имя сайта в IP-адрес'),
            const [Tr('Virusni o‘chiradi', 'Удаляет вирусы'), Tr('Internetni tezlatadi', 'Ускоряет интернет'), Tr('Parol saqlaydi', 'Хранит пароли')])),
        Q(1, (g) => g.quizCode(const Tr('HTTPS odatda qaysi portda ishlaydi?', 'На каком порту обычно HTTPS?'), '443', ['80', '22', '21'])),
        Q(2, (g) => g.quizCode(const Tr('Qaysi biri to‘g‘ri IPv4 manzil?', 'Какой IPv4-адрес правильный?'), '10.0.0.25', ['256.1.1.1', '10.0.0', '1.2.3.4.5'],
            e: const Tr('Har bir qism 0–255, jami 4 ta qism.', 'Каждая часть 0–255, всего 4 части.'))),
        Q(2, (g) => g.quiz(const Tr('Nega keraksiz portlarni yopish kerak?', 'Зачем закрывать лишние порты?'), const Tr('Hujum uchun kirish yo‘llari kamayadi', 'Меньше путей для атаки'),
            const [Tr('Ekran chiroyli bo‘ladi', 'Экран будет красивее'), Tr('Batareya ko‘payadi', 'Батарея больше'), Tr('Kerak emas', 'Не нужно')])),
        Q(3, (g) => g.quiz(const Tr('Ma’lumot internetda qanday yuboriladi?', 'Как данные идут по интернету?'), const Tr('Kichik paketlarga bo‘linib, turli yo‘llar bilan', 'Маленькими пакетами, разными путями'),
            const [Tr('Bitta katta fayl bo‘lib', 'Одним большим файлом'), Tr('Faqat sun’iy yo‘ldosh orqali', 'Только через спутник'), Tr('Pochta orqali', 'Почтой')])),
        Q(3, (g) => g.quiz(const Tr('192.168.x.x qanday manzil?', 'Что за адрес 192.168.x.x?'), const Tr('Ichki (lokal) tarmoq', 'Внутренняя (локальная) сеть'),
            const [Tr('Google serveri', 'Сервер Google'), Tr('Har doim xavfli', 'Всегда опасный'), Tr('Sun’iy yo‘ldosh', 'Спутник')])),
], 3),
      g.order(const Tr('Saytga kirganda nima bo‘ladi:', 'Что происходит при заходе на сайт:'), ['Nom yoziladi', 'DNS IP ni topadi', 'Ulanish 443 portga', 'Sahifa keladi']),
    ];

// ---------------------------------------------------------------- 7. Shifrlash asoslari
List<LessonStep> cy7(Gen g) {
  final k = 1 + g.r.nextInt(3);
  String caesar(String s, int k) => String.fromCharCodes(s.codeUnits.map((c) => c >= 65 && c <= 90 ? (c - 65 + k) % 26 + 65 : c));
  final w = g.pick(const ['KOD', 'OLMA', 'SIR', 'DARS']);
  return [
    const LessonStep.read(
      h: Tr('Shifrlash: sirni qulflash', 'Шифрование: запираем секрет'),
      p: Tr(
          'Shifrlash — matnni kalitsiz o‘qib bo‘lmaydigan qilish. Eng qadimgi — Sezar shifri: har harf alifboda k qadam suriladi (k=1: A→B). Uni oson buzish mumkin. '
              'Hozirgi shifrlar (AES) millionlab yil ham buzilmaydi. Simmetrik — bitta kalit qulflaydi va ochadi. Asimmetrik — ochiq kalit qulflaydi, yopiq (shaxsiy) kalit ochadi.',
          'Шифрование — сделать текст нечитаемым без ключа. Древнейший — шифр Цезаря: каждая буква сдвигается на k (k=1: A→B). Его легко взломать. '
              'Современные шифры (AES) не взломать и за миллионы лет. Симметричный — один ключ и запирает, и открывает. Асимметричный — открытый ключ запирает, закрытый (личный) открывает.'),
    ),
    ...g.from([
      Q(1, (g) => g.quizCode(Tr('Sezar shifri, k=$k. “$w” nima bo‘ladi?', 'Шифр Цезаря, k=$k. Во что превратится «$w»?'), caesar(w, k),
          [caesar(w, k + 1), w, caesar(w, 26 - k)])),
      Q(1, (g) => g.quiz(const Tr('Simmetrik shifrlashda nechta kalit?', 'Сколько ключей в симметричном шифровании?'), const Tr('Bitta, ikkala tomonda bir xil', 'Один, одинаковый у обеих сторон'),
          const [Tr('Ikkita har xil', 'Два разных'), Tr('Kalit yo‘q', 'Ключа нет'), Tr('Uchta', 'Три')])),
      Q(2, (g) => g.quiz(const Tr('Asimmetrik: do‘stingiz sizga sir yuboradi. U qaysi kalit bilan qulflaydi?', 'Асимметричное: друг шлёт вам секрет. Каким ключом он запирает?'),
          const Tr('Sizning ochiq kalitingiz bilan', 'Вашим открытым ключом'),
          const [Tr('Sizning yopiq kalitingiz bilan', 'Вашим закрытым ключом'), Tr('Kalitsiz', 'Без ключа'), Tr('O‘z paroli bilan', 'Своим паролем')],
          e: const Tr('Ochiq kalitni hamma biladi, ochadigan yopiq kalit faqat sizda.', 'Открытый ключ знают все, а закрытый, который открывает, — только у вас.'))),
      Q(2, (g) => g.quiz(const Tr('Sezar shifri nega zaif?', 'Почему шифр Цезаря слабый?'), const Tr('Faqat 25 xil kalit — hammasini sinab ko‘rish oson', 'Всего 25 ключей — легко перебрать все'),
          const [Tr('Juda uzun', 'Слишком длинный'), Tr('Raqamlar yo‘q', 'Нет цифр'), Tr('U kuchli', 'Он сильный')])),
      Q(3, (g) => g.quizCode(const Tr('“IFMMP” — k=1 Sezar shifri. Asl so‘z:', '«IFMMP» — шифр Цезаря с k=1. Исходное слово:'), 'HELLO', ['JGNNQ', 'IFMMP', 'HALLO'])),
      Q(3, (g) => g.quiz(const Tr('Kalit yo‘qolsa, kuchli shifrlangan fayl…', 'Если ключ потерян, сильно зашифрованный файл…'), const Tr('Amalda ochib bo‘lmaydi', 'Практически не открыть'),
          const [Tr('O‘zi ochiladi', 'Откроется сам'), Tr('Ertaga ochiladi', 'Откроется завтра'), Tr('Admin ochadi', 'Откроет админ')])),
    ], 3),
    g.fill(const Tr('Sezar shifri, k=1: A harfi qaysi harfga aylanadi?', 'Шифр Цезаря, k=1: во что превратится A?'), 'A → ', '', ['B', 'b']),
  ];
}

// ---------------------------------------------------------------- 8. HTTPS
List<LessonStep> cy8(Gen g) => [
      const LessonStep.read(
        h: Tr('HTTPS va qulf belgisi', 'HTTPS и значок замка'),
        p: Tr(
            'HTTP’da ma’lumot ochiq ketadi — yo‘lda kimdir o‘qishi mumkin. HTTPS (S — Secure) ma’lumotni shifrlaydi (TLS). Brauzerdagi 🔒 belgisi: ulanish shifrlangan va sayt sertifikati tekshirilgan. '
                'Lekin 🔒 “sayt halol” degani emas — firibgar sayt ham HTTPS bo‘lishi mumkin! Domen nomini doim o‘qing.',
            'В HTTP данные идут открыто — их можно прочитать по пути. HTTPS (S — Secure) шифрует данные (TLS). Значок 🔒 в браузере: соединение зашифровано и сертификат сайта проверен. '
                'Но 🔒 не значит «сайт честный» — мошеннический сайт тоже бывает с HTTPS! Всегда читайте имя домена.'),
      ),
      ...g.from([
        Q(1, (g) => g.quiz(const Tr('HTTPS’dagi “S” nimani anglatadi?', 'Что значит «S» в HTTPS?'), const Tr('Secure — xavfsiz (shifrlangan)', 'Secure — защищённый (зашифрованный)'),
            const [Tr('Speed — tezlik', 'Speed — скорость'), Tr('Site — sayt', 'Site — сайт'), Tr('Simple — oddiy', 'Simple — простой')])),
        Q(2, (g) => g.quiz(const Tr('🔒 belgisi bor sayt — albatta halolmi?', 'Сайт с 🔒 — обязательно честный?'), const Tr('Yo‘q, faqat ulanish shifrlangan', 'Нет, просто соединение зашифровано'),
            const [Tr('Ha, 100%', 'Да, на 100%'), Tr('Ha, davlat tekshirgan', 'Да, проверено государством'), Tr('Qulf — reklama', 'Замок — это реклама')])),
        Q(2, (g) => g.quiz(const Tr('HTTP sahifada parol yozsangiz:', 'Если ввести пароль на HTTP-странице:'), const Tr('Tarmoqda ochiq ketadi, o‘g‘irlanishi mumkin', 'Он идёт по сети открыто, его могут украсть'),
            const [Tr('Hech narsa bo‘lmaydi', 'Ничего не будет'), Tr('Avtomatik shifrlanadi', 'Зашифруется автоматически'), Tr('Sayt ochilmaydi', 'Сайт не откроется')])),
        Q(3, (g) => g.quiz(const Tr('Sertifikat nima uchun kerak?', 'Зачем нужен сертификат?'), const Tr('Sayt haqiqatan o‘sha domen egasi ekanini tasdiqlash', 'Подтвердить, что сайт правда принадлежит этому домену'),
            const [Tr('Sayt chiroyli bo‘lishi uchun', 'Чтобы сайт был красивым'), Tr('Reyting uchun', 'Для рейтинга'), Tr('Tezlik uchun', 'Для скорости')])),
        Q(3, (g) => g.quiz(const Tr('Brauzer “Ulanish xavfsiz emas, sertifikat xato” dedi. Nima qilasiz?', 'Браузер пишет «Подключение не защищено, ошибка сертификата». Что делать?'),
            const Tr('Saytga kirmayman, ayniqsa parol yozmayman', 'Не захожу, тем более не ввожу пароль'),
            const [Tr('“Baribir davom etish”', '«Всё равно продолжить»'), Tr('Parolni yozib ko‘raman', 'Попробую ввести пароль'), Tr('Antivirusni o‘chiraman', 'Выключу антивирус')])),
], 3),
      g.order(const Tr('Saytga ishonishdan oldin:', 'Прежде чем доверять сайту:'), ['Domenni o‘qish', '🔒 ni ko‘rish', 'Imloni tekshirish', 'Rasmiy manbadan solishtirish']),
    ];

// ---------------------------------------------------------------- 9. Zararli dasturlar
List<LessonStep> cy9(Gen g) => [
      const LessonStep.read(
        h: Tr('Zararli dasturlar (malware)', 'Вредоносные программы (malware)'),
        p: Tr(
            'Virus — boshqa faylga yopishib tarqaladi. Chuvalchang (worm) — tarmoq orqali o‘zi tarqaladi. Troyan — foydali ilova qiyofasidagi zararli dastur. '
                'Ransomware — fayllarni shifrlab, pul talab qiladi. Spyware — yashirincha kuzatadi. Himoya: yangilanish, rasmiy ilovalar, antivirus, zaxira nusxa va ehtiyotkorlik.',
            'Вирус — прикрепляется к другим файлам и так распространяется. Червь (worm) — сам распространяется по сети. Троян — вредонос под видом полезной программы. '
                'Ransomware — шифрует файлы и требует деньги. Spyware — тайно следит. Защита: обновления, официальные приложения, антивирус, бэкап и внимательность.'),
      ),
      ...g.from([
        Q(1, (g) => g.quiz(const Tr('“Bepul Minecraft mod” ichida yashirin zararli kod — bu…', '«Бесплатный мод Minecraft» со скрытым вредоносом — это…'), const Tr('Troyan', 'Троян'),
            const [Tr('Chuvalchang', 'Червь'), Tr('Antivirus', 'Антивирус'), Tr('Brauzer', 'Браузер')])),
        Q(1, (g) => g.quiz(const Tr('Fayllarni qulflab, “to‘lov qiling” deydigan dastur:', 'Программа, которая запирает файлы и требует «заплатите»:'), const Tr('Ransomware', 'Ransomware'),
            const [Tr('Spyware', 'Spyware'), Tr('Word', 'Word'), Tr('Firewall', 'Firewall')])),
        Q(2, (g) => g.quiz(const Tr('Odam bosmasa ham tarmoqda o‘zi tarqaladigan:', 'Сам распространяется по сети без участия человека:'), const Tr('Chuvalchang (worm)', 'Червь (worm)'),
            const [Tr('Troyan', 'Троян'), Tr('Fishing xati', 'Фишинговое письмо'), Tr('Parol', 'Пароль')])),
        Q(2, (g) => g.quiz(const Tr('Ransomware’ga to‘lov qilish to‘g‘rimi?', 'Платить ли выкуп ransomware?'), const Tr('Tavsiya etilmaydi — fayl qaytishi kafolatlanmaydi', 'Не рекомендуется — возврат файлов не гарантирован'),
            const [Tr('Ha, darhol', 'Да, сразу'), Tr('Ha, ikki marta', 'Да, дважды'), Tr('Faqat kechasi', 'Только ночью')])),
        Q(3, (g) => g.quiz(const Tr('Kompyuter sekinlashdi, o‘zi reklama ochyapti, noma’lum dastur paydo bo‘ldi. Birinchi qadam:', 'Компьютер тормозит, сам открывает рекламу, появилась неизвестная программа. Первый шаг:'),
            const Tr('Internetdan uzish va antivirus bilan tekshirish', 'Отключить интернет и проверить антивирусом'),
            const [Tr('Parollarni shu kompyuterda yozish', 'Вводить пароли на этом компьютере'), Tr('E’tibor bermaslik', 'Не обращать внимания'), Tr('Ko‘proq ilova o‘rnatish', 'Поставить больше программ')])),
], 3),
      g.order(const Tr('Zararlanganda tiklanish:', 'Восстановление после заражения:'), ['Internetdan uzish', 'Antivirus bilan tozalash', 'Parollarni almashtirish', 'Zaxiradan tiklash']),
    ];

// ---------------------------------------------------------------- 10. Xesh
List<LessonStep> cy10(Gen g) => [
      const LessonStep.read(
        h: Tr('Xesh: parollarni qanday saqlashadi', 'Хеш: как хранят пароли'),
        p: Tr(
            'Xesh-funksiya istalgan matndan qisqa “barmoq izi” yasaydi (masalan SHA-256). Bitta harf o‘zgarsa — xesh butunlay o‘zgaradi. Xeshdan asl matnni qaytarib bo‘lmaydi. '
                'Yaxshi saytlar parolni emas, uning xeshini saqlaydi; tuz (salt) — har bir foydalanuvchiga qo‘shiladigan tasodifiy qo‘shimcha, bir xil parollar ham har xil xesh beradi.',
            'Хеш-функция делает из любого текста короткий «отпечаток» (например, SHA-256). Изменится одна буква — хеш изменится полностью. Из хеша нельзя вернуть исходный текст. '
                'Хорошие сайты хранят не пароль, а его хеш; соль (salt) — случайная добавка для каждого пользователя, чтобы одинаковые пароли давали разные хеши.'),
      ),
      ...g.from([
        Q(1, (g) => g.quiz(const Tr('Xeshdan asl parolni to‘g‘ridan-to‘g‘ri qaytarish mumkinmi?', 'Можно ли напрямую получить пароль из хеша?'), const Tr('Yo‘q, bu bir tomonlama funksiya', 'Нет, это односторонняя функция'),
            const [Tr('Ha, osongina', 'Да, легко'), Tr('Faqat admin', 'Только админ'), Tr('Ha, kalit bilan', 'Да, ключом')])),
        Q(2, (g) => g.quiz(const Tr('“salom” va “Salom” xeshlari…', 'Хеши «salom» и «Salom»…'), const Tr('Butunlay boshqacha', 'Совсем разные'),
            const [Tr('Bir xil', 'Одинаковые'), Tr('Bitta harfi farq qiladi', 'Отличаются одной буквой'), Tr('Xesh yo‘q', 'Хеша нет')])),
        Q(2, (g) => g.quiz(const Tr('Sayt bazasi o‘g‘irlandi. Qaysi holat eng xavfsiz?', 'Базу сайта украли. Какой случай безопаснее?'), const Tr('Parollar tuzli xesh ko‘rinishida', 'Пароли в виде солёных хешей'),
            const [Tr('Parollar ochiq matnda', 'Пароли открытым текстом'), Tr('Parollar Excel’da', 'Пароли в Excel'), Tr('Hammasi bir xil', 'Всё одинаково')])),
        Q(3, (g) => g.quiz(const Tr('Tuz (salt) nima beradi?', 'Что даёт соль (salt)?'), const Tr('Bir xil parollar har xil xesh beradi, tayyor jadvallar ishlamaydi', 'Одинаковые пароли дают разные хеши, готовые таблицы не работают'),
            const [Tr('Parolni qisqartiradi', 'Укорачивает пароль'), Tr('Ta’mni yaxshilaydi', 'Улучшает вкус'), Tr('Xeshni o‘chiradi', 'Удаляет хеш')])),
        Q(3, (g) => g.quiz(const Tr('Yuklab olingan fayl xeshi rasmiy saytdagidan farq qildi. Bu nimani bildiradi?', 'Хеш скачанного файла отличается от указанного на сайте. Что это значит?'),
            const Tr('Fayl o‘zgartirilgan yoki buzilgan — ishlatmang', 'Файл изменён или повреждён — не используйте'),
            const [Tr('Hammasi joyida', 'Всё в порядке'), Tr('Fayl yangiroq', 'Файл новее'), Tr('Internet tez', 'Интернет быстрый')])),
], 3),
      g.order(const Tr('Ro‘yxatdan o‘tishda parol:', 'Пароль при регистрации:'), ['Parol kiritiladi', 'Tasodifiy tuz qo‘shiladi', 'Xesh hisoblanadi', 'Faqat xesh saqlanadi']),
    ];

// ================================================================ USTALAR / МАСТЕРА
// ---------------------------------------------------------------- 11. Sezar shifri Python’da
List<LessonStep> cy11(Gen g) {
  final k = 2 + g.r.nextInt(3);
  return [
    const LessonStep.read(
      h: Tr('Shifrni kod bilan yozamiz', 'Пишем шифр кодом'),
      p: Tr(
          'Harfni songa aylantiramiz: ord("A") = 65. Surish: (kod − 65 + k) % 26 + 65 — % 26 alifbo oxiridan boshiga qaytaradi (Z → A). So‘ng chr() bilan yana harf. '
              'Deshifrlash — xuddi shu, faqat −k. Kalitni bilmasak, 25 tasini ham sinab ko‘ramiz (brute force) — shuning uchun Sezar zaif.',
          'Превращаем букву в число: ord("A") = 65. Сдвиг: (код − 65 + k) % 26 + 65 — % 26 возвращает с конца алфавита в начало (Z → A). Потом chr() — снова буква. '
              'Расшифровка — то же самое, но с −k. Не знаем ключ — перебираем все 25 (brute force), поэтому Цезарь слабый.'),
    ),
    ...g.from([
      Q(1, (g) => g.quizCode(const Tr('ord("A") natijasi:', 'Результат ord("A"):'), '65', ['1', '97', '0'])),
      Q(2, (g) => g.quizCode(Tr('k=$k, harf “Z”. (90 − 65 + $k) % 26 + 65 = ?', 'k=$k, буква «Z». (90 − 65 + $k) % 26 + 65 = ?'), '${(25 + k) % 26 + 65}',
          ['${90 + k}', '${65 + k}', '90'])),
      Q(2, (g) => g.quiz(const Tr('Nima uchun % 26 kerak?', 'Зачем нужен % 26?'), const Tr('Z dan keyin A ga qaytish uchun', 'Чтобы после Z вернуться к A'),
          const [Tr('Tezlik uchun', 'Для скорости'), Tr('Sonni kattalashtirish uchun', 'Чтобы увеличить число'), Tr('Kerak emas', 'Не нужен')])),
      Q(3, (g) => g.quizCode(const Tr('Deshifrlash formulasi:', 'Формула расшифровки:'), '(c - 65 - k) % 26 + 65', ['(c - 65 + k) % 26 + 65', 'c * k', '(c + k) // 26'])),
      Q(3, (g) => g.quizCode(const Tr('Kalitni bilmasdan Sezarni ochish uchun nechta urinish yetadi?', 'Сколько попыток хватит, чтобы вскрыть Цезаря без ключа?'), '25', ['1000000', '2', '26²'])),
    ], 3),
    g.order(const Tr('Shifrlash kodi tartibi:', 'Порядок кода шифрования:'), ['for h in matn:', '    n = ord(h) - 65', '    n = (n + k) % 26', '    natija += chr(n + 65)']),
  ];
}

// ---------------------------------------------------------------- 12. Parol kuchi matematikasi
List<LessonStep> cy12(Gen g) {
  final len = g.pick(const [4, 6]);
  return [
    const LessonStep.read(
      h: Tr('Parol kuchining matematikasi', 'Математика силы пароля'),
      p: Tr(
          'Variantlar soni = (belgilar soni) ^ (uzunlik). Faqat raqamli 4 xonali PIN: 10⁴ = 10 000 — kompyuter bir zumda sinaydi. '
              'Kichik harf (26) bilan 8 belgi: 26⁸ ≈ 209 mlrd. Katta+kichik+raqam+belgi (~94) bilan 12 belgi: 94¹² ≈ 4,7·10²³ — yuz minglab yil. '
              'Himoya tomoni: urinishlarni cheklash (5 xato → kutish), 2FA, uzun parol.',
          'Число вариантов = (число символов) ^ (длина). Цифровой PIN из 4 цифр: 10⁴ = 10 000 — компьютер переберёт мгновенно. '
              'Строчные буквы (26), 8 символов: 26⁸ ≈ 209 млрд. Заглавные+строчные+цифры+знаки (~94), 12 символов: 94¹² ≈ 4,7·10²³ — сотни тысяч лет. '
              'Со стороны защиты: ограничение попыток (5 ошибок → ожидание), 2FA, длинный пароль.'),
    ),
    ...g.from([
      Q(1, (g) => g.quizCode(Tr('$len xonali, faqat raqamli PIN nechta variant?', 'Сколько вариантов у PIN из $len цифр?'), len == 4 ? '10000' : '1000000',
          len == 4 ? ['40', '9999', '4000'] : ['60', '999999', '6000'])),
      Q(2, (g) => g.quiz(const Tr('Parolni 1 belgiga uzaytirish (94 xil belgi) variantlarni necha marta oshiradi?', 'Удлинение пароля на 1 символ (94 символа) увеличивает варианты во сколько раз?'),
          const Tr('94 marta', 'в 94 раза'), const [Tr('1 marta', 'в 1 раз'), Tr('2 marta', 'в 2 раза'), Tr('O‘zgarmaydi', 'Не меняется')])),
      Q(2, (g) => g.quiz(const Tr('Saytda “5 marta xato — 15 daqiqa kuting” qoidasi nima uchun?', 'Зачем правило «5 ошибок — ждите 15 минут»?'), const Tr('Brute-force’ni amalda imkonsiz qiladi', 'Делает перебор практически невозможным'),
          const [Tr('Foydalanuvchini jazolash', 'Наказать пользователя'), Tr('Serverni tezlatish', 'Ускорить сервер'), Tr('Reklama ko‘rsatish', 'Показать рекламу')])),
      Q(3, (g) => g.quiz(const Tr('Qaysi biri kuchliroq?', 'Что надёжнее?'), const Tr('“tog‘ bulut kitob anor” (4 so‘z, 20+ belgi)', '«tog‘ bulut kitob anor» (4 слова, 20+ символов)'),
          const [Tr('“P@ss1”', '«P@ss1»'), Tr('“Aa1!”', '«Aa1!»'), Tr('“12345678”', '«12345678»')],
          e: const Tr('Uzunlik eng katta ta’sir qiladi: daraja ko‘rsatkichi o‘sadi.', 'Длина влияет сильнее всего: растёт показатель степени.'))),
      Q(3, (g) => g.quizCode(const Tr('Lug‘at hujumi (dictionary attack) qaysi parolni tez topadi?', 'Какой пароль быстро найдёт атака по словарю?'), 'football2010', ['Tq9#vL2!mZ8@', 'k7#P!x2Q9&wR', 'r!8Zm#2Qp@7L'])),
    ], 3),
    g.fill(const Tr('26 harfli alifbo, 2 belgili parol: nechta variant?', 'Алфавит из 26 букв, пароль из 2 символов: сколько вариантов?'), '26 × 26 = ', '', ['676']),
  ];
}

// ---------------------------------------------------------------- 13. SQL injection va himoya
List<LessonStep> cy13(Gen g) => [
      const LessonStep.read(
        h: Tr('SQL injection va undan himoya', 'SQL-инъекция и защита от неё'),
        p: Tr(
            'Sayt bazadan so‘raganda foydalanuvchi matnini SQL buyrug‘iga to‘g‘ridan-to‘g‘ri “yopishtirsa”, maxsus belgilar ( \' ) buyruq ma’nosini o‘zgartirib yuboradi — bu SQL injection. '
                'Himoya — parametrli so‘rov: SQL buyrug‘i alohida, foydalanuvchi ma’lumoti alohida yuboriladi va hech qachon buyruq bo‘lib bajarilmaydi. '
                'Qo‘shimcha: kiruvchi ma’lumotni tekshirish, bazaga minimal huquq. Idrok serveri ham shunday qilingan: “?” belgilari bilan.',
            'Если сайт «приклеивает» текст пользователя прямо в SQL-команду, спецсимволы ( \' ) меняют смысл команды — это SQL-инъекция. '
                'Защита — параметризованный запрос: команда SQL отдельно, данные пользователя отдельно, и они никогда не выполняются как команда. '
                'Дополнительно: проверка входных данных, минимальные права у базы. Сервер Idrok сделан именно так: с символами «?».'),
      ),
      ...g.from([
        Q(1, (g) => g.quiz(const Tr('SQL injection sababi nima?', 'Причина SQL-инъекции?'), const Tr('Foydalanuvchi matni buyruqqa to‘g‘ridan-to‘g‘ri qo‘shilgan', 'Текст пользователя вставлен прямо в команду'),
            const [Tr('Sekin internet', 'Медленный интернет'), Tr('Katta shrift', 'Крупный шрифт'), Tr('Rang', 'Цвет')])),
        Q(2, (g) => g.quizCode(const Tr('Qaysi kod xavfsiz?', 'Какой код безопасен?'), 'db.execute("SELECT * FROM users WHERE name=?", (ism,))',
            ['db.execute("SELECT * FROM users WHERE name=\'" + ism + "\'")', 'db.execute(f"SELECT * FROM users WHERE name=\'{ism}\'")', 'db.execute("SELECT * FROM users WHERE name=" + ism)'])),
        Q(2, (g) => g.quiz(const Tr('Parametrli so‘rov nima qiladi?', 'Что делает параметризованный запрос?'), const Tr('Ma’lumotni hech qachon buyruq sifatida bajarmaydi', 'Никогда не выполняет данные как команду'),
            const [Tr('Parolni ko‘rsatadi', 'Показывает пароль'), Tr('Bazani o‘chiradi', 'Удаляет базу'), Tr('Hech narsa', 'Ничего')])),
        Q(3, (g) => g.quiz(const Tr('“Minimal huquq” printsipi bazaga nimani anglatadi?', 'Что означает принцип «минимальных прав» для базы?'),
            const Tr('Sayt hisobi faqat keragini qila oladi (masalan, jadvalni o‘chira olmaydi)', 'Аккаунт сайта может только нужное (например, не может удалить таблицу)'),
            const [Tr('Hammaga admin huquq', 'Всем права админа'), Tr('Parolsiz baza', 'База без пароля'), Tr('Bitta jadval', 'Одна таблица')])),
        Q(3, (g) => g.quiz(const Tr('Saytda zaiflik topdingiz. Axloqiy yo‘l:', 'Нашли уязвимость на сайте. Этичный путь:'), const Tr('Egasiga yashirin xabar berish (responsible disclosure)', 'Тихо сообщить владельцу (responsible disclosure)'),
            const [Tr('Ma’lumotlarni yuklab olish', 'Скачать данные'), Tr('Ijtimoiy tarmoqda e’lon qilish', 'Опубликовать в соцсетях'), Tr('Do‘stlarga o‘rgatish', 'Научить друзей')])),
], 3),
      g.order(const Tr('Xavfsiz so‘rov yozish:', 'Безопасный запрос:'), ['Ma’lumotni tekshirish', 'SQL’da ? qo‘yish', 'Ma’lumotni alohida berish', 'Natijani qaytarish']),
    ];

// ---------------------------------------------------------------- 14. XSS
List<LessonStep> cy14(Gen g) => [
      const LessonStep.read(
        h: Tr('XSS va chiqishni ekranlash', 'XSS и экранирование вывода'),
        p: Tr(
            'XSS (Cross-Site Scripting) — sayt foydalanuvchi yozgan matnni HTML sifatida ko‘rsatib yuborsa, kimdir izohga <script> yozib, boshqalarning brauzerida kod ishga tushiradi. '
                'Himoya — ekranlash (escaping): < belgisi &lt; ga, > esa &gt; ga aylantiriladi, shunda matn faqat matn bo‘lib ko‘rinadi. '
                'Qo‘shimcha: Content-Security-Policy (CSP) sarlavhasi. Idrok sertifikat sahifasi ham shunday himoyalangan.',
            'XSS (межсайтовый скриптинг) — если сайт показывает текст пользователя как HTML, кто-то напишет в комментарии <script>, и код запустится в браузерах других людей. '
                'Защита — экранирование: символ < превращается в &lt;, > — в &gt;, и текст показывается просто как текст. '
                'Дополнительно: заголовок Content-Security-Policy (CSP). Страница сертификатов Idrok защищена именно так.'),
      ),
      ...g.from([
        Q(1, (g) => g.quizCode(const Tr('< belgisi ekranlanganda nima bo‘ladi?', 'Во что экранируется символ <?'), '&lt;', ['&gt;', '<<', '&amp;'])),
        Q(2, (g) => g.quiz(const Tr('XSS kimga zarar beradi?', 'Кому вредит XSS?'), const Tr('Saytga kirgan boshqa foydalanuvchilarga', 'Другим посетителям сайта'),
            const [Tr('Faqat serverga', 'Только серверу'), Tr('Hech kimga', 'Никому'), Tr('Faqat yozganga', 'Только автору')])),
        Q(2, (g) => g.quizCode(const Tr('Python’da HTML ekranlash:', 'Экранирование HTML в Python:'), 'html.escape(matn)', ['print(matn)', 'matn.upper()', 'eval(matn)'])),
        Q(3, (g) => g.quiz(const Tr('Asosiy qoida:', 'Главное правило:'), const Tr('Foydalanuvchi ma’lumotiga hech qachon ishonmang — kirishda tekshiring, chiqishda ekranlang', 'Никогда не доверяйте вводу — проверяйте на входе, экранируйте на выходе'),
            const [Tr('Hamma ma’lumot xavfsiz', 'Все данные безопасны'), Tr('Faqat parolni tekshiring', 'Проверяйте только пароль'), Tr('Ekranlash sekin, kerak emas', 'Экранирование медленное, не нужно')])),
        Q(3, (g) => g.quiz(const Tr('CSP sarlavhasi nima qiladi?', 'Что делает заголовок CSP?'), const Tr('Sahifada qaysi skriptlar ishlashi mumkinligini cheklaydi', 'Ограничивает, какие скрипты могут работать на странице'),
            const [Tr('Rangni o‘zgartiradi', 'Меняет цвет'), Tr('Parol saqlaydi', 'Хранит пароль'), Tr('Saytni tezlatadi', 'Ускоряет сайт')])),
], 3),
      g.fill(const Tr('> belgisi ekranlansa:', 'Символ > после экранирования:'), '', '', ['&gt;']),
    ];

// ---------------------------------------------------------------- 15. Loglar va aniqlash
List<LessonStep> cy15(Gen g) {
  final ip = '10.0.${g.r.nextInt(9) + 1}.${g.r.nextInt(200) + 20}';
  return [
    const LessonStep.read(
      h: Tr('Loglar: hujumni qanday payqashadi', 'Логи: как замечают атаку'),
      p: Tr(
          'Log — server yozib boradigan kundalik: kim, qachon, nima qildi. Himoyachi (SOC tahlilchisi) loglardan g‘alati naqsh qidiradi: bitta IP dan 1 daqiqada 500 ta xato kirish, '
              'tunda admin kirishi, yangi davlatdan kirish. Bunda IP bloklanadi, akkaunt vaqtincha qulflanadi, egasiga xabar boriladi. Loglarni o‘chirib bo‘lmaydigan joyda saqlash kerak.',
          'Лог — дневник сервера: кто, когда, что сделал. Защитник (аналитик SOC) ищет в логах странные шаблоны: 500 неудачных входов за минуту с одного IP, '
              'вход админа ночью, вход из новой страны. Тогда IP блокируют, аккаунт временно замораживают, владельца предупреждают. Логи хранят там, где их нельзя стереть.'),
    ),
    ...g.from([
      Q(1, (g) => g.quiz(Tr('Logda: $ip dan 1 daqiqada 500 ta “parol xato”. Bu nima?', 'В логе: с $ip за минуту 500 «неверный пароль». Что это?'),
          const Tr('Parolni tanlash urinishi (brute force)', 'Попытка подбора пароля (brute force)'),
          const [Tr('Oddiy foydalanuvchi', 'Обычный пользователь'), Tr('Server yangilanishi', 'Обновление сервера'), Tr('Hech narsa', 'Ничего')])),
      Q(2, (g) => g.quiz(const Tr('Shunday holatda to‘g‘ri javob:', 'Правильная реакция в этом случае:'), const Tr('IP ni vaqtincha bloklash va hodisani yozib qo‘yish', 'Временно заблокировать IP и записать инцидент'),
          const [Tr('Serverni o‘chirib, unutish', 'Выключить сервер и забыть'), Tr('Loglarni o‘chirish', 'Удалить логи'), Tr('Hujumchiga javob hujumi', 'Атаковать в ответ')])),
      Q(2, (g) => g.quiz(const Tr('Nega loglarni alohida, o‘chirib bo‘lmaydigan joyda saqlashadi?', 'Почему логи хранят отдельно, без возможности удаления?'), const Tr('Hujumchi izini yashira olmasligi uchun', 'Чтобы атакующий не смог скрыть следы'),
          const [Tr('Joy tejash uchun', 'Для экономии места'), Tr('Chiroyli bo‘lishi uchun', 'Для красоты'), Tr('Kerak emas', 'Не нужно')])),
      Q(3, (g) => g.quiz(const Tr('Qaysi biri eng shubhali?', 'Что самое подозрительное?'), const Tr('Admin soat 03:00 da yangi davlatdan kirdi', 'Админ вошёл в 03:00 из новой страны'),
          const [Tr('O‘quvchi 15:00 da dars ochdi', 'Ученик открыл урок в 15:00'), Tr('Ustoz test yaratdi', 'Учитель создал тест'), Tr('Sahifa yangilandi', 'Страница обновилась')])),
      Q(3, (g) => g.quiz(const Tr('SOC nima?', 'Что такое SOC?'), const Tr('Xavfsizlikni kuzatuvchi markaz (jamoa)', 'Центр (команда) мониторинга безопасности'),
          const [Tr('Ijtimoiy tarmoq', 'Соцсеть'), Tr('O‘yin', 'Игра'), Tr('Dasturlash tili', 'Язык программирования')])),
    ], 3),
    g.order(const Tr('Hodisaga javob (incident response):', 'Реагирование на инцидент:'), ['Aniqlash', 'Cheklash (izolyatsiya)', 'Tozalash', 'Tiklash', 'Xulosa chiqarish']),
  ];
}

// ---------------------------------------------------------------- 16. Ijtimoiy muhandislik
List<LessonStep> cy16(Gen g) => [
      const LessonStep.read(
        h: Tr('Ijtimoiy muhandislik', 'Социальная инженерия'),
        p: Tr(
            'Ijtimoiy muhandislik — texnikani emas, odamni “buzish”: ishonch, qo‘rquv, shoshilish yoki yordam berish istagidan foydalanish. '
                'Usullar: o‘zini “IT xodim”, “ustoz” yoki “bank” deb tanishtirish; soxta voqea to‘qish (pretexting); “tekin sovg‘a” (baiting); ortidan kirib olish (tailgating). '
                'Himoya: shaxsni boshqa kanal orqali tasdiqlash, qoidaga amal qilish, “yo‘q” deyishni bilish.',
            'Социальная инженерия — «взлом» не техники, а человека: через доверие, страх, спешку или желание помочь. '
                'Приёмы: представиться «айтишником», «учителем» или «банком»; придумать легенду (pretexting); «бесплатный подарок» (baiting); пройти следом в дверь (tailgating). '
                'Защита: подтверждать личность через другой канал, соблюдать правила, уметь сказать «нет».'),
      ),
      ...g.from([
        Q(1, (g) => g.quiz(const Tr('“Men IT bo‘limidanman, parolingizni ayting, tizimni tekshiraman”. Bu…', '«Я из IT-отдела, назовите пароль, проверю систему». Это…'),
            const Tr('Ijtimoiy muhandislik', 'Социальная инженерия'), const [Tr('Oddiy tekshiruv', 'Обычная проверка'), Tr('Yangilanish', 'Обновление'), Tr('Antivirus', 'Антивирус')])),
        Q(2, (g) => g.quiz(const Tr('“Direktor” yozdi: “Shoshilinch! 5 ta karta sotib ol, kodlarini yubor”. To‘g‘ri harakat:', '«Директор» пишет: «Срочно! Купи 5 карт, пришли коды». Правильно:'),
            const Tr('Direktorga boshqa yo‘l bilan (qo‘ng‘iroq) tasdiqlash', 'Подтвердить у директора другим путём (звонком)'),
            const [Tr('Darrov sotib olish', 'Сразу купить'), Tr('Kodlarni yuborish', 'Прислать коды'), Tr('Yarmini yuborish', 'Прислать половину')])),
        Q(2, (g) => g.quiz(const Tr('Begona odam qulfli eshikdan ortingizdan kirmoqchi. Bu…', 'Незнакомец хочет пройти за вами через закрытую дверь. Это…'), const Tr('Tailgating', 'Tailgating'),
            const [Tr('Fishing', 'Фишинг'), Tr('Xesh', 'Хеш'), Tr('DNS', 'DNS')])),
        Q(3, (g) => g.quiz(const Tr('Hujumchi qaysi his-tuyg‘ularga ko‘proq tayanadi?', 'На какие чувства чаще всего давит атакующий?'), const Tr('Shoshilish, qo‘rquv, ishonch', 'Спешка, страх, доверие'),
            const [Tr('Zerikish', 'Скука'), Tr('Ochlik', 'Голод'), Tr('Uyqu', 'Сон')])),
        Q(3, (g) => g.quiz(const Tr('Eng kuchli himoya:', 'Самая сильная защита:'), const Tr('Ta’lim va “avval tasdiqla” odati', 'Обучение и привычка «сначала проверь»'),
            const [Tr('Qimmat kompyuter', 'Дорогой компьютер'), Tr('Hech kimga ishonmaslik va gapirmaslik', 'Никому не верить и ни с кем не говорить'), Tr('Faqat antivirus', 'Только антивирус')])),
], 3),
      g.order(const Tr('Shubhali iltimosga javob:', 'Ответ на подозрительную просьбу:'), ['To‘xtash', 'Kim ekanini tasdiqlash', 'Qoidani eslash', 'Rad etish yoki xabar berish']),
    ];

// ---------------------------------------------------------------- 17. Tarmoq himoyasi
List<LessonStep> cy17(Gen g) => [
      const LessonStep.read(
        h: Tr('Tarmoq himoyasi: firewall, VPN, huquqlar', 'Защита сети: firewall, VPN, права'),
        p: Tr(
            'Firewall (tarmoqlararo ekran) — qaysi ulanish kirishi va chiqishini hal qiladigan “qo‘riqchi”. VPN — ulanishni shifrlangan “tunnel”dan o‘tkazadi. '
                'Minimal huquq printsipi: har kim faqat ishiga kerak bo‘lgan huquqqa ega. Chuqur himoya (defense in depth) — bir nechta qatlam: biri yiqilsa, keyingisi ushlab qoladi. '
                'Zero Trust — “hech kimga avtomatik ishonma, har safar tekshir”.',
            'Firewall (межсетевой экран) — «охранник», решающий, какие соединения входят и выходят. VPN — пропускает соединение через зашифрованный «туннель». '
                'Принцип минимальных прав: у каждого только те права, что нужны для работы. Эшелонированная защита (defense in depth) — несколько слоёв: упал один — держит следующий. '
                'Zero Trust — «никому не доверяй автоматически, проверяй каждый раз».'),
      ),
      ...g.from([
        Q(1, (g) => g.quiz(const Tr('Firewall nima qiladi?', 'Что делает firewall?'), const Tr('Ulanishlarni qoida bo‘yicha o‘tkazadi yoki to‘sadi', 'Пропускает или блокирует соединения по правилам'),
            const [Tr('Rasm chizadi', 'Рисует'), Tr('Parol yaratadi', 'Создаёт пароли'), Tr('Internetni tekin qiladi', 'Делает интернет бесплатным')])),
        Q(2, (g) => g.quiz(const Tr('O‘quvchi akkauntiga admin huquqi berildi. Qaysi printsip buzildi?', 'Аккаунту ученика дали права админа. Какой принцип нарушен?'),
            const Tr('Minimal huquq', 'Минимальных прав'), const [Tr('Zaxira nusxa', 'Резервной копии'), Tr('Shifrlash', 'Шифрования'), Tr('DNS', 'DNS')])),
        Q(2, (g) => g.quiz(const Tr('Defense in depth nima?', 'Что такое defense in depth?'), const Tr('Bir nechta himoya qatlami', 'Несколько слоёв защиты'),
            const [Tr('Bitta juda kuchli parol', 'Один очень сильный пароль'), Tr('Chuqur suvga sho‘ng‘ish', 'Нырять глубоко'), Tr('Faqat firewall', 'Только firewall')])),
        Q(3, (g) => g.quiz(const Tr('Zero Trust g‘oyasi:', 'Идея Zero Trust:'), const Tr('Ichki tarmoqdagi qurilmaga ham har safar tekshiruv', 'Проверять каждый раз даже устройство во внутренней сети'),
            const [Tr('Hammaga to‘liq ishonish', 'Полностью доверять всем'), Tr('Parolsiz ishlash', 'Работать без паролей'), Tr('Tarmoqni o‘chirish', 'Отключить сеть')])),
        Q(3, (g) => g.quiz(const Tr('VPN nimadan himoya qilmaydi?', 'От чего VPN НЕ защищает?'), const Tr('Fishing saytga o‘zingiz parol yozishdan', 'От того, что вы сами введёте пароль на фишинговом сайте'),
            const [Tr('Ommaviy Wi-Fi’da kuzatishdan', 'От слежки в публичном Wi-Fi'), Tr('Provayder ko‘rishidan', 'От того, что видит провайдер'), Tr('Ochiq trafikdan', 'От открытого трафика')])),
], 3),
      g.order(const Tr('Maktab tarmog‘ini himoyalash qatlamlari:', 'Слои защиты школьной сети:'), ['Firewall', 'Yangilanishlar', 'Minimal huquqlar', 'Loglarni kuzatish', 'O‘quvchilarni o‘qitish']),
    ];

// ---------------------------------------------------------------- 18. Etika va qonun
List<LessonStep> cy18(Gen g) => [
      const LessonStep.read(
        h: Tr('Etika, qonun va kasb', 'Этика, закон и профессия'),
        p: Tr(
            'Ruxsatsiz birovning akkaunti, sayti yoki tarmog‘iga kirish — O‘zbekistonda ham, butun dunyoda ham jinoyat. Bilim — kuch, lekin faqat himoya uchun. '
                'Qonuniy yo‘llar: o‘zingizning “laboratoriya”ngiz (virtual mashina), CTF musobaqalari, Bug Bounty dasturlari (kompaniya o‘zi ruxsat beradi va mukofot to‘laydi). '
                'Kasblar: SOC tahlilchisi, pentester, xavfsizlik muhandisi, kriminalist — dunyoda eng talab yuqori kasblardan.',
            'Вход без разрешения в чужой аккаунт, сайт или сеть — преступление и в Узбекистане, и во всём мире. Знание — сила, но только для защиты. '
                'Законные пути: своя «лаборатория» (виртуальная машина), соревнования CTF, программы Bug Bounty (компания сама разрешает и платит награду). '
                'Профессии: аналитик SOC, пентестер, инженер безопасности, криминалист — одни из самых востребованных в мире.'),
      ),
      ...g.from([
        Q(1, (g) => g.quiz(const Tr('Do‘stingiz “sinfdoshning akkauntini buzib ko‘raylik” dedi. Javob:', 'Друг предлагает «взломать аккаунт одноклассника». Ответ:'),
            const Tr('Yo‘q — bu noqonuniy va axloqsiz', 'Нет — это незаконно и неэтично'),
            const [Tr('Ha, hazil uchun', 'Да, ради шутки'), Tr('Faqat bir marta', 'Только один раз'), Tr('Agar bilinmasa — mayli', 'Если не узнают — можно')])),
        Q(1, (g) => g.quiz(const Tr('Bug Bounty nima?', 'Что такое Bug Bounty?'), const Tr('Kompaniya ruxsat bergan zaiflik qidirish va mukofot', 'Поиск уязвимостей с разрешения компании и награда'),
            const [Tr('Hasharot ovlash', 'Ловля жуков'), Tr('Virus sotish', 'Продажа вирусов'), Tr('O‘yin', 'Игра')])),
        Q(2, (g) => g.quiz(const Tr('Mashq qilishning xavfsiz va qonuniy joyi:', 'Безопасное и законное место для практики:'), const Tr('O‘z virtual mashinangiz va CTF platformalari', 'Своя виртуальная машина и CTF-платформы'),
            const [Tr('Maktab serveri', 'Школьный сервер'), Tr('Qo‘shnining Wi-Fi’i', 'Wi-Fi соседа'), Tr('Bank sayti', 'Сайт банка')])),
        Q(2, (g) => g.quiz(const Tr('Pentester nima qiladi?', 'Что делает пентестер?'), const Tr('Shartnoma asosida tizimni sinab, hisobot yozadi', 'По договору тестирует систему и пишет отчёт'),
            const [Tr('Yashirincha buzadi', 'Тайно взламывает'), Tr('Faqat kompyuter sotadi', 'Только продаёт компьютеры'), Tr('Dizayn qiladi', 'Делает дизайн')])),
        Q(3, (g) => g.quiz(const Tr('“Oq” va “qora” xakerni ajratadigan asosiy narsa:', 'Главное, что отличает «белого» хакера от «чёрного»:'), const Tr('Ruxsat va niyat', 'Разрешение и намерение'),
            const [Tr('Kompyuter rangi', 'Цвет компьютера'), Tr('Bilim darajasi', 'Уровень знаний'), Tr('Yoshi', 'Возраст')])),
], 3),
      g.order(const Tr('Kiberxavfsizlik mutaxassisi yo‘li:', 'Путь специалиста по кибербезопасности:'), ['Asoslar (tarmoq, OS)', 'Dasturlash (Python)', 'Xavfsizlik nazariyasi', 'CTF va laboratoriya', 'Sertifikat va ish']),
    ];

// ---------------------------------------------------------------- 19. CTF: dekodlash
List<LessonStep> cy19(Gen g) {
  final w = g.pick(const ['IDROK', 'KOD', 'FLAG']);
  final bin = w[0].codeUnitAt(0).toRadixString(2).padLeft(8, '0');
  return [
    const LessonStep.read(
      h: Tr('CTF: bayroqni toping', 'CTF: найдите флаг'),
      p: Tr(
          'CTF (Capture The Flag) — qonuniy kiberxavfsizlik musobaqasi: maxsus tayyorlangan topshiriqdan “bayroq” (masalan flag{...}) topiladi. '
              'Boshlang‘ich topshiriqlar — kodlashlar: ikkilik (01000001 = 65 = “A”), hex (41 = “A”), Base64 (“SGk=” = “Hi”), Sezar. '
              'Kodlash ≠ shifrlash: kodlashni kalitsiz ochish mumkin, u faqat ko‘rinishni o‘zgartiradi.',
          'CTF (Capture The Flag) — законное соревнование по кибербезопасности: в специально подготовленном задании ищут «флаг» (например, flag{...}). '
              'Начальные задания — кодировки: двоичная (01000001 = 65 = «A»), hex (41 = «A»), Base64 («SGk=» = «Hi»), Цезарь. '
              'Кодирование ≠ шифрование: кодировку можно открыть без ключа, она лишь меняет вид.'),
    ),
    ...g.from([
      Q(1, (g) => g.quizCode(const Tr('01000001 ikkilik soni o‘nlikda:', 'Двоичное 01000001 в десятичной:'), '65', ['41', '1', '100'])),
      Q(2, (g) => g.quizCode(Tr('$bin — qaysi harf? (ASCII)', '$bin — какая буква? (ASCII)'), w[0],
          [String.fromCharCode(w.codeUnitAt(0) + 1), String.fromCharCode(w.codeUnitAt(0) - 1), String.fromCharCode(w.codeUnitAt(0) + 2)])),
      Q(2, (g) => g.quizCode(const Tr('Hex 41 qaysi harf?', 'Какая буква hex 41?'), 'A', ['4', 'B', 'Z'])),
      Q(3, (g) => g.quiz(const Tr('Kodlash va shifrlash farqi:', 'Разница кодирования и шифрования:'), const Tr('Kodlash kalitsiz ochiladi, shifrlash — kalit bilan', 'Кодировка открывается без ключа, шифр — только с ключом'),
          const [Tr('Farqi yo‘q', 'Разницы нет'), Tr('Kodlash kuchliroq', 'Кодирование надёжнее'), Tr('Shifrlash kalitsiz ochiladi', 'Шифр открывается без ключа')])),
      Q(3, (g) => g.quizCode(const Tr('Base64’da “SGk=” nima?', 'Что такое «SGk=» в Base64?'), 'Hi', ['SG', 'Hello', 'k='])),
    ], 3),
    g.fill(const Tr('CTF bayrog‘i formati: flag{…}. Bayroqni yozing (ichiga IDROK):', 'Формат флага: flag{…}. Запишите флаг (внутри IDROK):'), 'flag{', '}', ['IDROK', 'idrok']),
  ];
}

// ================================================================ animatsiyalar / анимации
typedef CyScene = (Tr h, Tr p, AnimScene Function(Gen g));

AnimScene _chat(Tr intro, List<(bool, Tr)> b, List<Tr> s) => chatScene(intro, b, s);

final Map<String, CyScene> kCyScenes = {
  'cy1': (const Tr('Uchta qo‘riqchi: CIA', 'Три стража: CIA'), _watch, (g) => _chat(
        const Tr('Maktab sayti uchun uchta savol.', 'Три вопроса для сайта школы.'), const [
          (true, Tr('🔐 Baholarni faqat ustoz va o‘quvchi ko‘radimi?', '🔐 Оценки видят только учитель и ученик?')),
          (true, Tr('🧾 Baholarni hech kim yashirincha o‘zgartira olmaydimi?', '🧾 Никто не может тайно изменить оценки?')),
          (true, Tr('🟢 Sayt imtihon kuni ham ishlaydimi?', '🟢 Сайт работает даже в день экзамена?')),
          (false, Tr('✅ Uchchalasi “ha” — sayt xavfsiz!', '✅ Все три «да» — сайт защищён!')),
        ], const [
          Tr('Maxfiylik — Confidentiality.', 'Конфиденциальность — Confidentiality.'),
          Tr('Butunlik — Integrity.', 'Целостность — Integrity.'),
          Tr('Mavjudlik — Availability.', 'Доступность — Availability.'),
          Tr('C + I + A = xavfsizlik uchburchagi.', 'C + I + A = треугольник безопасности.'),
        ])),
  'cy2': (const Tr('Parol qancha chidaydi', 'Сколько продержится пароль'), _watch, (g) => _chat(
        const Tr('Kompyuter parolni tanlashga urinmoqda…', 'Компьютер пытается подобрать пароль…'), const [
          (false, Tr('“1234” → 0,001 soniya 💥', '«1234» → 0,001 секунды 💥')),
          (false, Tr('“olma2010” → bir necha daqiqa 😬', '«olma2010» → несколько минут 😬')),
          (false, Tr('“Kitob!Olma7Bulut” → millionlab yil 🛡', '«Kitob!Olma7Bulut» → миллионы лет 🛡')),
          (true, Tr('+ 2FA → parol topilsa ham, kod yo‘q 🔒', '+ 2FA → даже с паролем нет кода 🔒')),
        ], const [
          Tr('Qisqa raqamlar — bir zumda.', 'Короткие цифры — мгновенно.'),
          Tr('So‘z + yil — lug‘atda bor.', 'Слово + год — есть в словаре.'),
          Tr('Uzun ibora — juda kuchli.', 'Длинная фраза — очень сильно.'),
          Tr('2FA — ikkinchi qulf.', '2FA — второй замок.'),
        ])),
  'cy3': (const Tr('Fishing xatini tahlil qilamiz', 'Разбираем фишинговое письмо'), _watch, (g) => _chat(
        const Tr('Pochtaga xat keldi.', 'Пришло письмо.'), const [
          (false, Tr('Kimdan: support@instagrarn-help.xyz', 'От: support@instagrarn-help.xyz')),
          (false, Tr('“Akkauntingiz 1 soatda o‘chiriladi!!!”', '«Ваш аккаунт удалят через 1 час!!!»')),
          (false, Tr('“Parolingizni shu yerga yozing 👉 link”', '«Введите пароль здесь 👉 ссылка»')),
          (true, Tr('Bosmayman → spam → rasmiy ilovadan tekshiraman ✅', 'Не нажимаю → спам → проверяю в официальном приложении ✅')),
        ], const [
          Tr('“rn” — “m”ga o‘xshatilgan, .xyz domeni.', '«rn» похоже на «m», домен .xyz.'),
          Tr('Qo‘rqitish va shoshiltirish.', 'Запугивание и спешка.'),
          Tr('Parol so‘rash — 100% fishing.', 'Просят пароль — 100% фишинг.'),
          Tr('To‘xta → tekshir → rasmiy yo‘l.', 'Стоп → проверь → официальный путь.'),
        ])),
  'cy4': (const Tr('Bitta rasm nimani aytadi', 'Что рассказывает одно фото'), _watch, (g) => _chat(
        Tr('${g.pick(_names)} yangi rasm joylamoqchi…', '${g.pick(_names)} хочет выложить новое фото…'), const [
          (true, Tr('📸 Rasm: maktab formasi, orqada maktab raqami', '📸 Фото: школьная форма, на фоне номер школы')),
          (false, Tr('📍 Geoteg: aniq manzil', '📍 Геотег: точный адрес')),
          (false, Tr('🕒 Har kuni 8:00 da shu yerda', '🕒 Каждый день в 8:00 здесь')),
          (true, Tr('Geotegni o‘chirdim, profil yopiq ✅', 'Убрал геотег, профиль закрыт ✅')),
        ], const [
          Tr('Forma va raqam — maktabni ochadi.', 'Форма и номер выдают школу.'),
          Tr('Geoteg — aniq joy.', 'Геотег — точное место.'),
          Tr('Odat — vaqtni ochadi.', 'Привычка выдаёт время.'),
          Tr('Kam ma’lumot — kam xavf.', 'Меньше данных — меньше риска.'),
        ])),
  'cy5': (const Tr('Yangilanish teshikni yopadi', 'Обновление закрывает дыру'), _watch, (g) => _chat(
        const Tr('Telefon xabar berdi…', 'Телефон сообщает…'), const [
          (false, Tr('⚠ Yangilanish: xavfsizlik tuzatishi', '⚠ Обновление: исправление безопасности')),
          (true, Tr('Keyinroq…', 'Потом…')),
          (false, Tr('🦠 Zaiflikdan foydalanuvchi zararli dastur tarqalmoqda', '🦠 Распространяется вредонос, использующий уязвимость')),
          (true, Tr('Hozir yangilayman + zaxira nusxa ✅', 'Обновляю сейчас + бэкап ✅')),
        ], const [
          Tr('Yangilanish — yamoq.', 'Обновление — заплатка.'),
          Tr('Kechiktirish — teshik ochiq qoladi.', 'Откладывать — дыра открыта.'),
          Tr('Hujumchilar eski versiyalarni qidiradi.', 'Атакующие ищут старые версии.'),
          Tr('Yangilanish + backup = tinch uyqu.', 'Обновление + бэкап = спокойный сон.'),
        ])),
  'cy6': (const Tr('Paket sayohati', 'Путешествие пакета'), _watch, (g) => _chat(
        const Tr('Siz idrok.uz ni ochdingiz.', 'Вы открыли idrok.uz.'), const [
          (true, Tr('💻 idrok.uz qayerda?', '💻 Где idrok.uz?')),
          (false, Tr('📖 DNS: 185.199.108.153', '📖 DNS: 185.199.108.153')),
          (true, Tr('🚪 185.199.108.153, 443-eshik, ulanaymi?', '🚪 185.199.108.153, дверь 443, можно подключиться?')),
          (false, Tr('🔒 Ha, shifrlangan ulanish. Mana sahifa!', '🔒 Да, зашифрованное соединение. Вот страница!')),
        ], const [
          Tr('Brauzer nomni biladi, IP ni emas.', 'Браузер знает имя, а не IP.'),
          Tr('DNS — internet telefon kitobi.', 'DNS — телефонная книга интернета.'),
          Tr('443 — HTTPS eshigi.', '443 — дверь HTTPS.'),
          Tr('Paketlar routerlar orqali boradi.', 'Пакеты идут через роутеры.'),
        ])),
  'cy7': (const Tr('Sezar shifri qadamma-qadam', 'Шифр Цезаря по шагам'), _watch, (g) {
        final t = Tracer('py', ['k = 3', 'h = "A"', 'n = ord(h) - 65', 'n = (n + k) % 26', 'print(chr(n + 65))'])
          ..step(0, const Tr('Kalit: 3 qadam surish.', 'Ключ: сдвиг на 3.'), set: 'k', val: 3)
          ..step(1, const Tr('Shifrlanadigan harf.', 'Буква для шифрования.'), set: 'h', val: '"A"')
          ..step(2, const Tr('A → 0 (alifbodagi o‘rni).', 'A → 0 (место в алфавите).'), set: 'n', val: 0)
          ..step(3, const Tr('0 + 3 = 3; % 26 — Z dan keyin A ga qaytadi.', '0 + 3 = 3; % 26 — после Z снова A.'), set: 'n', val: 3)
          ..step(4, const Tr('3 → “D”. A shifrlanib D bo‘ldi!', '3 → «D». A зашифровалась в D!'), print: 'D');
        return t.scene();
      }),
  'cy8': (const Tr('HTTP va HTTPS farqi', 'Разница HTTP и HTTPS'), _watch, (g) => _chat(
        const Tr('Kafedagi Wi-Fi. Kimdir trafikni kuzatyapti 👀', 'Wi-Fi в кафе. Кто-то смотрит трафик 👀'), const [
          (true, Tr('http:// → login=ali, parol=Olma123', 'http:// → login=ali, parol=Olma123')),
          (false, Tr('👀 Kuzatuvchi: hammasini o‘qidim!', '👀 Наблюдатель: всё прочитал!')),
          (true, Tr('https:// → 8f3a…c91e…77b0 (shifrlangan)', 'https:// → 8f3a…c91e…77b0 (зашифровано)')),
          (false, Tr('👀 Kuzatuvchi: hech narsa tushunmadim 😕', '👀 Наблюдатель: ничего не понял 😕')),
        ], const [
          Tr('HTTP — ochiq xat.', 'HTTP — открытое письмо.'),
          Tr('Yo‘ldagi har kim o‘qiy oladi.', 'Его может прочитать любой по пути.'),
          Tr('HTTPS — qulflangan konvert.', 'HTTPS — запечатанный конверт.'),
          Tr('Lekin domenni baribir o‘qing!', 'Но домен всё равно читайте!'),
        ])),
  'cy9': (const Tr('Troyan qanday kiradi', 'Как проникает троян'), _watch, (g) => _chat(
        const Tr('Telegram kanalda reklama…', 'Реклама в Telegram-канале…'), const [
          (false, Tr('🎮 “Premium o‘yin TEKIN! mod.apk”', '🎮 «Премиум-игра БЕСПЛАТНО! mod.apk»')),
          (false, Tr('📲 O‘rnatish: kontakt, SMS, ekran — hammasiga ruxsat bering', '📲 Установка: дайте доступ к контактам, SMS, экрану')),
          (true, Tr('O‘yinga SMS ruxsati nega kerak? 🤔', 'Зачем игре доступ к SMS? 🤔')),
          (true, Tr('O‘rnatmayman. Faqat Play Market ✅', 'Не ставлю. Только Play Market ✅')),
        ], const [
          Tr('“Tekin premium” — klassik o‘lja.', '«Бесплатный премиум» — классическая приманка.'),
          Tr('Ortiqcha ruxsatlar — qizil bayroq.', 'Лишние разрешения — красный флаг.'),
          Tr('SMS ruxsati → 2FA kodlari o‘g‘irlanadi.', 'Доступ к SMS → крадут коды 2FA.'),
          Tr('Rasmiy do‘kon — xavfsizroq.', 'Официальный магазин — безопаснее.'),
        ])),
  'cy10': (const Tr('Parol bazada qanday turadi', 'Как пароль лежит в базе'), _watch, (g) => renderHtml(
        const Tr('Foydalanuvchilar jadvali.', 'Таблица пользователей.'), [
          ('', _e('th', 'Login | Saqlangan', 0), const Tr('Bazadagi jadval.', 'Таблица в базе.')),
          ('❌ ochiq matn', _e('tr', 'ali | Olma123', 1), const Tr('Yomon: baza o‘g‘irlansa — parol ochiq!', 'Плохо: украдут базу — пароль открыт!')),
          ('❌ tuzsiz xesh', _e('tr', 'vali | 5f4dcc3b…', 2), const Tr('Yaxshiroq, lekin bir xil parol — bir xil xesh.', 'Лучше, но одинаковый пароль — одинаковый хеш.')),
          ('✅ tuz + xesh', _e('tr', 'aziz | 9c1e…:a8f2', 3), const Tr('To‘g‘ri: har kimga tasodifiy tuz + xesh.', 'Правильно: случайная соль + хеш для каждого.')),
        ])),
  'cy11': (const Tr('“KOD” ni shifrlaymiz', 'Шифруем «KOD»'), _watch, (g) {
        final t = Tracer('py', ['natija = ""', 'for h in "KOD":', '    n = (ord(h) - 65 + 1) % 26', '    natija += chr(n + 65)', 'print(natija)'])
          ..step(0, const Tr('Bo‘sh natija, kalit k = 1.', 'Пустой результат, ключ k = 1.'), set: 'natija', val: '""')
          ..step(1, const Tr('1-harf: K', 'Буква 1: K'), set: 'h', val: '"K"')
          ..step(3, const Tr('K → L', 'K → L'), set: 'natija', val: '"L"')
          ..step(1, const Tr('2-harf: O → P', 'Буква 2: O → P'), set: 'natija', val: '"LP"')
          ..step(1, const Tr('3-harf: D → E', 'Буква 3: D → E'), set: 'natija', val: '"LPE"')
          ..step(4, const Tr('Shifr tayyor: LPE', 'Шифр готов: LPE'), print: 'LPE');
        return t.scene();
      }),
  'cy12': (const Tr('Variantlar portlashi', 'Взрыв вариантов'), _watch, (g) {
        final t = Tracer('py', ['belgilar = 94', 'for uzunlik in [4, 8, 12]:', '    variant = belgilar ** uzunlik', '    print(uzunlik, variant)'])
          ..step(0, const Tr('94 xil belgi: harf, raqam, belgi.', '94 разных символа: буквы, цифры, знаки.'), set: 'belgilar', val: 94)
          ..step(2, const Tr('4 belgi: ~78 mln — soniyalarda.', '4 символа: ~78 млн — за секунды.'), set: 'variant', val: '78 074 896')
          ..step(2, const Tr('8 belgi: ~6·10¹⁵ — oylar, yillar.', '8 символов: ~6·10¹⁵ — месяцы, годы.'), set: 'variant', val: '6·10¹⁵')
          ..step(2, const Tr('12 belgi: ~4,7·10²³ — yuz minglab yil!', '12 символов: ~4,7·10²³ — сотни тысяч лет!'), set: 'variant', val: '4.7·10²³')
          ..step(3, const Tr('Xulosa: uzunlik — eng kuchli himoya.', 'Вывод: длина — сильнейшая защита.'), print: '12 → 4.7·10²³');
        return t.scene();
      }),
  'cy13': (const Tr('Parametrli so‘rov himoyasi', 'Защита параметризованным запросом'), _watch, (g) => _chat(
        const Tr('Login formasiga g‘alati matn yozildi.', 'В форму входа ввели странный текст.'), const [
          (true, Tr('Kiritildi: ali\' OR \'1\'=\'1', 'Введено: ali\' OR \'1\'=\'1')),
          (false, Tr('❌ Yopishtirilgan SQL: buyruq ma’nosi o‘zgardi!', '❌ Склеенный SQL: смысл команды изменился!')),
          (true, Tr('✅ WHERE name = ? + (matn alohida)', '✅ WHERE name = ? + (текст отдельно)')),
          (false, Tr('Baza: bunday ism yo‘q. Kirish rad etildi 🛡', 'База: такого имени нет. Вход отклонён 🛡')),
        ], const [
          Tr('Bu “ma’lumot”, lekin ichida SQL belgilari.', 'Это «данные», но внутри символы SQL.'),
          Tr('Yopishtirish — zaiflik.', 'Склеивание — уязвимость.'),
          Tr('? — ma’lumot buyruqdan ajratildi.', '? — данные отделены от команды.'),
          Tr('Matn shunchaki matn bo‘lib qoldi.', 'Текст остался просто текстом.'),
        ])),
  'cy14': (const Tr('Ekranlash qanday ishlaydi', 'Как работает экранирование'), _watch, (g) => renderHtml(
        const Tr('Izohlar bo‘limi.', 'Раздел комментариев.'), [
          ('Izoh: Zo‘r dars!', _e('p', 'Zo‘r dars!', 0), const Tr('Oddiy izoh.', 'Обычный комментарий.')),
          ('Izoh: <script>…</script>', _e('mark', '⚠ Kod bo‘lib ishlashi mumkin edi', 1), const Tr('Ekranlashsiz — brauzer buni kod deb o‘ylaydi!', 'Без экранирования браузер примет это за код!')),
          ('html.escape(izoh)', _e('p', '&lt;script&gt;…', 2), const Tr('< → &lt;, > → &gt;', '< → &lt;, > → &gt;')),
          ('Natija', _e('strong', '<script>… — shunchaki matn ✅', 3), const Tr('Endi u faqat matn, xavfsiz.', 'Теперь это просто текст, безопасно.')),
        ])),
  'cy15': (const Tr('Logda hujumni topamiz', 'Находим атаку в логе'), _watch, (g) => renderHtml(
        const Tr('Server logi.', 'Лог сервера.'), [
          ('', _e('th', 'Vaqt | IP | Hodisa', 0), const Tr('Log jadvali.', 'Таблица лога.')),
          ('', _e('tr', '09:01 | 10.0.4.17 | kirish OK', 1), const Tr('Oddiy kirish.', 'Обычный вход.')),
          ('', _e('tr', '03:12 | 45.9.1.8 | parol xato ×500', 2), const Tr('🚩 500 xato — brute force!', '🚩 500 ошибок — перебор!')),
          ('', _e('tr', '03:13 | 45.9.1.8 | BLOKLANDI', 3), const Tr('Avtomatik qoida IP ni blokladi.', 'Автоправило заблокировало IP.')),
          ('', _e('mark', 'Hodisa yozildi, admin ogohlantirildi', 4), const Tr('Hodisa hujjatlashtirildi.', 'Инцидент задокументирован.')),
        ])),
  'cy16': (const Tr('“IT xodim” qo‘ng‘irog‘i', 'Звонок «айтишника»'), _watch, (g) => _chat(
        const Tr('Telefon jiringladi…', 'Звонит телефон…'), const [
          (false, Tr('Salom, men maktab IT bo‘limidanman. Tizimda xato, parolingizni ayting.', 'Здравствуйте, я из IT-отдела школы. Ошибка в системе, назовите пароль.')),
          (true, Tr('Ismingiz va xonangiz?', 'Ваше имя и кабинет?')),
          (false, Tr('Vaqt yo‘q, tez bo‘ling! Aks holda akkaunt o‘chadi!', 'Нет времени, быстрее! Иначе аккаунт удалят!')),
          (true, Tr('Men o‘zim IT xonaga qo‘ng‘iroq qilaman. Xayr ✅', 'Я сам перезвоню в IT-кабинет. До свидания ✅')),
        ], const [
          Tr('Obro‘ niqobi: “IT bo‘limi”.', 'Маска авторитета: «IT-отдел».'),
          Tr('Tasdiqlash savoli — to‘g‘ri.', 'Проверочный вопрос — правильно.'),
          Tr('Shoshiltirish + qo‘rqitish = qizil bayroq.', 'Спешка + страх = красный флаг.'),
          Tr('Boshqa kanal orqali tasdiqlash — eng yaxshi himoya.', 'Проверка через другой канал — лучшая защита.'),
        ])),
  'cy17': (const Tr('Himoya qatlamlari', 'Слои защиты'), _watch, (g) => renderHtml(
        const Tr('Maktab tarmog‘ini himoyalaymiz.', 'Защищаем школьную сеть.'), [
          ('1-qatlam', _e('li', '🧱 Firewall: keraksiz portlar yopiq', 0), const Tr('Tashqi devor.', 'Внешняя стена.')),
          ('2-qatlam', _e('li', '🔄 Yangilanishlar o‘rnatilgan', 1), const Tr('Teshiklar yopiq.', 'Дыры закрыты.')),
          ('3-qatlam', _e('li', '👤 Minimal huquqlar', 2), const Tr('Har kim faqat o‘z ishini qiladi.', 'Каждый делает только своё.')),
          ('4-qatlam', _e('li', '📜 Loglar kuzatiladi', 3), const Tr('G‘alati harakat ko‘rinadi.', 'Странное поведение заметно.')),
          ('5-qatlam', _e('li', '🎓 Odamlar o‘qitilgan', 4), const Tr('Eng muhim qatlam — inson.', 'Самый важный слой — человек.')),
        ])),
  'cy18': (const Tr('To‘g‘ri yo‘lni tanlash', 'Выбираем правильный путь'), _watch, (g) => _chat(
        const Tr('Dasturchi o‘quvchi saytda xato topdi…', 'Ученик-программист нашёл ошибку на сайте…'), const [
          (true, Tr('Bu zaiflik! Nima qilay?', 'Это уязвимость! Что делать?')),
          (false, Tr('❌ Ma’lumotlarni yuklab olish — jinoyat', '❌ Скачать данные — преступление')),
          (false, Tr('✅ Egasiga xabar berish (responsible disclosure)', '✅ Сообщить владельцу (responsible disclosure)')),
          (true, Tr('Xabar berdim → rahmat xati + Bug Bounty mukofoti 🏆', 'Сообщил → письмо благодарности + награда Bug Bounty 🏆')),
        ], const [
          Tr('Bilim — mas’uliyat.', 'Знание — ответственность.'),
          Tr('Ruxsatsiz — qonunbuzarlik.', 'Без разрешения — нарушение закона.'),
          Tr('Halol yo‘l — xabar berish.', 'Честный путь — сообщить.'),
          Tr('Oq shlyapa — hurmat va kasb.', 'Белая шляпа — уважение и профессия.'),
        ])),
  'cy19': (const Tr('Bayroqni dekodlaymiz', 'Декодируем флаг'), _watch, (g) {
        final t = Tracer('py', ['kod = [73, 68, 82, 79, 75]', 'bayroq = ""', 'for x in kod:', '    bayroq += chr(x)', 'print("flag{" + bayroq + "}")'])
          ..step(0, const Tr('Topshiriq: sonlar ro‘yxati.', 'Задание: список чисел.'), set: 'kod', val: '[73, 68, 82, 79, 75]')
          ..step(1, const Tr('Bo‘sh bayroq.', 'Пустой флаг.'), set: 'bayroq', val: '""')
          ..step(3, const Tr('73 → I', '73 → I'), set: 'bayroq', val: '"I"')
          ..step(3, const Tr('68 → D, 82 → R', '68 → D, 82 → R'), set: 'bayroq', val: '"IDR"')
          ..step(3, const Tr('79 → O, 75 → K', '79 → O, 75 → K'), set: 'bayroq', val: '"IDROK"')
          ..step(4, const Tr('Bayroq topildi! 🚩', 'Флаг найден! 🚩'), print: 'flag{IDROK}');
        return t.scene();
      }),
};
