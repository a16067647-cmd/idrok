"""Maxfiylik siyosati, foydalanish shartlari va hisobni o‘chirish sahifalari.
Политика конфиденциальности, условия использования и страница удаления аккаунта.

Ochiq sahifalar: /privacy, /terms, /delete-account  (?lang=ru — ruscha)
"""
import html

VERSION = "2026-11-09"
UPDATED = {"uz": "9-noyabr, 2026", "ru": "9 ноября 2026"}
CONTACT = "Telegram: @behruz_sk (https://t.me/behruz_sk), email: behryzmamajon@gmail.com"
APP = "Idrok Academy"

PAGES = ("/about", "/privacy", "/terms", "/delete-account")

# Jamoa: (fayl, ism, lavozim uz, lavozim ru) / команда: (файл, имя, роль uz, роль ru)
TEAM = [
    ("bexruz", "Mamajonov Bexruz", "Asoschi", "Основатель"),
    ("vazzohbek", "Satvaldiyev Vazzohbek", "Hammuassis", "Сооснователь"),
    ("abdurahmon", "Rahimjonov Abdurahmon", "Hammuassis", "Сооснователь"),
]
TEAM_AFTER = 2  # jamoa shu bo‘limdan keyin / команда после этого раздела
PARTNER_LOGO = "kelajak"  # qo‘llab-quvvatlovchi logotipi / логотип партнёра
PARTNER_AFTER = 3

TITLES = {
    "/about": {"uz": "Biz haqimizda", "ru": "О нас"},
    "/privacy": {"uz": "Maxfiylik siyosati", "ru": "Политика конфиденциальности"},
    "/terms": {"uz": "Foydalanish shartlari", "ru": "Условия использования"},
    "/delete-account": {"uz": "Hisobni o‘chirish", "ru": "Удаление аккаунта"},
}

# Har bir bo‘lim: (sarlavha, [xatboshilar]) / каждый раздел: (заголовок, [абзацы])
TEXT = {
    "/about": {
        "uz": [
            ("Idrok Academy nima", [
                "Idrok Academy — O‘zbekiston maktab o‘quvchilari uchun dasturlashni o‘yin orqali o‘rgatadigan ilova. "
                "HTML, CSS, JavaScript, Python va sun’iy intellekt darslari o‘zbek va rus tillarida: qisqa darslar, "
                "animatsiyalar, XP, ligalar, yakuniy imtihon va sertifikat.",
            ]),
            ("Maqsadimiz", [
                "Har bir maktab o‘quvchisi — qaysi viloyat yoki tumanda yashashidan qat’i nazar — kod yozishni qiziqarli "
                "va tushunarli tarzda o‘rgana olishi.",
            ]),
            ("Jamoa", []),
            ("Qo‘llab-quvvatlovchi", [
                "Idrok Academy loyihasi Kelajak Markazlari tomonidan qo‘llab-quvvatlangan va moliyalashtirilgan. "
                "Ularning yordami uchun chin dildan minnatdormiz!",
            ]),
            ("Ustozlar uchun", [
                "Sinf natijalarini kuzatish, o‘z darslari va testlarini yaratish, sun’iy intellekt yordamida kitobdan dars tayyorlash.",
            ]),
            ("Aloqa", [CONTACT]),
        ],
        "ru": [
            ("Что такое Idrok Academy", [
                "Idrok Academy — приложение, которое учит школьников Узбекистана программированию в игровой форме. "
                "Уроки HTML, CSS, JavaScript, Python и искусственного интеллекта на узбекском и русском языках: короткие уроки, "
                "анимации, XP, лиги, итоговый экзамен и сертификат.",
            ]),
            ("Наша цель", [
                "Чтобы каждый школьник — в какой бы области или районе он ни жил — мог интересно и понятно научиться писать код.",
            ]),
            ("Команда", []),
            ("При поддержке", [
                "Проект Idrok Academy поддержан и профинансирован Kelajak Markazlari. "
                "Искренне благодарим их за помощь!",
            ]),
            ("Для учителей", [
                "Следить за результатами класса, создавать свои уроки и тесты, готовить уроки из книг с помощью искусственного интеллекта.",
            ]),
            ("Контакты", [CONTACT]),
        ],
    },
    "/privacy": {
        "uz": [
            ("Kim biz", [
                f"{APP} — maktab o‘quvchilari uchun dasturlash darslari ilovasi (mobil ilova va veb-sayt). "
                f"Ushbu siyosat qanday ma’lumot yig‘ilishi, nima uchun ishlatilishi va uni qanday o‘chirish mumkinligini tushuntiradi. "
                f"Savollar uchun: {CONTACT}.",
            ]),
            ("Qanday ma’lumot yig‘amiz", [
                "Hisob: login, ism, parol (faqat shifrlangan xesh ko‘rinishida saqlanadi — parolingizni hech kim ko‘ra olmaydi).",
                "Maktab: viloyat, tuman va maktab nomi. Ustozlar uchun — ustoz kodi orqali bog‘langan maktab.",
                "Profil surati: o‘quvchilar ro‘yxatdan o‘tishda yuklaydi. U faqat ilova ichida — ustoz va reytingda ko‘rinadi.",
                "O‘qish natijalari: tugatilgan darslar, XP, testlar va imtihon natijalari, sertifikatlar, do‘kondagi buyurtmalar.",
                "Siz yaratgan narsalar: portfoliodagi kod, ustozlar yuklagan kitoblar (PDF) va darslar.",
                "Biz telefon raqami, joylashuv (GPS), kontaktlar, reklama identifikatori yoki to‘lov kartasi ma’lumotlarini yig‘maymiz. "
                "Ilovada reklama va kuzatuv (tracking) xizmatlari yo‘q.",
            ]),
            ("Nima uchun ishlatamiz", [
                "Hisobingizga kirish, darslar va natijalarni saqlash, ustozga sinf natijalarini ko‘rsatish, reyting va sertifikatlar berish uchun. "
                "Ma’lumotlaringizni sotmaymiz va reklama uchun bermaymiz.",
            ]),
            ("Kimlar ko‘radi", [
                "Ustozingiz — o‘z maktabidagi o‘quvchilarning ismi, surati va natijalari.",
                "Boshqa o‘quvchilar — reytingda ism, surat va XP.",
                "Hamma (havola orqali) — siz ulashgan portfolio sahifasi va sertifikatni tekshirish sahifasi (ism, kurs, sana).",
                "Texnik xizmatlar: server Render.com da, zaxira nusxa Supabase.com da saqlanadi (serverlar O‘zbekistondan tashqarida bo‘lishi mumkin). "
                "Ustoz AI funksiyasidan foydalanganda dars matni yoki kitob matni Google Gemini xizmatiga yuboriladi. "
                "O‘quvchilarning shaxsiy ma’lumotlari (ism, surat) AI ga yuborilmaydi.",
            ]),
            ("Bolalar", [
                "Ilova maktab o‘quvchilari uchun. 18 yoshga to‘lmagan foydalanuvchi ota-onasi yoki vasiysining roziligi bilan ro‘yxatdan o‘tadi — "
                "bu ro‘yxatdan o‘tishda tasdiqlanadi. Ota-ona istalgan vaqtda farzandining ma’lumotlarini ko‘rishni yoki o‘chirishni so‘rashi mumkin.",
            ]),
            ("Qancha saqlaymiz", [
                "Hisob mavjud bo‘lguncha. Hisobni o‘chirsangiz, ma’lumotlar darhol bazadan o‘chiriladi; zaxira nusxalardan esa qisqa vaqt ichida yo‘qoladi.",
            ]),
            ("Sizning huquqlaringiz", [
                "Ma’lumotlaringizni ko‘rish, tuzatish (profilda) va to‘liq o‘chirish (Profil → «Hisobni o‘chirish»). "
                f"Boshqa so‘rovlar uchun: {CONTACT}.",
            ]),
            ("Xavfsizlik", [
                "Ulanish HTTPS orqali shifrlanadi, parollar xesh ko‘rinishida saqlanadi. Hech qanday tizim 100% xavfsiz emas, "
                "lekin biz ma’lumotlaringizni himoya qilish uchun oqilona choralar ko‘ramiz.",
            ]),
            ("O‘zgarishlar", [
                "Siyosat o‘zgarsa, yangi sanani shu sahifada e’lon qilamiz.",
            ]),
        ],
        "ru": [
            ("Кто мы", [
                f"{APP} — приложение с уроками программирования для школьников (мобильное приложение и сайт). "
                f"Эта политика объясняет, какие данные собираются, зачем они нужны и как их удалить. "
                f"Вопросы: {CONTACT}.",
            ]),
            ("Какие данные мы собираем", [
                "Аккаунт: логин, имя, пароль (хранится только в виде зашифрованного хеша — никто не видит ваш пароль).",
                "Школа: область, район и название школы. Для учителей — школа, привязанная через код учителя.",
                "Фото профиля: ученики загружают при регистрации. Оно видно только внутри приложения — учителю и в рейтинге.",
                "Результаты учёбы: пройденные уроки, XP, результаты тестов и экзаменов, сертификаты, заказы в магазине.",
                "То, что вы создаёте: код в портфолио, книги (PDF) и уроки, загруженные учителями.",
                "Мы не собираем номер телефона, геолокацию (GPS), контакты, рекламный идентификатор или данные банковских карт. "
                "В приложении нет рекламы и сервисов слежения (трекинга).",
            ]),
            ("Зачем мы их используем", [
                "Чтобы вы могли войти в аккаунт, сохранять уроки и результаты, показывать учителю результаты класса, вести рейтинг и выдавать сертификаты. "
                "Мы не продаём ваши данные и не передаём их для рекламы.",
            ]),
            ("Кто видит данные", [
                "Ваш учитель — имя, фото и результаты учеников своей школы.",
                "Другие ученики — имя, фото и XP в рейтинге.",
                "Все (по ссылке) — страница портфолио, которой вы поделились, и страница проверки сертификата (имя, курс, дата).",
                "Технические сервисы: сервер на Render.com, резервная копия на Supabase.com (серверы могут находиться за пределами Узбекистана). "
                "Когда учитель пользуется функцией AI, текст урока или книги отправляется в сервис Google Gemini. "
                "Личные данные учеников (имя, фото) в AI не отправляются.",
            ]),
            ("Дети", [
                "Приложение предназначено для школьников. Пользователь младше 18 лет регистрируется с согласия родителя или опекуна — "
                "это подтверждается при регистрации. Родитель в любой момент может запросить просмотр или удаление данных ребёнка.",
            ]),
            ("Сколько храним", [
                "Пока существует аккаунт. Если вы удалите аккаунт, данные сразу удаляются из базы, а из резервных копий — в течение короткого времени.",
            ]),
            ("Ваши права", [
                "Просматривать данные, исправлять их (в профиле) и полностью удалить (Профиль → «Удалить аккаунт»). "
                f"Другие запросы: {CONTACT}.",
            ]),
            ("Безопасность", [
                "Соединение шифруется через HTTPS, пароли хранятся в виде хеша. Ни одна система не защищена на 100%, "
                "но мы принимаем разумные меры для защиты ваших данных.",
            ]),
            ("Изменения", [
                "Если политика изменится, мы опубликуем новую дату на этой странице.",
            ]),
        ],
    },
    "/terms": {
        "uz": [
            ("Umumiy", [
                f"{APP} dan foydalanish orqali siz ushbu shartlarga va Maxfiylik siyosatiga rozilik bildirasiz. "
                "18 yoshga to‘lmagan bo‘lsangiz, ota-onangiz yoki vasiyingiz ham rozi bo‘lishi kerak.",
            ]),
            ("Hisob", [
                "Haqiqiy ismingizni kiriting va parolingizni hech kimga bermang. Hisobingizdagi harakatlar uchun o‘zingiz javobgarsiz. "
                "Boshqa odam nomidan hisob ochish taqiqlanadi.",
            ]),
            ("Taqiqlanadi", [
                "Haqoratli, odobsiz yoki boshqalarga zarar yetkazuvchi kontent joylash; boshqalarning suratini ruxsatsiz yuklash; "
                "boshqa birovning mualliflik huquqi bilan himoyalangan kitob yoki materialini ruxsatsiz yuklash; "
                "tizimni buzishga, XP yoki natijalarni soxtalashtirishga urinish; zararli kod ishga tushirish.",
            ]),
            ("Ustozlar", [
                "Ustoz yuklagan kitob va darslar uchun ustozning o‘zi javobgar — u bu materialdan foydalanish huquqiga ega bo‘lishi kerak. "
                "AI yaratgan darslar xato bo‘lishi mumkin, ularni o‘quvchilarga berishdan oldin tekshiring.",
            ]),
            ("XP, do‘kon va sertifikatlar", [
                "XP va do‘kondagi mukofotlar o‘yin elementi bo‘lib, pul qiymatiga ega emas. "
                "Sertifikat ilovada kursni tugatganingizni tasdiqlaydi; u davlat ta’lim hujjati emas.",
            ]),
            ("Xizmat", [
                "Ilova «boricha» taqdim etiladi. Biz uni doimiy ishlashini ta’minlashga harakat qilamiz, lekin uzilishlar bo‘lishi mumkin. "
                "Qoidalarni buzgan hisoblarni cheklash yoki o‘chirish huquqini saqlab qolamiz.",
            ]),
            ("Hisobni o‘chirish", [
                "Hisobingizni istalgan vaqtda Profil → «Hisobni o‘chirish» orqali o‘chirishingiz mumkin.",
            ]),
            ("Aloqa", [
                f"{CONTACT}. Shartlar o‘zgarsa, yangi sanani shu sahifada e’lon qilamiz.",
            ]),
        ],
        "ru": [
            ("Общее", [
                f"Пользуясь {APP}, вы соглашаетесь с этими условиями и Политикой конфиденциальности. "
                "Если вам нет 18 лет, согласие должен дать и ваш родитель или опекун.",
            ]),
            ("Аккаунт", [
                "Указывайте настоящее имя и никому не сообщайте пароль. Вы отвечаете за действия в своём аккаунте. "
                "Запрещено создавать аккаунт от имени другого человека.",
            ]),
            ("Запрещено", [
                "Размещать оскорбительный, непристойный или вредный для других контент; загружать чужие фото без разрешения; "
                "загружать без разрешения книги или материалы, защищённые чужим авторским правом; "
                "пытаться взломать систему, подделать XP или результаты; запускать вредоносный код.",
            ]),
            ("Учителя", [
                "За загруженные книги и уроки отвечает сам учитель — у него должно быть право использовать эти материалы. "
                "Уроки, созданные AI, могут содержать ошибки — проверяйте их перед тем, как давать ученикам.",
            ]),
            ("XP, магазин и сертификаты", [
                "XP и награды в магазине — игровой элемент и не имеют денежной стоимости. "
                "Сертификат подтверждает прохождение курса в приложении; это не государственный документ об образовании.",
            ]),
            ("Сервис", [
                "Приложение предоставляется «как есть». Мы стараемся, чтобы оно работало постоянно, но возможны перебои. "
                "Мы оставляем за собой право ограничить или удалить аккаунты, нарушающие правила.",
            ]),
            ("Удаление аккаунта", [
                "Вы можете удалить аккаунт в любой момент: Профиль → «Удалить аккаунт».",
            ]),
            ("Контакты", [
                f"{CONTACT}. Если условия изменятся, мы опубликуем новую дату на этой странице.",
            ]),
        ],
    },
    "/delete-account": {
        "uz": [
            ("Ilova ichida", [
                "1. Idrok Academy ilovasini yoki veb-saytini oching va hisobingizga kiring.",
                "2. «Profil» bo‘limi → «Hisobni o‘chirish» ni bosing.",
                "3. Parolingizni kiriting va tasdiqlang. Hisob darhol o‘chiriladi.",
            ]),
            ("Ilovaga kira olmasangiz", [
                f"{CONTACT} ga loginingizni yozib yuboring. Hisobni egasi ekaningizni tekshirib, 30 kun ichida o‘chiramiz.",
            ]),
            ("Nima o‘chiriladi", [
                "Login, ism, parol xeshi, maktab, profil surati, XP va darslar, test va imtihon natijalari, sertifikatlar, "
                "portfolio, buyurtmalar, rozilik yozuvlari. Zaxira nusxalardan ham qisqa vaqt ichida yo‘qoladi. "
                "Ustoz yaratgan maktab darslari maktabdagi boshqa o‘quvchilar uchun qolishi mumkin.",
            ]),
        ],
        "ru": [
            ("В приложении", [
                "1. Откройте приложение или сайт Idrok Academy и войдите в аккаунт.",
                "2. Раздел «Профиль» → нажмите «Удалить аккаунт».",
                "3. Введите пароль и подтвердите. Аккаунт удаляется сразу.",
            ]),
            ("Если не можете войти", [
                f"Напишите свой логин: {CONTACT}. Мы проверим, что аккаунт ваш, и удалим его в течение 30 дней.",
            ]),
            ("Что удаляется", [
                "Логин, имя, хеш пароля, школа, фото профиля, XP и уроки, результаты тестов и экзаменов, сертификаты, "
                "портфолио, заказы, записи о согласии. Из резервных копий данные исчезают в течение короткого времени. "
                "Школьные уроки, созданные учителем, могут остаться для других учеников школы.",
            ]),
        ],
    },
}


def _href(p, lang, static):
    if static:
        return p.strip("/") + ("-ru" if lang == "ru" else "") + ".html"
    return f"{p}?lang={lang}"


def page(path, lang="", static=False):
    lang = "ru" if lang == "ru" else "uz"
    other = "uz" if lang == "ru" else "ru"
    title = TITLES[path][lang]
    upd = ("Yangilangan" if lang == "uz" else "Обновлено") + ": " + UPDATED[lang]
    links = " · ".join(
        f'<a href="{_href(p, lang, static)}">{html.escape(TITLES[p][lang])}</a>' for p in PAGES if p != path)
    body = []
    for i, (head, paras) in enumerate(TEXT[path][lang]):
        body.append(f"<h2>{html.escape(head)}</h2>")
        body.extend(f"<p>{html.escape(p)}</p>" for p in paras)
        if path == "/about" and i == TEAM_AFTER:
            body.append('<div class="team">' + "".join(
                f'<div class="m"><img src="{"" if static else "/"}team/{f}.jpg" alt="{html.escape(n)}">'
                f'<b>{html.escape(n)}</b><span>{html.escape(r_uz if lang == "uz" else r_ru)}</span></div>'
                for f, n, r_uz, r_ru in TEAM) + "</div>")
        if path == "/about" and i == PARTNER_AFTER:
            body.append(f'<img class="partner" src="{"" if static else "/"}team/{PARTNER_LOGO}.jpg" alt="Kelajak Markazlari">')
    return f"""<!DOCTYPE html>
<html lang="{lang}"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{html.escape(title)} — {APP}</title>
<style>
body{{margin:0;background:#f5f6fa;font:16px/1.6 -apple-system,Segoe UI,Roboto,sans-serif;color:#1c1c1e}}
main{{max-width:720px;margin:0 auto;padding:32px 20px 60px}}
.card{{background:#fff;border-radius:20px;padding:28px 24px;box-shadow:0 2px 12px rgba(0,0,0,.06)}}
h1{{margin:0 0 4px;font-size:28px}} h2{{font-size:18px;margin:24px 0 6px}}
p{{margin:6px 0}} .muted{{color:#8e8e93;font-size:14px}}
.team{{display:grid;grid-template-columns:repeat(auto-fit,minmax(170px,1fr));gap:16px;margin:12px 0}}
.m{{text-align:center}} .m img{{width:100%;aspect-ratio:1;object-fit:cover;border-radius:18px;display:block;margin-bottom:8px}}
.partner{{width:180px;border-radius:18px;display:block;margin:12px 0}}
.m b{{display:block}} .m span{{color:#8e8e93;font-size:14px}}
a{{color:#0A6CFF;text-decoration:none}} .top{{display:flex;justify-content:space-between;margin-bottom:16px}}
</style></head><body><main>
<div class="top"><b>{APP}</b><a href="{_href(path, other, static)}">{"Русский" if lang == "uz" else "O‘zbekcha"}</a></div>
<div class="card"><h1>{html.escape(title)}</h1><div class="muted">{upd}</div>
{"".join(body)}
</div><p class="muted" style="margin-top:20px">{links}</p></main></body></html>"""


if __name__ == "__main__":
    # Statik nusxa (GitHub Pages) / статическая копия: python3 legal.py <papka>
    import sys
    from pathlib import Path
    out = Path(sys.argv[1])
    out.mkdir(parents=True, exist_ok=True)
    import shutil
    (out / "team").mkdir(exist_ok=True)
    for f in [t[0] for t in TEAM] + [PARTNER_LOGO]:
        shutil.copy(Path(__file__).parent / "content" / "team" / f"{f}.jpg", out / "team" / f"{f}.jpg")
    for p in PAGES:
        for lg in ("uz", "ru"):
            (out / _href(p, lg, True)).write_text(page(p, lg, static=True), encoding="utf-8")
    print("legal pages ->", out)
