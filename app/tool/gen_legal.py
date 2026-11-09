"""server/legal.py dan lib/legal_text.dart ni yaratadi / генерирует lib/legal_text.dart из server/legal.py.
Ishga tushirish / запуск: python3 tool/gen_legal.py"""
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "server"))
import legal  # noqa: E402

out = ["// AVTOMATIK — tool/gen_legal.py / АВТОМАТИЧЕСКИ — tool/gen_legal.py", "// ignore_for_file: lines_longer_than_80_chars", ""]
out.append(f"const String kLegalVersion = {json.dumps(legal.VERSION)};")
out.append(f"const Map<String, String> kLegalUpdated = {json.dumps(legal.UPDATED, ensure_ascii=False)};")
out.append("")
out.append("/// sahifa -> til -> [sarlavha, [xatboshilar]] / страница -> язык -> [заголовок, [абзацы]]")
out.append("const Map<String, Map<String, String>> kLegalTitles = " + json.dumps(
    {k.strip('/'): v for k, v in legal.TITLES.items()}, ensure_ascii=False) + ";")
out.append("")
out.append("const Map<String, Map<String, List<List<Object>>>> kLegalText = " + json.dumps(
    {k.strip('/'): {l: [[h, ps] for h, ps in secs] for l, secs in v.items()} for k, v in legal.TEXT.items()},
    ensure_ascii=False, indent=1).replace("$", "\\$") + ";")
(ROOT / "app/lib/legal_text.dart").write_text("\n".join(out) + "\n", encoding="utf-8")
print("ok")
