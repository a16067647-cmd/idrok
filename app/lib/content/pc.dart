// Kompyuter savodxonligi: fayllar, klaviatura, Word, Excel, PowerPoint, internet.
// Компьютерная грамотность: файлы, клавиатура, Word, Excel, PowerPoint, интернет.
// Boshlang‘ich liga uchun tavsiya etiladi, majburiy emas.
// Рекомендуется для начальной лиги, не обязательно.
import 'model.dart';

RenderEl _e(String tag, String text, int line, [Map<String, String> style = const {}]) => RenderEl(tag, text, line, style: style);

const _watch = Tr('Ko‘k tugmani bosing yoki barmoq bilan suring — har bir qadamni ko‘rasiz.',
    'Нажмите синюю кнопку или листайте пальцем — увидите каждый шаг.');

const _names = ['Aziza', 'Bekzod', 'Laylo', 'Sardor', 'Madina', 'Jasur'];

// ---------------------------------------------------------------- 1. Kompyuter va fayllar
List<LessonStep> pc1(Gen g) => [
      const LessonStep.read(
        h: Tr('Fayl va papka', 'Файл и папка'),
        p: Tr(
            'Kompyuterdagi har bir narsa — fayl: rasm, qo‘shiq, hujjat. Fayllarni papkalarga solamiz, xuddi daftarlarni portfelga solgandek. '
                'Fayl nomining oxiridagi kengaytma uning turini aytadi: .docx — Word hujjati, .xlsx — Excel jadvali, .pptx — taqdimot, .jpg — rasm, .mp4 — video.',
            'Всё на компьютере — это файлы: картинки, песни, документы. Файлы кладём в папки, как тетради в портфель. '
                'Расширение в конце имени говорит о типе: .docx — документ Word, .xlsx — таблица Excel, .pptx — презентация, .jpg — картинка, .mp4 — видео.'),
      ),
      ...g.from([
        Q(1, (g) => g.quiz(const Tr('“referat.docx” qaysi dasturda ochiladi?', 'В какой программе откроется «referat.docx»?'), const Tr('Word', 'Word'),
            const [Tr('Excel', 'Excel'), Tr('PowerPoint', 'PowerPoint'), Tr('Rasm ko‘rgich', 'Просмотр фото')])),
        Q(1, (g) => g.quiz(const Tr('Papka nima uchun kerak?', 'Зачем нужна папка?'), const Tr('Fayllarni tartib bilan saqlash uchun', 'Чтобы хранить файлы по порядку'),
            const [Tr('Kompyuterni tezlatish uchun', 'Чтобы ускорить компьютер'), Tr('Internetga ulanish uchun', 'Чтобы подключиться к интернету'), Tr('Rasm chizish uchun', 'Чтобы рисовать')])),
        Q(2, (g) => g.quiz(const Tr('Qaysi biri jadval fayli?', 'Какой файл — таблица?'), const Tr('baholar.xlsx', 'baholar.xlsx'),
            const [Tr('baholar.pptx', 'baholar.pptx'), Tr('baholar.mp4', 'baholar.mp4'), Tr('baholar.jpg', 'baholar.jpg')])),
        Q(2, (g) => g.quiz(const Tr('Faylni “Savat”dan (Korzina) qaytarsa bo‘ladimi?', 'Можно ли вернуть файл из «Корзины»?'), const Tr('Ha, “Tiklash” bilan', 'Да, через «Восстановить»'),
            const [Tr('Yo‘q, hech qachon', 'Нет, никогда'), Tr('Faqat internet bo‘lsa', 'Только с интернетом'), Tr('Faqat ertaga', 'Только завтра')])),
        Q(3, (g) => g.quiz(const Tr('Eng yaxshi fayl nomi qaysi?', 'Какое имя файла лучше всего?'), const Tr('Tarix_referat_8-sinf.docx', 'Tarix_referat_8-sinf.docx'),
            const [Tr('yangi papka (3).docx', 'новая папка (3).docx'), Tr('asdfgh.docx', 'asdfgh.docx'), Tr('1.docx', '1.docx')],
            e: const Tr('Nomdan ichida nima borligi tushunilishi kerak.', 'По имени должно быть понятно, что внутри.'))),
      ], 2),
      g.order(const Tr('Yangi papka yaratish — tartiblang:', 'Создать новую папку — упорядочьте:'),
          ['Sichqoncha o‘ng tugmasi', 'Yaratish → Papka', 'Nom yozish', 'Enter bosish']),
    ];

// ---------------------------------------------------------------- 2. Klaviatura yorliqlari
List<LessonStep> pc2(Gen g) => [
      const LessonStep.read(
        h: Tr('Tezkor tugmalar', 'Горячие клавиши'),
        p: Tr(
            'Professionallar sichqonchadan kamroq foydalanadi. Eng kerakli tugmalar: Ctrl+C — nusxa olish, Ctrl+V — qo‘yish, '
                'Ctrl+X — kesib olish, Ctrl+Z — orqaga qaytarish, Ctrl+S — saqlash, Ctrl+A — hammasini belgilash, Ctrl+F — qidirish.',
            'Профессионалы реже пользуются мышкой. Самые нужные клавиши: Ctrl+C — копировать, Ctrl+V — вставить, '
                'Ctrl+X — вырезать, Ctrl+Z — отменить, Ctrl+S — сохранить, Ctrl+A — выделить всё, Ctrl+F — поиск.'),
      ),
      ...g.from([
        Q(1, (g) => g.quizCode(const Tr('Xato qildingiz. Qaysi tugma orqaga qaytaradi?', 'Ошиблись. Какая клавиша отменяет?'), 'Ctrl+Z',
            ['Ctrl+S', 'Ctrl+C', 'Ctrl+A'])),
        Q(1, (g) => g.quizCode(const Tr('Ishni saqlash uchun:', 'Чтобы сохранить работу:'), 'Ctrl+S', ['Ctrl+V', 'Ctrl+Z', 'Ctrl+F'])),
        Q(2, (g) => g.quizCode(const Tr('Matnni bir joydan boshqa joyga ko‘chirish (nusxasiz):', 'Перенести текст в другое место (без копии):'), 'Ctrl+X, Ctrl+V',
            ['Ctrl+C, Ctrl+Z', 'Ctrl+A, Ctrl+S', 'Ctrl+F, Ctrl+V'])),
        Q(2, (g) => g.quizCode(const Tr('Uzun hujjatda bitta so‘zni topish:', 'Найти слово в длинном документе:'), 'Ctrl+F', ['Ctrl+A', 'Ctrl+X', 'Ctrl+S'])),
        Q(3, (g) => g.quizCode(const Tr('Butun matnni belgilab, nusxa olish:', 'Выделить весь текст и скопировать:'), 'Ctrl+A, Ctrl+C',
            ['Ctrl+C, Ctrl+A', 'Ctrl+S, Ctrl+C', 'Ctrl+Z, Ctrl+A'])),
      ], 2),
      g.fill(const Tr('Nusxa olingan matnni qo‘yish:', 'Вставить скопированный текст:'), 'Ctrl+', '', ['V', 'v']),
    ];

// ---------------------------------------------------------------- 3. Word: matn
List<LessonStep> pc3(Gen g) => [
      const LessonStep.read(
        h: Tr('Word: matnni bezash', 'Word: оформление текста'),
        p: Tr(
            'Microsoft Word — hujjat yozish dasturi: referat, ariza, xat. Matnni belgilang va bezang: Ctrl+B — qalin, Ctrl+I — qiya, Ctrl+U — tagiga chizilgan. '
                '“Bosh sahifa” (Главная) bo‘limida shrift, o‘lcham, rang va tekislash (chapga, markazga, o‘ngga) bor. Sarlavha odatda markazda va kattaroq bo‘ladi.',
            'Microsoft Word — программа для документов: реферат, заявление, письмо. Выделите текст и оформите: Ctrl+B — жирный, Ctrl+I — курсив, Ctrl+U — подчёркнутый. '
                'На вкладке «Главная» есть шрифт, размер, цвет и выравнивание (влево, по центру, вправо). Заголовок обычно по центру и крупнее.'),
      ),
      ...g.from([
        Q(1, (g) => g.quizCode(const Tr('So‘zni qalin qilish:', 'Сделать слово жирным:'), 'Ctrl+B', ['Ctrl+I', 'Ctrl+U', 'Ctrl+P'])),
        Q(1, (g) => g.quiz(const Tr('Word nima uchun?', 'Для чего Word?'), const Tr('Hujjat va matn yozish', 'Писать документы и тексты'),
            const [Tr('Jadvalda hisoblash', 'Считать в таблицах'), Tr('Slayd ko‘rsatish', 'Показывать слайды'), Tr('Video montaj', 'Монтаж видео')])),
        Q(2, (g) => g.quiz(const Tr('Sarlavhani sahifa o‘rtasiga qo‘yish:', 'Поставить заголовок по центру:'), const Tr('Markazga tekislash (Ctrl+E)', 'Выравнивание по центру (Ctrl+E)'),
            const [Tr('Probel ko‘p bosish', 'Много раз нажать пробел'), Tr('Ctrl+B', 'Ctrl+B'), Tr('Shriftni kattalashtirish', 'Увеличить шрифт')],
            e: const Tr('Probel bilan surish noto‘g‘ri — matn o‘zgarsa, buziladi.', 'Двигать пробелами неправильно — при правке всё съедет.'))),
        Q(3, (g) => g.quiz(const Tr('Rasmiy ariza uchun qaysi shrift mos?', 'Какой шрифт подходит для официального заявления?'), const Tr('Times New Roman, 14', 'Times New Roman, 14'),
            const [Tr('Comic Sans, 28, qizil', 'Comic Sans, 28, красный'), Tr('Hammasi katta harfda', 'Всё заглавными буквами'), Tr('Har so‘z boshqa rangda', 'Каждое слово другим цветом')])),
      ], 2),
      g.order(const Tr('Matnni qalin qilish — tartiblang:', 'Сделать текст жирным — упорядочьте:'),
          ['Word ni ochish', 'Matnni yozish', 'Matnni belgilash', 'Ctrl+B bosish']),
    ];

// ---------------------------------------------------------------- 4. Word: hujjat tuzilishi
List<LessonStep> pc4(Gen g) => [
      const LessonStep.read(
        h: Tr('Word: chiroyli hujjat', 'Word: красивый документ'),
        p: Tr(
            'Yaxshi hujjatda: sarlavhalar (“Sarlavha 1”, “Sarlavha 2” uslublari), ro‘yxatlar (nuqtali yoki raqamli), kerak bo‘lsa jadval va rasm bor. '
                '“Qo‘yish” (Вставка) bo‘limidan jadval, rasm va sahifa raqamini qo‘shasiz. Uslublar bilan yozilgan sarlavhalardan mundarija avtomatik yasaladi.',
            'В хорошем документе есть: заголовки (стили «Заголовок 1», «Заголовок 2»), списки (маркированные или нумерованные), при необходимости таблица и картинка. '
                'На вкладке «Вставка» добавляют таблицу, рисунок и номер страницы. Из заголовков со стилями оглавление собирается автоматически.'),
      ),
      ...g.from([
        Q(1, (g) => g.quiz(const Tr('Jadval qaysi bo‘limdan qo‘shiladi?', 'Где вставить таблицу?'), const Tr('Qo‘yish (Вставка)', 'Вставка'),
            const [Tr('Fayl', 'Файл'), Tr('Ko‘rinish', 'Вид'), Tr('Pochta', 'Рассылки')])),
        Q(2, (g) => g.quiz(const Tr('Mundarija avtomatik yasalishi uchun nima kerak?', 'Что нужно для автоматического оглавления?'),
            const Tr('Sarlavhalarga “Sarlavha” uslubini berish', 'Задать заголовкам стиль «Заголовок»'),
            const [Tr('Sarlavhani qalin qilish', 'Сделать заголовок жирным'), Tr('Har sahifani qo‘lda raqamlash', 'Нумеровать страницы вручную'), Tr('Internet', 'Интернет')])),
        Q(2, (g) => g.quiz(const Tr('Qadamma-qadam ko‘rsatma uchun qaysi ro‘yxat?', 'Какой список для пошаговой инструкции?'), const Tr('Raqamli ro‘yxat (1, 2, 3)', 'Нумерованный (1, 2, 3)'),
            const [Tr('Nuqtali ro‘yxat', 'Маркированный'), Tr('Ro‘yxatsiz, bitta paragraf', 'Без списка, одним абзацем'), Tr('Jadval', 'Таблица')])),
        Q(3, (g) => g.quiz(const Tr('Hujjatni o‘zgartirib bo‘lmaydigan qilib yuborish uchun:', 'Чтобы отправить документ без возможности правки:'),
            const Tr('PDF qilib saqlash', 'Сохранить как PDF'),
            const [Tr('Rasmga olish', 'Сфотографировать экран'), Tr('Shriftni kichraytirish', 'Уменьшить шрифт'), Tr('.txt qilib saqlash', 'Сохранить как .txt')])),
      ], 2),
      g.order(const Tr('Referat tuzilishi — tartiblang:', 'Структура реферата — упорядочьте:'),
          ['Titul varag‘i', 'Mundarija', 'Asosiy qism', 'Xulosa', 'Adabiyotlar']),
    ];

// ---------------------------------------------------------------- 5. Excel: kataklar
List<LessonStep> pc5(Gen g) {
  final col = g.pick(const ['B', 'C', 'D']);
  final row = 2 + g.r.nextInt(7);
  return [
    const LessonStep.read(
      h: Tr('Excel: kataklar', 'Excel: ячейки'),
      p: Tr(
          'Microsoft Excel — jadval dasturi. Ustunlar harf bilan (A, B, C…), qatorlar raqam bilan (1, 2, 3…) belgilanadi. '
              'Ustun va qator kesishgan joy — katak, uning manzili masalan B3. Katakka matn, son yoki formula yoziladi. Birinchi qatorga sarlavhalar yoziladi.',
          'Microsoft Excel — программа для таблиц. Столбцы обозначают буквами (A, B, C…), строки — числами (1, 2, 3…). '
              'Пересечение столбца и строки — ячейка, её адрес, например, B3. В ячейку пишут текст, число или формулу. В первую строку пишут заголовки.'),
    ),
    ...g.from([
      Q(1, (g) => g.quizCode(Tr('$col ustun va $row-qator kesishgan katak manzili:', 'Адрес ячейки на пересечении столбца $col и строки $row:'), '$col$row',
          ['$row$col', '$col-$row', '${String.fromCharCode(col.codeUnitAt(0) + 1)}$row'])),
      Q(1, (g) => g.quiz(const Tr('Excel nima uchun?', 'Для чего Excel?'), const Tr('Jadval va hisob-kitob', 'Таблицы и вычисления'),
          const [Tr('Xat yozish', 'Писать письма'), Tr('Slayd ko‘rsatish', 'Показ слайдов'), Tr('Rasm chizish', 'Рисование')])),
      Q(2, (g) => g.quiz(const Tr('Ustunlar qanday belgilanadi?', 'Как обозначаются столбцы?'), const Tr('Harflar bilan: A, B, C', 'Буквами: A, B, C'),
          const [Tr('Raqamlar bilan: 1, 2, 3', 'Числами: 1, 2, 3'), Tr('Ranglar bilan', 'Цветами'), Tr('Belgilanmaydi', 'Никак')])),
      Q(3, (g) => g.quiz(const Tr('Baholar jadvalida 1-qatorga nima yoziladi?', 'Что пишут в 1-й строке таблицы оценок?'), const Tr('Sarlavhalar: Ism, Fan, Baho', 'Заголовки: Имя, Предмет, Оценка'),
          const [Tr('Birinchi o‘quvchi', 'Первый ученик'), Tr('Hech narsa', 'Ничего'), Tr('Jami ball', 'Итоговый балл')])),
    ], 2),
    g.fill(const Tr('A ustun va 1-qator kesishgan katak:', 'Ячейка на пересечении столбца A и строки 1:'), '', '', ['A1', 'a1']),
  ];
}

// ---------------------------------------------------------------- 6. Excel: formulalar
List<LessonStep> pc6(Gen g) {
  final a = 3 + g.r.nextInt(6), b = 2 + g.r.nextInt(6);
  return [
    const LessonStep.read(
      h: Tr('Excel: formulalar', 'Excel: формулы'),
      p: Tr(
          'Formula doim = belgisi bilan boshlanadi. =B2+C2 — ikki katakni qo‘shadi. Funksiyalar: =SUM(B2:B6) — yig‘indi, =AVERAGE(B2:B6) — o‘rtacha, '
              '=MAX(…) — eng katta, =MIN(…) — eng kichik. B2:B6 — B2 dan B6 gacha bo‘lgan kataklar. Raqam o‘zgarsa, natija o‘zi qayta hisoblanadi!',
          'Формула всегда начинается со знака =. =B2+C2 — складывает две ячейки. Функции: =SUM(B2:B6) (СУММ) — сумма, =AVERAGE(B2:B6) (СРЗНАЧ) — среднее, '
              '=MAX(…) — наибольшее, =MIN(…) — наименьшее. B2:B6 — ячейки от B2 до B6. Если число изменится, результат пересчитается сам!'),
    ),
    ...g.from([
      Q(1, (g) => g.quizCode(const Tr('Formula qaysi belgi bilan boshlanadi?', 'С какого знака начинается формула?'), '=', ['+', '#', '\$'])),
      Q(1, (g) => g.quizCode(Tr('B2 = $a, C2 = $b. =B2+C2 natijasi?', 'B2 = $a, C2 = $b. Результат =B2+C2?'), '${a + b}', ['${a * b}', 'B2C2', '${a - b}'])),
      Q(2, (g) => g.quizCode(const Tr('B2 dan B6 gacha baholarning o‘rtachasi:', 'Среднее оценок с B2 по B6:'), '=AVERAGE(B2:B6)',
          ['=SUM(B2:B6)', '=MAX(B2:B6)', 'AVERAGE B2-B6'])),
      Q(2, (g) => g.quizCode(const Tr('Eng yuqori ballni topish:', 'Найти самый высокий балл:'), '=MAX(C2:C30)', ['=MIN(C2:C30)', '=SUM(C2:C30)', '=C30'])),
      Q(3, (g) => g.quiz(const Tr('B3 dagi son 4 dan 5 ga o‘zgardi. =SUM(B2:B6) nima bo‘ladi?', 'Число в B3 изменилось с 4 на 5. Что будет с =SUM(B2:B6)?'),
          const Tr('O‘zi 1 ga oshadi', 'Само увеличится на 1'),
          const [Tr('Qo‘lda qayta yozish kerak', 'Нужно переписать вручную'), Tr('Xato chiqadi', 'Будет ошибка'), Tr('O‘zgarmaydi', 'Не изменится')])),
    ], 2),
    g.fill(const Tr('B2 dan B10 gacha yig‘indi:', 'Сумма с B2 по B10:'), '=SUM(', ')', ['B2:B10', 'b2:b10']),
  ];
}

// ---------------------------------------------------------------- 7. PowerPoint: slayd
List<LessonStep> pc7(Gen g) => [
      const LessonStep.read(
        h: Tr('PowerPoint: slaydlar', 'PowerPoint: слайды'),
        p: Tr(
            'Microsoft PowerPoint — taqdimot dasturi. Taqdimot slaydlardan iborat. Yangi slayd: “Bosh sahifa → Yangi slayd” yoki Ctrl+M. '
                '1-slayd — titul: mavzu va ismingiz. Har bir slaydda bitta fikr, qisqa sarlavha va 3–5 ta qisqa band bo‘lsin. F5 — namoyishni boshidan boshlash.',
            'Microsoft PowerPoint — программа для презентаций. Презентация состоит из слайдов. Новый слайд: «Главная → Создать слайд» или Ctrl+M. '
                '1-й слайд — титульный: тема и ваше имя. На каждом слайде одна мысль, короткий заголовок и 3–5 коротких пунктов. F5 — показ с начала.'),
      ),
      ...g.from([
        Q(1, (g) => g.quizCode(const Tr('Namoyishni boshidan boshlash:', 'Начать показ с начала:'), 'F5', ['F1', 'Ctrl+S', 'Esc'])),
        Q(1, (g) => g.quiz(const Tr('Birinchi slaydda nima bo‘ladi?', 'Что на первом слайде?'), const Tr('Mavzu va muallif ismi', 'Тема и имя автора'),
            const [Tr('Butun matn', 'Весь текст'), Tr('Xulosa', 'Вывод'), Tr('Hech narsa', 'Ничего')])),
        Q(2, (g) => g.quiz(const Tr('Bitta slaydda qancha matn yaxshi?', 'Сколько текста хорошо на одном слайде?'), const Tr('3–5 ta qisqa band', '3–5 коротких пунктов'),
            const [Tr('Butun sahifa matn', 'Целая страница текста'), Tr('20 ta band', '20 пунктов'), Tr('Hech qancha, faqat rang', 'Нисколько, только цвет')])),
        Q(2, (g) => g.quizCode(const Tr('Yangi slayd qo‘shish:', 'Добавить новый слайд:'), 'Ctrl+M', ['Ctrl+N', 'Ctrl+Z', 'F5'])),
      ], 2),
      g.order(const Tr('Taqdimot tartibi:', 'Порядок презентации:'), ['Titul slayd', 'Reja', 'Asosiy slaydlar', 'Xulosa', 'Rahmat! Savollar?']),
    ];

// ---------------------------------------------------------------- 8. PowerPoint: yaxshi taqdimot
List<LessonStep> pc8(Gen g) => [
      const LessonStep.read(
        h: Tr('Ajoyib taqdimot sirlari', 'Секреты отличной презентации'),
        p: Tr(
            '1) Matn katta (kamida 24 pt) va o‘qiladigan bo‘lsin. 2) Fon va matn rangi farqli: oq fonda to‘q matn. 3) Har slaydga mos rasm yoki diagramma. '
                '4) Animatsiya kam va bir xil — ortiqchasi chalg‘itadi. 5) Slaydni o‘qib bermang — gapirib bering, slayd faqat yordamchi.',
            '1) Текст крупный (не меньше 24 pt) и читаемый. 2) Цвет фона и текста контрастный: тёмный текст на светлом фоне. 3) На каждом слайде подходящая картинка или диаграмма. '
                '4) Анимации мало и одинаковые — лишнее отвлекает. 5) Не читайте слайд — рассказывайте, слайд лишь помощник.'),
      ),
      ...g.from([
        Q(1, (g) => g.quiz(const Tr('Qaysi rang juftligi yaxshi o‘qiladi?', 'Какое сочетание цветов читается лучше?'), const Tr('Oq fon, to‘q ko‘k matn', 'Белый фон, тёмно-синий текст'),
            const [Tr('Sariq fon, oq matn', 'Жёлтый фон, белый текст'), Tr('Qizil fon, yashil matn', 'Красный фон, зелёный текст'), Tr('Kulrang fon, kulrang matn', 'Серый фон, серый текст')])),
        Q(2, (g) => g.quiz(const Tr('Har bir so‘zga boshqa animatsiya — bu…', 'Каждому слову своя анимация — это…'), const Tr('Chalg‘itadi, kam ishlatish kerak', 'Отвлекает, нужно меньше'),
            const [Tr('Eng yaxshi usul', 'Лучший способ'), Tr('Majburiy', 'Обязательно'), Tr('Baho oshiradi', 'Повысит оценку')])),
        Q(2, (g) => g.quiz(const Tr('Sonlarni taqqoslash uchun slaydga nima qo‘yasiz?', 'Что поставить на слайд, чтобы сравнить числа?'), const Tr('Diagramma', 'Диаграмму'),
            const [Tr('Uzun paragraf', 'Длинный абзац'), Tr('Musiqa', 'Музыку'), Tr('Bo‘sh slayd', 'Пустой слайд')])),
        Q(3, (g) => g.quiz(const Tr('Taqdimot paytida eng yaxshisi:', 'Во время выступления лучше всего:'), const Tr('Tinglovchilarga qarab gapirish', 'Говорить, глядя на слушателей'),
            const [Tr('Slayddagi matnni o‘qish', 'Читать текст со слайда'), Tr('Ekranga orqa o‘girib turish', 'Стоять спиной к экрану'), Tr('Juda tez gapirish', 'Говорить очень быстро')])),
      ], 2),
      g.order(const Tr('Taqdimotga tayyorlanish:', 'Подготовка к презентации:'), ['Mavzuni tanlash', 'Reja tuzish', 'Slaydlarni yasash', 'Mashq qilish', 'Chiqish qilish']),
    ];

// ---------------------------------------------------------------- 9. Internet va xavfsizlik
List<LessonStep> pc9(Gen g) {
  final n = g.pick(_names);
  return [
    const LessonStep.read(
      h: Tr('Internet, qidiruv va email', 'Интернет, поиск и email'),
      p: Tr(
          'Qidiruvda aniq so‘zlar yozing: “fotosintez 6-sinf oddiy tushuntirish”. Ma’lumotni 2–3 ta ishonchli manbada tekshiring. '
              'Email: aniq mavzu, salomlashish, qisqa matn, imzo. Xavfsizlik: parolni hech kimga bermang, kuchli parol (harf+raqam+belgi), notanish havolani bosmang.',
          'В поиске пишите точные слова: «фотосинтез 6 класс простое объяснение». Проверяйте информацию в 2–3 надёжных источниках. '
              'Email: понятная тема, приветствие, короткий текст, подпись. Безопасность: никому не давайте пароль, пароль сложный (буквы+цифры+знаки), не открывайте незнакомые ссылки.'),
    ),
    ...g.from([
      Q(1, (g) => g.quiz(const Tr('Eng kuchli parol qaysi?', 'Какой пароль самый надёжный?'), const Tr('Kitob7#Olma!92', 'Kitob7#Olma!92'),
          [const Tr('123456', '123456'), const Tr('parol', 'parol'), Tr(n, n)])),
      Q(1, (g) => g.quiz(const Tr('Notanish odam “sovg‘a yutdingiz, havolani bosing” deb yozdi. Nima qilasiz?', 'Незнакомец пишет «вы выиграли приз, нажмите ссылку». Что делать?'),
          const Tr('Bosmayman va kattalarga aytaman', 'Не нажимаю и говорю взрослым'),
          const [Tr('Darrov bosaman', 'Сразу нажимаю'), Tr('Parolimni yozaman', 'Пишу свой пароль'), Tr('Do‘stlarimga tarqataman', 'Рассылаю друзьям')])),
      Q(2, (g) => g.quiz(const Tr('Ustozga email mavzusi (Тема) qanday bo‘lsin?', 'Какая тема письма учителю?'), Tr('Uy vazifasi: Tarix referati — $n, 8-B', 'Домашнее задание: реферат по истории — $n, 8-Б'),
          const [Tr('salom', 'привет'), Tr('(mavzusiz)', '(без темы)'), Tr('!!!!!', '!!!!!')])),
      Q(3, (g) => g.quiz(const Tr('Internetdagi ma’lumot to‘g‘riligini qanday tekshirasiz?', 'Как проверить информацию из интернета?'),
          const Tr('Bir nechta ishonchli manbada solishtirib', 'Сравнить в нескольких надёжных источниках'),
          const [Tr('Birinchi saytga ishonib', 'Поверить первому сайту'), Tr('Ko‘p layk bo‘lsa — to‘g‘ri', 'Много лайков — значит правда'), Tr('Tekshirish shart emas', 'Проверять не нужно')])),
    ], 2),
    g.order(const Tr('Email yozish tartibi:', 'Порядок письма:'), ['Mavzu', 'Salomlashish', 'Asosiy matn', 'Rahmat', 'Imzo (ism)']),
  ];
}

// ================================================================ animatsiyalar / анимации
typedef PcScene = (Tr h, Tr p, AnimScene Function(Gen g));

final Map<String, PcScene> kPcScenes = {
  'pc1': (const Tr('Fayllarni tartibga solamiz', 'Наводим порядок в файлах'), _watch, (g) => chatScene(
        const Tr('Ish stoli to‘lib ketgan… Tartibga keltiramiz.', 'Рабочий стол переполнен… Наводим порядок.'), const [
          (true, Tr('📁 Yangi papka → “Maktab”', '📁 Новая папка → «Maktab»')),
          (false, Tr('📄 referat.docx  📊 baholar.xlsx  🖼 slayd.pptx', '📄 referat.docx  📊 baholar.xlsx  🖼 slayd.pptx')),
          (true, Tr('Hammasini “Maktab” papkasiga sudrayman', 'Перетаскиваю всё в папку «Maktab»')),
          (false, Tr('✅ Ish stoli toza, fayllar bir joyda!', '✅ Рабочий стол чистый, файлы в одном месте!')),
        ], const [
          Tr('Papka — fayllar uchun quti.', 'Папка — коробка для файлов.'),
          Tr('Kengaytma turini aytadi: .docx, .xlsx, .pptx.', 'Расширение говорит о типе: .docx, .xlsx, .pptx.'),
          Tr('Sichqoncha bilan sudrab, papkaga solamiz.', 'Перетаскиваем мышкой в папку.'),
          Tr('Tartibli kompyuter — tez ish.', 'Порядок в компьютере — быстрая работа.'),
        ])),
  'pc2': (const Tr('Ctrl tugmasi sehrlari', 'Магия клавиши Ctrl'), _watch, (g) => chatScene(
        const Tr('Matn bilan ishlaymiz — faqat klaviatura!', 'Работаем с текстом — только клавиатура!'), const [
          (true, Tr('Ctrl+A → hammasi belgilandi', 'Ctrl+A → всё выделено')),
          (true, Tr('Ctrl+C → nusxa olindi', 'Ctrl+C → скопировано')),
          (true, Tr('Ctrl+V → boshqa joyga qo‘yildi', 'Ctrl+V → вставлено в другое место')),
          (false, Tr('Oops, xato! Ctrl+Z → qaytdi ↩', 'Ой, ошибка! Ctrl+Z → отменено ↩')),
          (true, Tr('Ctrl+S → saqlandi 💾', 'Ctrl+S → сохранено 💾')),
        ], const [
          Tr('A — All, hammasi.', 'A — All, всё.'),
          Tr('C — Copy, nusxa.', 'C — Copy, копия.'),
          Tr('V — qo‘yish (C ning yonida).', 'V — вставить (рядом с C).'),
          Tr('Z — eng yaxshi do‘st: xatoni bekor qiladi.', 'Z — лучший друг: отменяет ошибку.'),
          Tr('S — Save. Tez-tez saqlang!', 'S — Save. Сохраняйте почаще!'),
        ])),
  'pc3': (const Tr('Word’da sarlavha bezaymiz', 'Оформляем заголовок в Word'), _watch, (g) => renderHtml(
        const Tr('Bo‘sh hujjat. Yozamiz va bezaymiz.', 'Пустой документ. Пишем и оформляем.'), [
          ('Mening maktabim', _e('p', 'Mening maktabim', 0), const Tr('Oddiy matn yozdik.', 'Написали обычный текст.')),
          ('Ctrl+B, Ctrl+E, 20 pt', _e('h1', 'Mening maktabim', 1), const Tr('Qalin, markazda, katta — sarlavha tayyor!', 'Жирный, по центру, крупный — заголовок готов!')),
          ('Ctrl+I', _e('em', 'Kelajak shu yerdan boshlanadi', 2), const Tr('Ctrl+I — qiya harflar.', 'Ctrl+I — курсив.')),
          ('Ctrl+U', _e('p', 'Maktabimiz 1985-yilda ochilgan.', 3, {'decoration': 'underline'}), const Tr('Ctrl+U — tagiga chizish.', 'Ctrl+U — подчёркивание.')),
          ('Rang: ko‘k', _e('strong', 'Biz faxrlanamiz!', 4, {'color': '#0A6CFF'}), const Tr('Rang tanlab, muhim so‘zni ajratdik.', 'Выбрали цвет и выделили важное.')),
        ], lang: 'word')),
  'pc4': (const Tr('Hujjat tuzilishi', 'Структура документа'), _watch, (g) => renderHtml(
        const Tr('Referat quramiz.', 'Собираем реферат.'), [
          ('Uslub: Sarlavha 1', _e('h1', 'Amir Temur', 0), const Tr('Asosiy sarlavha — “Sarlavha 1” uslubi.', 'Главный заголовок — стиль «Заголовок 1».')),
          ('Uslub: Sarlavha 2', _e('h2', '1. Hayoti', 1), const Tr('Bo‘lim — “Sarlavha 2”.', 'Раздел — «Заголовок 2».')),
          ('Oddiy matn', _e('p', 'Amir Temur 1336-yilda tug‘ilgan.', 2), const Tr('Oddiy paragraf.', 'Обычный абзац.')),
          ('Raqamli ro‘yxat', _e('oli', 'Samarqand', 3), const Tr('Raqamli ro‘yxat — tartib muhim bo‘lsa.', 'Нумерованный список — когда важен порядок.')),
          ('Qo‘yish → Jadval', _e('th', 'Yil | Voqea', 4), const Tr('Qo‘yish → Jadval: sarlavha qatori.', 'Вставка → Таблица: строка заголовков.')),
          ('', _e('tr', '1370 | Hukmdor bo‘ldi', 5), const Tr('Jadvalga ma’lumot.', 'Данные в таблице.')),
        ], lang: 'word')),
  'pc5': (const Tr('Jadval to‘ladi', 'Таблица заполняется'), _watch, (g) {
        final s = g.sample(_names, 3);
        return renderHtml(const Tr('Bo‘sh varaq: A, B, C ustunlar.', 'Пустой лист: столбцы A, B, C.'), [
          ('A1: Ism  B1: Matem  C1: Ingliz', _e('th', 'Ism | Matem | Ingliz', 0), const Tr('1-qator — sarlavhalar.', 'Строка 1 — заголовки.')),
          ('A2: ${s[0]}  B2: 5  C2: 4', _e('tr', '${s[0]} | 5 | 4', 1), const Tr('2-qator: A2, B2, C2 kataklari.', 'Строка 2: ячейки A2, B2, C2.')),
          ('A3: ${s[1]}  B3: 4  C3: 5', _e('tr', '${s[1]} | 4 | 5', 2), const Tr('Har katakning manzili bor: B3 = 4.', 'У каждой ячейки есть адрес: B3 = 4.')),
          ('A4: ${s[2]}  B4: 5  C4: 5', _e('tr', '${s[2]} | 5 | 5', 3), const Tr('Jadval tayyor — endi hisoblash mumkin.', 'Таблица готова — можно считать.')),
        ], lang: 'excel');
      }),
  'pc6': (const Tr('Formula o‘zi hisoblaydi', 'Формула считает сама'), _watch, (g) => renderHtml(
        const Tr('Baholar bor. Formulalar qo‘shamiz.', 'Оценки есть. Добавляем формулы.'), [
          ('', _e('th', 'Fan | Baho', 0), const Tr('B ustunda baholar.', 'В столбце B оценки.')),
          ('B2: 5  B3: 4  B4: 5', _e('tr', 'Matem | 5', 1), const Tr('Ma’lumotlar kiritildi.', 'Данные введены.')),
          ('', _e('tr', 'Ingliz | 4', 2), const Tr('…', '…')),
          ('', _e('tr', 'Fizika | 5', 3), const Tr('…', '…')),
          ('B5: =SUM(B2:B4)', _e('tr', 'Jami | 14', 4), const Tr('=SUM — yig‘indi: 5+4+5 = 14.', '=SUM — сумма: 5+4+5 = 14.')),
          ('B6: =AVERAGE(B2:B4)', _e('mark', 'O‘rtacha: 4,67', 5), const Tr('=AVERAGE — o‘rtacha baho.', '=AVERAGE — средняя оценка.')),
        ], lang: 'excel')),
  'pc7': (const Tr('Slayd yasaymiz', 'Делаем слайд'), _watch, (g) => renderHtml(
        const Tr('Bo‘sh slayd. To‘ldiramiz.', 'Пустой слайд. Заполняем.'), [
          ('Sarlavha', _e('h1', 'Quyosh tizimi', 0), const Tr('Qisqa, katta sarlavha.', 'Короткий крупный заголовок.')),
          ('Band 1', _e('li', '8 ta sayyora', 1), const Tr('Bandlar — qisqa.', 'Пункты — короткие.')),
          ('Band 2', _e('li', 'Eng kattasi — Yupiter', 2), const Tr('Bitta fikr — bitta band.', 'Одна мысль — один пункт.')),
          ('Band 3', _e('li', 'Biz — Yerda 🌍', 3), const Tr('3–5 band yetarli.', '3–5 пунктов достаточно.')),
          ('F5', _e('button', '▶ Namoyish', 4), const Tr('F5 — namoyish boshlandi!', 'F5 — показ начался!')),
        ], lang: 'ppt')),
  'pc8': (const Tr('Yomon va yaxshi slayd', 'Плохой и хороший слайд'), _watch, (g) => chatScene(
        const Tr('Bitta mavzu — ikki xil slayd.', 'Одна тема — два разных слайда.'), const [
          (false, Tr('❌ 300 so‘zli matn, 12 pt, sariq fonda oq harf, 10 ta animatsiya', '❌ Текст на 300 слов, 12 pt, белое на жёлтом, 10 анимаций')),
          (true, Tr('✅ “Suv aylanishi” + 3 band + rasm, 28 pt, oq fon', '✅ «Круговорот воды» + 3 пункта + картинка, 28 pt, белый фон')),
          (false, Tr('Tinglovchilar: 😴', 'Слушатели: 😴')),
          (true, Tr('Tinglovchilar: 🤩 savol berishyapti!', 'Слушатели: 🤩 задают вопросы!')),
        ], const [
          Tr('Ko‘p matn va yomon rang — o‘qib bo‘lmaydi.', 'Много текста и плохой цвет — не прочитать.'),
          Tr('Kam matn, katta harf, rasm — tushunarli.', 'Мало текста, крупный шрифт, картинка — понятно.'),
          Tr('Zerikarli slayd — e’tibor yo‘qoladi.', 'Скучный слайд — внимание теряется.'),
          Tr('Yaxshi slayd — tinglovchi qiziqadi!', 'Хороший слайд — слушателю интересно!'),
        ])),
  'pc9': (const Tr('Xavfli xabarni taniymiz', 'Узнаём опасное сообщение'), _watch, (g) => chatScene(
        const Tr('Pochtaga xat keldi…', 'Пришло письмо…'), const [
          (false, Tr('🎁 TABRIKLAYMIZ! iPhone yutdingiz! Havolani bosing va parolingizni yozing!', '🎁 ПОЗДРАВЛЯЕМ! Вы выиграли iPhone! Нажмите ссылку и введите пароль!')),
          (true, Tr('Men hech qanday tanlovda qatnashmaganman 🤔', 'Я ни в каком конкурсе не участвовал 🤔')),
          (false, Tr('Tezroq! 10 daqiqa qoldi!!!', 'Быстрее! Осталось 10 минут!!!')),
          (true, Tr('Bosmayman. Spam deb belgilab, o‘chiraman ✅', 'Не нажимаю. Отмечаю как спам и удаляю ✅')),
        ], const [
          Tr('Juda yaxshi va’da — birinchi xavf belgisi.', 'Слишком хорошее обещание — первый признак опасности.'),
          Tr('O‘ylab ko‘ring: haqiqatdan shunday bo‘lganmi?', 'Подумайте: было ли такое на самом деле?'),
          Tr('Shoshiltirish — firibgarlar usuli.', 'Торопят — приём мошенников.'),
          Tr('Parol hech qachon havola orqali so‘ralmaydi!', 'Пароль никогда не просят по ссылке!'),
        ])),
};
