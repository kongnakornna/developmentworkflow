#!/usr/bin/env python3
"""
Architecture Blueprint — Module Generator (Python)

สร้างโมดูลใหม่ตามมาตรฐาน DDD + Clean Architecture + Modular
รองรับ Windows / macOS / Linux — ใช้แค่ standard library

Usage:
    python gen_module.py ordering
    python gen_module.py payment --type Core --context "Payment Processing"
    python gen_module.py inventory --base-path ./src/modules --force
    python gen_module.py ordering --dry-run
    python gen_module.py --list-templates
"""

from __future__ import annotations

import argparse
import os
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Iterable


# ============================================================
# Constants
# ============================================================
VERSION = "1.0.0"

# ANSI colors (จะไม่แสดงบน Windows รุ่นเก่า — fallback อัตโนมัติ)
class C:
    RESET   = "\033[0m"
    BOLD    = "\033[1m"
    DIM     = "\033[2m"
    RED     = "\033[91m"
    GREEN   = "\033[92m"
    YELLOW  = "\033[93m"
    BLUE    = "\033[94m"
    MAGENTA = "\033[95m"
    CYAN    = "\033[96m"
    WHITE   = "\033[97m"

    @classmethod
    def disable(cls) -> None:
        """ปิดสีทั้งหมด (สำหรับ redirect หรือ --no-color)"""
        for attr in dir(cls):
            if attr.isupper() and not attr.startswith("_"):
                setattr(cls, attr, "")


# ============================================================
# Domain: Module Spec
# ============================================================
@dataclass
class ModuleSpec:
    name: str
    context: str
    context_type: str          # Core / Supporting / Generic
    base_path: Path

    @property
    def path(self) -> Path:
        return self.base_path / self.name


# ============================================================
# โครงสร้างโฟลเดอร์
# ============================================================
LAYERS: dict[str, list[str]] = {
    # domain (DDD + Clean Layer 1)
    "domain": [
        "entities",
        "value-objects",
        "aggregates",
        "events",
        "repositories",
        "services",
    ],
    # application (Clean Layer 2)
    "application": [
        "use-cases",
        "dto",
        "ports",
    ],
    # infrastructure (Clean Layer 3)
    "infrastructure": [
        "persistence",
        "messaging",
        "external",
    ],
    # presentation (Clean Layer 4)
    "presentation": [
        "http",
        "cli",
    ],
    # public API
    "public": [],
    # tests
    "tests": [
        "unit",
        "integration",
        "e2e",
    ],
}


# ============================================================
# Helpers
# ============================================================
def echo(msg: str = "", color: str = "", bold: bool = False) -> None:
    prefix = (C.BOLD if bold else "") + color
    suffix = C.RESET if (color or bold) else ""
    print(f"{prefix}{msg}{suffix}")


def step(msg: str) -> None:
    echo(f"  → {msg}", C.CYAN)


def ok(msg: str) -> None:
    echo(f"  ✅ {msg}", C.GREEN)


def warn(msg: str) -> None:
    echo(f"  ⚠️  {msg}", C.YELLOW)


def err(msg: str) -> None:
    echo(f"  ❌ {msg}", C.RED)


def header_banner() -> None:
    echo()
    echo("╔══════════════════════════════════════════════════════╗", C.MAGENTA)
    echo("║  🏛️   Architecture Blueprint — Module Generator      ║", C.MAGENTA)
    echo("║       DDD + Clean Architecture + Modular             ║", C.MAGENTA)
    echo("╚══════════════════════════════════════════════════════╝", C.MAGENTA)
    echo()


def write_utf8(path: Path, content: str, overwrite: bool = False) -> bool:
    """เขียนไฟล์ UTF-8 ไม่มี BOM — คืนค่า True ถ้าเขียน, False ถ้าข้าม"""
    if path.exists() and not overwrite:
        warn(f"มีอยู่แล้ว ข้าม: {path}")
        return False
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8", newline="\n")
    return True


def touch(path: Path) -> None:
    """สร้างไฟล์ว่างถ้ายังไม่มี"""
    path.parent.mkdir(parents=True, exist_ok=True)
    if not path.exists():
        path.touch()


# ============================================================
# Templates
# ============================================================
def public_api_template(spec: ModuleSpec) -> str:
    return f"""// ============================================================
// Public API ของโมดูล: {spec.name}
// Bounded Context: {spec.context}
// Type: {spec.context_type}
// ============================================================
// ⚠️  โมดูลอื่น import ได้เฉพาะไฟล์ใน public/ เท่านั้น
// ⚠️  ห้าม import จาก domain/ application/ infrastructure/ presentation/ โดยตรง
// ============================================================

// --- Commands ---
// export {{ PlaceOrder }} from '../application/use-cases/PlaceOrder';
// export {{ CancelOrder }} from '../application/use-cases/CancelOrder';

// --- Queries ---
// export {{ GetOrderById }} from '../application/use-cases/GetOrderById';

// --- DTOs ---
// export type {{ PlaceOrderInput }} from '../application/dto/PlaceOrderInput';
// export type {{ OrderOutput }} from '../application/dto/OrderOutput';

// --- Domain Events (เปิดให้โมดูลอื่น subscribe) ---
// export {{ OrderPlaced }} from '../domain/events/OrderPlaced';
// export {{ OrderCancelled }} from '../domain/events/OrderCancelled';

// --- Public Types ---
// export type {{ OrderId }} from '../domain/value-objects/OrderId';
"""


def readme_template(spec: ModuleSpec) -> str:
    return f"""# 📦 Module: {spec.name}

> **Bounded Context:** {spec.context}  
> **Type:** {spec.context_type}  
> **Layer:** Modular Monolith → Clean Architecture → DDD

---

## 🎯 ความรับผิดชอบ

[อธิบายว่าโมดูลนี้ทำอะไร รับผิดชอบ business rule อะไร]

---

## 🗣️ Ubiquitous Language

| คำศัพท์ | ความหมาย |
|---|---|
| [term-1] | [ความหมาย] |
| [term-2] | [ความหมาย] |

---

## 🔌 Public API (เปิดให้โมดูลอื่นใช้)

### Commands
- `[commandName]` — [คำอธิบาย]

### Queries
- `[queryName]` — [คำอธิบาย]

### Events (publish)
- `[EventName]` — [คำอธิบาย]

### Events (subscribe)
- `[EventName]` จาก [module-name]

---

## 📥 Dependencies (พึ่งโมดูลอื่น)

| โมดูล | ประเภท | เหตุผล |
|---|---|---|
| [module-a] | Sync API | [เหตุผล] |
| [module-b] | Async Event | [เหตุผล] |

> ⚠️  ห้าม import จาก internal ของโมดูลอื่น — ใช้ `public/` เท่านั้น

---

## 📤 Data Ownership

| Storage | Table/Collection | คำอธิบาย |
|---|---|---|
| PostgreSQL | `{spec.name}` | [คำอธิบาย] |

> ✅  โมดูลอื่นห้ามเข้าถึงตารางนี้โดยตรง → ต้องผ่าน API/Event

---

## 🏛️ Domain Model

### Aggregates
- **Aggregate Root:** [ชื่อ]
  - Entities: [ ]
  - Value Objects: [ ]

### Domain Events
- [EventName] — [คำอธิบาย]

---

## 🧪 Tests

- `tests/unit/` — ทดสอบ domain logic (ไม่ต้อง DB)
- `tests/integration/` — ทดสอบกับ DB/API จริง
- `tests/e2e/` — ทดสอบทั้ง flow

---

## 📊 KPI

| KPI | Target |
|---|---|
| Domain Test Coverage | ≥ 90% |
| Dependency Cycle | 0 |
| Framework coupling (domain) | 0 |
| Change Impact Radius | ≤ 5 files |

---

## 📁 โครงสร้าง
