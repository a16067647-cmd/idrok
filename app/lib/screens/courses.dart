import 'package:flutter/material.dart';

import '../course_art.dart';
import '../lessons.dart';
import '../progress.dart';
import '../state.dart';
import '../theme.dart';
import '../widgets.dart';
import 'cards.dart' show ProjectCard;
import 'certificate.dart';
import 'lesson.dart';
import 'lessons_admin.dart' show SchoolLessonsSection;
import 'teacher_tests.dart' show SchoolTestsSection;

/// 2. Kurs xaritasi / карта курса.
class CoursesTab extends StatelessWidget {
  const CoursesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppScope.of(context);
    final course = s.course;
    return TabPage(
      title: s.t('courses'),
      split: 4,
      children: s.courseLocked(course)
          ? [const _CoursePicker(), LockedCourseCard(course: course)]
          : [
        const _CoursePicker(),
        _CourseHero(course: course),
        SectionHeader(s.t('course_path')),
        _Path(course: course),
        _Chest(course: course),
        if ((kSchoolLessons[course.id] ?? const []).isNotEmpty) SchoolLessonsSection(course: course),
        if (!s.isStaff) ExamCard(course: course),
        ProjectCard(course: course),
        const SchoolTestsSection(),
      ],
    );
  }
}

/// Qulflangan yakuniy kurs kartasi / карточка закрытого финального курса.
class LockedCourseCard extends StatelessWidget {
  final Course course;
  const LockedCourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final s = AppScope.of(context);
    final c = s.c;
    final master = s.st.league == 'master';
    Widget row(bool ok, String text, [String? trail]) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(children: [
            Icon(ok ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
                size: 20, color: ok ? const Color(0xFF34C759) : kWhite.withAlpha(0x88)),
            const SizedBox(width: S.x3),
            Expanded(child: Text(text, style: AppType.subhead.copyWith(color: kWhite))),
            if (trail != null) Text(trail, style: AppType.caption.copyWith(color: kWhite.withAlpha(0xCC), fontWeight: w7)),
          ]),
        );
    return Container(
      key: const ValueKey('course-locked'),
      padding: const EdgeInsets.all(S.x5),
      decoration: BoxDecoration(
        borderRadius: R.all(R.xl),
        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF1E4D7B), Color(0xFF07101F)]),
        boxShadow: Shadows.glow(const Color(0xFF1E4D7B), c, strength: 0.8),
      ),
      foregroundDecoration: BoxDecoration(gradient: kGloss, borderRadius: R.all(R.xl)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(color: const Color(0x26FFFFFF), borderRadius: R.all(R.lg), border: Border.all(color: const Color(0x40FFFFFF))),
            child: const Icon(Icons.lock_rounded, color: Color(0xFFFFD54A), size: 30),
          ),
          const SizedBox(width: S.x4),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(s.tr(const Tr('YASHIRIN YAKUNIY KURS', 'СЕКРЕТНЫЙ ФИНАЛЬНЫЙ КУРС')),
                  style: AppType.caption.copyWith(color: const Color(0xFFFFD54A), fontWeight: w8, letterSpacing: 1.1)),
              Text(s.tr(course.name), style: AppType.title2.copyWith(color: kWhite)),
            ]),
          ),
        ]),
        const SizedBox(height: S.x3),
        Text(
            s.tr(const Tr('Eng kuchli o‘quvchilar uchun: shifrlash, xesh, tarmoq, SQL injection va XSS’dan himoya, CTF. Ochish shartlari:',
                'Для самых сильных учеников: шифрование, хеши, сети, защита от SQL-инъекций и XSS, CTF. Условия открытия:')),
            style: AppType.subhead.copyWith(color: kWhite.withAlpha(0xD9))),
        const SizedBox(height: S.x3),
        row(master, s.tr(const Tr('Ustalar ligasiga chiqish', 'Попасть в Мастер-лигу'))),
        for (final co in kCourses.where((x) => x.id != course.id))
          row(s.courseComplete(co), s.tr(Tr('“${co.name.uz}” kursini tugatish', 'Пройти курс «${co.name.ru}»')),
              '${s.progressOf(co)}/${s.lessonsOf(co).length}'),
      ]),
    );
  }
}

// ------------------------------------------------------------ kurs tanlash / выбор курса
class _CoursePicker extends StatelessWidget {
  const _CoursePicker();

  @override
  Widget build(BuildContext context) {
    final s = AppScope.of(context);
    final c = s.c;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      child: Row(children: [
        for (final x in kCourses) ...[
          Pressable(
            key: ValueKey('course-${x.id}'),
            onTap: () => s.pickCourse(x.id),
            scale: 0.95,
            child: AnimatedContainer(
              duration: Motion.of(context, Motion.base),
              curve: Motion.curve,
              padding: const EdgeInsets.fromLTRB(6, 6, 16, 6),
              decoration: BoxDecoration(
                color: x.id == s.courseId ? (c.isDark ? c.elevated : c.surface) : Colors.transparent,
                borderRadius: R.all(R.pill),
                border: Border.all(color: x.id == s.courseId ? c.hairlineStrong : c.hairline),
                boxShadow: x.id == s.courseId ? Shadows.soft(c) : null,
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                if (s.courseLocked(x))
                  SizedBox.square(dimension: 30, child: Icon(Icons.lock_rounded, size: 22, color: c.text3))
                else
                  CoursePixel(x, size: 30),
                const SizedBox(width: S.x2),
                Text(s.tr(x.name),
                    style: AppType.subhead.copyWith(
                        color: x.id == s.courseId ? c.text : c.text2, fontWeight: x.id == s.courseId ? w8 : w6)),
              ]),
            ),
          ),
          const SizedBox(width: S.x2),
        ],
      ]),
    );
  }
}

// ------------------------------------------------------------ kurs kartasi / карточка курса
class _CourseHero extends StatelessWidget {
  final Course course;
  const _CourseHero({required this.course});

  @override
  Widget build(BuildContext context) {
    final s = AppScope.of(context);
    final c = s.c;
    final d = s.progressOf(course), n = s.lessonsOf(course).length;
    return CourseGlass(
      course: course,
      radius: R.xxl,
      child: Padding(
        padding: const EdgeInsets.all(S.x5),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            CoursePixel(course, size: 64),
            const SizedBox(width: S.x4),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('${s.t('boss').toUpperCase()} ${kCourses.indexOf(course) + 1}',
                    style: AppType.overline.copyWith(color: c.text2)),
                const SizedBox(height: 3),
                Text(s.tr(course.name), style: AppType.title1.copyWith(color: c.text)),
                Text(s.tr(course.sub), style: AppType.subhead.copyWith(color: c.text2)),
              ]),
            ),
          ]),
          const SizedBox(height: S.x5),
          Row(children: [
            Expanded(child: AppProgress(n == 0 ? 0 : d / n, height: 8, color: courseAccent(course, c))),
            const SizedBox(width: S.x3),
            Text('$d/$n', style: AppType.footnote.copyWith(color: c.text, fontWeight: w8)),
          ]),
        ]),
      ),
    );
  }
}

// ------------------------------------------------------------ dars yo‘li / путь уроков
class _Path extends StatelessWidget {
  final Course course;
  const _Path({required this.course});

  @override
  Widget build(BuildContext context) {
    final s = AppScope.of(context);
    final c = s.c, st = s.st;
    final cur = s.nextLesson(course);
    const offsets = [0.0, 56.0, 112.0, 56.0];
    final items = <Widget>[];
    for (var i = 0; i < s.lessonsOf(course).length; i++) {
      final l = s.lessonsOf(course)[i];
      final done = st.isDone(l.id);
      final open = s.unlocked(course, i);
      final isCur = cur != null && cur.id == l.id;
      final sub = done
          ? s.t('completed')
          : isCur
              ? '${s.t('now')} · +${l.xp} XP'
              : open
                  ? '+${l.xp} XP'
                  : s.t('locked');
      items.add(Padding(
        padding: EdgeInsets.only(left: offsets[i % 4]),
        child: Pressable(
          key: ValueKey('lesson-${l.id}'),
          onTap: open ? () => openLesson(context, l.id) : null,
          scale: 0.97,
          child: Row(children: [
            _Node(index: i, done: done, current: isCur, open: open),
            const SizedBox(width: S.x4),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(s.tr(l.title),
                    style: AppType.headline.copyWith(color: open ? c.text : c.text3)),
                const SizedBox(height: 2),
                Text(sub,
                    style: AppType.footnote.copyWith(
                        color: isCur ? c.accentText : c.text2, fontWeight: isCur ? w8 : w6)),
              ]),
            ),
            if (open && !done)
              Icon(Icons.chevron_right_rounded, color: isCur ? c.accentText : c.text3),
          ]),
        ),
      ));
      if (i < s.lessonsOf(course).length - 1) {
        items.add(Padding(
          padding: EdgeInsets.only(left: (offsets[i % 4] + offsets[(i + 1) % 4]) / 2 + 33, top: 6, bottom: 6),
          child: Column(children: [
            for (var k = 0; k < 3; k++)
              Container(
                width: 5,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 2.5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: done ? c.accent.withAlpha(0x99) : c.hairlineStrong,
                ),
              ),
          ]),
        ));
      }
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: items);
  }
}

/// Dars tugunchasi / узел урока.
class _Node extends StatelessWidget {
  final int index;
  final bool done, current, open;
  const _Node({required this.index, required this.done, required this.current, required this.open});

  @override
  Widget build(BuildContext context) {
    final c = colorsOf(context);
    const size = 72.0;
    Widget face({required Gradient? gradient, Color? color, required Widget child, Color? lip, bool ring = false}) {
      return Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: gradient,
          color: color,
          border: Border.all(
            color: ring ? kWhite.withAlpha(c.isDark ? 0x40 : 0xCC) : (lip == null ? c.hairline : const Color(0x26FFFFFF)),
            width: ring ? 3 : 1,
          ),
          boxShadow: [
            if (lip != null) BoxShadow(color: lip, offset: const Offset(0, 5)),
            ...Shadows.soft(c),
          ],
        ),
        child: child,
      );
    }

    if (done) {
      return face(
        gradient: c.accentGradient,
        lip: Color.lerp(c.accent, kBlack, 0.35),
        child: const Icon(Icons.check_rounded, size: 32, color: kWhite),
      );
    }
    if (current) {
      return Breathing(
        builder: (t) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: c.yellow.withAlpha((0x40 + 0x50 * t).round()), blurRadius: 18 + 14 * t)],
          ),
          child: face(
            gradient: c.yellowGradient,
            lip: Color.lerp(c.yellow, kBlack, 0.3),
            ring: true,
            child: const Icon(Icons.play_arrow_rounded, size: 36, color: kWhite, shadows: kTextShadow),
          ),
        ),
      );
    }
    if (open) {
      return face(
        gradient: null,
        color: c.isDark ? c.elevated : c.surface,
        lip: c.isDark ? const Color(0xFF080B12) : const Color(0xFFD9E2EE),
        child: Text('${index + 1}', style: AppType.title2.copyWith(color: c.text)),
      );
    }
    return face(
      gradient: null,
      color: c.surfaceAlt,
      child: Icon(Icons.lock_rounded, size: 24, color: c.text3),
    );
  }
}

// ------------------------------------------------------------ xazina / сундук
class _Chest extends StatelessWidget {
  final Course course;
  const _Chest({required this.course});

  @override
  Widget build(BuildContext context) {
    final s = AppScope.of(context);
    final c = s.c;
    final d = s.progressOf(course), n = s.lessonsOf(course).length;
    final allDone = n > 0 && d == n;
    final opened = s.st.chests.contains(course.id);
    final ready = allDone && !opened;
    return AppCard(
      kind: ready ? CardKind.tinted : CardKind.solid,
      tint: ready ? c.yellowSoft : null,
      borderColor: ready ? c.yellow.withAlpha(0x66) : null,
      padding: const EdgeInsets.all(S.x4),
      child: Row(children: [
        IconTile(
          opened ? Icons.auto_awesome_rounded : Icons.redeem_rounded,
          size: 56,
          bg: ready || opened ? c.yellowSoft : c.surfaceAlt,
          color: ready || opened ? c.yellowText : c.text3,
        ),
        const SizedBox(width: S.x4),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(s.t('chest'), style: AppType.headline.copyWith(color: c.text)),
            const SizedBox(height: 2),
            Text(
              opened ? s.t('chest_done') : (allDone ? '+$kChestXp XP' : s.t('chest_locked')),
              style: AppType.footnote.copyWith(color: c.text2),
            ),
          ]),
        ),
        if (ready)
          AppButton(s.t('chest_open'),
              onPressed: () => s.chest(course), kind: BtnKind.success, height: 42, icon: Icons.bolt_rounded),
      ]),
    );
  }
}

// ------------------------------------------------------------ yakuniy imtihon / итоговый экзамен
String waitText(AppState s, Duration d) {
  final h = d.inHours, m = d.inMinutes % 60;
  return h > 0 ? '$h ${s.t('hours_short')} $m ${s.t('min_short')}' : '${m < 1 ? 1 : m} ${s.t('min_short')}';
}

void openExam(BuildContext context, Course co) {
  Navigator.of(context).push(AppRoute<void>(builder: (_) => LessonScreen.exam(examCourse: co.id)));
}

class ExamCard extends StatelessWidget {
  final Course course;
  const ExamCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final s = AppScope.of(context);
    final c = s.c;
    final cert = s.certs[course.id];
    final done = s.courseComplete(course);
    final wait = s.examWait(course);
    final ready = done && cert == null && wait == Duration.zero;

    if (ready) {
      return Container(
        key: const ValueKey('exam-card'),
        padding: const EdgeInsets.all(S.x5),
        decoration: BoxDecoration(
          borderRadius: R.all(R.xl),
          gradient: const LinearGradient(
              begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFFC94A), Color(0xFFFF9F0A)]),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Floaty(child: Icon(Icons.workspace_premium_rounded, color: kWhite, size: 44, shadows: kTextShadow)),
            const SizedBox(width: S.x3),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(s.t('exam_title'), style: AppType.title3.copyWith(color: kWhite)),
                const SizedBox(height: 2),
                Text(s.t('exam_ready_text').replaceAll('{q}', '$kExamSize').replaceAll('{n}', '$kExamPass'),
                    style: AppType.footnote.copyWith(color: kWhite.withAlpha(0xE6))),
              ]),
            ),
          ]),
          const SizedBox(height: S.x4),
          SizedBox(
            width: double.infinity,
            child: Pressable(
              key: const ValueKey('exam-open'),
              onTap: () => openExam(context, course),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: kWhite, borderRadius: R.all(R.pill)),
                child: Text(s.t('exam_start'), style: AppType.headline.copyWith(color: const Color(0xFFB86E00))),
              ),
            ),
          ),
        ]),
      );
    }

    final (IconData icon, String sub) = cert != null
        ? (Icons.workspace_premium_rounded, '${s.t('cert_got')} · ${cert.score}%')
        : !done
            ? (Icons.lock_rounded, s.t('exam_locked'))
            : (Icons.schedule_rounded, '${s.t('exam_retry_in')} ${waitText(s, wait)}');
    return Pressable(
      key: const ValueKey('exam-card'),
      onTap: cert != null ? () => openCertificate(context, cert) : null,
      scale: 0.98,
      child: AppCard(
        padding: const EdgeInsets.all(S.x4),
        child: Row(children: [
          IconTile(icon,
              size: 56,
              bg: cert != null ? c.yellowSoft : c.surfaceAlt,
              color: cert != null ? c.yellowText : c.text3),
          const SizedBox(width: S.x4),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(s.t(cert != null ? 'certificate' : 'exam_title'), style: AppType.headline.copyWith(color: c.text)),
              const SizedBox(height: 2),
              Text(sub, style: AppType.footnote.copyWith(color: c.text2)),
            ]),
          ),
          if (cert != null) Icon(Icons.chevron_right_rounded, color: c.text3),
        ]),
      ),
    );
  }
}
