// IDROK Motion Lab (Academy · Neural Learning) testlari / тесты.

import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kodla/motion_lab.dart';

MotionField make({int seed = 7, MotionLevel level = MotionLevel.normal, double w = 390, double h = 844, MotionTier t = MotionTier.phone}) {
  final f = MotionField(kAcademyNeural, seed: seed, level: level);
  f.resize(w, h, t);
  return f;
}

void main() {
  group('engine', () {
    test('same seed gives the same layout, another seed a different one', () {
      final a = make(), b = make();
      for (var i = 0; i < 300; i++) {
        a.step(1 / 60, null);
        b.step(1 / 60, null);
      }
      expect(a.active, b.active);
      for (var i = 0; i < a.active; i++) {
        expect(a.px[i], b.px[i]);
        expect(a.py[i], b.py[i]);
      }
      final c = make(seed: 9);
      expect(c.px[0] != a.px[0] || c.py[0] != a.py[0], isTrue);
    });

    test('particle budget follows device and level', () {
      int n(double w, double h, MotionTier t, MotionLevel l) => MotionField.countFor(kAcademyNeural, w, h, t, l);
      final phone = n(390, 844, MotionTier.phone, MotionLevel.normal);
      final desk = n(1920, 1080, MotionTier.desktop, MotionLevel.normal);
      expect(phone, inInclusiveRange(kAcademyNeural.minCount, kAcademyNeural.maxPhone));
      expect(desk, lessThanOrEqualTo(kAcademyNeural.maxDesktop));
      expect(desk, greaterThan(phone));
      expect(n(1920, 1080, MotionTier.desktop, MotionLevel.low), lessThan(desk));
      expect(n(1920, 1080, MotionTier.desktop, MotionLevel.off), 0);
      expect(n(0, 0, MotionTier.phone, MotionLevel.normal), 0);
    });

    test('stays finite, inside the margin and under every limit with violent input', () {
      final f = make(w: 1280, h: 720, t: MotionTier.desktop);
      final r = math.Random(3);
      final ptr = MotionPointer();
      final m = kAcademyNeural.wander + kAcademyNeural.maxDisp + 16;
      final lim = f.width + 2 * m + 1;
      var finite = true, inside = true, disp = true, links = true;
      for (var s = 0; s < 2000; s++) {
        ptr
          ..x = r.nextDouble() * 1280
          ..y = r.nextDouble() * 720
          ..strength = 1
          ..touch = s % 7 == 0
          ..scrollVel = (r.nextDouble() - 0.5) * 8000;
        f.step(s % 50 == 0 ? 0.5 : 1 / 60, ptr); // katta kadr oralig‘i qisqartiriladi / большие паузы ограничиваются
        for (var i = 0; i < f.active; i++) {
          if (!f.px[i].isFinite || !f.py[i].isFinite) finite = false;
          if (f.px[i] < -lim || f.px[i] > f.width + lim || f.py[i] < -lim || f.py[i] > f.height + lim) inside = false;
        }
        if (f.maxDisplacement > kAcademyNeural.maxDisp + 0.01) disp = false;
        final deg = List<int>.filled(f.active, 0);
        for (var k = 0; k < f.linkCount; k++) {
          deg[f.linkA[k]]++;
          deg[f.linkB[k]]++;
          final dx = f.px[f.linkA[k]] - f.px[f.linkB[k]], dy = f.py[f.linkA[k]] - f.py[f.linkB[k]];
          if (math.sqrt(dx * dx + dy * dy) > kAcademyNeural.linkDist * 1.25 + 0.5) links = false;
        }
        if (deg.any((d) => d > kAcademyNeural.maxLinks)) links = false;
      }
      expect(finite, isTrue, reason: 'finite');
      expect(inside, isTrue, reason: 'inside the margin');
      expect(disp, isTrue, reason: 'displacement limit');
      expect(links, isTrue, reason: 'link limits');
    });

    test('the pointer pushes particles away softly and they return afterwards', () {
      final g = make(w: 800, h: 600, t: MotionTier.desktop), calm = make(w: 800, h: 600, t: MotionTier.desktop);
      var idx = 0;
      for (var i = 0; i < g.active; i++) {
        if (g.px[i] > 100 && g.px[i] < 700 && g.py[i] > 100 && g.py[i] < 500) {
          idx = i;
          break;
        }
      }
      final p = MotionPointer()
        ..x = g.px[idx] - 40
        ..y = g.py[idx]
        ..strength = 1;
      for (var s = 0; s < 20; s++) {
        g.step(1 / 60, p);
        calm.step(1 / 60, null);
      }
      double dist(MotionField f) => math.sqrt(math.pow(f.px[idx] - p.x!, 2) + math.pow(f.py[idx] - p.y!, 2));
      expect(dist(g), greaterThan(dist(calm) + 3));
      final peak = g.maxDisplacement;
      expect(peak, greaterThan(5));
      for (var s = 0; s < 240; s++) {
        g.step(1 / 60, null);
      }
      expect(g.maxDisplacement, lessThan(peak * 0.05));
    });

    test('scroll velocity drifts the network', () {
      final a = make(), b = make();
      final sc = MotionPointer()..scrollVel = 2500;
      for (var s = 0; s < 30; s++) {
        a.step(1 / 60, sc);
        b.step(1 / 60, null);
      }
      var moved = 0.0;
      for (var i = 0; i < a.active; i++) {
        moved += (a.py[i] - b.py[i]).abs();
      }
      expect(moved / a.active, greaterThan(3));
    });

    test('quality only steps down on slow frames and keeps a floor', () {
      final q = make(w: 1280, h: 720, t: MotionTier.desktop);
      final before = q.active;
      for (var i = 0; i < 4000; i++) {
        q.debugFeedFrameTime(0.04);
      }
      expect(q.quality, lessThan(1));
      expect(q.quality, greaterThanOrEqualTo(0.4));
      expect(q.active, lessThanOrEqualTo(before));
      expect(q.active, greaterThanOrEqualTo(kAcademyNeural.minCount));
      final fast = make(w: 1280, h: 720, t: MotionTier.desktop);
      for (var i = 0; i < 4000; i++) {
        fast.debugFeedFrameTime(1 / 60);
      }
      expect(fast.quality, 1);
    });

    test('resizing keeps the field valid; an idle pointer fades out', () {
      final z = make();
      z.resize(1200, 800, MotionTier.desktop);
      z.step(1 / 60, null);
      expect(z.capacity, greaterThan(0));
      expect(z.px.every((v) => v.isFinite), isTrue);
      expect(pointerStrength(0), 1);
      expect(pointerStrength(5), 0);
    });
  });

  group('layer', () {
    Widget host(Widget layer, {bool reduced = false}) => MaterialApp(
          builder: (ctx, child) => MediaQuery(data: MediaQuery.of(ctx).copyWith(disableAnimations: reduced), child: child!),
          home: Scaffold(body: SizedBox(width: 400, height: 800, child: Stack(children: [Positioned.fill(child: layer)]))),
        );
    const layer = MotionLayer(dot: Color(0xFF0A6CFF), accent: Color(0xFF38C8FF), link: Color(0xFF0A6CFF));

    testWidgets('animates, follows the mouse and never blocks taps', (t) async {
      var taps = 0;
      await t.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Stack(children: [
            const Positioned.fill(child: layer),
            Center(child: ElevatedButton(onPressed: () => taps++, child: const Text('go'))),
          ]),
        ),
      ));
      for (var i = 0; i < 10; i++) {
        await t.pump(const Duration(milliseconds: 50));
      }
      final mouse = await t.createGesture(kind: PointerDeviceKind.mouse);
      await mouse.addPointer(location: const Offset(200, 300));
      await mouse.moveTo(const Offset(210, 310));
      for (var i = 0; i < 10; i++) {
        await t.pump(const Duration(milliseconds: 50));
      }
      await t.tap(find.text('go'));
      expect(taps, 1);
      expect(find.byType(MotionLayer), findsOneWidget);
      await mouse.removePointer();
    });

    testWidgets('static frame (animate: false) lets the tree settle', (t) async {
      await t.pumpWidget(host(const MotionLayer(animate: false, dot: Color(0xFF0A6CFF), accent: Color(0xFF38C8FF), link: Color(0xFF0A6CFF))));
      await t.pumpAndSettle(); // animatsiya yo‘q — qotib qolmaydi / анимации нет — не зависнет
      expect(find.byType(CustomPaint), findsWidgets);
    });

    testWidgets('reduced motion shows one static frame', (t) async {
      await t.pumpWidget(host(layer, reduced: true));
      await t.pumpAndSettle();
      expect(find.byType(CustomPaint), findsWidgets);
    });

    testWidgets('level off draws nothing; layer disposes cleanly', (t) async {
      await t.pumpWidget(host(const MotionLayer(level: MotionLevel.off, dot: Color(0xFF0A6CFF), accent: Color(0xFF38C8FF), link: Color(0xFF0A6CFF))));
      await t.pumpAndSettle();
      await t.pumpWidget(host(layer));
      await t.pump(const Duration(milliseconds: 100));
      await t.pumpWidget(const SizedBox());
      await t.pump();
      expect(tester_noExceptions(t), isTrue);
    });
  });
}

bool tester_noExceptions(WidgetTester t) => t.takeException() == null;
