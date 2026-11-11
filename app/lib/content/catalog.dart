// Kurslar katalogi / каталог курсов.
// MUHIM: id va xp server/content/lessons.json bilan bir xil bo‘lishi shart (test tekshiradi).
// ВАЖНО: id и xp должны совпадать с server/content/lessons.json (проверяется тестом).
import 'ai.dart';
import 'cyber.dart';
import 'css.dart';
import 'data_lesson.dart';
import 'html.dart';
import 'js.dart';
import 'model.dart';
import 'more.dart';
import 'pc.dart';
import 'python.dart';
import 'scenes.dart';

/// XP harakatga qarab: bir xil uzunlikdagi darslar har bir ligada bir xil XP beradi.
/// XP за усилия: уроки одинаковой длины дают одинаковый XP в любой лиге.
const int kLessonXp = 20;
const int kProjectXp = 30;

Lesson _l(String id, String course, Tr title, StepBuilder b, {int xp = kLessonXp, Set<String>? leagues}) =>
    Lesson(id: id, courseId: course, xp: xp, title: title, builder: _withScene(id, b), leagues: leagues);

/// Nazariyadan keyin animatsiya qadamini qo‘shadi / добавляет шаг-анимацию после теории.
StepBuilder _withScene(String id, StepBuilder b) {
  final sc = kScenes[id];
  if (sc == null) return b;
  return (g) {
    final steps = [...b(g)];
    final at = steps.indexWhere((x) => x.type == StepType.read) + 1;
    steps.insert(at, LessonStep.read(h: sc.$1, p: sc.$2, anim: sc.$3(g)));
    return steps;
  };
}

final List<Course> kCourses = [
  // Kompyuter savodxonligi — boshlang‘ich liga uchun tavsiya, majburiy emas.
  // Компьютерная грамотность — рекомендуется начальной лиге, не обязательно.
  Course(id: 'pc', tag: 'PC', color: '#13B07B', name: const Tr('Kompyuter savodxonligi', 'Компьютерная грамотность'),
      sub: const Tr('Word, Excel, PowerPoint', 'Word, Excel, PowerPoint'), lessons: [
    _l('pc1', 'pc', const Tr('Fayl va papkalar', 'Файлы и папки'), pc1),
    _l('pc2', 'pc', const Tr('Tezkor tugmalar', 'Горячие клавиши'), pc2),
    _l('pc3', 'pc', const Tr('Word: matnni bezash', 'Word: оформление текста'), pc3),
    _l('pc4', 'pc', const Tr('Word: hujjat tuzilishi', 'Word: структура документа'), pc4),
    _l('pc5', 'pc', const Tr('Excel: kataklar', 'Excel: ячейки'), pc5),
    _l('pc6', 'pc', const Tr('Excel: formulalar', 'Excel: формулы'), pc6),
    _l('pc7', 'pc', const Tr('PowerPoint: slaydlar', 'PowerPoint: слайды'), pc7),
    _l('pc8', 'pc', const Tr('Ajoyib taqdimot', 'Отличная презентация'), pc8),
    _l('pc9', 'pc', const Tr('Internet va xavfsizlik', 'Интернет и безопасность'), pc9),
  ]),
  Course(id: 'html', tag: '</>', color: '#0A6CFF', name: const Tr('HTML', 'HTML'),
      sub: const Tr('Veb-sahifa tuzilishi', 'Структура веб-страницы'), lessons: [
    _l('html1', 'html', const Tr('HTML nima?', 'Что такое HTML?'), html1),
    _l('html2', 'html', const Tr('Sarlavha va paragraf', 'Заголовки и абзацы'), html2),
    _l('html3', 'html', const Tr('Havola va rasm', 'Ссылки и картинки'), html3),
    _l('html4', 'html', const Tr('Ro‘yxatlar', 'Списки'), html4),
    _l('html5', 'html', const Tr('Sahifa tuzilishi', 'Структура страницы'), html5),
    _l('html6', 'html', const Tr('Formalar', 'Формы'), html6),
    _l('html7', 'html', const Tr('Jadvallar', 'Таблицы'), html7),
    _l('html8', 'html', const Tr('Matnni bezash', 'Оформление текста'), html8),
    _l('html9', 'html', const Tr('Tanlash maydonlari', 'Поля выбора'), html9),
  ]),
  Course(id: 'css', tag: '{ }', color: '#0A1226', name: const Tr('CSS', 'CSS'),
      sub: const Tr('Sahifani bezash', 'Оформление страницы'), lessons: [
    _l('css1', 'css', const Tr('Birinchi qoida', 'Первое правило'), css1),
    _l('css2', 'css', const Tr('Matn', 'Текст'), css2),
    _l('css3', 'css', const Tr('Ranglar va fon', 'Цвета и фон'), css3),
    _l('css4', 'css', const Tr('Quti modeli', 'Блочная модель'), css4),
    _l('css5', 'css', const Tr('Klass va id', 'Класс и id'), css5),
    _l('css6', 'css', const Tr('Flexbox', 'Flexbox'), css6),
    _l('css7', 'css', const Tr('Chegara va soya', 'Рамка и тень'), css7),
    _l('css8', 'css', const Tr(':hover va o‘tish', ':hover и переход'), css8),
    _l('css9', 'css', const Tr('O‘lchamlar', 'Размеры'), css9),
  ]),
  Course(id: 'js', tag: 'JS', color: '#1FB6F5', name: const Tr('JavaScript', 'JavaScript'),
      sub: const Tr('Sahifaga jon berish', 'Оживляем страницу'), lessons: [
    _l('js1', 'js', const Tr('console.log', 'console.log'), js1),
    _l('js2', 'js', const Tr('O‘zgaruvchilar', 'Переменные'), js2),
    _l('js3', 'js', const Tr('Hisob-kitob', 'Вычисления'), js3),
    _l('js4', 'js', const Tr('Shartlar', 'Условия'), js4),
    _l('js5', 'js', const Tr('Sikllar', 'Циклы'), js5),
    _l('js6', 'js', const Tr('Funksiyalar', 'Функции'), js6),
    _l('js7', 'js', const Tr('Massivlar', 'Массивы'), js7),
    _l('js8', 'js', const Tr('Massiv bo‘ylab sikl', 'Цикл по массиву'), js8),
    _l('js9', 'js', const Tr('Obyektlar', 'Объекты'), js9),
  ]),
  Course(id: 'py', tag: 'Py', color: '#3776AB', name: const Tr('Python', 'Python'),
      sub: const Tr('Olimpiada tili', 'Язык олимпиад'), lessons: [
    _l('py1', 'py', const Tr('print()', 'print()'), py1),
    _l('py2', 'py', const Tr('O‘zgaruvchi va input', 'Переменные и input'), py2),
    _l('py3', 'py', const Tr('Sonlar', 'Числа'), py3),
    _l('py4', 'py', const Tr('if / elif / else', 'if / elif / else'), py4),
    _l('py5', 'py', const Tr('for va range', 'for и range'), py5),
    _l('py6', 'py', const Tr('Ro‘yxatlar', 'Списки'), py6),
    _l('py7', 'py', const Tr('while sikli', 'Цикл while'), py7),
    _l('py8', 'py', const Tr('Satrlar', 'Строки'), py8),
    _l('py9', 'py', const Tr('Lug‘atlar', 'Словари'), py9),
  ]),
  Course(id: 'ai', tag: 'AI', color: '#E8590C', name: const Tr('Sun’iy intellekt', 'Искусственный интеллект'),
      sub: const Tr('AI ni tushunish va yaratish', 'Понять и создать AI'), lessons: [
    _l('ai1', 'ai', const Tr('AI nima?', 'Что такое AI?'), ai1, leagues: kBeginner),
    _l('ai2', 'ai', const Tr('AI qanday o‘rganadi', 'Как учится AI'), ai2, leagues: kBeginner),
    _l('ai3', 'ai', const Tr('Aqlli so‘rov', 'Умный запрос'), ai3, leagues: kBeginner),
    _l('ai4', 'ai', const Tr('AI xatolari', 'Ошибки AI'), ai4, leagues: kBeginner),
    _l('ai5', 'ai', const Tr('Soxta va xavfsizlik', 'Фейки и безопасность'), ai5, leagues: kBeginner),
    _l('ai6', 'ai', const Tr('AI qanday ko‘radi', 'Как AI видит'), ai6, leagues: kBeginner),
    _l('ai7', 'ai', const Tr('Halol va xavfsiz AI', 'Честный и безопасный AI'), ai7, leagues: kBeginner),
    _l('aiA1', 'ai', const Tr('Chatbot', 'Чат-бот'), aiA1, xp: kProjectXp, leagues: kAdvanced),
    _l('aiA2', 'ai', const Tr('Raqamni tanish', 'Распознавание цифр'), aiA2, xp: kProjectXp, leagues: kAdvanced),
    _l('aiA3', 'ai', const Tr('Savol generatori', 'Генератор вопросов'), aiA3, xp: kProjectXp, leagues: kAdvanced),
    _l('aiA4', 'ai', const Tr('Matn kayfiyati', 'Настроение текста'), aiA4, xp: kProjectXp, leagues: kAdvanced),
    _l('aiM1', 'ai', const Tr('Niyatli chatbot', 'Чат-бот с намерениями'), aiM1, xp: kProjectXp, leagues: kMaster),
    _l('aiM2', 'ai', const Tr('k-NN tanish', 'Распознавание k-NN'), aiM2, xp: kProjectXp, leagues: kMaster),
    _l('aiM3', 'ai', const Tr('Moslashuvchan test', 'Адаптивный тест'), aiM3, xp: kProjectXp, leagues: kMaster),
    _l('aiM4', 'ai', const Tr('Sun’iy neyron', 'Искусственный нейрон'), aiM4, xp: kProjectXp, leagues: kMaster),
  ]),
  // Kiberxavfsizlik: asoslar hamma uchun, chuqur darslar ilg‘or va ustalar ligasi uchun.
  // Кибербезопасность: основы для всех, глубокие уроки для продвинутой и мастер-лиги.
  Course(id: 'cy', tag: 'SEC', color: '#0B2A4A', name: const Tr('Kiberxavfsizlik', 'Кибербезопасность'),
      sub: const Tr('Himoyachi bo‘lib o‘ylash', 'Думать как защитник'), lessons: [
    _l('cy1', 'cy', const Tr('Kiberxavfsizlik nima?', 'Что такое кибербезопасность?'), cy1),
    _l('cy2', 'cy', const Tr('Parol va 2FA', 'Пароль и 2FA'), cy2),
    _l('cy3', 'cy', const Tr('Fishing', 'Фишинг'), cy3),
    _l('cy4', 'cy', const Tr('Raqamli iz', 'Цифровой след'), cy4),
    _l('cy5', 'cy', const Tr('Qurilma himoyasi', 'Защита устройства'), cy5),
    _l('cy6', 'cy', const Tr('Internet ichidan', 'Интернет изнутри'), cy6, leagues: kAdvMaster),
    _l('cy7', 'cy', const Tr('Shifrlash', 'Шифрование'), cy7, leagues: kAdvMaster),
    _l('cy8', 'cy', const Tr('HTTPS', 'HTTPS'), cy8, leagues: kAdvMaster),
    _l('cy9', 'cy', const Tr('Zararli dasturlar', 'Вредоносные программы'), cy9, leagues: kAdvMaster),
    _l('cy10', 'cy', const Tr('Xesh va parollar', 'Хеш и пароли'), cy10, leagues: kAdvMaster),
    _l('cy11', 'cy', const Tr('Shifr kodda', 'Шифр в коде'), cy11, xp: kProjectXp, leagues: kMaster),
    _l('cy12', 'cy', const Tr('Parol matematikasi', 'Математика паролей'), cy12, xp: kProjectXp, leagues: kMaster),
    _l('cy13', 'cy', const Tr('SQL injection himoyasi', 'Защита от SQL-инъекций'), cy13, xp: kProjectXp, leagues: kMaster),
    _l('cy14', 'cy', const Tr('XSS himoyasi', 'Защита от XSS'), cy14, xp: kProjectXp, leagues: kMaster),
    _l('cy15', 'cy', const Tr('Loglar va aniqlash', 'Логи и обнаружение'), cy15, xp: kProjectXp, leagues: kMaster),
    _l('cy16', 'cy', const Tr('Ijtimoiy muhandislik', 'Социальная инженерия'), cy16, xp: kProjectXp, leagues: kMaster),
    _l('cy17', 'cy', const Tr('Tarmoq himoyasi', 'Защита сети'), cy17, xp: kProjectXp, leagues: kMaster),
    _l('cy18', 'cy', const Tr('Etika va kasb', 'Этика и профессия'), cy18, xp: kProjectXp, leagues: kMaster),
    _l('cy19', 'cy', const Tr('CTF: bayroq', 'CTF: флаг'), cy19, xp: kProjectXp, leagues: kMaster),
  ]),
];

final Map<String, (Lesson, Course)> kAllLessons = {
  for (final c in kCourses)
    for (final l in c.lessons) l.id: (l, c),
};

// ---------------------------------------------------------------- server darslari / уроки с сервера
/// Serverdagi yozuv / запись на сервере.
class ContentItem {
  final String id, scope; // global | school
  final bool hidden;
  final int updated;
  final Map<String, dynamic>? data; // null — faqat yashirilgan / только скрыт
  const ContentItem(this.id, this.scope, this.hidden, this.updated, this.data);

  factory ContentItem.fromJson(Map j) => ContentItem('${j['id']}', j['scope'] == 'school' ? 'school' : 'global',
      j['hidden'] == true, j['updated'] is int ? j['updated'] as int : 0, j['data'] is Map ? Map<String, dynamic>.from(j['data'] as Map) : null);
}

final Map<String, List<Lesson>> _builtin = {};

/// Asl (ilovadagi) dars / встроенный урок.
final Map<String, (Lesson, Course)> kBuiltinLessons = {};

/// Serverdan kelgan yozuvlar (id → yozuv) / записи с сервера.
final Map<String, ContentItem> kContent = {};

/// Maktab darslari (kurs → darslar), XP bermaydi / уроки школы, без XP.
final Map<String, List<Lesson>> kSchoolLessons = {};

/// Server darslarini qo‘llash: asl darslar tiklanadi, so‘ng o‘zgartirishlar, yashirish va yangilari.
/// Применить уроки сервера: восстанавливаем встроенные, затем правки, скрытие и новые.
void applyContent(List<Object?> raw) {
  if (_builtin.isEmpty) {
    for (final c in kCourses) {
      _builtin[c.id] = List.of(c.lessons);
      for (final l in c.lessons) {
        kBuiltinLessons[l.id] = (l, c);
      }
    }
  }
  kContent.clear();
  kSchoolLessons.clear();
  final items = [for (final r in raw) if (r is Map) ContentItem.fromJson(r)]..sort((a, b) => a.updated.compareTo(b.updated));
  final hidden = <String>{};
  final extra = <(Lesson, int?)>[];
  final override = <String, Lesson>{};
  for (final it in items) {
    kContent[it.id] = it;
    if (it.scope == 'school') {
      final l = it.hidden ? null : lessonFromJson(it.id, it.data, source: 'school');
      if (l != null) kSchoolLessons.putIfAbsent(l.courseId, () => []).add(l);
      continue;
    }
    if (it.hidden) hidden.add(it.id);
    final base = kBuiltinLessons[it.id];
    if (base != null) {
      final l = it.data == null ? null : lessonFromJson(it.id, it.data, source: 'global', course: base.$1.courseId);
      if (l != null) override[it.id] = l;
    } else {
      final l = lessonFromJson(it.id, it.data, source: 'global');
      if (l != null) extra.add((l, it.data?['pos'] is int ? it.data!['pos'] as int : null));
    }
  }
  for (final c in kCourses) {
    final list = [for (final l in _builtin[c.id]!) override[l.id] ?? l];
    for (final (l, pos) in extra) {
      if (l.courseId != c.id) continue;
      if (pos != null && pos >= 0 && pos <= list.length) {
        list.insert(pos, l);
      } else {
        list.add(l);
      }
    }
    c.lessons
      ..clear()
      ..addAll([for (final l in list) if (!hidden.contains(l.id)) l]);
  }
  kAllLessons.clear();
  for (final c in kCourses) {
    for (final l in c.lessons) {
      kAllLessons[l.id] = (l, c);
    }
    for (final l in kSchoolLessons[c.id] ?? const <Lesson>[]) {
      kAllLessons[l.id] = (l, c);
    }
  }
}

/// Admin uchun: kursdagi barcha darslar (yashirilganlari ham) / для админа: все уроки курса (и скрытые).
List<Lesson> adminLessonsOf(Course c) {
  if (_builtin.isEmpty) applyContent(const []);
  final shown = {for (final l in c.lessons) l.id};
  final out = List<Lesson>.of(c.lessons);
  for (final l in _builtin[c.id]!) {
    if (!shown.contains(l.id)) out.insert(_builtin[c.id]!.indexOf(l).clamp(0, out.length), l);
  }
  for (final it in kContent.values) {
    if (it.scope == 'global' && it.hidden && !kBuiltinLessons.containsKey(it.id) && !shown.contains(it.id)) {
      final l = lessonFromJson(it.id, it.data, source: 'global');
      if (l != null && l.courseId == c.id) out.add(l);
    }
  }
  return out;
}

const String kPlaygroundStart = '# Kvadratlar jadvali\nn = int(input("Nechta son? "))\nfor i in range(1, n + 1):\n    print(i, "→", i * i)\n';
