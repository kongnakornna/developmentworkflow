# AI Prompt Skills for OpenCode

ชุด Skills 29 โมดูล (00–28) — แต่ละ Skill มี SKILL.md + scripts + templates

## หมวดหมู่
- **Content:** 00, 02, 03, 04, 10
- **Management:** 05, 06, 18, 19, 20, 21, 26, 27
- **Analysis:** 07, 08
- **Design:** 09, 11, 14, 25
- **Software:** 12, 15, 16, 17, 24
- **Business:** 13
- **Creative:** 22, 23
- **Language:** 01
- **Architecture:** ⭐ **28** (รวม 16+17+24)

## Skills ที่มี scripts
| Skill | Scripts |
|---|---|
| `28-architecture-blueprint` | `gen_module.py`, `gen-module.sh`, `gen-module.ps1`, `gen-module.bat` |

## วิธีใช้ Skill ที่มี script
```bash
# 1) อ่าน SKILL.md เพื่อเข้าใจ flow
# 2) รัน script เพื่อ generate โครงสร้าง
cd opencode/skills/28-architecture-blueprint/scripts
python gen_module.py ordering --type Core

# 3) เปิดโฟลเดอร์ที่สร้าง + เติม business logic