# 🏗️ Flow + โครงสร้าง Folder: DDD + Clean Architecture + Modular

รวม 3 Skills เข้าด้วยกันเป็น **Reference สำหรับออกแบบระบบ**

- `16-ddd` → ออกแบบ **โดเมน** (Business Logic)
- `17-clean-architecture` → ออกแบบ **ชั้น** (Layered)
- `24-modular` → ออกแบบ **โมดูล** (Loose Coupling)

---

## 🔗 ความสัมพันธ์ของ 3 แนวคิด

```
┌────────────────────────────────────────────────────────────┐
│                     MODULAR (24)                           │
│         แบ่งระบบเป็นโมดูลอิสระ (Loose Coupling)            │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │  Module A    │  │  Module B    │  │  Module C    │      │
│  │  (Bounded    │  │  (Bounded    │  │  (Bounded    │      │
│  │   Context)   │  │   Context)   │  │   Context)   │      │
│  │              │  │              │  │              │      │
│  │  ┌────────┐  │  │  ┌────────┐  │  │  ┌────────┐  │      │
│  │  │  DDD   │  │  │  │  DDD   │  │  │  │  DDD   │  │      │
│  │  │ (16)   │  │  │  │ (16)   │  │  │  │ (16)   │  │      │
│  │  └────────┘  │  │  └────────┘  │  │  └────────┘  │      │
│  │  ┌────────┐  │  │  ┌────────┐  │  │  ┌────────┐  │      │
│  │  │ Clean  │  │  │  │ Clean  │  │  │  │ Clean  │  │      │
│  │  │ Arch   │  │  │  │ Arch   │  │  │  │ Arch   │  │      │
│  │  │ (17)   │  │  │  │ (17)   │  │  │  │ (17)   │  │      │
│  │  └────────┘  │  │  └────────┘  │  │  └────────┘  │      │
│  └──────────────┘  └──────────────┘  └──────────────┘      │
└────────────────────────────────────────────────────────────┘
```

**หลักการ:**
- **Modular (24)** = กรอบใหญ่ → แบ่งระบบเป็นโมดูล
- **DDD (16)** = ออกแบบภายในโมดูล → Bounded Context, Aggregate
- **Clean Arch (17)** = จัดชั้นภายในโมดูล → Entities → Use Cases → Adapters → Frameworks

---

## 🔄 Flow การทำงาน 7 ขั้น (จากบนลงล่าง)

```
┌─────────────────────────────────────────────────────────────┐
│  STEP 1: วิเคราะห์โดเมน (Domain Discovery)                 │
│  → ค้นหา Domain / Subdomain / Bounded Context              │
│  → ใช้: 16-ddd                                              │
└────────────────────────┬────────────────────────────────────┘
                         ▼
┌─────────────────────────────────────────────────────────────┐
│  STEP 2: แบ่งโมดูล (Modularization)                        │
│  → 1 Bounded Context ≈ 1 Module                            │
│  → กำหนด Interface / Contract ระหว่างโมดูล                 │
│  → ใช้: 24-modular                                          │
└────────────────────────┬────────────────────────────────────┘
                         ▼
┌─────────────────────────────────────────────────────────────┐
│  STEP 3: ออกแบบภายในโมดูล (Clean Architecture)             │
│  → Entities → Use Cases → Adapters → Frameworks            │
│  → ใช้: 17-clean-architecture                               │
└────────────────────────┬────────────────────────────────────┘
                         ▼
┌─────────────────────────────────────────────────────────────┐
│  STEP 4: กำหนด Ubiquitous Language + Aggregate             │
│  → Entity, Value Object, Aggregate Root, Domain Event      │
│  → ใช้: 16-ddd                                              │
└────────────────────────┬────────────────────────────────────┘
                         ▼
┌─────────────────────────────────────────────────────────────┐
│  STEP 5: วาง Dependency Graph                              │
│  → ห้าม Cycle, ตรวจ Coupling / Cohesion                    │
│  → ใช้: 24-modular                                          │
└────────────────────────┬────────────────────────────────────┘
                         ▼
┌─────────────────────────────────────────────────────────────┐
│  STEP 6: ออกแบบการสื่อสารระหว่างโมดูล                      │
│  → API / Event / Shared Kernel                             │
│  → ใช้: 16-ddd (Context Mapping) + 24-modular              │
└────────────────────────┬────────────────────────────────────┘
                         ▼
┌─────────────────────────────────────────────────────────────┐
│  STEP 7: สร้างโครงสร้าง Folder + ทดสอบ                     │
│  → 1 Module = 1 Package/Folder                             │
│  → Unit Test แยกโมดูลได้                                   │
│  → ใช้: 17 + 24                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 📁 โครงสร้าง Folder (Monorepo แบบ Modular + DDD + Clean)

```text
project-root/
├── README.md
├── package.json (หรือ pom.xml / go.mod / Cargo.toml)
├── docker-compose.yml
├── .env.example
│
├── docs/
│   ├── domain-map.md              # Bounded Context Map
│   ├── dependency-graph.md        # ห้ามมี cycle
│   ├── ubiquitous-language.md     # คำศัพท์ธุรกิจ
│   └── adr/                       # Architecture Decision Records
│       ├── 001-why-modular.md
│       ├── 002-why-ddd.md
│       └── 003-why-clean-arch.md
│
├── src/
│   ├── shared/                    # Shared Kernel
│   │   ├── kernel/                # Primitive types, Result, Guard
│   │   ├── contracts/             # Interface ข้ามโมดูล
│   │   └── infra/                 # Logger, Config, DB pool
│   │
│   ├── modules/                   # ⬅️ MODULAR (24)
│   │   │
│   │   ├── ordering/              # 1 Module = 1 Bounded Context
│   │   │   ├── README.md
│   │   │   ├── package.json
│   │   │   │
│   │   │   ├── domain/            # ⬅️ DDD (16) + Clean Layer 1
│   │   │   │   ├── entities/
│   │   │   │   │   ├── Order.ts
│   │   │   │   │   └── OrderItem.ts
│   │   │   │   ├── value-objects/
│   │   │   │   │   ├── OrderId.ts
│   │   │   │   │   ├── Money.ts
│   │   │   │   │   └── Address.ts
│   │   │   │   ├── aggregates/
│   │   │   │   │   └── OrderAggregate.ts
│   │   │   │   ├── events/
│   │   │   │   │   ├── OrderPlaced.ts
│   │   │   │   │   └── OrderCancelled.ts
│   │   │   │   ├── repositories/  # Interface เท่านั้น
│   │   │   │   │   └── OrderRepository.ts
│   │   │   │   └── services/      # Domain Services
│   │   │   │       └── PricingService.ts
│   │   │   │
│   │   │   ├── application/       # ⬅️ Clean Layer 2 (Use Cases)
│   │   │   │   ├── use-cases/
│   │   │   │   │   ├── PlaceOrder.ts
│   │   │   │   │   ├── CancelOrder.ts
│   │   │   │   │   └── GetOrderById.ts
│   │   │   │   ├── dto/
│   │   │   │   │   ├── PlaceOrderInput.ts
│   │   │   │   │   └── OrderOutput.ts
│   │   │   │   └── ports/         # Interface ของ external
│   │   │   │       └── PaymentGateway.ts
│   │   │   │
│   │   │   ├── infrastructure/    # ⬅️ Clean Layer 3 (Adapters)
│   │   │   │   ├── persistence/
│   │   │   │   │   ├── OrderRepositoryImpl.ts
│   │   │   │   │   └── OrderMapper.ts
│   │   │   │   ├── messaging/
│   │   │   │   │   └── OrderEventPublisher.ts
│   │   │   │   └── external/
│   │   │   │       └── StripePaymentAdapter.ts
│   │   │   │
│   │   │   ├── presentation/      # ⬅️ Clean Layer 4 (Frameworks)
│   │   │   │   ├── http/
│   │   │   │   │   ├── OrderController.ts
│   │   │   │   │   └── routes.ts
│   │   │   │   └── cli/
│   │   │   │       └── orderCommand.ts
│   │   │   │
│   │   │   ├── public/            # ⬅️ Public API ของโมดูล
│   │   │   │   ├── index.ts       # Export เฉพาะที่ควรเปิด
│   │   │   │   └── events.ts      # Domain events ที่เปิดให้ subscribe
│   │   │   │
│   │   │   └── tests/
│   │   │       ├── unit/
│   │   │       ├── integration/
│   │   │       └── e2e/
│   │   │
│   │   ├── payment/               # Module 2 (Bounded Context)
│   │   │   ├── domain/
│   │   │   ├── application/
│   │   │   ├── infrastructure/
│   │   │   ├── presentation/
│   │   │   ├── public/
│   │   │   └── tests/
│   │   │
│   │   ├── inventory/             # Module 3
│   │   │   └── ... (โครงเดียวกัน)
│   │   │
│   │   ├── shipping/              # Module 4
│   │   │   └── ...
│   │   │
│   │   └── customer/              # Module 5
│   │       └── ...
│   │
│   └── apps/                      # ⬅️ Composition Root
│       ├── api/                   # REST API (ประกอบทุกโมดูล)
│       │   ├── main.ts
│       │   └── container.ts       # DI container
│       ├── worker/                # Background jobs
│       │   └── main.ts
│       └── web/                   # Frontend (ถ้ามี)
│           └── ...
│
├── libs/                          # Library ที่แชร์ได้ (ถ้ามี)
│   ├── logging/
│   └── testing-utils/
│
├── scripts/
│   ├── check-deps.ts              # ตรวจ dependency cycle
│   ├── check-boundaries.ts        # ตรวจว่าโมดูลไม่ข้ามขอบเขต
│   └── gen-module.ts              # สร้างโมดูลใหม่จาก template
│
└── tests/
    ├── contract/                  # ทดสอบ contract ระหว่างโมดูล
    └── e2e/                       # ทดสอบทั้งระบบ
```

---

## 🔍 Flow การพึ่งพา (Dependency Rule)

```
                    ┌──────────────┐
                    │ presentation │  (HTTP / CLI / UI)
                    └──────┬───────┘
                           │ depends on
                           ▼
                    ┌──────────────┐
                    │infrastructure│  (DB / API / Message)
                    └──────┬───────┘
                           │ implements ports
                           ▼
                    ┌──────────────┐
                    │ application  │  (Use Cases)
                    └──────┬───────┘
                           │ depends on
                           ▼
                    ┌──────────────┐
                    │    domain    │  (Entities, VO, Aggregates)
                    └──────────────┘
                     ▲ Pure, ไม่พึ่งอะไร
```

**กฎเหล็ก:**
- ⬇️ Layer บน → พึ่ง Layer ล่าง ✅
- ⬆️ Layer ล่าง → ห้ามพึ่ง Layer บน ❌
- 🔄 ห้ามมี Cycle ระหว่างโมดูล ❌
- 🌐 ข้ามโมดูล → ผ่าน `public/` เท่านั้น ✅

---

## 🔀 Flow การสื่อสารระหว่างโมดูล

```
┌──────────┐    Sync (API/Port)      ┌──────────┐
│ Ordering │ ───────────────────────▶│ Payment  │
│  Module  │◀─────────────────────── │  Module  │
└────┬─────┘    Response             └────┬─────┘
     │                                    │
     │ Async (Domain Event)               │
     ▼                                    ▼
┌──────────────────────────────────────────────┐
│            Event Bus (Kafka / RabbitMQ)      │
└──────────────────────────────────────────────┘
     │                                    │
     ▼                                    ▼
┌──────────┐                        ┌──────────┐
│ Inventory│                        │ Shipping │
│  Module  │                        │  Module  │
└──────────┘                        └──────────┘
```

**3 รูปแบบการสื่อสาร:**

| รูปแบบ | ใช้เมื่อ | ตัวอย่าง |
|---|---|---|
| **Sync API** | ต้องการผลทันที | Order → Payment (charge) |
| **Async Event** | ไม่ต้องรอ, eventual consistency | Order → Inventory (reserve) |
| **Shared Kernel** | โครงสร้างพื้นฐาน | Money, Result, Guard |

---

## 📊 Context Map (DDD + Modular)

```
        ┌─────────────┐         ┌─────────────┐
        │  Ordering   │◀───ACL──│   Legacy    │
        │  (Core)     │         │   System    │
        └──────┬──────┘         └─────────────┘
               │
               │ Customer/Supplier
               ▼
        ┌─────────────┐         ┌─────────────┐
        │  Payment    │◀───OHS──│  Shipping   │
        │ (Support)   │         │  (Generic)  │
        └─────────────┘         └─────────────┘

ACL = Anti-Corruption Layer
OHS = Open Host Service
```

---

## 🎯 KPI วัดคุณภาพการออกแบบ

| KPI | คำอธิบาย | เป้าหมาย |
|---|---|---|
| **Modularity** | | |
| Coupling Score | จำนวน dependency ข้ามโมดูล | ↓ |
| Cohesion Score | ความเกี่ยวเนื่องภายในโมดูล | ↑ |
| Cycle Count | จำนวน dependency cycle | 0 |
| Change Impact | ไฟล์ที่กระทบเมื่อแก้ 1 โมดูล | ≤ 5 |
| **DDD** | | |
| Ubiquitous Language Coverage | % โค้ดที่ใช้คำจาก UL | ≥ 90% |
| Aggregate Size | จำนวน Entity ต่อ Aggregate | ≤ 5 |
| Bounded Context Count | จำนวน Context ที่ชัดเจน | 3–7 |
| **Clean Arch** | | |
| Dependency Rule Violations | จำนวนครั้งที่ฝ่าฝืน | 0 |
| Test Coverage (Domain) | % test ของ domain layer | ≥ 90% |
| Framework Coupling | จำนวน import framework ใน domain | 0 |

---

## 🛠️ ตัวอย่างการเรียกใช้ Skill

```bash
# ออกแบบทั้งระบบ
ใช้ skill 16-ddd + 17-clean-architecture + 24-modular
ระบบ: E-commerce Platform
โดเมน: Ordering, Payment, Inventory, Shipping, Customer
Tech Stack: Node.js + TypeScript + PostgreSQL + Kafka
ข้อจำกัด: 5 ทีม, ขยายเป็น microservices ได้ในอนาคต

# ผลลัพธ์ที่ได้:
# 1. Domain Map + Bounded Contexts
# 2. Module Map + Interfaces
# 3. Dependency Graph (ไม่มี cycle)
# 4. โครงสร้าง Folder ต่อโมดูล
# 5. Flow การสื่อสาร (Sync + Async)
# 6. KPI วัดคุณภาพ
```

---

## 📋 Checklist รวม 3 แนวคิด

### ✅ DDD (16)
- [ ] ระบุ Domain / Subdomain / Bounded Context
- [ ] มี Ubiquitous Language
- [ ] ระบุ Entity / Value Object / Aggregate
- [ ] มี Domain Events
- [ ] มี Context Map (ACL, OHS, Shared Kernel)

### ✅ Clean Architecture (17)
- [ ] แยก 4 Layer: Entities → Use Cases → Adapters → Frameworks
- [ ] Domain layer ไม่พึ่ง framework
- [ ] Dependency ชี้เข้าด้านในเท่านั้น
- [ ] Repository เป็น interface ใน domain
- [ ] Implementation อยู่ใน infrastructure

### ✅ Modular (24)
- [ ] 1 Bounded Context = 1 Module
- [ ] Loose Coupling / High Cohesion
- [ ] ไม่มี Dependency Cycle
- [ ] เปิดเฉพาะ `public/` ให้โมดูลอื่นใช้
- [ ] ทดสอบแยกโมดูลได้

---

## 🚀 สรุป 5 บรรทัด

1. **Modular (24)** = กรอบใหญ่ แบ่งระบบเป็นโมดูลอิสระ
2. **DDD (16)** = ออกแบบภายในโมดูลด้วย Bounded Context + Aggregate
3. **Clean Arch (17)** = จัดชั้นในโมดูล เป็น 4 layer
4. **Flow:** Domain → Module → Layer → Dependency Graph → Communication → Folder
5. **KPI หลัก:** Cycle = 0, Change Impact ≤ 5, Domain Test ≥ 90%

---