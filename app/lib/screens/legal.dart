import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../config.dart';
import '../legal_text.dart';
import '../state.dart';
import '../theme.dart';
import '../widgets.dart';

/// Hujjat sahifasini ochish: 'privacy', 'terms', 'delete-account'.
/// Открыть документ: 'privacy', 'terms', 'delete-account'.
Future<void> openLegal(BuildContext context, String page) =>
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => LegalScreen(page: page)));

/// Maxfiylik siyosati / shartlar — ilova ichida o‘qiladi (internetsiz ham).
/// Политика / условия — читаются в приложении (и без интернета).
class LegalScreen extends StatelessWidget {
  final String page;
  const LegalScreen({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    final s = AppScope.of(context);
    final c = s.c;
    final lang = s.lang == 'ru' ? 'ru' : 'uz';
    final title = kLegalTitles[page]?[lang] ?? '';
    final sections = kLegalText[page]?[lang] ?? const <List<Object>>[];
    final url = '$kDefaultServer/$page${lang == 'ru' ? '?lang=ru' : ''}';
    return Scaffold(
      backgroundColor: c.bg,
      body: AppBackground(
        child: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: ListView(
                key: ValueKey('legal-$page'),
                padding: const EdgeInsets.fromLTRB(S.page, S.x3, S.page, S.x8),
                children: [
                  Row(children: [
                    AppIconButton(Icons.arrow_back_rounded,
                        tooltip: s.t('back'), onPressed: () => Navigator.of(context).maybePop()),
                  ]),
                  const SizedBox(height: S.x4),
                  LargeTitle(title, subtitle: '${s.t('legal_updated')}: ${kLegalUpdated[lang] ?? ''}'),
                  const SizedBox(height: S.x4),
                  Container(
                    padding: const EdgeInsets.all(S.x5),
                    decoration: BoxDecoration(color: c.surface, borderRadius: R.all(R.lg)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      for (var i = 0; i < sections.length; i++) ...[
                        Padding(
                          padding: const EdgeInsets.only(top: S.x3, bottom: S.x1),
                          child: Text('${sections[i][0]}', style: AppType.headline.copyWith(color: c.text)),
                        ),
                        for (final p in (sections[i][1] as List))
                          Padding(
                            padding: const EdgeInsets.only(bottom: S.x2),
                            child: Text('$p', style: AppType.callout.copyWith(color: c.text2, height: 1.45)),
                          ),
                        if (page == 'about' && i == kLegalTeamAfter) _Team(lang: lang),
                        if (page == 'about' && i == kLegalPartnerAfter)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: S.x2),
                            child: ClipRRect(
                              borderRadius: R.all(R.lg),
                              child: Image.asset('assets/team/$kLegalPartnerLogo.jpg',
                                  width: 160, height: 160, fit: BoxFit.cover, semanticLabel: 'Kelajak Markazlari'),
                            ),
                          ),
                      ],
                    ]),
                  ),
                  const SizedBox(height: S.x4),
                  Pressable(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: url));
                      s.toast(s.t('copied'), icon: Icons.link_rounded);
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(Icons.link_rounded, size: 16, color: c.text3),
                      const SizedBox(width: S.x1),
                      Flexible(child: Text(url, style: AppType.footnote.copyWith(color: c.text3))),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Jamoa a’zolari / участники команды.
class _Team extends StatelessWidget {
  final String lang;
  const _Team({required this.lang});

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context).c;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: S.x2),
      child: LayoutBuilder(builder: (context, box) {
        final w = box.maxWidth >= 480 ? (box.maxWidth - S.x4 * 2) / 3 : (box.maxWidth - S.x4) / 2;
        return Wrap(spacing: S.x4, runSpacing: S.x4, children: [
          for (final m in kLegalTeam)
            SizedBox(
              width: w,
              child: Column(children: [
                ClipRRect(
                  borderRadius: R.all(R.lg),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset('assets/team/${m[0]}.jpg', fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: S.x2),
                Text(m[1], textAlign: TextAlign.center, style: AppType.subhead.copyWith(color: c.text, fontWeight: FontWeight.w700)),
                Text(lang == 'ru' ? m[3] : m[2],
                    textAlign: TextAlign.center, style: AppType.footnote.copyWith(color: c.text3)),
              ]),
            ),
        ]);
      }),
    );
  }
}

/// Ro‘yxatdan o‘tishda rozilik belgisi / галочка согласия при регистрации.
class ConsentTile extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String text;
  final List<(String, String)> links; // (matn, sahifa) / (текст, страница)
  const ConsentTile({super.key, required this.value, required this.onChanged, required this.text, this.links = const []});

  @override
  Widget build(BuildContext context) {
    final s = AppScope.of(context);
    final c = s.c;
    return Pressable(
      onTap: () => onChanged(!value),
      semanticLabel: text,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: S.x2),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: value ? c.accent : c.surface,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: value ? c.accent : c.text3, width: 1.6),
            ),
            child: value ? const Icon(Icons.check_rounded, size: 18, color: Colors.white) : null,
          ),
          const SizedBox(width: S.x3),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(text, style: AppType.subhead.copyWith(color: c.text)),
              if (links.isNotEmpty)
                Wrap(spacing: S.x3, children: [
                  for (final l in links)
                    GestureDetector(
                      onTap: () => openLegal(context, l.$2),
                      child: Padding(
                        padding: const EdgeInsets.only(top: S.x1),
                        child: Text(l.$1,
                            style: AppType.subhead.copyWith(color: c.accentText, fontWeight: FontWeight.w600)),
                      ),
                    ),
                ]),
            ]),
          ),
        ]),
      ),
    );
  }
}
