<#
.SYNOPSIS
    สร้างโมดูลใหม่ตาม Architecture Blueprint (DDD + Clean Architecture + Modular)

.DESCRIPTION
    Script นี้จะสร้างโครงสร้างโฟลเดอร์สำหรับโมดูลใหม่
    ตามมาตรฐาน 4 Layers: domain / application / infrastructure / presentation
    พร้อม public/ (Public API) และ tests/

.PARAMETER ModuleName
    ชื่อโมดูล (ภาษาอังกฤษ, kebab-case แนะนำ) เช่น ordering, payment, inventory

.PARAMETER BasePath
    Path หลักของโปรเจกต์ (default: .\src\modules)

.PARAMETER BoundedContext
    ชื่อ Bounded Context (default: เท่ากับ ModuleName)

.PARAMETER ContextType
    ประเภท: Core / Supporting / Generic (default: Supporting)

.PARAMETER Force
    เขียนทับโมดูลเดิมถ้ามีอยู่แล้ว

.EXAMPLE
    .\gen-module.ps1 ordering
    สร้างโมดูล ordering ที่ .\src\modules\ordering

.EXAMPLE
    .\gen-module.ps1 payment -ContextType Core -BoundedContext "Payment Processing"

.EXAMPLE
    .\gen-module.ps1 inventory -BasePath "C:\Projects\MyApp\src\modules" -Force

.NOTES
    Author: AI Prompt Template Pack
    Version: 1.0.0
    Compatible: Windows PowerShell 5.1+ / PowerShell 7+
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [ValidatePattern('^[a-z][a-z0-9-]*$')]
    [string]$ModuleName,

    [Parameter(Mandatory = $false)]
    [string]$BasePath = ".\src\modules",

    [Parameter(Mandatory = $false)]
    [string]$BoundedContext,

    [Parameter(Mandatory = $false)]
    [ValidateSet('Core', 'Supporting', 'Generic')]
    [string]$ContextType = 'Supporting',

    [Parameter(Mandatory = $false)]
    [switch]$Force
)

# ============================================================
# ตั้งค่า
# ============================================================
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

if (-not $BoundedContext) {
    $BoundedContext = $ModuleName
}

$ModulePath = Join-Path $BasePath $ModuleName

# ============================================================
# ฟังก์ชันช่วย
# ============================================================
function Write-Step {
    param([string]$Message, [string]$Color = 'Cyan')
    Write-Host "  → $Message" -ForegroundColor $Color
}

function Write-Success {
    param([string]$Message)
    Write-Host "  ✅ $Message" -ForegroundColor Green
}

function Write-Warn {
    param([string]$Message)
    Write-Host "  ⚠️  $Message" -ForegroundColor Yellow
}

function Write-Err {
    param([string]$Message)
    Write-Host "  ❌ $Message" -ForegroundColor Red
}

function New-DirectorySafe {
    param([string]$Path)
    if (-not (Test-Path $Path)) {
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
    }
}

function Write-FileIfNotExists {
    param(
        [string]$Path,
        [string]$Content,
        [switch]$Overwrite
    )
    if ((Test-Path $Path) -and (-not $Overwrite)) {
        Write-Warn "มีไฟล์อยู่แล้ว ข้าม: $Path"
        return
    }
    $dir = Split-Path $Path -Parent
    if ($dir -and -not (Test-Path $dir)) {
        New-DirectorySafe -Path $dir
    }
    # ใช้ UTF-8 ไม่มี BOM
    $utf8NoBom = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText($Path, $Content, $utf8NoBom)
}

# ============================================================
# Header
# ============================================================
Write-Host ""
Write-Host "╔══════════════════════════════════════════════════════╗" -ForegroundColor Magenta
Write-Host "║  🏛️  Architecture Blueprint — Module Generator       ║" -ForegroundColor Magenta
Write-Host "║      DDD + Clean Architecture + Modular              ║" -ForegroundColor Magenta
Write-Host "╚══════════════════════════════════════════════════════╝" -ForegroundColor Magenta
Write-Host ""
Write-Host "📦 Module:          $ModuleName" -ForegroundColor White
Write-Host "🏷️  Bounded Context: $BoundedContext" -ForegroundColor White
Write-Host "🎯 Type:            $ContextType" -ForegroundColor White
Write-Host "📁 Path:            $ModulePath" -ForegroundColor White
Write-Host ""

# ============================================================
# ตรวจสอบโมดูลเดิม
# ============================================================
if (Test-Path $ModulePath) {
    if (-not $Force) {
        Write-Err "โมดูล '$ModuleName' มีอยู่แล้วที่: $ModulePath"
        Write-Host ""
        Write-Host "  ใช้ -Force เพื่อเขียนทับ หรือเลือกชื่ออื่น" -ForegroundColor Yellow
        exit 1
    }
    Write-Warn "โมดูลมีอยู่แล้ว — กำลังเขียนทับด้วย -Force"
    Write-Host ""
}

# ============================================================
# 1) สร้างโครงสร้างโฟลเดอร์
# ============================================================
Write-Host "📂 [1/5] สร้างโครงสร้างโฟลเดอร์..." -ForegroundColor Cyan

$folders = @(
    # domain (DDD + Clean Layer 1)
    "domain\entities",
    "domain\value-objects",
    "domain\aggregates",
    "domain\events",
    "domain\repositories",
    "domain\services",
    # application (Clean Layer 2)
    "application\use-cases",
    "application\dto",
    "application\ports",
    # infrastructure (Clean Layer 3)
    "infrastructure\persistence",
    "infrastructure\messaging",
    "infrastructure\external",
    # presentation (Clean Layer 4)
    "presentation\http",
    "presentation\cli",
    # public API
    "public",
    # tests
    "tests\unit",
    "tests\integration",
    "tests\e2e"
)

foreach ($folder in $folders) {
    $fullPath = Join-Path $ModulePath $folder
    New-DirectorySafe -Path $fullPath
    Write-Step $folder
}

Write-Success "สร้างโฟลเดอร์ทั้งหมด $($folders.Count) รายการ"
Write-Host ""

# ============================================================
# 2) สร้างไฟล์ .gitkeep (สำหรับโฟลเดอร์ว่าง)
# ============================================================
Write-Host "📌 [2/5] สร้าง .gitkeep..." -ForegroundColor Cyan

$gitkeepFolders = @(
    "domain\entities",
    "domain\value-objects",
    "domain\aggregates",
    "domain\events",
    "domain\repositories",
    "domain\services",
    "application\use-cases",
    "application\dto",
    "application\ports",
    "infrastructure\persistence",
    "infrastructure\messaging",
    "infrastructure\external",
    "presentation\http",
    "presentation\cli",
    "tests\unit",
    "tests\integration",
    "tests\e2e"
)

foreach ($folder in $gitkeepFolders) {
    $gitkeepPath = Join-Path $ModulePath "$folder\.gitkeep"
    if (-not (Test-Path $gitkeepPath)) {
        New-Item -ItemType File -Path $gitkeepPath -Force | Out-Null
    }
}

Write-Success "สร้าง .gitkeep เรียบร้อย"
Write-Host ""

# ============================================================
# 3) สร้างไฟล์ public/index.ts (Public API)
# ============================================================
Write-Host "🔌 [3/5] สร้าง Public API..." -ForegroundColor Cyan

$publicApiContent = @"
// ============================================================
// Public API ของโมดูล: $ModuleName
// Bounded Context: $BoundedContext
// Type: $ContextType
// ============================================================
// ⚠️  โมดูลอื่น import ได้เฉพาะไฟล์ใน public/ เท่านั้น
// ⚠️  ห้าม import จาก domain/ application/ infrastructure/ presentation/ โดยตรง
// ============================================================

// --- Commands ---
// export { PlaceOrder } from '../application/use-cases/PlaceOrder';
// export { CancelOrder } from '../application/use-cases/CancelOrder';

// --- Queries ---
// export { GetOrderById } from '../application/use-cases/GetOrderById';

// --- DTOs ---
// export type { PlaceOrderInput } from '../application/dto/PlaceOrderInput';
// export type { OrderOutput } from '../application/dto/OrderOutput';

// --- Domain Events (เปิดให้โมดูลอื่น subscribe) ---
// export { OrderPlaced } from '../domain/events/OrderPlaced';
// export { OrderCancelled } from '../domain/events/OrderCancelled';

// --- Public Types ---
// export type { OrderId } from '../domain/value-objects/OrderId';
"@

$publicApiPath = Join-Path $ModulePath "public\index.ts"
Write-FileIfNotExists -Path $publicApiPath -Content $publicApiContent -Overwrite:$Force
Write-Step "public/index.ts"
Write-Success "สร้าง Public API เรียบร้อย"
Write-Host ""

# ============================================================
# 4) สร้าง README.md ของโมดูล
# ============================================================
Write-Host "📝 [4/5] สร้าง README.md..." -ForegroundColor Cyan

$readmeContent = @"
# 📦 Module: $ModuleName

> **Bounded Context:** $BoundedContext  
> **Type:** $ContextType  
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
- ``[commandName]`` — [คำอธิบาย]

### Queries
- ``[queryName]`` — [คำอธิบาย]

### Events (publish)
- ``[EventName]`` — [คำอธิบาย]

### Events (subscribe)
- ``[EventName]`` จาก [module-name]

---

## 📥 Dependencies (พึ่งโมดูลอื่น)

| โมดูล | ประเภท | เหตุผล |
|---|---|---|
| [module-a] | Sync API | [เหตุผล] |
| [module-b] | Async Event | [เหตุผล] |

> ⚠️  ห้าม import จาก internal ของโมดูลอื่น — ใช้ ``public/`` เท่านั้น

---

## 📤 Data Ownership

| Storage | Table/Collection | คำอธิบาย |
|---|---|---|
| PostgreSQL | ``$ModuleName`` | [คำอธิบาย] |

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

- ``tests/unit/`` — ทดสอบ domain logic (ไม่ต้อง DB)
- ``tests/integration/`` — ทดสอบกับ DB/API จริง
- ``tests/e2e/`` — ทดสอบทั้ง flow

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

\`\`\`
$ModuleName/
├── domain/          # ⬅️ DDD — Entities, VO, Aggregates, Events
│   ├── entities/
│   ├── value-objects/
│   ├── aggregates/
│   ├── events/
│   ├── repositories/   (interface only)
│   └── services/
├── application/     # ⬅️ Clean Layer 2 — Use Cases
│   ├── use-cases/
│   ├── dto/
│   └── ports/
├── infrastructure/  # ⬅️ Clean Layer 3 — Adapters
│   ├── persistence/
│   ├── messaging/
│   └── external/
├── presentation/    # ⬅️ Clean Layer 4 — Frameworks
│   ├── http/
│   └── cli/
├── public/          # ⬅️ Public API (เปิดให้โมดูลอื่น)
└── tests/
    ├── unit/
    ├── integration/
    └── e2e/
\`\`\`

---

## 📚 อ้างอิง

- Skill: ``28-architecture-blueprint``
- Related: ``16-ddd``, ``17-clean-architecture``, ``24-modular``
"@

$readmePath = Join-Path $ModulePath "README.md"
Write-FileIfNotExists -Path $readmePath -Content $readmeContent -Overwrite:$Force
Write-Step "README.md"
Write-Success "สร้าง README.md เรียบร้อย"
Write-Host ""

# ============================================================
# 5) สรุป
# ============================================================
Write-Host "📊 [5/5] สรุป..." -ForegroundColor Cyan
Write-Host ""

# นับไฟล์และโฟลเดอร์
$allFiles = Get-ChildItem -Path $ModulePath -Recurse -File | Measure-Object
$allFolders = Get-ChildItem -Path $ModulePath -Recurse -Directory | Measure-Object

Write-Host "╔══════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║  ✅ สร้างโมดูลสำเร็จ                                  ║" -ForegroundColor Green
Write-Host "╚══════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "📦 Module:       $ModuleName" -ForegroundColor White
Write-Host "📁 Path:         $ModulePath" -ForegroundColor White
Write-Host "📂 Folders:      $($allFolders.Count)" -ForegroundColor White
Write-Host "📄 Files:        $($allFiles.Count)" -ForegroundColor White
Write-Host ""

Write-Host "📋 ขั้นตอนถัดไป:" -ForegroundColor Yellow
Write-Host "   1. เปิด README.md เพื่อกรอก Ubiquitous Language + Dependencies" -ForegroundColor Gray
Write-Host "   2. เพิ่ม Entity/Value Object ใน domain/entities, domain/value-objects" -ForegroundColor Gray
Write-Host "   3. สร้าง Use Case ใน application/use-cases" -ForegroundColor Gray
Write-Host "   4. Implement Repository ใน infrastructure/persistence" -ForegroundColor Gray
Write-Host "   5. เปิด Public API ที่ public/index.ts" -ForegroundColor Gray
Write-Host "   6. เขียน Test ใน tests/unit" -ForegroundColor Gray
Write-Host ""

Write-Host "🔍 ตรวจสอบ Dependency Cycle:" -ForegroundColor Yellow
Write-Host "   npx depcruise --validate .dependency-cruiser.js src/" -ForegroundColor Gray
Write-Host ""

Write-Host "🎉 เสร็จสิ้น!" -ForegroundColor Magenta
Write-Host ""

# เปิด folder อัตโนมัติ (Windows)
if ($IsWindows -or $env:OS -eq 'Windows_NT') {
    try {
        Start-Process explorer.exe -ArgumentList (Resolve-Path $ModulePath).Path -ErrorAction SilentlyContinue
    } catch {
        # ไม่เป็นไรถ้าเปิดไม่ได้
    }
}