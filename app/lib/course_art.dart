// ============================================================================
//  Kurs kartalari: shisha (glassmorphism) + piksel-art belgilar.
//  Карточки курсов: стекло (glassmorphism) + пиксель-арт значки.
//
//  Rasm fayllari yo‘q — belgilar 16×16 katakli matn sifatida saqlanadi va chiziladi.
//  Файлов картинок нет — значки хранятся как текст 16×16 и рисуются кодом.
// ============================================================================

import 'package:flutter/material.dart';

import 'content/model.dart' show Course;
import 'theme.dart';
import 'widgets.dart';

// ---------------------------------------------------------------- ranglar / цвета
/// Kurs "terisi": har kurs o‘z dasturlash tilining haqiqiy rangida, kod oynasi ko‘rinishida.
/// «Скин» курса: каждый курс в настоящем цвете своего языка, в виде окна редактора кода.
class CourseSkin {
  final Color bar; // sarlavha qatori / строка заголовка
  final Color barText; // sarlavha matni / текст заголовка
  final Color accent; // progress va urg‘u / прогресс и акцент
  final String file; // oynadagi fayl nomi / имя файла в окне
  const CourseSkin({required this.bar, required this.barText, required this.accent, required this.file});
}

const Map<String, CourseSkin> kCourseSkin = {
  'pc': CourseSkin(bar: Color(0xFF2D9C5A), barText: kWhite, accent: Color(0xFF2D9C5A), file: 'kompyuter.txt'),
  'html': CourseSkin(bar: Color(0xFFE34F26), barText: kWhite, accent: Color(0xFFE34F26), file: 'index.html'),
  'css': CourseSkin(bar: Color(0xFF1572B6), barText: kWhite, accent: Color(0xFF1572B6), file: 'style.css'),
  'js': CourseSkin(bar: Color(0xFFF7DF1E), barText: Color(0xFF1A1A1A), accent: Color(0xFFD4B400), file: 'app.js'),
  'py': CourseSkin(bar: Color(0xFF3776AB), barText: kWhite, accent: Color(0xFF3776AB), file: 'main.py'),
  'ai': CourseSkin(bar: Color(0xFF22324F), barText: Color(0xFF8FDBFF), accent: Color(0xFF2FA4E0), file: 'model.py'),
  'cy': CourseSkin(bar: Color(0xFF0E2238), barText: Color(0xFF3DDC84), accent: Color(0xFF2FBF71), file: 'secure.sh'),
};

CourseSkin courseSkin(Course co) {
  final s = kCourseSkin[co.id];
  if (s != null) return s;
  final col = hexColor(co.color);
  return CourseSkin(bar: col, barText: onColor(col), accent: col, file: '${co.id}.txt');
}

/// Eski API (testlar uchun): [asosiy, sarlavha] / старый API (для тестов): [акцент, заголовок].
final Map<String, List<Color>> kCourseTint = {for (final e in kCourseSkin.entries) e.key: [e.value.accent, e.value.bar]};

List<Color> courseTint(Course co, AppColors c) {
  final k = courseSkin(co);
  return [k.accent, k.bar];
}

/// Kursning urg‘u rangi (progress chizig‘i) / акцентный цвет курса (полоса прогресса).
Color courseAccent(Course co, AppColors c) {
  final a = courseSkin(co).accent;
  return c.isDark ? Color.lerp(a, kWhite, 0.25)! : a;
}

// ---------------------------------------------------------------- piksel-art / пиксель-арт
/// Umumiy palitra (barcha belgilar uchun bitta) / общая палитра (одна на все значки).
/// '.' — bo‘sh katak / пустая клетка. 'k' — kontur / контур.
const Map<String, Color> kPixelPalette = {
  'k': Color(0xFF0A1226),
  'w': Color(0xFFFFFFFF),
  'g': Color(0xFFDCE8FA),
  's': Color(0xFF38C8FF),
  'b': Color(0xFF0A6CFF),
  'd': Color(0xFF0047D6),
  'v': Color(0xFF7FE3D8), // och firuza / светлая бирюза
  'p': Color(0xFF00A89D), // firuza / бирюза
  'y': Color(0xFFFFC94A),
  'o': Color(0xFFFF9F0A),
  'r': Color(0xFFFF5A6E),
  'm': Color(0xFF34C759),
};

/// Qorong‘i mavzuda kontur ochroq (aks holda ko‘rinmaydi) / в тёмной теме контур светлее.
const Color kPixelOutlineDark = Color(0xFF2B3A63);

const int kPixelGrid = 16;

/// Har bir kurs uchun 16×16 rasm / картинка 16×16 для каждого курса.
const Map<String, List<String>> kPixelArt = {
  // monitor / монитор
  'pc': [
    '................',
    '.kkkkkkkkkkkkkk.',
    '.kddddddddddddk.',
    '.kdwwssssssssdk.',
    '.kdwsssssssssdk.',
    '.kdsmmmmsssssdk.',
    '.kdssssyyysssdk.',
    '.kdsmmmssssssdk.',
    '.kdssssssssssdk.',
    '.kddddddddddddk.',
    '.kkkkkkkkkkkkkk.',
    '......kddk......',
    '......kddk......',
    '...kkkkkkkkkk...',
    '...kggggggggk...',
    '...kkkkkkkkkk...',
  ],
  // qalqon + qulf / щит + замок
  'cy': [
    '................',
    '.......kk.......',
    '.....kkbbkk.....',
    '...kkssbbbbkk...',
    '..ksbbkkkkbbbk..',
    '..ksbbkbbkbbbk..',
    '..ksbbkbbkbbbk..',
    '..ksbkkkkkkbbk..',
    '..ksbkyyyykbbk..',
    '...kbkykkykbk...',
    '...kbkyyyykbk...',
    '....kkkkkkkk....',
    '.....kbbbbk.....',
    '......kbbk......',
    '.......kk.......',
    '................',
  ],
  // brauzer oynasi / окно браузера
  'html': [
    '................',
    '.kkkkkkkkkkkkkk.',
    '.kbbbbbbbbbbbbk.',
    '.kbrbybmbbbbbbk.',
    '.kbbbbbbbbbbbbk.',
    '.kkkkkkkkkkkkkk.',
    '.kwwwwwwwwwwwwk.',
    '.kwwwdwwwpdwwwk.',
    '.kwwdwwwpwwdwwk.',
    '.kwdwwwwpwwwdwk.',
    '.kwwdwwpwwwdwwk.',
    '.kwwwdpwwwdwwwk.',
    '.kwwwwwwwwwwwwk.',
    '.kggggggggggggk.',
    '.kkkkkkkkkkkkkk.',
    '................',
  ],
  // mo‘yqalam / кисть
  'css': [
    '................',
    '..........kkk...',
    '.........kyyok..',
    '........kyyok...',
    '.......kyyok....',
    '......kyyok.....',
    '.....kggok......',
    '....kgggk.......',
    '...kpppkk.......',
    '..kpppvvk.......',
    '..kppvvsk..kk...',
    '..kpvvssk.kssk..',
    '...kvssk..kssk..',
    '...kkssk...kk...',
    '.....kk.........',
    '................',
  ],
  // chaqmoq / молния
  'js': [
    '................',
    '.........kkkkk..',
    '........kyyyok..',
    '.......kyyyok...',
    '......kyyyok....',
    '.....kyyyok.....',
    '....kyyyykkkk...',
    '...kyyyyyyyok...',
    '...kkkkyyyok....',
    '......kyyok.....',
    '.....kyyok......',
    '....kyyok.......',
    '....kyok........',
    '...kyok.........',
    '...kkk..........',
    '................',
  ],
  // ilon / змейка
  'py': [
    '................',
    '....kkkkkkk.....',
    '...kssssssskk...',
    '...kswkssssssk..',
    '...ksssssssssk..',
    '...kkkkkkkssskrr',
    '.........kbbbk..',
    '..kkkkkkkkssskk.',
    '.kssssssssssssk.',
    '.ksssbbbkkkkkk..',
    '.kyyyk..........',
    '.kssskkkkkkkk...',
    '.ksssssbbbsssk..',
    '..kkkkkkkkkssk..',
    '...........kk...',
    '................',
  ],
  // robot / робот
  'ai': [
    '.......kk.......',
    '......kyyk......',
    '.......kk.......',
    '..kkkkkkkkkkkk..',
    '.kggggggggggggk.',
    '.kgkkkkggkkkkgk.',
    'kkgkswkggkswkgkk',
    'kpgksskggksskgpk',
    'kpgkkkkggkkkkgpk',
    'kkggggggggggggkk',
    '.kggkkkkkkkkggk.',
    '.kggkwkwkwkwggk.',
    '.kggkkkkkkkkggk.',
    '.kggggggggggggk.',
    '..kkkkkkkkkkkk..',
    '................',
  ],
};

/// Piksel-art belgi. Kurs uchun rasm bo‘lmasa — oddiy [CourseTag].
/// Пиксель-арт значок. Если для курса нет картинки — обычный [CourseTag].
class CoursePixel extends StatelessWidget {
  final Course course;
  final double size;
  const CoursePixel(this.course, {super.key, this.size = 48});

  @override
  Widget build(BuildContext context) {
    final rows = kPixelArt[course.id];
    if (rows == null) return CourseTag(course, size: size, fontSize: size * 0.3);
    return ExcludeSemantics(
      child: RepaintBoundary(
        child: CustomPaint(
          size: Size.square(size),
          painter: _PixelPainter(rows, colorsOf(context).isDark),
        ),
      ),
    );
  }
}

class _PixelPainter extends CustomPainter {
  final List<String> rows;
  final bool dark;
  const _PixelPainter(this.rows, this.dark);

  @override
  void paint(Canvas canvas, Size size) {
    final cell = size.width / kPixelGrid;
    // Tekislashsiz: chetlari o‘tkir qoladi / без сглаживания: края остаются чёткими.
    final p = Paint()..isAntiAlias = false;
    for (var y = 0; y < rows.length; y++) {
      final row = rows[y];
      var x = 0;
      while (x < row.length) {
        final ch = row[x];
        var end = x + 1;
        while (end < row.length && row[end] == ch) {
          end++;
        }
        final col = ch == 'k' && dark ? kPixelOutlineDark : kPixelPalette[ch];
        if (col != null) {
          p.color = col;
          canvas.drawRect(Rect.fromLTRB(x * cell, y * cell, end * cell, (y + 1) * cell), p);
        }
        x = end;
      }
    }
  }

  @override
  bool shouldRepaint(_PixelPainter old) => old.rows != rows || old.dark != dark;
}

// ---------------------------------------------------------------- kod oynasi kartasi / карточка «окно кода»
/// Kurs kartasi — kichik kod muharriri oynasi: rangli sarlavha qatori (3 nuqta + fayl nomi), oq tana.
/// Gradient va xira dog‘lar yo‘q. Карточка курса — маленькое окно редактора: цветная строка заголовка
/// (3 точки + имя файла), светлое тело. Без градиентов и размытых пятен.
/// (Nomi eski — CourseGlass — chaqiruvchilar o‘zgarmasin deb / имя старое, чтобы не менять вызовы.)
class CourseGlass extends StatelessWidget {
  final Course course;
  final Widget child;
  final double radius;
  final double? height;
  const CourseGlass({super.key, required this.course, required this.child, this.radius = R.xl, this.height});

  @override
  Widget build(BuildContext context) {
    final c = colorsOf(context);
    final k = courseSkin(course);
    final d = Motion.of(context, Motion.base);
    final r = BorderRadius.circular(radius);
    final bar = AnimatedContainer(
      duration: d,
      curve: Motion.curve,
      height: 30,
      color: k.bar,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(children: [
        for (var i = 0; i < 3; i++) ...[
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(shape: BoxShape.circle, color: k.barText.withAlpha(i == 0 ? 0xE6 : 0x73)),
          ),
          const SizedBox(width: 5),
        ],
        const SizedBox(width: 6),
        Flexible(
          child: Text(k.file,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppType.mono.copyWith(fontSize: 12, height: 1, color: k.barText, fontWeight: w7)),
        ),
      ]),
    );
    return AnimatedContainer(
      duration: d,
      curve: Motion.curve,
      height: height,
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: r,
        border: Border.all(color: k.bar.withAlpha(c.isDark ? 0x99 : 0x66), width: 1.5),
        boxShadow: [
          // qalin rangli pastki chet (o‘yin kartasi kabi) / толстый цветной нижний край (как игровая карточка)
          BoxShadow(color: Color.lerp(k.bar, const Color(0xFF000000), 0.25)!.withAlpha(c.isDark ? 0xCC : 0x8C), offset: const Offset(0, 4)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius - 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: height == null ? MainAxisSize.min : MainAxisSize.max,
          children: [bar, if (height == null) child else Expanded(child: child)],
        ),
      ),
    );
  }
}
