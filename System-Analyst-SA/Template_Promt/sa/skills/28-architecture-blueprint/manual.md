# 📘 Manual — Architecture Blueprint Skill (28)

> คู่มือการใช้งาน Skill **28-architecture-blueprint** สำหรับ OpenCode  
> รวม DDD + Clean Architecture + Modular + Folder Generator

---

## 📑 สารบัญ

1. [ภาพรวม](#1-ภาพรวม)
2. [โครงสร้างไฟล์](#2-โครงสร้างไฟล์)
3. [การติดตั้ง](#3-การติดตั้ง)
4. [วิธีใช้งานใน OpenCode](#4-วิธีใช้งานใน-opencode)
5. [วิธีใช้งาน Scripts](#5-วิธีใช้งาน-scripts)
6. [ตัวอย่างจริง 3 กรณี](#6-ตัวอย่างจริง-3-กรณี)
7. [Troubleshooting](#7-troubleshooting)
8. [FAQ](#8-faq)
9. [Best Practices](#9-best-practices)

---

## 1. ภาพรวม

### 1.1 Skill นี้ทำอะไร

`28-architecture-blueprint` เป็น Skill ที่รวม 3 แนวคิดเข้าด้วยกัน:

| แนวคิด | ที่มา | ทำอะไร |
|---|---|---|
| **DDD** | `16-ddd` | ออกแบบโดเมน → Bounded Context, Aggregate |
| **Clean Architecture** | `17-clean-architecture` | จัดชั้น 4 layers |
| **Modular** | `24-modular` | แบ่งโมดูล → Loose Coupling |

### 1.2 ได้อะไรจาก Skill นี้

- ✅ **Blueprint 7 ส่วน** — Domain → Module → Layer → Dependency → Communication → Folder → KPI
- ✅ **Folder Generator** — สร้างโครงสร้างจริงได้ทันที (Python/Bash/PowerShell)
- ✅ **Checklist + KPI** — ตรวจสอบคุณภาพสถาปัตยกรรม
- ✅ **Roadmap** — Modular Monolith → Microservices

### 1.3 เมื่อไหร่ควรใช้

| สถานการณ์ | ใช้ Skill นี้ |
|---|---|
| เริ่มโปรเจกต์ใหม่ | ✅ ใช่ |
| Refactor ระบบเดิม → Modular | ✅ ใช่ |
| ออกแบบ Microservices | ✅ ใช่ (28 + 15) |
| ออกแบบ UX/UI | ❌ ใช้ 25-ux-ui |
| เขียน KPI | ❌ ใช้ 05-kpi |
| วางแผนโครงการ | ❌ ใช้ 20-project-management |

---

## 2. โครงสร้างไฟล์

```text
28-architecture-blueprint/
├── SKILL.md                          # Skill definition (อ่านโดย AI)
├── manual.md                         # ⬅️ ไฟล์นี้
├── templates/
│   ├── folder-tree.txt               # โครงสร้างโฟลเดอร์
│   ├── module-readme.template.md     # README ของแต่ละโมดูล
│   └── public-api.template.ts        # Public API stub
└── scripts/
    ├── gen_module.py                 ⭐ Primary (cross-platform)
    ├── gen-module.sh                 (macOS / Linux)
    ├── gen-module.ps1                (Windows PowerShell)
    ├── gen-module.bat                (Windows CMD wrapper)
    └── check_deps.py                 (Optional — ตรวจ cycle)
```

---

## 3. การติดตั้ง

### 3.1 ใน OpenCode

#### Global (ทุกโปรเจกต์)

```bash
# macOS / Linux
mkdir -p ~/.config/opencode/skills
cp -r 28-architecture-blueprint ~/.config/opencode/skills/

# Windows PowerShell
New-Item -ItemType Directory -Force "$env:USERPROFILE\.config\opencode\skills"
Copy-Item -Recurse "28-architecture-blueprint" "$env:USERPROFILE\.config\opencode\skills\"
```

#### Per-project

```bash
mkdir -p .opencode/skills
cp -r 28-architecture-blueprint .opencode/skills/
```

### 3.2 Requirements

| Component | Version | หมายเหตุ |
|---|---|---|
| **OpenCode** | ล่าสุด | — |
| **Python** (แนะนำ) | 3.9+ | ใช้แค่ standard library |
| **Bash** | 4.0+ | สำหรับ `gen-module.sh` |
| **PowerShell** | 5.1+ หรือ 7+ | สำหรับ `gen-module.ps1` |

### 3.3 ตรวจสอบการติดตั้ง

```bash
# ตรวจว่ามี skill
ls ~/.config/opencode/skills/28-architecture-blueprint/

# ตรวจ Python
python --version    # หรือ python3 --version

# ทดสอบ script
python ~/.config/opencode/skills/28-architecture-blueprint/scripts/gen_module.py --version
```

ผลลัพธ์ที่คาดหวัง:
```
gen_module.py v1.0.0
```

---

## 4. วิธีใช้งานใน OpenCode

### 4.1 เรียกใช้ด้วยชื่อ skill

```bash
ใช้ skill 28-architecture-blueprint
ระบบ: E-commerce Platform
โดเมน: Ordering, Payment, Inventory
Tech Stack: Node.js + TypeScript + PostgreSQL
ขนาดทีม: 5 คน
ภาษา: ไทย
```

AI จะตอบกลับด้วย Blueprint 7 ส่วน

### 4.2 ใช้ร่วมกับ Skill อื่น

```bash
ใช้ skill 28-architecture-blueprint + 18-risk-management
ระบบ: Mobile App Backend
โดเมน: Clinic, Doctor, Appointment, Patient
ภาษา: ไทย+อังกฤษ
```

AI จะสร้าง Blueprint + Risk Register

### 4.3 ใช้แบบ Step-by-step

```bash
# ครั้งที่ 1: ขอ Domain Map ก่อน
ใช้ skill 28-architecture-blueprint
ระบบ: E-commerce
ขอ: ส่วนที่ 1 Domain Map เท่านั้น

# ครั้งที่ 2: ขอ Module Map
ขอต่อ: ส่วนที่ 2 Module Map

# ครั้งที่ 3: ขอ Folder + Generate
ขอต่อ: ส่วนที่ 6 Folder Structure + คำสั่ง generate
```

### 4.4 ตัวอย่างคำสั่งเต็ม

```
ใช้ skill 28-architecture-blueprint

## บริบท
- ระบบ: B2B SaaS — Project Management
- โดเมน: Workspace, Project, Task, Billing, Auth
- Tech Stack: Go + PostgreSQL + gRPC
- ขนาดทีม: 4 ทีม (ทีมละ 5 คน)
- ข้อจำกัด: multi-tenant, audit log, SSO
- แผนขยาย: รองรับ enterprise ใน 2 ปี
- Quality Attributes: scalability, security, maintainability
- ภาษา: ไทย+อังกฤษ

## ต้องการ
1. Blueprint ครบ 7 ส่วน
2. คำสั่ง generate folder สำหรับทุกโมดูล
3. KPI + Checklist
```

---

## 5. วิธีใช้งาน Scripts

### 5.1 Python (แนะนำ — cross-platform)

#### พื้นฐาน

```bash
cd scripts/
python gen_module.py ordering
```

#### Flags ทั้งหมด

| Flag | ย่อ | คำอธิบาย | ตัวอย่าง |
|---|---|---|---|
| `--base-path` | `-b` | Path หลัก | `-b ./src/modules` |
| `--context` | `-c` | Bounded Context | `-c "Payment Processing"` |
| `--type` | `-t` | ประเภท | `-t Core` |
| `--force` | `-f` | เขียนทับ | `-f` |
| `--dry-run` | `-n` | ดูตัวอย่าง | `-n` |
| `--no-color` | | ปิดสี | `--no-color` |
| `--list-templates` | | ดู template | `--list-templates` |
| `--version` | `-v` | ดูเวอร์ชัน | `-v` |

#### ตัวอย่างการใช้

```bash
# 1) สร้างโมดูล Core
python gen_module.py ordering --type Core

# 2) สร้างโมดูล Supporting พร้อม context
python gen_module.py payment \
    --type Supporting \
    --context "Payment Processing"

# 3) ระบุ base path
python gen_module.py inventory \
    --base-path "C:\Projects\MyApp\src\modules"

# 4) Dry-run
python gen_module.py ordering --dry-run

# 5) ดู template
python gen_module.py --list-templates

# 6) สร้างหลายโมดูลทีเดียว
python gen_module.py ordering -t Core
python gen_module.py payment -t Supporting
python gen_module.py inventory -t Supporting
python gen_module.py shipping -t Generic
```

#### ตั้ง Alias

**macOS / Linux** (`~/.bashrc` หรือ `~/.zshrc`):

```bash
alias nm='python3 /path/to/28-architecture-blueprint/scripts/gen_module.py'
```

**Windows PowerShell** (`$PROFILE`):

```powershell
function New-AppModule {
    param(
        [Parameter(Mandatory, Position=0)][string]$Name,
        [Parameter(Position=1)][ValidateSet('Core','Supporting','Generic')][string]$Type = 'Supporting',
        [string]$BasePath = ".\src\modules"
    )
    python "C:\path\to\28-architecture-blueprint\scripts\gen_module.py" `
        $Name --type $Type --base-path $BasePath
}
Set-Alias nm New-AppModule
```

ใช้: `nm ordering Core`

---

### 5.2 Bash (macOS / Linux)

```bash
chmod +x gen-module.sh
./gen-module.sh ordering
```

---

### 5.3 PowerShell (Windows)

```powershell
# อนุญาตรันครั้งเดียว
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# รัน
.\gen-module.ps1 ordering
.\gen-module.ps1 payment -ContextType Core -BoundedContext "Payment Processing"
.\gen-module.ps1 inventory -BasePath "C:\Projects\MyApp\src\modules" -Force
```

---

### 5.4 Batch (Windows CMD)

```bat
gen-module.bat ordering
gen-module.bat payment Core
```

---

## 6. ตัวอย่างจริง 3 กรณี

### 6.1 กรณีที่ 1 — E-commerce Platform

#### Step 1: ขอ Blueprint

```
ใช้ skill 28-architecture-blueprint
ระบบ: E-commerce Platform
โดเมน: Ordering, Payment, Inventory, Shipping, Customer
Tech Stack: Node.js + TypeScript + PostgreSQL + Kafka
ขนาดทีม: 5 ทีม (ทีมละ 5 คน)
แผนขยาย: Microservices ใน 2 ปี
ภาษา: ไทย+อังกฤษ
```

#### Step 2: ตรวจสอบ Domain Map

AI จะให้ผลลัพธ์:

| Context | ประเภท | ความรับผิดชอบ |
|---|---|---|
| Ordering | Core | รับคำสั่งซื้อ, คำนวณราคา |
| Payment | Supporting | ชำระเงิน, refund |
| Inventory | Supporting | สต็อกสินค้า |
| Shipping | Generic | จัดส่ง |
| Customer | Core | โปรไฟล์, loyalty |

#### Step 3: Generate folder

```bash
cd scripts/

python gen_module.py ordering   -t Core       -c "Order Management"
python gen_module.py payment    -t Supporting -c "Payment Processing"
python gen_module.py inventory  -t Supporting -c "Stock Management"
python gen_module.py shipping   -t Generic    -c "Logistics"
python gen_module.py customer   -t Core       -c "Customer Profile"
```

#### Step 4: ตรวจสอบ

```bash
tree src/modules/ -L 2
```

ผลลัพธ์:
```
src/modules/
├── ordering/
│   ├── README.md
│   ├── domain/
│   ├── application/
│   ├── infrastructure/
│   ├── presentation/
│   ├── public/
│   └── tests/
├── payment/
├── inventory/
├── shipping/
└── customer/
```

---

### 6.2 กรณีที่ 2 — SaaS B2B

#### Step 1: ขอ Blueprint

```
ใช้ skill 28-architecture-blueprint
ระบบ: B2B SaaS — Project Management
โดเมน: Workspace, Project, Task, Billing, Auth
Tech Stack: Go + PostgreSQL + gRPC
Quality Attributes: multi-tenant, audit log, SSO
ขนาดทีม: 4 ทีม
ภาษา: English
```

#### Step 2: Generate

```bash
python gen_module.py workspace -t Core       -c "Workspace Management"
python gen_module.py project   -t Core       -c "Project Tracking"
python gen_module.py task      -t Core       -c "Task Management"
python gen_module.py billing   -t Supporting -c "Billing & Invoicing"
python gen_module.py auth      -t Generic    -c "Authentication"
```

#### Step 3: ตรวจสอบ Cycle

```bash
python check_deps.py --path src/modules
```

ผลลัพธ์ที่ต้องการ:
```
✅ No cycles found
✅ No boundary violations
```

---

### 6.3 กรณีที่ 3 — Mobile Backend (Clinic Booking)

#### Step 1: ขอ Blueprint

```
ใช้ skill 28-architecture-blueprint
ระบบ: Mobile App Backend (Clinic Booking)
โดเมน: Clinic, Doctor, Appointment, Patient, Notification
Tech Stack: NestJS + MongoDB + Redis + RabbitMQ
ขนาดทีม: 3 ทีม
ภาษา: ไทย
```

#### Step 2: Generate

```bash
python gen_module.py clinic       -t Core       -c "Clinic Management"
python gen_module.py doctor       -t Supporting -c "Doctor Profile"
python gen_module.py appointment  -t Core       -c "Appointment Booking"
python gen_module.py patient      -t Supporting -c "Patient Profile"
python gen_module.py notification -t Generic    -c "Notifications"
```

#### Step 3: เพิ่ม Entity ตัวอย่าง (appointment module)

สร้าง `src/modules/appointment/domain/entities/Appointment.ts`:

```typescript
import { AppointmentId } from '../value-objects/AppointmentId';
import { AppointmentStatus } from '../value-objects/AppointmentStatus';

export class Appointment {
  constructor(
    public readonly id: AppointmentId,
    public readonly patientId: string,
    public readonly doctorId: string,
    public readonly scheduledAt: Date,
    private _status: AppointmentStatus,
  ) {}

  get status(): AppointmentStatus {
    return this._status;
  }

  confirm(): void {
    if (this._status !== AppointmentStatus.Pending) {
      throw new Error('Only pending appointments can be confirmed');
    }
    this._status = AppointmentStatus.Confirmed;
  }

  cancel(): void {
    if (this._status === AppointmentStatus.Completed) {
      throw new Error('Completed appointments cannot be cancelled');
    }
    this._status = AppointmentStatus.Cancelled;
  }
}
```

---

## 7. Troubleshooting

### 7.1 ปัญหา: Python ไม่รู้จักคำสั่ง

**อาการ:**
```
'python' is not recognized as an internal or external command
```

**แก้ไข:**
```bash
# ลอง python3
python3 gen_module.py ordering

# Windows: ใช้ py launcher
py gen_module.py ordering

# หรือติดตั้ง Python จาก python.org
```

---

### 7.2 ปัญหา: PowerShell ไม่ยอมรัน Script

**อาการ:**
```
cannot be loaded because running scripts is disabled on this system
```

**แก้ไข:**
```powershell
# วิธีที่ 1: อนุญาตเฉพาะ session นี้
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# วิธีที่ 2: ใช้ wrapper .bat แทน
gen-module.bat ordering
```

---

### 7.3 ปัญหา: ชื่อโมดูลไม่ถูกต้อง

**อาการ:**
```
❌ ชื่อโมดูลไม่ถูกต้อง: 'Ordering'
   ต้องขึ้นต้นด้วย a-z ตามด้วย a-z, 0-9, - เท่านั้น (kebab-case)
```

**แก้ไข:**
```bash
# ใช้ kebab-case (ตัวพิมพ์เล็ก)
python gen_module.py ordering          # ✅
python gen_module.py payment-gateway   # ✅
python gen_module.py Ordering          # ❌
python gen_module.py payment_gateway   # ❌ (ใช้ - ไม่ใช่ _)
```

---

### 7.4 ปัญหา: โมดูลมีอยู่แล้ว

**อาการ:**
```
❌ โมดูล 'ordering' มีอยู่แล้วที่: src/modules/ordering
```

**แก้ไข:**
```bash
# ใช้ --force เขียนทับ
python gen_module.py ordering --force

# หรือใช้ชื่ออื่น
python gen_module.py ordering-v2
```

---

### 7.5 ปัญหา: ไฟล์ภาษาไทยแสดงเป็นตัวประหลาด

**สาเหตุ:** Editor ใช้ encoding ผิด

**แก้ไข:**
- ใช้ editor ที่รองรับ UTF-8 (VS Code, IntelliJ, Sublime)
- ตรวจ `File → Encoding → UTF-8`
- Scripts เขียนไฟล์เป็น **UTF-8 ไม่มี BOM** อยู่แล้ว

---

### 7.6 ปัญหา: Dependency Cycle เกิดขึ้น

**อาการ:**
```
⚠️  Cycle detected: ordering → payment → ordering
```

**แก้ไข:**
1. ตรวจว่าโมดูลไหนควรเป็นเจ้าของ business logic
2. ย้าย logic ไปที่ Core
3. ใช้ **Event** แทน **Sync call** ถ้าทำได้
4. ใช้ **Anti-Corruption Layer** (ACL) ถ้าติดต่อ legacy

```
❌ ผิด: Ordering → Payment (sync)
        Payment → Ordering (sync)

✅ ถูก: Ordering → Payment (sync)
        Payment --publish--> PaymentCompleted (event)
        Ordering --subscribe--> PaymentCompleted
```

---

## 8. FAQ

### Q1: ต้องลง library เพิ่มไหม?

**A:** ไม่ต้อง — `gen_module.py` ใช้แค่ standard library ของ Python

### Q2: ใช้กับ TypeScript / Go / Python ได้ไหม?

**A:** ได้ — script แค่สร้าง folder + stub files เท่านั้น ส่วน content ขึ้นกับ Tech Stack ของคุณ

### Q3: จะปรับ LAYERS ได้ไหม?

**A:** ได้ — แก้ตัวแปร `LAYERS` ใน `gen_module.py`:

```python
LAYERS = {
    "domain": ["entities", "value-objects", "aggregates", "events", "repositories", "services"],
    "application": ["use-cases", "dto", "ports"],
    "infrastructure": ["persistence", "messaging", "external"],
    "presentation": ["http", "cli"],
    "public": [],
    "tests": ["unit", "integration", "e2e"],
    # เพิ่ม layer ใหม่ได้
    "integrations": ["stripe", "sendgrid"],
}
```

### Q4: ใช้กับ Monorepo (Nx, Turborepo, Go workspace) ได้ไหม?

**A:** ได้ — แค่เปลี่ยน `--base-path`:

```bash
python gen_module.py ordering -b apps/api/src/modules
python gen_module.py ordering -b packages/ordering/src
```

### Q5: ถ้าอยากเพิ่ม template ใหม่ทำไง?

**A:** แก้ function ใน `gen_module.py`:

```python
def my_custom_file(spec: ModuleSpec) -> str:
    return f"# Custom for {spec.name}\n"

def create_custom(spec, overwrite, dry_run):
    path = spec.path / "CUSTOM.md"
    return write_utf8(path, my_custom_file(spec), overwrite)
```

แล้วเรียกใน `main()`

### Q6: Skill นี้ต่างจาก `12-software-architecture` ยังไง?

| ด้าน | 12-software-architecture | 28-architecture-blueprint |
|---|---|---|
| ขอบเขต | Architecture ทั่วไป | DDD + Clean Arch + Modular |
| Domain | ❌ | ✅ Bounded Context |
| Folder | แนะนำ | ✅ Generate ได้ |
| Dependency Graph | ⚠️ บางส่วน | ✅ Mermaid + Cycle check |
| KPI | ทั่วไป | ✅ Modular/DDD/Clean Arch |

**ใช้คู่กัน:** `28 → 12` (Blueprint → Architecture เจาะลึก)

### Q7: Generate แล้วได้อะไรบ้าง?

```
✅ 18 โฟลเดอร์ (4 layers + public + tests)
✅ 17 ไฟล์ .gitkeep
✅ 1 ไฟล์ public/index.ts (Public API stub)
✅ 1 ไฟล์ README.md (Bounded Context + KPI + Checklist)
= 20 ไฟล์ทั้งหมด
```

---

## 9. Best Practices

### 9.1 ก่อนใช้ Skill

- [ ] ระบุ **Core Domain** ให้ชัด (จุดแข่งธุรกิจ)
- [ ] ตกลง **Ubiquitous Language** กับทีม
- [ ] ตัดสินใจ Tech Stack + Quality Attributes
- [ ] กำหนดขนาดทีม + แผนขยาย

### 9.2 ระหว่าง Generate

- [ ] ใช้ `--dry-run` ก่อนเสมอ
- [ ] ตั้งชื่อโมดูลเป็น **kebab-case** (ตัวพิมพ์เล็ก)
- [ ] ระบุ `--type` ให้ถูก (Core/Supporting/Generic)
- [ ] เขียน `--context` ให้สื่อความหมาย

### 9.3 หลัง Generate

- [ ] เติม **Ubiquitous Language** ใน README
- [ ] เพิ่ม **Entity/Value Object** ใน `domain/`
- [ ] เขียน **Use Case** ใน `application/`
- [ ] Implement **Repository** ใน `infrastructure/`
- [ ] เปิด **Public API** ที่ `public/index.ts`
- [ ] เขียน **Test** ใน `tests/unit/`
- [ ] ตรวจ **Dependency Cycle** (`check_deps.py`)

### 9.4 หลักการจำง่าย

> **"1 Context = 1 Module = 1 Owner"**

- 1 Bounded Context → 1 Module
- 1 Module → 1 ทีมเจ้าของ
- 1 ทีม → 1 Bounded Context

> **"Public API เท่านั้น"**

ข้ามโมดูลต้องผ่าน `public/index.ts` เท่านั้น — ห้าม import internal

> **"Domain บริสุทธิ์"**

Domain layer ห้าม import framework, DB, HTTP — pure business logic

---

## 🎯 Quick Reference

```bash
# ⚡ เริ่มใช้งานเร็ว
cd scripts/
python gen_module.py ordering -t Core -c "Order Management"

# ⚡ หลายโมดูล
python gen_module.py ordering -t Core
python gen_module.py payment -t Supporting
python gen_module.py inventory -t Supporting

# ⚡ Dry-run
python gen_module.py ordering --dry-run

# ⚡ ดู template
python gen_module.py --list-templates

# ⚡ Alias
nm ordering Core
```

```bash
# 🎯 ใน OpenCode
ใช้ skill 28-architecture-blueprint
ระบบ: [ชื่อ]
โดเมน: [ ]
Tech Stack: [ ]
ภาษา: ไทย
```

---

## 📚 อ้างอิง

| เอกสาร | ที่อยู่ |
|---|---|
| Skill Definition | `SKILL.md` |
| Manual (ไฟล์นี้) | `manual.md` |
| Folder Tree | `templates/folder-tree.txt` |
| Script หลัก | `scripts/gen_module.py` |
| ตรวจ Dependency | `scripts/check_deps.py` |

---

## 📞 ต้องการความช่วยเหลือ

1. อ่าน **Troubleshooting** (ส่วนที่ 7)
2. ตรวจ **FAQ** (ส่วนที่ 8)
3. รัน `python gen_module.py --help`
4. เปิด issue ใน OpenCode

---

**เวอร์ชัน:** 1.0.0  
**อัปเดต:** 2026-10-15  
**ผู้เขียน:** AI Prompt Template Pack