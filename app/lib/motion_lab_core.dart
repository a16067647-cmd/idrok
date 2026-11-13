// ============================================================================
//  IDROK Motion Lab — yadro (faqat Dart, Flutter'siz): zarrachalar tarmog‘i.
//  IDROK Motion Lab — ядро (чистый Dart, без Flutter): сеть частиц.
//
//  Academy uchun "Neural Learning" (asabiy bilim tarmog‘i): mayda tugunlar va
//  ingichka chiziqlar. Dvigatel umumiy, ko‘rinish esa [MotionProfile] orqali beriladi.
//  Для Academy — «Neural Learning»: мелкие узлы и тонкие линии. Движок общий,
//  внешний вид задаётся через [MotionProfile].
//
//  Xususiyatlar / Особенности:
//   • barqaror vaqt qadami, chegaralangan kuchlar / стабильный шаг, ограниченные силы
//   • sichqoncha maydoni (yumshoq itarish) + prujinali qaytish / поле курсора + возврат пружиной
//   • skroll tezligi → sekin siljish va ulanish masofasi / скорость скролла → дрейф и дальность связей
//   • 3 chuqurlik qatlami / 3 слоя глубины
//   • fazoviy to‘r (grid) bilan qo‘shnilarni qidirish, kadrda xotira ajratilmaydi
//     сетка для поиска соседей, без аллокаций в кадре
//   • sifatni avtomatik pasaytirish / автоматическое снижение качества
// ============================================================================

import 'dart:math' as math;
import 'dart:typed_data';

/// Qurilma darajasi / класс устройства.
enum MotionTier { phone, desktop }

/// Ko‘rinish darajasi: o‘chirilgan / yengil / oddiy.
/// Уровень: выключено / лёгкий / обычный.
enum MotionLevel { off, low, normal }

/// Mahsulot sozlamasi (deklarativ). Dvigatelni o‘zgartirmasdan sozlanadi.
/// Настройка продукта (декларативная). Меняется без правки движка.
class MotionProfile {
  final String id;
  final String name;

  /// Zarrachalar byudjeti / бюджет частиц.
  final int minCount, maxPhone, maxDesktop;
  final double areaPerParticle; // px² bitta zarracha uchun / px² на частицу

  /// O‘lcham (radius, px) va 3 qatlam: [uzoq, o‘rta, yaqin].
  final double sizeMin, sizeMax;
  final List<double> layerSpeed, layerSize, layerAlpha;

  /// Tinch harakat / спокойное движение.
  final double baseSpeed; // px/s
  final double wander; // px — organik chayqalish / органичное покачивание

  /// Pruzhina (qaytish) va so‘nish / пружина (возврат) и затухание.
  final double spring, damping;

  /// Sichqoncha maydoni / поле курсора.
  final double pointerRadius, pointerForce, maxDisp;
  final double touchScale;

  /// Skroll ta’siri / влияние скролла.
  final double scrollDrift, scrollMaxDrift, scrollLinkBoost;

  /// Ulanishlar / связи.
  final double linkDist, linkAlpha;
  final int maxLinks;

  /// Ko‘proq ko‘rinadigan "aksent" tugunlar ulushi / доля «акцентных» узлов.
  final double accentShare;

  const MotionProfile({
    required this.id,
    required this.name,
    this.minCount = 16,
    this.maxPhone = 44,
    this.maxDesktop = 90,
    this.areaPerParticle = 9000,
    this.sizeMin = 1.0,
    this.sizeMax = 2.2,
    this.layerSpeed = const [0.55, 0.85, 1.2],
    this.layerSize = const [0.75, 1.0, 1.3],
    this.layerAlpha = const [0.45, 0.7, 1.0],
    this.baseSpeed = 9,
    this.wander = 14,
    this.spring = 5.5,
    this.damping = 3.6,
    this.pointerRadius = 150,
    this.pointerForce = 900,
    this.maxDisp = 70,
    this.touchScale = 0.6,
    this.scrollDrift = 0.08,
    this.scrollMaxDrift = 90,
    this.scrollLinkBoost = 0.25,
    this.linkDist = 118,
    this.linkAlpha = 0.30,
    this.maxLinks = 3,
    this.accentShare = 0.1,
  });
}

/// IDROK Academy — NEURAL LEARNING: bilim tarmog‘i, jonli va tinch.
/// IDROK Academy — NEURAL LEARNING: живая и спокойная сеть знаний.
const MotionProfile kAcademyNeural = MotionProfile(id: 'academy', name: 'Neural Learning');

/// Kirish: sichqoncha/barmoq va skroll (maydon koordinatalarida).
/// Ввод: курсор/палец и скролл (в координатах поля).
class MotionPointer {
  /// null — kursor yo‘q / нет курсора.
  double? x, y;
  bool touch = false;

  /// 0..1 — ta’sir kuchi (kursor harakatsiz qolsa pasayadi) / сила влияния.
  double strength = 1;

  /// Skroll tezligi (musbat — kontent yuqoriga) / скорость скролла (+ контент вверх).
  double scrollVel = 0;
}

/// Zarrachalar maydoni / поле частиц.
class MotionField {
  final MotionProfile profile;
  final int seed;
  final MotionLevel level;
  final double _margin;

  double width = 0, height = 0;
  int capacity = 0; // ajratilgan / выделено
  int active = 0; // hozir ishlayotgan / сейчас работает
  double _time = 0;

  // Zarracha ma’lumotlari (massivlar — qayta ishlatiladi) / данные частиц (массивы переиспользуются).
  late Float32List bx, by, bvx, bvy; // asosiy joy va tezlik / база и скорость
  late Float32List dx, dy, dvx, dvy; // pointer siljishi / смещение от курсора
  late Float32List ph1, ph2, wf; // organik chayqalish fazasi / фазы покачивания
  late Float32List radius;
  late Uint8List layer;
  late Uint8List accent;

  /// Chiqish: ko‘rinadigan joylar / вывод: видимые позиции.
  late Float32List px, py;

  // Ulanishlar / связи.
  late Int32List linkA, linkB;
  late Float32List linkW;
  int linkCount = 0;
  late Uint8List _deg;
  late Int32List _head, _next;
  int _cols = 1, _rows = 1;

  // Sifatni moslash / адаптация качества.
  double quality = 1; // 1 → 0.65 → 0.4
  double _ema = 1 / 60;
  int _slowFrames = 0;
  double _sinceDrop = 99;

  MotionField(this.profile, {this.seed = 7, this.level = MotionLevel.normal})
      : _margin = profile.wander + profile.maxDisp + 16;

  /// Zarrachalar soni (maydon o‘lchami va qurilma bo‘yicha) / число частиц.
  static int countFor(MotionProfile p, double w, double h, MotionTier tier, MotionLevel level) {
    if (level == MotionLevel.off || w <= 0 || h <= 0) return 0;
    final m = p.wander + p.maxDisp + 16;
    final raw = ((w + 2 * m) * (h + 2 * m) / p.areaPerParticle);
    final cap = tier == MotionTier.phone ? p.maxPhone : p.maxDesktop;
    var n = raw.clamp(p.minCount.toDouble(), cap.toDouble());
    if (level == MotionLevel.low) n *= 0.55;
    return n.round();
  }

  /// O‘lchamga moslashtirish. Zarrachalar qayta yaratiladi (faqat o‘lcham sezilarli o‘zgarganda).
  /// Подгонка под размер. Частицы пересоздаются только при заметной смене размера.
  void resize(double w, double h, MotionTier tier) {
    if ((w - width).abs() < 1 && (h - height).abs() < 1 && capacity > 0) return;
    final oldW = width, oldH = height;
    width = w;
    height = h;
    _prepareGrid();
    final n = countFor(profile, w, h, tier, level);
    if (n == capacity && capacity > 0 && oldW > 0) {
      // Sonni saqlab, joylarni yangi o‘lchamga cho‘zamiz / сохраняем число, масштабируем позиции.
      final sx = w / oldW, sy = h / oldH;
      for (var i = 0; i < capacity; i++) {
        bx[i] *= sx;
        by[i] *= sy;
      }
    } else {
      _spawn(n);
    }
  }

  void _spawn(int n) {
    capacity = n;
    active = n;
    bx = Float32List(n);
    by = Float32List(n);
    bvx = Float32List(n);
    bvy = Float32List(n);
    dx = Float32List(n);
    dy = Float32List(n);
    dvx = Float32List(n);
    dvy = Float32List(n);
    ph1 = Float32List(n);
    ph2 = Float32List(n);
    wf = Float32List(n);
    radius = Float32List(n);
    layer = Uint8List(n);
    accent = Uint8List(n);
    px = Float32List(n);
    py = Float32List(n);
    _deg = Uint8List(n);
    _next = Int32List(n);
    final cap = n * profile.maxLinks;
    linkA = Int32List(cap);
    linkB = Int32List(cap);
    linkW = Float32List(cap);
    linkCount = 0;

    final r = math.Random(seed); // aniq (seed) — har safar bir xil joylashuv / детерминированно
    final m = _margin;
    for (var i = 0; i < n; i++) {
      bx[i] = (r.nextDouble() * (width + 2 * m) - m).toDouble();
      by[i] = (r.nextDouble() * (height + 2 * m) - m).toDouble();
      final a = r.nextDouble() * math.pi * 2;
      final sp = profile.baseSpeed * (0.4 + r.nextDouble() * 0.9);
      bvx[i] = math.cos(a) * sp;
      bvy[i] = math.sin(a) * sp;
      ph1[i] = r.nextDouble() * math.pi * 2;
      ph2[i] = r.nextDouble() * math.pi * 2;
      wf[i] = 0.18 + r.nextDouble() * 0.22;
      // Uzoq qatlam ko‘proq, yaqin kamroq / дальних больше, ближних меньше
      final lr = r.nextDouble();
      layer[i] = lr < 0.45 ? 0 : (lr < 0.80 ? 1 : 2);
      accent[i] = r.nextDouble() < profile.accentShare ? 1 : 0;
      radius[i] = (profile.sizeMin + r.nextDouble() * (profile.sizeMax - profile.sizeMin)) * profile.layerSize[layer[i]] *
          (accent[i] == 1 ? 1.35 : 1.0);
    }
    step(0, null); // boshlang‘ich ko‘rinadigan joylar / начальные видимые позиции
  }

  void _prepareGrid() {
    final cell = profile.linkDist * (1 + profile.scrollLinkBoost);
    _cols = math.max(1, (width / cell).ceil() + 1);
    _rows = math.max(1, (height / cell).ceil() + 1);
    _head = Int32List(_cols * _rows);
  }

  /// Bitta qadam. [dt] soniya (0.05 dan oshmaydi). [input] — sichqoncha/skroll.
  void step(double dt, MotionPointer? input) {
    if (capacity == 0) return;
    dt = dt.clamp(0.0, 0.05).toDouble();
    _time += dt;
    _adaptQuality(dt);

    final p = profile;
    final m = _margin;
    final lowLevel = level == MotionLevel.low;
    final scroll = input?.scrollVel ?? 0;
    final drift = (-scroll * p.scrollDrift).clamp(-p.scrollMaxDrift, p.scrollMaxDrift).toDouble();
    final boost = 1 + p.scrollLinkBoost * (scroll.abs() / 1500).clamp(0.0, 1.0);

    // Sichqoncha maydoni / поле курсора.
    final inp = input;
    final hasPtr = inp != null && inp.x != null && inp.y != null && inp.strength > 0.01;
    final ptrX = hasPtr ? inp.x! : 0.0, ptrY = hasPtr ? inp.y! : 0.0;
    final touch = hasPtr && inp.touch;
    final scale = hasPtr ? (touch ? p.touchScale : 1.0) * inp.strength * (lowLevel ? 0.6 : 1.0) : 0.0;
    final radius0 = p.pointerRadius * (touch ? 0.8 : 1.0);
    final r2 = radius0 * radius0;

    final n = active;
    for (var i = 0; i < n; i++) {
      final ly = layer[i];
      final sp = p.layerSpeed[ly];

      // Asosiy harakat + skroll siljishi / базовое движение + дрейф от скролла
      var x = bx[i] + bvx[i] * sp * dt;
      var y = by[i] + (bvy[i] + drift) * sp * dt;
      // Chetdan o‘tsa — ko‘rinmaydigan zonada narigi tomonga / за краем — на другую сторону (вне видимости)
      final lo = -m, hiX = width + m, hiY = height + m;
      if (x < lo) {
        x += width + 2 * m;
      } else if (x > hiX) {
        x -= width + 2 * m;
      }
      if (y < lo) {
        y += height + 2 * m;
      } else if (y > hiY) {
        y -= height + 2 * m;
      }
      bx[i] = x;
      by[i] = y;

      // Organik chayqalish / органичное покачивание
      final w = p.wander * (0.5 + 0.25 * ly);
      final ox = math.sin(_time * wf[i] * 2.2 + ph1[i]) * w;
      final oy = math.cos(_time * wf[i] * 1.9 + ph2[i]) * w;

      var vx = dvx[i], vy = dvy[i];
      var ddx = dx[i], ddy = dy[i];

      // Kursor: yumshoq itarish, yaqin qatlamda kuchliroq (parallaks)
      // Курсор: мягкое отталкивание, сильнее на ближнем слое (параллакс)
      if (scale > 0) {
        final vxp = x + ox + ddx - ptrX, vyp = y + oy + ddy - ptrY;
        final d2 = vxp * vxp + vyp * vyp;
        if (d2 < r2 && d2 > 0.0001) {
          final d = math.sqrt(d2);
          final f = (1 - d / radius0);
          final k = f * f * p.pointerForce * scale * (0.55 + 0.3 * ly);
          vx += vxp / d * k * dt;
          vy += vyp / d * k * dt;
        }
      }

      // Prujina va so‘nish (barqaror, yarim-yashirin Eyler) / пружина и затухание
      vx += (-p.spring * ddx - p.damping * vx) * dt;
      vy += (-p.spring * ddy - p.damping * vy) * dt;
      ddx += vx * dt;
      ddy += vy * dt;
      final mag2 = ddx * ddx + ddy * ddy;
      if (mag2 > p.maxDisp * p.maxDisp) {
        final s = p.maxDisp / math.sqrt(mag2);
        ddx *= s;
        ddy *= s;
        vx *= 0.5;
        vy *= 0.5;
      }
      dvx[i] = vx;
      dvy[i] = vy;
      dx[i] = ddx;
      dy[i] = ddy;
      px[i] = x + ox + ddx;
      py[i] = y + oy + ddy;
    }
    _buildLinks(boost);
  }

  void _buildLinks(double boost) {
    linkCount = 0;
    final p = profile;
    final n = active;
    if (n < 2 || quality < 0.3) return;
    final maxLinks = quality < 0.5 ? math.max(1, p.maxLinks - 1) : p.maxLinks;
    final dist = p.linkDist * boost;
    final dist2 = dist * dist;
    final cell = p.linkDist * (1 + p.scrollLinkBoost);

    _head.fillRange(0, _head.length, -1);
    _deg.fillRange(0, n, 0);
    const pad = 12.0;
    for (var i = 0; i < n; i++) {
      final x = px[i], y = py[i];
      if (x < -pad || y < -pad || x > width + pad || y > height + pad) continue; // ko‘rinmaydigan — ulanmaydi
      final cx = (x / cell).floor().clamp(0, _cols - 1);
      final cy = (y / cell).floor().clamp(0, _rows - 1);
      final ci = cy * _cols + cx;
      _next[i] = _head[ci];
      _head[ci] = i;
    }
    final cap = linkA.length;
    for (var i = 0; i < n && linkCount < cap; i++) {
      final x = px[i], y = py[i];
      if (x < -pad || y < -pad || x > width + pad || y > height + pad) continue;
      if (_deg[i] >= maxLinks) continue;
      final cx = (x / cell).floor().clamp(0, _cols - 1);
      final cy = (y / cell).floor().clamp(0, _rows - 1);
      for (var oy = -1; oy <= 1; oy++) {
        final ny = cy + oy;
        if (ny < 0 || ny >= _rows) continue;
        for (var ox = -1; ox <= 1; ox++) {
          final nx = cx + ox;
          if (nx < 0 || nx >= _cols) continue;
          var j = _head[ny * _cols + nx];
          while (j != -1) {
            if (j > i && _deg[j] < maxLinks && (layer[i] - layer[j]).abs() <= 1) {
              final ddx = px[j] - x, ddy = py[j] - y;
              final d2 = ddx * ddx + ddy * ddy;
              if (d2 < dist2) {
                final t = 1 - math.sqrt(d2) / dist;
                final a = p.linkAlpha * math.pow(t, 1.4) * math.min(p.layerAlpha[layer[i]], p.layerAlpha[layer[j]]);
                if (linkCount < cap && a > 0.01) {
                  linkA[linkCount] = i;
                  linkB[linkCount] = j;
                  linkW[linkCount] = a.toDouble();
                  linkCount++;
                  _deg[i]++;
                  _deg[j]++;
                  if (_deg[i] >= maxLinks) break;
                }
              }
            }
            j = _next[j];
          }
          if (_deg[i] >= maxLinks) break;
        }
        if (_deg[i] >= maxLinks) break;
      }
    }
  }

  /// Kadr vaqtiga qarab sifatni pasaytiradi (faqat pasayadi — tebranish yo‘q).
  /// Снижает качество по времени кадра (только вниз — без раскачки).
  void _adaptQuality(double dt) {
    if (dt <= 0) return;
    _ema += (dt - _ema) * 0.08;
    _sinceDrop += dt;
    if (_ema > 0.026) {
      _slowFrames++;
    } else {
      _slowFrames = math.max(0, _slowFrames - 2);
    }
    if (_slowFrames > 90 && _sinceDrop > 3 && quality > 0.4) {
      quality = quality > 0.7 ? 0.65 : 0.4;
      active = math.max(math.min(capacity, profile.minCount), (capacity * quality).ceil());
      _slowFrames = 0;
      _sinceDrop = 0;
    }
  }

  /// Sinov uchun: kadr vaqtini taqlid qilish / для тестов: имитация времени кадра.
  void debugFeedFrameTime(double dt) => _adaptQuality(dt);

  /// Kursor ketgandan keyin ham zarrachalar o‘z joyiga qaytishi uchun: eng katta siljish.
  double get maxDisplacement {
    var m = 0.0;
    for (var i = 0; i < active; i++) {
      final d = math.sqrt(dx[i] * dx[i] + dy[i] * dy[i]);
      if (d > m) m = d;
    }
    return m;
  }
}

/// Kursor ta’siri qanchalik pasayishi (harakatsiz turganda) / затухание влияния курсора.
double pointerStrength(double secondsSinceMove) => (1 - (secondsSinceMove - 2.5) / 1.5).clamp(0.0, 1.0).toDouble();
