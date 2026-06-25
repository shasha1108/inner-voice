#!/usr/bin/env python3
"""内容评分工具 — 标题(10) + 正文(10)，双轨独立

用法:
 python3 scripts/score.py --mode title --h1 X --h2 X --h3 X --h4 X [--json]
 python3 scripts/score.py --mode body --b1 X --b2 X --b3 X --b4 X --b5 X --b6 X --b7 X --b8 X [--json]

阈值: 标题 ≥ 9.0 通过 | 正文 ≥ 9.5 通过
"""

import sys, json, argparse

# ── 维度定义 ──────────────────────────────────────────────

TITLE_DIMS = {
 "H1": {"name": "搜索可见性", "max": 2.5, "rules": ["#1", "#12", "#13"]},
 "H2": {"name": "隐喻关键词", "max": 2.5, "rules": ["#4", "#5", "#35"]},
 "H3": {"name": "人话感", "max": 2.5, "rules": ["#2", "#6", "#7", "#9", "#10", "#11"]},
 "H4": {"name": "钩子力", "max": 2.5, "rules": ["#3", "#8", "#12"]},
}

BODY_DIMS = {
 "B1": {"name": "角度执行", "max": 1.5, "rules": ["#41", "#42"]},
 "B2": {"name": "开头钩子", "max": 1.5, "rules": ["#15", "#30", "#49"]},
 "B3": {"name": "隐喻一致性", "max": 1.5, "rules": ["#35", "#36", "#37", "#38", "#39", "#40"]},
 "B4": {"name": "矛盾句质量", "max": 1.0, "rules": ["#20", "#43", "#46", "#47"]},
 "B5": {"name": "情绪弧线", "max": 1.0, "rules": ["#16", "#17", "#48", "#50"]},
 "B6": {"name": "价值增量", "max": 0.75, "rules": ["#31", "#51"]},
 "B7": {"name": "语言质感", "max": 1.5, "rules": ["#14", "#19", "#22", "#23", "#24", "#25", "#26", "#27", "#28", "#29"]},
 "B8": {"name": "CTA有效性", "max": 1.25, "rules": ["#18", "#32", "#33", "#34", "#44", "#45"]},
}

TITLE_PASS = 9.0
BODY_PASS = 9.5

# ── 硬性不及格条件 ────────────────────────────────────────

TITLE_HARD_FAILS = [
 ("H1", "伪造SEO数据 — 声称搜索友好但无小红书验证数据"),
 ("H3", "竖线前后是断裂的两个独立句子"),
 ("H3", "使用«»书名号做标签装饰"),
]

BODY_HARD_FAILS = [
 ("B7", "出现绝对禁用句式 (不是X而是Y/你应该/学会/记住/请记得/很多人都/治愈自我标签/我们把这种感觉叫做/心理学上称之为/这其实是/那个负责X的你)"),
 ("B3", "隐喻用法混用 — 前半段当概念用、后半段当物理空间用"),
 ("B3", "「」命名缺失，或凭空出现无铺垫无引出"),
 ("B8", "无CTA"),
 ("B6", "内容为教程/素材/壁纸类"),
]


def score_title(h1, h2, h3, h4):
 """评分标题并返回报告"""
 scores = {"H1": h1, "H2": h2, "H3": h3, "H4": h4}
 errors = []
 hard_fails_triggered = []

 # 范围检查
 for key, val in scores.items():
 dim = TITLE_DIMS[key]
 if val < 0 or val > dim["max"]:
 errors.append(f"{key}({dim['name']}): {val} 超出范围 [0-{dim['max']}]")

 if errors:
 return {"error": True, "errors": errors}

 total = sum(scores.values())
 passed = total >= TITLE_PASS

 # 找出最弱维度
 ratios = {k: v / TITLE_DIMS[k]["max"] for k, v in scores.items()}
 weakest_key = min(ratios, key=ratios.get)

 diagnosis = []
 if passed:
 diagnosis.append(f"✅ 标题 {total}/10 ≥ {TITLE_PASS} → 通过，输出5个备选")
 else:
 diagnosis.append(f"❌ 标题 {total}/10 < {TITLE_PASS} → 不通过，回标题第一步重写")

 diagnosis.append(f"🔻 最弱维度: {weakest_key}({TITLE_DIMS[weakest_key]['name']}) = {scores[weakest_key]}/{TITLE_DIMS[weakest_key]['max']}")

 return {
 "mode": "title",
 "scores": {k: {"value": v, "max": TITLE_DIMS[k]["max"], "name": TITLE_DIMS[k]["name"],
  "rules": TITLE_DIMS[k]["rules"]} for k, v in scores.items()},
 "total": round(total, 2),
 "max": 10,
 "passed": passed,
 "threshold": TITLE_PASS,
 "weakest": weakest_key,
 "hard_fails_triggered": hard_fails_triggered,
 "diagnosis": diagnosis,
 }


def score_body(b1, b2, b3, b4, b5, b6, b7, b8):
 """评分正文并返回报告"""
 scores = {"B1": b1, "B2": b2, "B3": b3, "B4": b4, "B5": b5, "B6": b6, "B7": b7, "B8": b8}
 errors = []
 hard_fails_triggered = []

 # 范围检查
 for key, val in scores.items():
 dim = BODY_DIMS[key]
 if val < 0 or val > dim["max"]:
 errors.append(f"{key}({dim['name']}): {val} 超出范围 [0-{dim['max']}]")

 if errors:
 return {"error": True, "errors": errors}

 # 硬性不及格检查 — 满分项=0分触发
 hard_fail_checks = {
 "B7": (b7, BODY_DIMS["B7"]["max"], "出现禁用句式 → 总分上限3.0"),
 "B3": (b3, BODY_DIMS["B3"]["max"], "隐喻混用/'「」'缺失或凭空出现 → 总分上限3.0"),
 "B8": (b8, BODY_DIMS["B8"]["max"], "无CTA → 总分上限3.0"),
 "B6": (b6, BODY_DIMS["B6"]["max"], "教程/素材/壁纸类 → 总分上限3.0"),
 }

 for key, (val, max_val, msg) in hard_fail_checks.items():
 if val <= 0:
 hard_fails_triggered.append(f"{key}: {msg}")

 total = sum(scores.values())

 if hard_fails_triggered:
 total = min(total, 3.0)
 passed = False
 else:
 passed = total >= BODY_PASS

 # 找出最弱维度
 ratios = {k: v / BODY_DIMS[k]["max"] for k, v in scores.items()}
 weakest_key = min(ratios, key=ratios.get)

 diagnosis = []
 if hard_fails_triggered:
 diagnosis.append("🚨 硬性不及格触发:")
 for hf in hard_fails_triggered:
 diagnosis.append(f" {hf}")
 elif passed:
 diagnosis.append(f"✅ 正文 {total}/10 ≥ {BODY_PASS} → 通过，进入确认点B")
 else:
 diagnosis.append(f"❌ 正文 {total}/10 < {BODY_PASS} → 不通过，回STEP 3重写 (loop_count +1)")

 diagnosis.append(f"🔻 最弱维度: {weakest_key}({BODY_DIMS[weakest_key]['name']}) = {scores[weakest_key]}/{BODY_DIMS[weakest_key]['max']}")

 return {
 "mode": "body",
 "scores": {k: {"value": v, "max": BODY_DIMS[k]["max"], "name": BODY_DIMS[k]["name"],
  "rules": BODY_DIMS[k]["rules"]} for k, v in scores.items()},
 "total": round(total, 2),
 "max": 10,
 "passed": passed,
 "threshold": BODY_PASS,
 "weakest": weakest_key,
 "hard_fails_triggered": hard_fails_triggered,
 "diagnosis": diagnosis,
 }


def format_report(result):
 """人类可读的报告"""
 lines = []
 dims = TITLE_DIMS if result["mode"] == "title" else BODY_DIMS
 lines.append(f"━━━ {'标题' if result['mode'] == 'title' else '正文'}评分 ━━━")

 for key in result["scores"]:
 s = result["scores"][key]
 bar = "█" * int(s["value"] / s["max"] * 10) + "░" * (10 - int(s["value"] / s["max"] * 10))
 rules_str = ", ".join(s["rules"])
 lines.append(f" {key} {s['name']}: {s['value']}/{s['max']} {bar} [{rules_str}]")

 lines.append(f" 总分: {result['total']}/10 | 阈值: {result['threshold']} | {'✅通过' if result['passed'] else '❌不通过'}")

 if result["hard_fails_triggered"]:
 lines.append(" 🚨 硬性不及格:")
 for hf in result["hard_fails_triggered"]:
 lines.append(f" {hf}")

 for d in result["diagnosis"]:
 lines.append(f" {d}")

 return "\n".join(lines)


if __name__ == "__main__":
 parser = argparse.ArgumentParser(description="inner-voice 内容评分 (纯文案，无图片)")
 parser.add_argument("--mode", choices=["title", "body"], required=True, help="评分模式")

 # 标题参数
 parser.add_argument("--h1", type=float, help="搜索可见性 (0-2.5)")
 parser.add_argument("--h2", type=float, help="隐喻关键词 (0-2.5)")
 parser.add_argument("--h3", type=float, help="人话感 (0-2.5)")
 parser.add_argument("--h4", type=float, help="钩子力 (0-2.5)")

 # 正文参数
 parser.add_argument("--b1", type=float, help="角度执行 (0-1.5)")
 parser.add_argument("--b2", type=float, help="开头钩子 (0-1.5)")
 parser.add_argument("--b3", type=float, help="隐喻一致性 (0-1.5)")
 parser.add_argument("--b4", type=float, help="矛盾句质量 (0-1.0)")
 parser.add_argument("--b5", type=float, help="情绪弧线 (0-1.0)")
 parser.add_argument("--b6", type=float, help="价值增量 (0-0.75)")
 parser.add_argument("--b7", type=float, help="语言质感 (0-1.5)")
 parser.add_argument("--b8", type=float, help="CTA有效性 (0-1.25)")

 parser.add_argument("--json", action="store_true", help="JSON 输出")

 args = parser.parse_args()

 if args.mode == "title":
 if any(v is None for v in [args.h1, args.h2, args.h3, args.h4]):
 print("错误: --mode title 需要 --h1 --h2 --h3 --h4", file=sys.stderr)
 sys.exit(1)
 result = score_title(args.h1, args.h2, args.h3, args.h4)
 else:
 if any(v is None for v in [args.b1, args.b2, args.b3, args.b4, args.b5, args.b6, args.b7, args.b8]):
 print("错误: --mode body 需要 --b1 ~ --b8", file=sys.stderr)
 sys.exit(1)
 result = score_body(args.b1, args.b2, args.b3, args.b4, args.b5, args.b6, args.b7, args.b8)

 if args.json:
 print(json.dumps(result, ensure_ascii=False, indent=2))
 else:
 print(format_report(result))
