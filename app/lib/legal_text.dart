// AVTOMATIK — tool/gen_legal.py / АВТОМАТИЧЕСКИ — tool/gen_legal.py
// ignore_for_file: lines_longer_than_80_chars

const String kLegalVersion = "2026-11-09";
const Map<String, String> kLegalUpdated = {"uz": "9-noyabr, 2026", "ru": "9 ноября 2026"};

/// sahifa -> til -> [sarlavha, [xatboshilar]] / страница -> язык -> [заголовок, [абзацы]]
const Map<String, Map<String, String>> kLegalTitles = {"about": {"uz": "Biz haqimizda", "ru": "О нас"}, "privacy": {"uz": "Maxfiylik siyosati", "ru": "Политика конфиденциальности"}, "terms": {"uz": "Foydalanish shartlari", "ru": "Условия использования"}, "delete-account": {"uz": "Hisobni o‘chirish", "ru": "Удаление аккаунта"}};
const List<List<String>> kLegalTeam = [["bexruz", "Mamajonov Bexruz", "Asoschi", "Основатель"], ["vazzohbek", "Satvaldiyev Vazzohbek", "Hammuassis", "Сооснователь"], ["abdurahmon", "Rahimjonov Abdurahmon", "Hammuassis", "Сооснователь"]];
const int kLegalTeamAfter = 2;
const String kLegalPartnerLogo = "kelajak";
const int kLegalPartnerAfter = 3;

const Map<String, Map<String, List<List<Object>>>> kLegalText = {
 "about": {
  "uz": [
   [
    "Idrok Academy nima",
    [
     "Idrok Academy — O‘zbekiston maktab o‘quvchilari uchun dasturlashni o‘yin orqali o‘rgatadigan ilova. HTML, CSS, JavaScript, Python va sun’iy intellekt darslari o‘zbek va rus tillarida: qisqa darslar, animatsiyalar, XP, ligalar, yakuniy imtihon va sertifikat."
    ]
   ],
   [
    "Maqsadimiz",
    [
     "Har bir maktab o‘quvchisi — qaysi viloyat yoki tumanda yashashidan qat’i nazar — kod yozishni qiziqarli va tushunarli tarzda o‘rgana olishi."
    ]
   ],
   [
    "Jamoa",
    []
   ],
   [
    "Qo‘llab-quvvatlovchi",
    [
     "Idrok Academy loyihasi Kelajak Markazlari tomonidan qo‘llab-quvvatlangan va moliyalashtirilgan. Ularning yordami uchun chin dildan minnatdormiz!"
    ]
   ],
   [
    "Ustozlar uchun",
    [
     "Sinf natijalarini kuzatish, o‘z darslari va testlarini yaratish, sun’iy intellekt yordamida kitobdan dars tayyorlash."
    ]
   ],
   [
    "Aloqa",
    [
     "Telegram: @behruz_sk (https://t.me/behruz_sk), email: behryzmamajon@gmail.com"
    ]
   ]
  ],
  "ru": [
   [
    "Что такое Idrok Academy",
    [
     "Idrok Academy — приложение, которое учит школьников Узбекистана программированию в игровой форме. Уроки HTML, CSS, JavaScript, Python и искусственного интеллекта на узбекском и русском языках: короткие уроки, анимации, XP, лиги, итоговый экзамен и сертификат."
    ]
   ],
   [
    "Наша цель",
    [
     "Чтобы каждый школьник — в какой бы области или районе он ни жил — мог интересно и понятно научиться писать код."
    ]
   ],
   [
    "Команда",
    []
   ],
   [
    "При поддержке",
    [
     "Проект Idrok Academy поддержан и профинансирован Kelajak Markazlari. Искренне благодарим их за помощь!"
    ]
   ],
   [
    "Для учителей",
    [
     "Следить за результатами класса, создавать свои уроки и тесты, готовить уроки из книг с помощью искусственного интеллекта."
    ]
   ],
   [
    "Контакты",
    [
     "Telegram: @behruz_sk (https://t.me/behruz_sk), email: behryzmamajon@gmail.com"
    ]
   ]
  ]
 },
 "privacy": {
  "uz": [
   [
    "Kim biz",
    [
     "Idrok Academy — maktab o‘quvchilari uchun dasturlash darslari ilovasi (mobil ilova va veb-sayt). Ushbu siyosat qanday ma’lumot yig‘ilishi, nima uchun ishlatilishi va uni qanday o‘chirish mumkinligini tushuntiradi. Savollar uchun: Telegram: @behruz_sk (https://t.me/behruz_sk), email: behryzmamajon@gmail.com."
    ]
   ],
   [
    "Qanday ma’lumot yig‘amiz",
    [
     "Hisob: login, ism, parol (faqat shifrlangan xesh ko‘rinishida saqlanadi — parolingizni hech kim ko‘ra olmaydi).",
     "Maktab: viloyat, tuman va maktab nomi. Ustozlar uchun — ustoz kodi orqali bog‘langan maktab.",
     "Profil surati: o‘quvchilar ro‘yxatdan o‘tishda yuklaydi. U faqat ilova ichida — ustoz va reytingda ko‘rinadi.",
     "O‘qish natijalari: tugatilgan darslar, XP, testlar va imtihon natijalari, sertifikatlar, do‘kondagi buyurtmalar.",
     "Siz yaratgan narsalar: portfoliodagi kod, ustozlar yuklagan kitoblar (PDF) va darslar.",
     "Biz telefon raqami, joylashuv (GPS), kontaktlar, reklama identifikatori yoki to‘lov kartasi ma’lumotlarini yig‘maymiz. Ilovada reklama va kuzatuv (tracking) xizmatlari yo‘q."
    ]
   ],
   [
    "Nima uchun ishlatamiz",
    [
     "Hisobingizga kirish, darslar va natijalarni saqlash, ustozga sinf natijalarini ko‘rsatish, reyting va sertifikatlar berish uchun. Ma’lumotlaringizni sotmaymiz va reklama uchun bermaymiz."
    ]
   ],
   [
    "Kimlar ko‘radi",
    [
     "Ustozingiz — o‘z maktabidagi o‘quvchilarning ismi, surati va natijalari.",
     "Boshqa o‘quvchilar — reytingda ism, surat va XP.",
     "Hamma (havola orqali) — siz ulashgan portfolio sahifasi va sertifikatni tekshirish sahifasi (ism, kurs, sana).",
     "Texnik xizmatlar: server Render.com da, zaxira nusxa Supabase.com da saqlanadi (serverlar O‘zbekistondan tashqarida bo‘lishi mumkin). Ustoz AI funksiyasidan foydalanganda dars matni yoki kitob matni Google Gemini xizmatiga yuboriladi. O‘quvchilarning shaxsiy ma’lumotlari (ism, surat) AI ga yuborilmaydi."
    ]
   ],
   [
    "Bolalar",
    [
     "Ilova maktab o‘quvchilari uchun. 18 yoshga to‘lmagan foydalanuvchi ota-onasi yoki vasiysining roziligi bilan ro‘yxatdan o‘tadi — bu ro‘yxatdan o‘tishda tasdiqlanadi. Ota-ona istalgan vaqtda farzandining ma’lumotlarini ko‘rishni yoki o‘chirishni so‘rashi mumkin."
    ]
   ],
   [
    "Qancha saqlaymiz",
    [
     "Hisob mavjud bo‘lguncha. Hisobni o‘chirsangiz, ma’lumotlar darhol bazadan o‘chiriladi; zaxira nusxalardan esa qisqa vaqt ichida yo‘qoladi."
    ]
   ],
   [
    "Sizning huquqlaringiz",
    [
     "Ma’lumotlaringizni ko‘rish, tuzatish (profilda) va to‘liq o‘chirish (Profil → «Hisobni o‘chirish»). Boshqa so‘rovlar uchun: Telegram: @behruz_sk (https://t.me/behruz_sk), email: behryzmamajon@gmail.com."
    ]
   ],
   [
    "Xavfsizlik",
    [
     "Ulanish HTTPS orqali shifrlanadi, parollar xesh ko‘rinishida saqlanadi. Hech qanday tizim 100% xavfsiz emas, lekin biz ma’lumotlaringizni himoya qilish uchun oqilona choralar ko‘ramiz."
    ]
   ],
   [
    "O‘zgarishlar",
    [
     "Siyosat o‘zgarsa, yangi sanani shu sahifada e’lon qilamiz."
    ]
   ]
  ],
  "ru": [
   [
    "Кто мы",
    [
     "Idrok Academy — приложение с уроками программирования для школьников (мобильное приложение и сайт). Эта политика объясняет, какие данные собираются, зачем они нужны и как их удалить. Вопросы: Telegram: @behruz_sk (https://t.me/behruz_sk), email: behryzmamajon@gmail.com."
    ]
   ],
   [
    "Какие данные мы собираем",
    [
     "Аккаунт: логин, имя, пароль (хранится только в виде зашифрованного хеша — никто не видит ваш пароль).",
     "Школа: область, район и название школы. Для учителей — школа, привязанная через код учителя.",
     "Фото профиля: ученики загружают при регистрации. Оно видно только внутри приложения — учителю и в рейтинге.",
     "Результаты учёбы: пройденные уроки, XP, результаты тестов и экзаменов, сертификаты, заказы в магазине.",
     "То, что вы создаёте: код в портфолио, книги (PDF) и уроки, загруженные учителями.",
     "Мы не собираем номер телефона, геолокацию (GPS), контакты, рекламный идентификатор или данные банковских карт. В приложении нет рекламы и сервисов слежения (трекинга)."
    ]
   ],
   [
    "Зачем мы их используем",
    [
     "Чтобы вы могли войти в аккаунт, сохранять уроки и результаты, показывать учителю результаты класса, вести рейтинг и выдавать сертификаты. Мы не продаём ваши данные и не передаём их для рекламы."
    ]
   ],
   [
    "Кто видит данные",
    [
     "Ваш учитель — имя, фото и результаты учеников своей школы.",
     "Другие ученики — имя, фото и XP в рейтинге.",
     "Все (по ссылке) — страница портфолио, которой вы поделились, и страница проверки сертификата (имя, курс, дата).",
     "Технические сервисы: сервер на Render.com, резервная копия на Supabase.com (серверы могут находиться за пределами Узбекистана). Когда учитель пользуется функцией AI, текст урока или книги отправляется в сервис Google Gemini. Личные данные учеников (имя, фото) в AI не отправляются."
    ]
   ],
   [
    "Дети",
    [
     "Приложение предназначено для школьников. Пользователь младше 18 лет регистрируется с согласия родителя или опекуна — это подтверждается при регистрации. Родитель в любой момент может запросить просмотр или удаление данных ребёнка."
    ]
   ],
   [
    "Сколько храним",
    [
     "Пока существует аккаунт. Если вы удалите аккаунт, данные сразу удаляются из базы, а из резервных копий — в течение короткого времени."
    ]
   ],
   [
    "Ваши права",
    [
     "Просматривать данные, исправлять их (в профиле) и полностью удалить (Профиль → «Удалить аккаунт»). Другие запросы: Telegram: @behruz_sk (https://t.me/behruz_sk), email: behryzmamajon@gmail.com."
    ]
   ],
   [
    "Безопасность",
    [
     "Соединение шифруется через HTTPS, пароли хранятся в виде хеша. Ни одна система не защищена на 100%, но мы принимаем разумные меры для защиты ваших данных."
    ]
   ],
   [
    "Изменения",
    [
     "Если политика изменится, мы опубликуем новую дату на этой странице."
    ]
   ]
  ]
 },
 "terms": {
  "uz": [
   [
    "Umumiy",
    [
     "Idrok Academy dan foydalanish orqali siz ushbu shartlarga va Maxfiylik siyosatiga rozilik bildirasiz. 18 yoshga to‘lmagan bo‘lsangiz, ota-onangiz yoki vasiyingiz ham rozi bo‘lishi kerak."
    ]
   ],
   [
    "Hisob",
    [
     "Haqiqiy ismingizni kiriting va parolingizni hech kimga bermang. Hisobingizdagi harakatlar uchun o‘zingiz javobgarsiz. Boshqa odam nomidan hisob ochish taqiqlanadi."
    ]
   ],
   [
    "Taqiqlanadi",
    [
     "Haqoratli, odobsiz yoki boshqalarga zarar yetkazuvchi kontent joylash; boshqalarning suratini ruxsatsiz yuklash; boshqa birovning mualliflik huquqi bilan himoyalangan kitob yoki materialini ruxsatsiz yuklash; tizimni buzishga, XP yoki natijalarni soxtalashtirishga urinish; zararli kod ishga tushirish."
    ]
   ],
   [
    "Ustozlar",
    [
     "Ustoz yuklagan kitob va darslar uchun ustozning o‘zi javobgar — u bu materialdan foydalanish huquqiga ega bo‘lishi kerak. AI yaratgan darslar xato bo‘lishi mumkin, ularni o‘quvchilarga berishdan oldin tekshiring."
    ]
   ],
   [
    "XP, do‘kon va sertifikatlar",
    [
     "XP va do‘kondagi mukofotlar o‘yin elementi bo‘lib, pul qiymatiga ega emas. Sertifikat ilovada kursni tugatganingizni tasdiqlaydi; u davlat ta’lim hujjati emas."
    ]
   ],
   [
    "Xizmat",
    [
     "Ilova «boricha» taqdim etiladi. Biz uni doimiy ishlashini ta’minlashga harakat qilamiz, lekin uzilishlar bo‘lishi mumkin. Qoidalarni buzgan hisoblarni cheklash yoki o‘chirish huquqini saqlab qolamiz."
    ]
   ],
   [
    "Hisobni o‘chirish",
    [
     "Hisobingizni istalgan vaqtda Profil → «Hisobni o‘chirish» orqali o‘chirishingiz mumkin."
    ]
   ],
   [
    "Aloqa",
    [
     "Telegram: @behruz_sk (https://t.me/behruz_sk), email: behryzmamajon@gmail.com. Shartlar o‘zgarsa, yangi sanani shu sahifada e’lon qilamiz."
    ]
   ]
  ],
  "ru": [
   [
    "Общее",
    [
     "Пользуясь Idrok Academy, вы соглашаетесь с этими условиями и Политикой конфиденциальности. Если вам нет 18 лет, согласие должен дать и ваш родитель или опекун."
    ]
   ],
   [
    "Аккаунт",
    [
     "Указывайте настоящее имя и никому не сообщайте пароль. Вы отвечаете за действия в своём аккаунте. Запрещено создавать аккаунт от имени другого человека."
    ]
   ],
   [
    "Запрещено",
    [
     "Размещать оскорбительный, непристойный или вредный для других контент; загружать чужие фото без разрешения; загружать без разрешения книги или материалы, защищённые чужим авторским правом; пытаться взломать систему, подделать XP или результаты; запускать вредоносный код."
    ]
   ],
   [
    "Учителя",
    [
     "За загруженные книги и уроки отвечает сам учитель — у него должно быть право использовать эти материалы. Уроки, созданные AI, могут содержать ошибки — проверяйте их перед тем, как давать ученикам."
    ]
   ],
   [
    "XP, магазин и сертификаты",
    [
     "XP и награды в магазине — игровой элемент и не имеют денежной стоимости. Сертификат подтверждает прохождение курса в приложении; это не государственный документ об образовании."
    ]
   ],
   [
    "Сервис",
    [
     "Приложение предоставляется «как есть». Мы стараемся, чтобы оно работало постоянно, но возможны перебои. Мы оставляем за собой право ограничить или удалить аккаунты, нарушающие правила."
    ]
   ],
   [
    "Удаление аккаунта",
    [
     "Вы можете удалить аккаунт в любой момент: Профиль → «Удалить аккаунт»."
    ]
   ],
   [
    "Контакты",
    [
     "Telegram: @behruz_sk (https://t.me/behruz_sk), email: behryzmamajon@gmail.com. Если условия изменятся, мы опубликуем новую дату на этой странице."
    ]
   ]
  ]
 },
 "delete-account": {
  "uz": [
   [
    "Ilova ichida",
    [
     "1. Idrok Academy ilovasini yoki veb-saytini oching va hisobingizga kiring.",
     "2. «Profil» bo‘limi → «Hisobni o‘chirish» ni bosing.",
     "3. Parolingizni kiriting va tasdiqlang. Hisob darhol o‘chiriladi."
    ]
   ],
   [
    "Ilovaga kira olmasangiz",
    [
     "Telegram: @behruz_sk (https://t.me/behruz_sk), email: behryzmamajon@gmail.com ga loginingizni yozib yuboring. Hisobni egasi ekaningizni tekshirib, 30 kun ichida o‘chiramiz."
    ]
   ],
   [
    "Nima o‘chiriladi",
    [
     "Login, ism, parol xeshi, maktab, profil surati, XP va darslar, test va imtihon natijalari, sertifikatlar, portfolio, buyurtmalar, rozilik yozuvlari. Zaxira nusxalardan ham qisqa vaqt ichida yo‘qoladi. Ustoz yaratgan maktab darslari maktabdagi boshqa o‘quvchilar uchun qolishi mumkin."
    ]
   ]
  ],
  "ru": [
   [
    "В приложении",
    [
     "1. Откройте приложение или сайт Idrok Academy и войдите в аккаунт.",
     "2. Раздел «Профиль» → нажмите «Удалить аккаунт».",
     "3. Введите пароль и подтвердите. Аккаунт удаляется сразу."
    ]
   ],
   [
    "Если не можете войти",
    [
     "Напишите свой логин: Telegram: @behruz_sk (https://t.me/behruz_sk), email: behryzmamajon@gmail.com. Мы проверим, что аккаунт ваш, и удалим его в течение 30 дней."
    ]
   ],
   [
    "Что удаляется",
    [
     "Логин, имя, хеш пароля, школа, фото профиля, XP и уроки, результаты тестов и экзаменов, сертификаты, портфолио, заказы, записи о согласии. Из резервных копий данные исчезают в течение короткого времени. Школьные уроки, созданные учителем, могут остаться для других учеников школы."
    ]
   ]
  ]
 }
};
