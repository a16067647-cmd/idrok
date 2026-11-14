import 'dart:async';

import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config.dart';
import 'motion_lab.dart' show MotionLevel;
import 'screens/auth.dart';
import 'screens/cards.dart' show CardsTab;
import 'screens/courses.dart';
import 'screens/home.dart';
import 'screens/intro.dart';
import 'screens/lesson.dart';
import 'screens/play.dart';
import 'screens/profile.dart';
import 'screens/profile_form.dart';
import 'screens/ranking.dart';
import 'screens/reminder.dart';
import 'screens/shop.dart';
import 'screens/teacher.dart';
import 'screens/teacher_tests.dart';
import 'app_lock.dart';
import 'screens/admin.dart';
import 'screens/lessons_admin.dart';
import 'state.dart';
import 'theme.dart';
import 'widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final state = AppState();
  runApp(KodlaApp(state: state));
  state.init();
}

class KodlaApp extends StatefulWidget {
  final AppState state;
  const KodlaApp({super.key, required this.state});

  @override
  State<KodlaApp> createState() => _KodlaAppState();
}

class _KodlaAppState extends State<KodlaApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // Telefon mavzusi almashsa / при смене темы телефона
  @override
  void didChangePlatformBrightness() {
    widget.state.setPlatformBrightness(WidgetsBinding.instance.platformDispatcher.platformBrightness);
  }

  @override
  Widget build(BuildContext context) {
    return AppScope(
      state: widget.state,
      child: Builder(builder: (context) {
        final s = AppScope.of(context);
        return MaterialApp(
          title: kAppName,
          debugShowCheckedModeBanner: false,
          navigatorKey: s.navigatorKey,
          theme: buildTheme(kLight),
          darkTheme: buildTheme(kDark),
          themeMode: switch (s.theme) {
            'light' => ThemeMode.light,
            'dark' => ThemeMode.dark,
            _ => ThemeMode.system,
          },
          themeAnimationDuration: const Duration(milliseconds: 320),
          themeAnimationCurve: Motion.curve,
          home: const RootScreen(),
        );
      }),
    );
  }
}

/// Kirish yoki asosiy ekran / вход или главный экран.
class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppScope.of(context);
    final Widget screen;
    if (!s.introDone && !s.testMode) {
      screen = IntroVideo(key: const ValueKey('intro'), onDone: s.finishIntro);
    } else if (!s.ready) {
      screen = const SplashScreen(key: ValueKey('splash'));
    } else if (!s.online && (s.mode != 'offline' || !s.testMode)) {
      screen = const AuthScreen(key: ValueKey('auth'));
    } else if (s.needsProfile) {
      screen = const ProfileSetupScreen(key: ValueKey('setup'));
    } else if (s.needsPlacement) {
      screen = const LessonScreen.placement(key: ValueKey('placement'));
    } else if (s.needsReminder) {
      screen = const ReminderScreen(key: ValueKey('reminder'));
    } else {
      screen = const HomeShell(key: ValueKey('home'));
    }
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: (s.isDark || !s.introDone ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark)
          .copyWith(statusBarColor: Colors.transparent, systemNavigationBarColor: Colors.transparent),
      child: AnimatedSwitcher(
        duration: Motion.of(context, const Duration(milliseconds: 600)),
        switchInCurve: Motion.curve,
        switchOutCurve: Curves.easeInCubic,
        child: screen,
      ),
    );
  }
}

/// Ochilish ekrani / заставка.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = colorsOf(context);
    return Scaffold(
      backgroundColor: c.bg,
      body: AppBackground(
        strong: true,
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const AppLogo(size: 96),
            const SizedBox(height: S.x5),
            Text(kAppName, style: AppType.title1.copyWith(color: c.text)),
            const SizedBox(height: S.x6),
            CupertinoActivityIndicator(color: c.text2, radius: 11),
            const _WakeHint(),
          ]),
        ),
      ),
    );
  }
}

/// Yuklanish cho‘zilsa (server uxlagan), 5 soniyadan keyin izoh chiqadi.
/// Если загрузка затянулась (сервер спал), через 5 секунд появляется подсказка.
class _WakeHint extends StatefulWidget {
  const _WakeHint();

  @override
  State<_WakeHint> createState() => _WakeHintState();
}

class _WakeHintState extends State<_WakeHint> {
  Timer? _t;
  bool _show = false;

  @override
  void initState() {
    super.initState();
    _t = Timer(const Duration(seconds: 5), () {
      if (mounted) setState(() => _show = true);
    });
  }

  @override
  void dispose() {
    _t?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = AppScope.of(context);
    return AnimatedOpacity(
      opacity: _show ? 1 : 0,
      duration: Motion.of(context, Motion.slow),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(S.x6, S.x4, S.x6, 0),
        child: Text(s.t('waking'), textAlign: TextAlign.center, style: AppType.footnote.copyWith(color: s.c.text2)),
      ),
    );
  }
}

/// Ilova logotipi (ikonka rasmi) / логотип приложения.
class AppLogo extends StatelessWidget {
  final double size;
  const AppLogo({super.key, this.size = 88});

  @override
  Widget build(BuildContext context) {
    final c = colorsOf(context);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.235),
        boxShadow: Shadows.glow(c.accent, c, strength: 0.8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size * 0.235),
        child: Image.asset('assets/icon/icon.png', fit: BoxFit.cover, filterQuality: FilterQuality.medium),
      ),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) AppLock.check(context);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) AppLock.check(context);
    // Ertasi kuni ochilsa — kunlik vazifalar yangilanadi.
    // Если приложение открыли на следующий день — обновляем задания дня.
    if (state == AppLifecycleState.resumed) {
      AppScope.read(context).refreshDay();
      _showNotice();
    }
  }

  /// Test bekor qilingani haqida xabar / сообщение об отменённом тесте.
  void _showNotice() {
    final s = AppScope.read(context);
    if (s.pendingNotice.isEmpty) return;
    final text = s.pendingNotice;
    s.pendingNotice = '';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final c = s.c;
      showAppSheet<void>(context, builder: (ctx) {
        return Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Center(child: IconTile(Icons.block_rounded, size: 60, circle: true, bg: c.dangerSoft, color: c.danger)),
          const SizedBox(height: S.x4),
          Text(s.t('test_cancelled_title'), textAlign: TextAlign.center, style: AppType.title3.copyWith(color: c.text)),
          const SizedBox(height: S.x2),
          Text(text, textAlign: TextAlign.center, style: AppType.subhead.copyWith(color: c.text2)),
          const SizedBox(height: S.x5),
          AppButton(s.t('ok'), key: const ValueKey('notice-ok'), expand: true, onPressed: () => Navigator.of(ctx).pop()),
        ]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = AppScope.of(context);
    final tabs = s.tabs;
    final wide = isWide(context);
    const deskExtra = ['play', 'cards', 'shop'];
    final tab = tabs.contains(s.tab) || (wide && !s.isStaff && deskExtra.contains(s.tab)) ? s.tab : tabs.first;
    s.pageBuilder ??= (id) => switch (id) {
          'courses' => const CoursesTab(),
          'play' => const PlayTab(),
          'shop' => const ShopTab(),
          _ => const HomeTab(),
        };

    final Widget body = switch (tab) {
      'courses' => const CoursesTab(),
      'play' => const PlayTab(),
      'ranking' => const RankingTab(),
      'teacher' => const TeacherTab(),
      'profile' => const ProfileTab(),
      'shop' => const ShopTab(),
      'tests' => const TeacherTestsTab(),
      'admin' => const AdminCodesTab(),
      'orders' => const AdminOrdersTab(),
      'dash' => const AdminDashTab(),
      'lessons' => const LessonsTab(),
      'cards' => const CardsTab(),
      _ => const HomeTab(),
    };

    final meta = <String, (IconData, String)>{
      'home': (Icons.school_rounded, s.t('learn_tab')),
      'courses': (Icons.map_rounded, s.t('courses')),
      'play': (Icons.terminal_rounded, s.t('play')),
      'ranking': (Icons.leaderboard_rounded, s.t('ranking')),
      'profile': (Icons.person_rounded, s.t('me_tab')),
      'teacher': (Icons.groups_rounded, s.t(s.isAdmin ? 'students_tab' : 'my_school')),
      'tests': (Icons.assignment_rounded, s.t('tests_tab')),
      'admin': (Icons.key_rounded, s.t('codes_tab')),
      'orders': (Icons.redeem_rounded, s.t('orders_tab')),
      'dash': (Icons.space_dashboard_rounded, s.t('dash_tab')),
      'lessons': (Icons.menu_book_rounded, s.t('les_tab')),
    };
    final sel = tabs.contains(tab) ? tabs.indexOf(tab) : tabs.length - 1;

    final switcher = AnimatedSwitcher(
      duration: Motion.of(context, Motion.base),
      switchInCurve: Motion.curve,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, anim) => FadeTransition(
        opacity: anim,
        child: SlideTransition(
          position: Tween(begin: const Offset(0, 0.012), end: Offset.zero).animate(anim),
          child: child,
        ),
      ),
      layoutBuilder: (current, previous) => Stack(
        alignment: Alignment.topCenter,
        children: [...previous, if (current != null) current],
      ),
      child: KeyedSubtree(key: ValueKey('$tab-${s.lang}'), child: body),
    );
    final navItems = [for (final k in tabs) (k, meta[k]!.$1, meta[k]!.$2)];
    void onNav(int i) {
      FocusManager.instance.primaryFocus?.unfocus();
      s.go(tabs[i]);
    }

    return PopScope(
      canPop: tab == tabs.first,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) s.go(tabs.first);
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          extendBody: true,
          backgroundColor: s.c.bg,
          // Jonli fon: o‘quvchilar uchun; ustoz/admin jadvallarida o‘chiq / живой фон: для учеников; у учителя/админа — выкл.
          body: AppBackground(
            motion: s.isStaff ? MotionLevel.off : MotionLevel.normal,
            child: SafeArea(
              bottom: false,
              child: wide
                  // Kompyuter: yon menyu + keng maydon / компьютер: боковое меню + широкая область
                  ? Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                      _DeskNav(tabs: tabs, tab: tab, meta: meta),
                      Expanded(child: switcher),
                    ])
                  : Align(
                      alignment: Alignment.topCenter,
                      child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 640), child: switcher),
                    ),
            ),
          ),
          bottomNavigationBar: wide ? null : FloatingNavBar(items: navItems, index: sel, onTap: onNav),
        ),
      ),
    );
  }
}

/// Kompyuter yon menyusi: yig‘iladi / ochiladi bir bosishda.
/// Боковое меню компьютера: сворачивается / открывается одним нажатием.
class _DeskNav extends StatelessWidget {
  final List<String> tabs;
  final String tab;
  final Map<String, (IconData, String)> meta;
  const _DeskNav({required this.tabs, required this.tab, required this.meta});

  @override
  Widget build(BuildContext context) {
    final s = AppScope.of(context);
    final c = s.c;
    final open = s.sideOpen;
    void go(String id) {
      FocusManager.instance.primaryFocus?.unfocus();
      s.openSide(id);
    }

    Widget item(String id, IconData icon, String label) => Padding(
          padding: const EdgeInsets.only(bottom: S.x1),
          child: SideItem(
            key: ValueKey('side-$id'),
            icon: icon,
            label: label,
            selected: tab == id,
            collapsed: !open,
            onTap: () => go(id),
          ),
        );
    Widget label(String text) => open
        ? Padding(
            padding: const EdgeInsets.fromLTRB(S.x3, S.x4, S.x3, S.x2),
            child: Text(text.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.clip,
                softWrap: false,
                style: AppType.caption.copyWith(color: c.text3, fontWeight: w7, letterSpacing: 0.8)),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: S.x3, horizontal: S.x3),
            child: Container(height: 1, color: c.hairline),
          );

    final main = [for (final k in tabs) if (k != 'profile') k];
    final themeIcon = switch (s.theme) {
      'light' => Icons.light_mode_rounded,
      'dark' => Icons.dark_mode_rounded,
      _ => Icons.brightness_auto_rounded,
    };
    void nextTheme() => s.setTheme(switch (s.theme) { 'system' => 'light', 'light' => 'dark', _ => 'system' });

    return AnimatedContainer(
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutCubic,
      width: open ? 256 : 84,
      margin: const EdgeInsets.all(S.x4),
      // Shisha (iOS) / стекло (iOS)
      child: Glass(
        radius: R.xxl,
        blur: 30,
        padding: const EdgeInsets.symmetric(horizontal: S.x3, vertical: S.x4),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        // Logotip va yig‘ish tugmasi / логотип и кнопка сворачивания
        SizedBox(
          height: 44,
          child: open
              ? Row(children: [
                  const SizedBox(width: S.x1),
                  const AppLogo(size: 38),
                  const SizedBox(width: S.x3),
                  Expanded(
                    child: Text(kAppName,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        softWrap: false,
                        style: AppType.headline.copyWith(color: c.text, fontWeight: w8)),
                  ),
                  _NavIconBtn(
                      key: const ValueKey('side-toggle'),
                      icon: Icons.keyboard_double_arrow_left_rounded,
                      tip: s.t('side_hide'),
                      onTap: s.toggleSide),
                ])
              : Center(
                  child: _NavIconBtn(
                      key: const ValueKey('side-toggle'),
                      icon: Icons.menu_rounded,
                      tip: s.t('side_show'),
                      onTap: s.toggleSide),
                ),
        ),
        const SizedBox(height: S.x3),
        Expanded(
          child: ListView(padding: EdgeInsets.zero, children: [
            for (final k in main) item(k, meta[k]!.$1, meta[k]!.$2),
            if (!s.isStaff) ...[
              label(s.t('side_tools')),
              item('play', Icons.terminal_rounded, s.t('play')),
              item('cards', Icons.bookmarks_rounded, s.t('my_cards')),
              item('shop', Icons.storefront_rounded, s.t('shop_title')),
            ],
            label(s.t('settings')),
            Padding(
              padding: const EdgeInsets.only(bottom: S.x1),
              child: SideItem(
                key: const ValueKey('side-lang'),
                icon: Icons.translate_rounded,
                label: s.t('language'),
                collapsed: !open,
                onTap: s.toggleLang,
                trailing: _Chip(s.lang == 'uz' ? 'UZ' : 'RU'),
              ),
            ),
            SideItem(
              key: const ValueKey('side-theme'),
              icon: themeIcon,
              label: s.t('appearance'),
              collapsed: !open,
              onTap: nextTheme,
              trailing: _Chip(s.t(s.theme)),
            ),
          ]),
        ),
        const SizedBox(height: S.x3),
        _ProfileCard(selected: tab == 'profile', collapsed: !open, onTap: () => go('profile')),
        ]),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String text;
  const _Chip(this.text);

  @override
  Widget build(BuildContext context) {
    final c = colorsOf(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: S.x2, vertical: 3),
      decoration: BoxDecoration(color: c.accentSoft, borderRadius: R.all(R.sm)),
      child: Text(text, style: AppType.caption.copyWith(color: c.accentText, fontWeight: w7)),
    );
  }
}

class _NavIconBtn extends StatelessWidget {
  final IconData icon;
  final String tip;
  final VoidCallback onTap;
  const _NavIconBtn({super.key, required this.icon, required this.tip, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = colorsOf(context);
    return Tooltip(
      message: tip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Pressable(
          onTap: onTap,
          semanticLabel: tip,
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
                color: c.glass, borderRadius: R.all(R.md), border: Border.all(color: c.glassEdge)),
            foregroundDecoration: BoxDecoration(gradient: kGloss, borderRadius: R.all(R.md)),
            child: Icon(icon, size: 22, color: c.text2),
          ),
        ),
      ),
    );
  }
}

/// Pastdagi profil kartasi (iOS uslubida) / карточка профиля внизу (в стиле iOS).
class _ProfileCard extends StatelessWidget {
  final bool selected;
  final bool collapsed;
  final VoidCallback onTap;
  const _ProfileCard({required this.selected, required this.collapsed, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final s = AppScope.of(context);
    final c = s.c;
    final name = s.displayName.trim().isEmpty ? s.username : s.displayName.trim();
    final photo = s.myPhoto;
    final initial = name.isEmpty ? 'I' : name.characters.first.toUpperCase();
    final avatar = Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: photo == null ? c.accentGradient : null,
        border: Border.all(color: selected ? Colors.white : c.surface, width: 2),
      ),
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      child: photo != null && photo.isNotEmpty
          ? Image.memory(photo, fit: BoxFit.cover, width: 40, height: 40)
          : Text(initial, style: AppType.headline.copyWith(color: Colors.white)),
    );
    final sub = s.isStaff ? s.t(s.isAdmin ? 'role_admin' : 'role_teacher') : '${s.st.xp} XP · ${s.leagueName}';
    return Tooltip(
      message: collapsed ? s.t('me_tab') : '',
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Pressable(
          key: const ValueKey('side-profile'),
          onTap: onTap,
          scale: 0.98,
          semanticLabel: s.t('me_tab'),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: EdgeInsets.all(collapsed ? S.x1 : S.x2),
            decoration: BoxDecoration(
              gradient: selected ? c.accentGradient : null,
              color: selected ? null : c.glass,
              borderRadius: R.all(R.lg),
              border: Border.all(color: selected ? const Color(0x55FFFFFF) : c.glassEdge),
              boxShadow: selected ? Shadows.glow(c.accent, c, strength: 0.6) : null,
            ),
            foregroundDecoration: BoxDecoration(gradient: kGloss, borderRadius: R.all(R.lg)),
            child: collapsed
                ? Center(child: avatar)
                : Row(children: [
                    avatar,
                    const SizedBox(width: S.x3),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(name.isEmpty ? kAppName : name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppType.subhead.copyWith(color: selected ? Colors.white : c.text, fontWeight: w7)),
                        Text(sub,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppType.caption.copyWith(color: selected ? Colors.white70 : c.text2)),
                      ]),
                    ),
                    Icon(Icons.chevron_right_rounded, color: selected ? Colors.white : c.text3),
                  ]),
          ),
        ),
      ),
    );
  }
}
