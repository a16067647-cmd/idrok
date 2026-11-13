# Idrok Academy — handover guide for an AI coding assistant

Read this whole file before changing anything. It explains how the app is built, the rules you must follow,
and a list of small tasks you can safely do.

## 1. What the app is
Idrok Academy is a gamified coding-lessons app for school students in Uzbekistan (HTML, CSS, JavaScript,
Python, AI). The whole interface exists in **two languages: Uzbek (Latin) and Russian**. Brand colours are
the blue palette of the Idrok logo (see `app/lib/theme.dart`). The design is a premium, iOS-like style.

- `app/` — Flutter app (Dart 3, Flutter stable). Android + iOS.
- `server/` — Python server, standard library only (`server.py`, `progress.py`, `runner.py`).
- `.github/workflows/build.yml` — GitHub builds the APK and runs all tests on every push to `main`
  (and on manual runs for other branches).

## 2. Golden rules
1. **Never commit to `main` directly.** Work on a branch (for example `ai/<task-name>`), run the build on
   that branch, and only merge when the build is green.
2. **Every text the user sees must exist in both languages.** UI texts live in `app/lib/i18n.dart`
   (two maps: `'uz'` and `'ru'`, same keys in both). Lesson texts use `Tr('uzbek', 'russian')`.
3. **Do not change game rules in only one place.** XP, quests, streak and leagues exist twice and must
   match: `app/lib/progress.dart` (offline) and `server/progress.py` (online).
4. **Lesson ids and XP must match** between `app/lib/content/catalog.dart` and
   `server/content/lessons.json`. The shop list must be identical in `server/content/shop.json`
   and `app/assets/content/shop.json`. Tests check this.
5. **Keep tests green.** `flutter analyze` must show no errors and `flutter test` must pass.
   If you add a feature, add a test in `app/test/logic_test.dart` (logic) or `app/test/widget_test.dart`
   (screens).
6. **Never commit `.db` files, passwords or tokens.**
7. **Teachers' tests never give XP.** Teachers and admins cannot study (server returns 403 for game actions).
8. Use the design system — never hard-code new colours or font sizes:
   `AppScope.of(context).c` (colours), `AppType` (text styles), `S` (spacing), `R` (radii), widgets in
   `app/lib/widgets.dart` (`AppButton`, `AppCard`, `AppPill`, `AppTextField`, `Segmented`, `TabPage`, …).

## 3. Map of the code
| Area | File(s) |
|---|---|
| App start, intro video, routing (auth → profile → warm-up → reminder → home) | `app/lib/main.dart` |
| App state, server calls, saving | `app/lib/state.dart`, `app/lib/api.dart` |
| Texts (uz/ru) | `app/lib/i18n.dart` |
| Lesson model + question generator (`Gen`, `Q`, `LessonStep`) | `app/lib/content/model.dart` |
| Lessons | `app/lib/content/html.dart`, `css.dart`, `js.dart`, `python.dart`, `ai.dart` |
| Course list | `app/lib/content/catalog.dart` |
| Lesson animations (data) | `app/lib/content/anim.dart`, `app/lib/content/scenes.dart` |
| Lesson animations (drawing) | `app/lib/screens/anim_player.dart` |
| Warm-up / placement test | `app/lib/content/placement.dart` |
| Regions, districts, school names | `app/lib/content/regions.dart` |
| Portfolio projects | `app/lib/content/projects.dart`, `app/lib/screens/cards.dart` |
| Lesson / test screen (timers, protection, AI helper) | `app/lib/screens/lesson.dart`, `helper.dart` |
| Teacher tests, admin codes & orders | `app/lib/screens/teacher_tests.dart`, `admin.dart`, `teacher.dart` |
| Reminder screen | `app/lib/screens/reminder.dart`, `app/lib/reminders.dart` |
| Android/iOS setup (Do Not Disturb, notifications) | `app/tool/setup_platforms.py` |

### How a lesson is written
A lesson is a function `List<LessonStep> name(Gen g)`. Every attempt uses a new random seed, so questions
change each time. Use `g.from([Q(difficulty, (g) => ...), ...], count)` to pick questions, and
`g.quiz`, `g.quizCode`, `g.fill`, `g.order`, `g.tryIt` to build them. Difficulty 1 = easy, 3 = hard.
Look at an existing lesson in `python.dart` and copy its style exactly.

### How an animation is written
Add an entry to `kScenes` in `app/lib/content/scenes.dart` with the lesson id. Scene kinds:
`trace` (code runs line by line with variable boxes — use `Tracer`), `render` (HTML appears on a phone),
`box`, `flex`, `learn`, `chat`, `grid`. Copy an existing entry of the same kind.

## 4. How to check your work
1. Push your branch, then run the build: `gh workflow run build.yml --ref <your-branch>`.
2. Watch it: `gh run list --limit 1`.
3. Logs are pushed to the branches `ci-logs-android` and `ci-logs-ios`
   (`2-analyze.txt`, `3-test.txt`, `4-build-apk.txt`, screenshots in `shots/`).
4. Only merge into `main` when the run is green. Then the APK appears under the run's Artifacts.

## 5. Safe small tasks (do one at a time)
- Add 2–3 more quiz questions to a lesson (keep both languages, keep 3 wrong options, all different).
- Fix a typo in Uzbek or Russian text in `i18n.dart`.
- Add a new beginner AI lesson (next free id: `ai8`): copy `ai6` style, add it to `catalog.dart` **and**
  `server/content/lessons.json` with the same id, `xp: 20`, `leagues: ["beginner"]`, plus an animation in `scenes.dart`
  (the tests require exactly one animation per lesson). Advanced project lessons: next id `aiA5`; master: `aiM5` (`xp: 30`).
- Add a new chat animation for a lesson (copy an `ai*` entry in `scenes.dart`).
- Improve a theory text (`LessonStep.read`) to be simpler for a 12-year-old beginner.

## 6. Things NOT to do without the owner
- Changing prices in the shop, XP amounts, league rules or the teacher/admin permissions.
- Deleting lessons (students' progress uses lesson ids).
- Adding new packages to `pubspec.yaml` (they often break the Android/iOS build).
- Anything with the server's database structure.

## Final exams and certificates (v4)
- `app/lib/content/exam.dart`: `examQuestions()` builds 30 questions from the course lessons (no code runner needed); pass = 70%, retry after 24 h.
- Exam runs in `LessonScreen.exam(examCourse:)`: one answer per question, leaving the app cancels it and counts as an attempt.
- Server: `/api/exam/start`, `/api/exam/finish`, `GET /api/exams`, public check page `/c/<ID>` (tables `exams`, `certs`).
- Certificate PDF: `app/lib/screens/certificate.dart` (`pdf` + `printing` packages, fonts from app assets).

## IDROK Motion Lab — Academy "Neural Learning" (live background)
A calm network of small nodes and thin links behind selected screens. Built from the Motion Lab brief,
**Academy part only** (Business and Uzwork are separate and not touched).

**Files**
- `app/lib/motion_lab_core.dart` — pure Dart engine (no Flutter): seeded particles, 3 depth layers, soft pointer
  field with spring return, scroll drift, link search on a spatial grid (no per-frame allocation), automatic quality
  step-down on slow frames. `MotionProfile` / `kAcademyNeural` hold every tunable value (declarative).
- `app/lib/motion_lab.dart` — Flutter layer: `MotionInput` (one global pointer route for the whole app, never
  consumes events), `MotionLayer` (Ticker + `CustomPaint`, no `setState` per frame, `IgnorePointer`).
- `AppBackground(motion: MotionLevel.off|low|normal)` in `widgets.dart` — default is **off**; a screen opts in.
- Tests: `app/test/motion_lab_test.dart` (engine limits, determinism, pointer/scroll, quality floor, layer behaviour).

**Where it is on (rollout list)**: main student shell (home, courses, ranking, profile…), login/register screen,
lesson start and result screens (light). **Off**: during lesson questions and exams, teacher/admin screens, forms
(profile setup), legal pages, certificates, splash.

**How to tune or disable**
- Everything off for everyone: `kMotionLab = false` in `app/lib/config.dart`.
- Per user: Profile → Settings → "Jonli fon / Живой фон" (saved in preferences as `bgmotion`).
- Automatically static (one frame, no ticker) when the device asks for reduced motion, in `testMode`, or off.
- Look and feel: edit `kAcademyNeural` (counts, speeds, pointer radius/force, link distance/opacity, accent share).
  Colours come from the app theme (`AppColors`): `accent`/`accentHi`/`kSky`, never hard-coded.
- To add the field to another screen: `AppBackground(motion: MotionLevel.low)`. Do not add it to dense tables or forms.

**Limits and budgets**: ≤ 44 nodes on phones, ≤ 90 on desktop (counts by area), `low` level × 0.55, ≤ 3 links per node,
at most 3 quality levels (1 → 0.65 → 0.4). Frame gaps are clamped to 50 ms. Hidden/offstage routes are muted by `TickerMode`.

**Known limitations**: touch uses finger drags as a scroll proxy (no hover on phones); the device-tier guess is by
screen size, not GPU; no real-device frame-rate numbers yet — measure on a low-end Android before enabling more screens.
Optional future idea from the brief (topic-based network presets) is not built.
