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
/// Kurs urg‘u ranglari: [asosiy, ikkinchi]. Progress chizig‘i va shisha ortidagi yumshoq sharlar.
/// Акцентные цвета курса: [основной, второй]. Полоса прогресса и мягкие сферы за стеклом.
const Map<String, List<Color>> kCourseTint = {
  'html': [Color(0xFF0A6CFF), Color(0xFF38C8FF)],
  'css': [Color(0xFF4656FF), Color(0xFFB45CFF)],
  'js': [Color(0xFF0A9BE0), Color(0xFFFFC94A)],
  'py': [Color(0xFF6C5CFF), Color(0xFF38C8FF)],
  'ai': [Color(0xFF9B4DFF), Color(0xFF2D6BFF)],
};

List<Color> courseTint(Course co, AppColors c) {
  final t = kCourseTint[co.id];
  if (t != null) return t;
  final col = courseColor(co, c);
  return [col, Color.lerp(col, kSky, 0.5)!];
}

/// Kursning urg‘u rangi (progress chizig‘i) / акцентный цвет курса (полоса прогресса).
Color courseAccent(Course co, AppColors c) {
  final a = courseTint(co, c).first;
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
  'v': Color(0xFF9A8CFF),
  'p': Color(0xFFB45CFF),
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

// ---------------------------------------------------------------- shisha karta / стеклянная карточка
/// Kurs kartasi uchun shisha sirt: ortida kurs rangidagi yumshoq sharlar, ustida yarim shaffof qatlam.
/// Xiralashtirish (blur) ishlatilmaydi — arzon telefonlarda ham tez ishlaydi.
/// Стеклянная поверхность карточки курса: мягкие сферы цвета курса, сверху полупрозрачный слой.
/// Размытие (blur) не используется — быстро работает и на слабых телефонах.
class CourseGlass extends StatelessWidget {
  final Course course;
  final Widget child;
  final double radius;
  final double? height;
  const CourseGlass({super.key, required this.course, required this.child, this.radius = R.xl, this.height});

  @override
  Widget build(BuildContext context) {
    final c = colorsOf(context);
    final t = courseTint(course, c);
    final d = Motion.of(context, Motion.slow);
    // Kurs almashganda ranglar silliq o‘tadi / при смене курса цвета меняются плавно.
    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(end: t[0]),
      duration: d,
      curve: Motion.curve,
      builder: (_, a, __) => TweenAnimationBuilder<Color?>(
        tween: ColorTween(end: t[1]),
        duration: d,
        curve: Motion.curve,
        child: child,
        builder: (_, b, ch) => _surface(c, a ?? t[0], b ?? t[1], ch!),
      ),
    );
  }

  Widget _surface(AppColors c, Color a, Color b, Widget ch) {
    final r = BorderRadius.circular(radius);
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: r,
        boxShadow: [
          BoxShadow(
              color: a.withAlpha(c.isDark ? 0x40 : 0x30), blurRadius: 26, offset: const Offset(0, 12), spreadRadius: -10),
          ...Shadows.soft(c),
        ],
      ),
      child: ClipRRect(
        borderRadius: r,
        child: Stack(children: [
          // 1) pastel fon / пастельный фон
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: c.surface,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.alphaBlend(a.withAlpha(c.isDark ? 0x30 : 0x26), c.surface),
                    Color.alphaBlend(b.withAlpha(c.isDark ? 0x1C : 0x1A), c.surface),
                  ],
                ),
              ),
            ),
          ),
          // 2) yumshoq sharlar / мягкие сферы
          Positioned(right: -46, top: -56, child: _Blob(170, a.withAlpha(c.isDark ? 0x66 : 0x59))),
          Positioned(left: -60, bottom: -70, child: _Blob(180, b.withAlpha(c.isDark ? 0x4D : 0x4D))),
          // 3) shisha qatlami + och chegara / слой стекла + светлая кромка
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: r,
                  border: Border.all(color: c.isDark ? c.glassEdge : kWhite, width: 1.2),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: c.isDark
                        ? const [Color(0x1AFFFFFF), Color(0x05FFFFFF)]
                        : const [Color(0x99FFFFFF), Color(0x47FFFFFF)],
                  ),
                ),
              ),
            ),
          ),
          ch,
        ]),
      ),
    );
  }
}

class _Blob extends StatelessWidget {
  final double size;
  final Color color;
  const _Blob(this.size, this.color);

  @override
  Widget build(BuildContext context) => IgnorePointer(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(colors: [color, color.withAlpha(0)]),
          ),
        ),
      );
}
