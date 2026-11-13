// ============================================================================
//  IDROK Motion Lab — Flutter qatlami: fon, kiritish va chizish.
//  IDROK Motion Lab — слой Flutter: фон, ввод и отрисовка.
//
//  Hisob-kitob dvigateli: motion_lab_core.dart (sof Dart, sinovdan o‘tgan).
//  Bu fayl: (1) bitta global kiritish manbai (sichqoncha, barmoq, skroll),
//  (2) animatsiya qatlami [MotionLayer], (3) chizuvchi.
//  Движок расчётов: motion_lab_core.dart (чистый Dart, покрыт тестами).
//  Этот файл: (1) единый глобальный источник ввода (мышь, палец, скролл),
//  (2) анимационный слой [MotionLayer], (3) отрисовка.
//
//  Qoidalar / Правила:
//   • qatlam faqat bezak: IgnorePointer, kiritishni ushlamaydi / слой — только декор, ввод не перехватывает
//   • kadrda setState yo‘q: faqat CustomPaint qayta chiziladi / нет setState в кадре: перерисовывается только CustomPaint
//   • "harakatni kamaytirish", testMode yoki o‘chirilgan bo‘lsa — harakatsiz bitta kadr
//     при «уменьшении движения», testMode или выключении — один статичный кадр
//   • ekrandan chiqqan (TickerMode o‘chiq) qatlam hisoblamaydi / слой вне экрана (TickerMode выкл.) не считает
// ============================================================================

import 'dart:math' as math;

import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'motion_lab_core.dart';

export 'motion_lab_core.dart' show MotionLevel, MotionProfile, MotionTier, MotionField, MotionPointer, kAcademyNeural, pointerStrength;

// ---------------------------------------------------------------- kiritish / ввод
/// Ilova bo‘yicha bitta kuzatuvchi: har bir qatlam o‘z tinglovchisini qo‘shmaydi.
/// Один наблюдатель на всё приложение: слои не вешают свои слушатели.
/// Hech narsani ushlamaydi va hodisalarni o‘zgartirmaydi / ничего не перехватывает.
class MotionInput {
  MotionInput._();
  static final MotionInput instance = MotionInput._();

  final Stopwatch _clock = Stopwatch()..start();
  int _refs = 0;

  /// Oxirgi kursor/barmoq joyi (global koordinata) / последняя позиция курсора/пальца (глобальная).
  Offset? pointer;
  bool touch = false;
  double _lastMove = -100; // soniya / секунды

  double _scroll = 0, _scrollAt = 0;

  double get _now => _clock.elapsedMicroseconds / 1e6;

  /// Kursor oxirgi marta qachon qimirlagan (soniya oldin) / сколько секунд назад двигался курсор.
  double get secondsSinceMove => _now - _lastMove;

  /// Skroll tezligi: vaqt o‘tishi bilan so‘nadi (musbat — kontent yuqoriga).
  /// Скорость скролла: затухает со временем (+ — контент вверх).
  double get scrollVel => _scroll * math.exp(-4 * (_now - _scrollAt));

  void _addScroll(double v) {
    final cur = scrollVel;
    _scroll = (cur + v).clamp(-3000.0, 3000.0).toDouble();
    _scrollAt = _now;
  }

  void attach() {
    if (_refs++ == 0) GestureBinding.instance.pointerRouter.addGlobalRoute(_route);
  }

  void detach() {
    if (--_refs <= 0) {
      _refs = 0;
      GestureBinding.instance.pointerRouter.removeGlobalRoute(_route);
      pointer = null;
    }
  }

  void _route(PointerEvent e) {
    if (e is PointerScrollEvent) {
      _addScroll(e.scrollDelta.dy * 6); // g‘ildirak / колесо мыши
      return;
    }
    final isTouch = e.kind == PointerDeviceKind.touch || e.kind == PointerDeviceKind.stylus;
    if (e is PointerHoverEvent || e is PointerMoveEvent || e is PointerDownEvent) {
      pointer = e.position;
      touch = isTouch;
      _lastMove = _now;
      // Barmoq bilan surish — skroll o‘rniga / перетаскивание пальцем — прокси скролла
      if (e is PointerMoveEvent && isTouch) _addScroll(-e.delta.dy * 20);
    } else if (e is PointerUpEvent || e is PointerCancelEvent) {
      if (isTouch) pointer = null;
    } else if (e is PointerRemovedEvent) {
      pointer = null;
    }
  }
}

// ---------------------------------------------------------------- qatlam / слой
class MotionLayer extends StatefulWidget {
  final MotionProfile profile;
  final MotionLevel level;

  /// false — harakatsiz bitta kadr (sinov rejimi, foydalanuvchi o‘chirgan) / один статичный кадр.
  final bool animate;
  final Color dot, accent, link;

  /// Nuqta/chiziq shaffofligi koeffitsiyentlari (mavzuga qarab) / коэффициенты прозрачности (по теме).
  final double dotAlpha, linkGain;
  const MotionLayer({
    super.key,
    this.profile = kAcademyNeural,
    this.level = MotionLevel.normal,
    this.animate = true,
    required this.dot,
    required this.accent,
    required this.link,
    this.dotAlpha = 0.5,
    this.linkGain = 1,
  });

  @override
  State<MotionLayer> createState() => _MotionLayerState();
}

class _Repaint extends ChangeNotifier {
  void ping() => notifyListeners();
}

class _MotionLayerState extends State<MotionLayer> with SingleTickerProviderStateMixin {
  final _repaint = _Repaint();
  final _ptr = MotionPointer();
  MotionField? _field;
  Ticker? _ticker;
  Duration _last = Duration.zero;
  bool _reduced = false;
  bool _attached = false;

  @override
  void initState() {
    super.initState();
    _sync();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reduced = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    _sync();
  }

  @override
  void didUpdateWidget(MotionLayer old) {
    super.didUpdateWidget(old);
    if (old.level != widget.level || old.profile != widget.profile) _field = null;
    _sync();
  }

  bool get _running => widget.animate && !_reduced && widget.level != MotionLevel.off;

  void _sync() {
    if (_running) {
      if (!_attached) {
        MotionInput.instance.attach();
        _attached = true;
      }
      _ticker ??= createTicker(_onTick)..start();
    } else {
      _ticker?.dispose();
      _ticker = null;
      if (_attached) {
        MotionInput.instance.detach();
        _attached = false;
      }
    }
  }

  @override
  void dispose() {
    _ticker?.dispose();
    if (_attached) MotionInput.instance.detach();
    _repaint.dispose();
    super.dispose();
  }

  void _onTick(Duration elapsed) {
    final f = _field;
    if (f == null) return;
    final dt = (elapsed - _last).inMicroseconds / 1e6;
    _last = elapsed;
    final input = MotionInput.instance;
    final box = context.findRenderObject();
    final gp = input.pointer;
    if (gp != null && box is RenderBox && box.attached && box.hasSize) {
      final l = box.globalToLocal(gp);
      _ptr.x = l.dx;
      _ptr.y = l.dy;
      _ptr.touch = input.touch;
      _ptr.strength = input.touch ? 1 : pointerStrength(input.secondsSinceMove);
    } else {
      _ptr.x = null;
      _ptr.y = null;
    }
    _ptr.scrollVel = input.scrollVel;
    f.step(dt, _ptr);
    _repaint.ping();
  }

  MotionField? _ensure(Size size) {
    if (size.width < 2 || size.height < 2) return null;
    var f = _field;
    if (f == null) {
      f = MotionField(widget.profile, level: widget.level);
      _field = f;
    }
    f.resize(size.width, size.height, size.shortestSide < 600 ? MotionTier.phone : MotionTier.desktop);
    return f;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.level == MotionLevel.off) return const SizedBox.shrink();
    return LayoutBuilder(builder: (context, box) {
      final size = Size(box.maxWidth.isFinite ? box.maxWidth : 0, box.maxHeight.isFinite ? box.maxHeight : 0);
      final f = _ensure(size);
      if (f == null) return const SizedBox.shrink();
      return ExcludeSemantics(
        child: IgnorePointer(
          child: RepaintBoundary(
            child: CustomPaint(
              size: size,
              painter: _NeuralPainter(f, _repaint,
                  dot: widget.dot,
                  accent: widget.accent,
                  link: widget.link,
                  dotAlpha: widget.dotAlpha,
                  linkGain: widget.linkGain),
            ),
          ),
        ),
      );
    });
  }
}

// ---------------------------------------------------------------- chizish / отрисовка
class _NeuralPainter extends CustomPainter {
  final MotionField f;
  final Color dot, accent, link;
  final double dotAlpha, linkGain;
  static const _steps = 24;
  late final List<Color> _linkColors;
  late final List<Color> _dotColors;
  late final Color _accentColor, _halo;

  _NeuralPainter(this.f, Listenable repaint,
      {required this.dot, required this.accent, required this.link, required this.dotAlpha, required this.linkGain})
      : super(repaint: repaint) {
    final maxLink = f.profile.linkAlpha * linkGain;
    _linkColors = [for (var q = 0; q < _steps; q++) link.withAlpha((255 * maxLink * q / (_steps - 1)).round().clamp(0, 255))];
    _dotColors = [for (var l = 0; l < 3; l++) dot.withAlpha((255 * dotAlpha * f.profile.layerAlpha[l]).round().clamp(0, 255))];
    _accentColor = accent.withAlpha((255 * math.min(1, dotAlpha * 1.7)).round().clamp(0, 255));
    _halo = accent.withAlpha((255 * dotAlpha * 0.28).round().clamp(0, 255));
  }

  @override
  void paint(Canvas canvas, Size size) {
    final n = f.active;
    if (n == 0) return;

    // Ingichka ulanishlar / тонкие связи
    final lp = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..isAntiAlias = true;
    final maxLink = f.profile.linkAlpha;
    for (var k = 0; k < f.linkCount; k++) {
      final q = ((f.linkW[k] / maxLink) * (_steps - 1)).round().clamp(0, _steps - 1);
      lp.color = _linkColors[q];
      canvas.drawLine(Offset(f.px[f.linkA[k]], f.py[f.linkA[k]]), Offset(f.px[f.linkB[k]], f.py[f.linkB[k]]), lp);
    }

    // Tugunlar / узлы
    final dp = Paint()..isAntiAlias = true;
    for (var i = 0; i < n; i++) {
      final x = f.px[i], y = f.py[i];
      if (x < -8 || y < -8 || x > size.width + 8 || y > size.height + 8) continue;
      if (f.accent[i] == 1) {
        dp.color = _halo;
        canvas.drawCircle(Offset(x, y), f.radius[i] * 3.2, dp);
        dp.color = _accentColor;
      } else {
        dp.color = _dotColors[f.layer[i]];
      }
      canvas.drawCircle(Offset(x, y), f.radius[i], dp);
    }
  }

  @override
  bool shouldRepaint(_NeuralPainter old) =>
      old.f != f || old.dot != dot || old.accent != accent || old.link != link || old.dotAlpha != dotAlpha || old.linkGain != linkGain;
}
