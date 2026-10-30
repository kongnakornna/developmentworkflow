# 📘 เล่มที่ 4: สถาปัตยกรรมซอฟต์แวร์ (Software Architecture)

---

# บทที่ 1: Software Architecture Principles

## 1. บทนำ

Software Architecture คือ "กระดูกสันหลัง" ของระบบซอฟต์แวร์ทุกตัว การตัดสินใจเชิงสถาปัตยกรรมในวันแรกๆ ของโปรเจกต์ จะส่งผลต่อความสำเร็จหรือความล้มเหลวของระบบไปอีก 5-10 ปีข้างหน้า บริษัทจำนวนมากล้มเหลวไม่ใช่เพราะโค้ดไม่ดี แต่เพราะสถาปัตยกรรมไม่รองรับการเปลี่ยนแปลง

บทนี้จะพาคุณเข้าใจหลักการพื้นฐานของ Software Architecture ตั้งแต่คำนิยาม ไปจนถึง Quality Attributes, Architecture Decision Records (ADR), และวิธีประเมินสถาปัตยกรรม

## 2. บทนิยาม

**Software Architecture** หมายถึง ชุดของการตัดสินใจเชิงโครงสร้างที่กำหนดว่า ระบบจะถูกแบ่งออกเป็นส่วนใดบ้าง ส่วนเหล่านั้นสื่อสารกันอย่างไร และมีข้อจำกัดอะไรที่ต้องเคารพ

**คำนิยามของ Ralph Johnson:**
> "Architecture is the decisions that you wish you could get right early in a project."

**คำนิยามของ Martin Fowler:**
> "Architecture is about the important stuff. Whatever that is."

**คำนิยามของ IEEE 1471:**
> "Architecture is the fundamental organization of a system, embodied in its components, their relationships to each other and the environment, and the principles governing its design and evolution."

**องค์ประกอบของ Architecture:**

| องค์ประกอบ | ความหมาย | ตัวอย่าง |
|-----------|----------|----------|
| **Structure** | การแบ่งส่วน | Layers, Modules, Services |
| **Behavior** | การปฏิสัมพันธ์ | API, Events, Messages |
| **Constraints** | ข้อจำกัด | Latency, Security |
| **Rationale** | เหตุผล | ADR, Design Docs |
| **Quality Attributes** | คุณภาพ | Scalability, Maintainability |

## 3. บทหัวข้อ

### 3.1 Software Architecture Principles คืออะไร

หลักการสำคัญ 10 ประการ:

| # | หลักการ | ความหมาย |
|---|---------|----------|
| 1 | **Separation of Concerns** | แยกความรับผิดชอบ |
| 2 | **Single Responsibility** | 1 Module = 1 หน้าที่ |
| 3 | **Loose Coupling** | ลดการพึ่งพา |
| 4 | **High Cohesion** | รวมสิ่งที่เกี่ยวข้อง |
| 5 | **Abstraction** | ซ่อนความซับซ้อน |
| 6 | **Encapsulation** | ซ่อน Implementation |
| 7 | **Dependency Inversion** | ขึ้นกับ Abstraction |
| 8 | **Interface Segregation** | Interface เล็กดีกว่าใหญ่ |
| 9 | **Law of Demeter** | อย่าคุยกับคนแปลกหน้า |
| 10 | **YAGNI** | อย่าทำเกินจำเป็น |

**Quality Attributes (ISO 25010):**

| กลุ่ม | Attributes |
|-------|-----------|
| **Functional Suitability** | Completeness, Correctness |
| **Performance** | Time Behavior, Resource Usage |
| **Compatibility** | Co-existence, Interoperability |
| **Usability** | Learnability, Operability |
| **Reliability** | Availability, Fault Tolerance |
| **Security** | Confidentiality, Integrity |
| **Maintainability** | Modularity, Testability |
| **Portability** | Adaptability, Installability |

**Architecture Decision Record (ADR):**

```markdown
# ADR-001: ใช้ PostgreSQL แทน MongoDB

## Status
Accepted

## Context
ระบบต้องเก็บข้อมูล Transactional ที่ต้องการ ACID
ทีมมีประสบการณ์ PostgreSQL 5 ปี

## Decision
ใช้ PostgreSQL 16 เป็น Primary Database

## Consequences
### Positive
- ACID Transactions
- Strong Consistency
- Team Expertise

### Negative
- Schema Migration ซับซ้อน
- Horizontal Scaling ยากกว่า

## Alternatives Considered
- MongoDB: ไม่มี ACID ที่เพียงพอ
- MySQL: ทีมไม่คุ้นเคย
```

### 3.2 ทำงานอย่างไร

**Architecture Process:**

```
Requirements → Quality Attributes → Architecture Vision
     ↓                                      ↓
Constraints ←──── Feedback ────→ Design Decisions
     ↓                                      ↓
Implementation → Review → Evolution ←──────┘
```

**Quality Attribute Workshop (QAW):**

```
1. ระบุ Quality Attributes ที่สำคัญ
2. สร้าง Quality Attribute Scenarios
3. จัดลำดับความสำคัญ
4. ออกแบบ Tactics
5. ประเมิน Trade-offs
```

**ตัวอย่าง Quality Attribute Scenario:**

```
Source:    ผู้ใช้
Stimulus:  เปิดหน้า Feed
Artifact:  Feed Service
Environment: Peak Load (3,600 QPS)
Response:  ส่ง Feed กลับ
Measure:   P99 < 200ms
```

**Architecture Tactics:**

| Quality | Tactics |
|---------|---------|
| **Performance** | Caching, Load Balancing, Async |
| **Availability** | Redundancy, Failover, Circuit Breaker |
| **Modifiability** | Modularity, Encapsulation, Interface |
| **Security** | Authentication, Authorization, Encryption |
| **Testability** | DI, Interface, Mock |
| **Scalability** | Sharding, Partitioning, Async |

### 3.3 การใช้งาน

**เมื่อต้องทำ Architecture:**

1. **Greenfield Project** — เริ่มจากศูนย์
2. **Major Refactor** — ระบบเดิมรองรับไม่ไหว
3. **Acquisition** — รวมระบบ
4. **Scale-Out** — ขยายระบบ
5. **Compliance** — ข้อกำหนดทางกฎหมาย

**Architecture Levels:**

| Level | ขอบเขต | ตัวอย่าง |
|-------|--------|----------|
| Enterprise | ทั้งองค์กร | IT Strategy |
| Solution | ระบบ | E-Commerce Platform |
| Application | App เดียว | Order Service |
| Component | Module | Payment Module |

### 3.4 ข้อดี

- ✅ **Shared Vision** — ทีมเข้าใจตรงกัน
- ✅ **Informed Decisions** — ตัดสินใจบนข้อมูล
- ✅ **Risk Mitigation** — ลดความเสี่ยง
- ✅ **Cost Optimization** — ใช้ทรัพยากรคุ้มค่า
- ✅ **Maintainability** — บำรุงรักษาง่าย
- ✅ **Onboarding** — พนักงานใหม่เข้าใจเร็ว

### 3.5 ข้อเสีย

- ❌ **Analysis Paralysis** — คิดมากเกิน
- ❌ **Over-Engineering** — ออกแบบเกินจำเป็น
- ❌ **Upfront Cost** — ลงทุนช่วงแรกสูง
- ❌ **Resistance** — ทีมต่อต้าน
- ❌ **Maintenance** — ต้องอัปเดตเอกสาร

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- อย่าเลือก Architecture ตามกระแส
- อย่าละเลย Non-Functional Requirements
- อย่าออกแบบโดยไม่มี Context
- ระวัง Architecture Astronaut

**ข้อห้าม:**
- ❌ ห้าม Copy Architecture โดยไม่เข้าใจ
- ❌ ห้าม Ignore Team Skills
- ❌ ห้าม Over-Engineer สำหรับ Startup
- ❌ ห้าม Under-Engineer สำหรับ Enterprise
- ❌ ห้าม Ignore Cost

**ข้อจำกัด:**
- Architecture ไม่ใช่ One-Size-Fits-All
- ต้อง Evolve ตามเวลา
- ต้อง Balance ระหว่าง Idealism vs Pragmatism
- ต้องพิจารณา Team, Budget, Timeline

### 3.7 สรุป

Software Architecture เป็นการตัดสินใจที่สำคัญ ต้องมีหลักการ มีเหตุผล และต้อง Evolve ได้

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

**4+1 Architectural View Model (Philippe Kruchten):**

```
                ┌─────────────┐
                │  Scenarios  │
                │  (Use Cases)│
                └──────┬──────┘
                       │
        ┌──────────────┼──────────────┐
        ▼              ▼              ▼
   ┌─────────┐   ┌─────────┐   ┌─────────┐
   │ Logical │   │ Process │   │Development│
   │ View    │   │ View    │   │ View    │
   └─────────┘   └─────────┘   └─────────┘
        │              │              │
        └──────────────┼──────────────┘
                       ▼
                  ┌─────────┐
                  │ Physical│
                  │ View    │
                  └─────────┘
```

| View | มุมมอง | สำหรับ |
|------|--------|--------|
| Logical | Class, Component | Developer |
| Process | Concurrency, Performance | System Engineer |
| Development | Module, Package | Developer |
| Physical | Deployment, Infrastructure | DevOps |
| Scenarios | Use Cases | ทุกคน |

### 4.2 โครงสร้างทำงานอย่างไร

**C4 Model (Simon Brown):**

```
Level 1: System Context
┌──────────────────────────────────┐
│         E-Commerce System        │
│  ┌────────┐         ┌────────┐   │
│  │Customer│────────▶│  Web   │   │
│  └────────┘         └────────┘   │
│       │                  │       │
│       ▼                  ▼       │
│  ┌────────┐         ┌────────┐   │
│  │Payment │         │Shipping│   │
│  └────────┘         └────────┘   │
└──────────────────────────────────┘

Level 2: Container
┌──────────────────────────────────┐
│  Web App │ API │ Database │ Cache│
└──────────────────────────────────┘

Level 3: Component
┌──────────────────────────────────┐
│  OrderController │ OrderService  │
│  OrderRepository │ OrderValidator│
└──────────────────────────────────┘

Level 4: Code
┌──────────────────────────────────┐
│  class Order { ... }             │
└──────────────────────────────────┘
```

### 4.3 โครงสร้างการใช้งาน

| View | เครื่องมือ | Output |
|------|-----------|--------|
| Context | Structurizr | Diagram |
| Container | PlantUML | Diagram |
| Component | Mermaid | Diagram |
| Deployment | Kubernetes YAML | Manifest |

### 4.4 สรุป

โครงสร้างของ Architecture ต้องมีหลายมุมมอง เพื่อสื่อสารกับผู้มีส่วนได้ส่วนเสียที่แตกต่างกัน

---

## 5. แนวทางการประยุกต์ใช้

**Framework การออกแบบ:**

```
1. Understand Requirements
   - Functional + Non-Functional

2. Identify Quality Attributes
   - จัดลำดับความสำคัญ

3. Create Architecture Vision
   - High-Level Diagram

4. Document Decisions
   - ADR

5. Prototype & Validate
   - Spike, PoC

6. Evolve
   - Review, Refactor
```

**Architecture Evaluation Methods:**

| Method | จุดประสงค์ |
|--------|-----------|
| ATAM | วิเคราะห์ Trade-offs |
| CBAM | Cost-Benefit |
| SAAM | Scenario-based |
| ARID | Active Review |

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา: E-Commerce Platform**

**Requirements:**
- 1M Users, 100K Orders/day
- 99.99% Availability
- Multi-Region

**Quality Attributes:**
- Scalability (High)
- Availability (Critical)
- Maintainability (High)
- Security (Critical)

**Architecture Decisions:**

| ADR | Decision |
|-----|----------|
| ADR-001 | Microservices สำหรับ Core Domains |
| ADR-002 | PostgreSQL + Read Replicas |
| ADR-003 | Kafka สำหรับ Async |
| ADR-004 | Kubernetes บน AWS |
| ADR-005 | Clean Architecture ต่อ Service |

**Architecture Diagram:**

```
Region A                    Region B
┌─────────────┐            ┌─────────────┐
│ API Gateway │◄──────────►│ API Gateway │
└──────┬──────┘            └──────┬──────┘
       │                          │
   ┌───┴───┐                  ┌───┴───┐
   ▼       ▼                  ▼       ▼
┌─────┐ ┌─────┐            ┌─────┐ ┌─────┐
│Order│ │User │            │Order│ │User │
└──┬──┘ └──┬──┘            └──┬──┘ └──┬──┘
   │       │                  │       │
   ▼       ▼                  ▼       ▼
┌─────┐ ┌─────┐            ┌─────┐ ┌─────┐
│ DB  │ │ DB  │◄──Replicate│ DB  │ │ DB  │
└─────┘ └─────┘            └─────┘ └─────┘
```

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| Analysis Paralysis | คิดมาก | Time-box, MVP |
| Over-Engineering | ไม่เข้าใจ Context | YAGNI, Start Simple |
| Architecture Drift | ไม่มี Governance | ADR, Review |
| Team Resistance | ไม่มี Buy-in | Involve ทีม |
| Documentation Rot | ไม่อัปเดต | Docs as Code |

---

# บทที่ 2: Clean Architecture

## 1. บทนำ

Clean Architecture คือแนวคิดที่ Robert C. Martin (Uncle Bob) นำเสนอในปี 2012 เพื่อแก้ปัญหาที่พบในซอฟต์แวร์ทั่วไป — Business Logic ผูกติดกับ Framework, Database เปลี่ยนยาก, Test ลำบาก แนวคิดนี้รวบรวมหลักการจาก Hexagonal Architecture, Onion Architecture, และ DCI เข้าด้วยกัน

หัวใจของ Clean Architecture คือ **Dependency Rule** — การพึ่งพาต้องชี้เข้าด้านในเท่านั้น ชั้นในสุด (Entities) ไม่รู้จักชั้นนอก (Frameworks)

## 2. บทนิยาม

**Clean Architecture** หมายถึง แนวทางการออกแบบซอฟต์แวร์ที่แบ่งระบบออกเป็นวงกลม concentric โดยมี Dependency Rule เป็นกฎเหล็ก

**คำนิยามของ Robert C. Martin:**
> "The goal of software architecture is to minimize the human resources required to build and maintain the required system."

**คำขวัญ:**
> "The Dependency Rule: Source code dependencies must point only inward, toward higher-level policies."

## 3. บทหัวข้อ

### 3.1 Clean Architecture คืออะไร

**วงกลม concentric:**

```
┌─────────────────────────────────────────────┐
│         Frameworks & Drivers                │
│  ┌───────────────────────────────────────┐  │
│  │      Interface Adapters              │  │
│  │  ┌─────────────────────────────────┐  │  │
│  │  │      Use Cases                 │  │  │
│  │  │  ┌─────────────────────────┐   │  │  │
│  │  │  │      Entities          │   │  │  │
│  │  │  │  (Enterprise Rules)    │   │  │  │
│  │  │  └─────────────────────────┘   │  │  │
│  │  └─────────────────────────────────┘  │  │
│  └───────────────────────────────────────┘  │
└─────────────────────────────────────────────┘
```

| Layer | หน้าที่ | ตัวอย่าง |
|-------|---------|----------|
| **Entities** | Enterprise Business Rules | Order, Customer |
| **Use Cases** | Application Business Rules | PlaceOrder |
| **Interface Adapters** | แปลงข้อมูล | Controllers, Presenters |
| **Frameworks** | เทคโนโลยี | Express, PostgreSQL |

**Dependency Rule:**

```
❌ ผิด:
Entities → Use Cases → Adapters → Frameworks

✅ ถูก:
Frameworks → Adapters → Use Cases → Entities
```

### 3.2 ทำงานอย่างไร

**ตัวอย่าง: Order System**

```python
# Layer 1: Entities (ไม่มี Dependency)
from dataclasses import dataclass
from decimal import Decimal

@dataclass
class OrderItem:
    product_id: str
    quantity: int
    price: Decimal

class Order:
    def __init__(self, id, customer_id):
        self.id = id
        self.customer_id = customer_id
        self.items = []
        self.status = "DRAFT"
    
    def add_item(self, product_id, quantity, price):
        if self.status != "DRAFT":
            raise ValueError("Cannot modify confirmed order")
        if quantity <= 0:
            raise ValueError("Quantity must be positive")
        self.items.append(OrderItem(product_id, quantity, price))
    
    def total(self):
        return sum(item.price * item.quantity for item in self.items)
    
    def confirm(self):
        if not self.items:
            raise ValueError("Empty order")
        self.status = "CONFIRMED"
        return OrderConfirmed(self.id, self.total())

# Layer 2: Use Cases (ขึ้นกับ Entities)
class OrderRepository(ABC):
    @abstractmethod
    def save(self, order: Order): pass
    
    @abstractmethod
    def find_by_id(self, id: str) -> Order: pass

class PlaceOrderUseCase:
    def __init__(self, repo: OrderRepository, event_bus):
        self.repo = repo
        self.event_bus = event_bus
    
    def execute(self, request: PlaceOrderRequest) -> PlaceOrderResponse:
        order = Order(uuid4(), request.customer_id)
        for item in request.items:
            order.add_item(item.product_id, item.quantity, item.price)
        order.confirm()
        self.repo.save(order)
        self.event_bus.publish(OrderConfirmed(order.id))
        return PlaceOrderResponse(order.id, order.total())

# Layer 3: Interface Adapters
class OrderController:
    def __init__(self, use_case: PlaceOrderUseCase):
        self.use_case = use_case
    
    def handle(self, http_request):
        request = PlaceOrderRequest.from_dict(http_request.json)
        response = self.use_case.execute(request)
        return {"order_id": response.order_id, "total": str(response.total)}

class PostgresOrderRepository(OrderRepository):
    def __init__(self, connection):
        self.conn = connection
    
    def save(self, order: Order):
        self.conn.execute("INSERT INTO orders ...", order.to_dict())
    
    def find_by_id(self, id: str) -> Order:
        row = self.conn.query("SELECT * FROM orders WHERE id = %s", id)
        return Order.from_dict(row)

# Layer 4: Frameworks & Drivers
from flask import Flask, request

app = Flask(__name__)

@app.route("/orders", methods=["POST"])
def create_order():
    controller = OrderController(
        PlaceOrderUseCase(
            PostgresOrderRepository(db),
            KafkaEventBus()
        )
    )
    return controller.handle(request)
```

**การทดสอบ:**

```python
# Test Use Case โดยไม่ต้องมี Database
class InMemoryOrderRepository(OrderRepository):
    def __init__(self):
        self.orders = {}
    
    def save(self, order):
        self.orders[order.id] = order
    
    def find_by_id(self, id):
        return self.orders.get(id)

def test_place_order():
    repo = InMemoryOrderRepository()
    event_bus = InMemoryEventBus()
    use_case = PlaceOrderUseCase(repo, event_bus)
    
    request = PlaceOrderRequest(
        customer_id="CUST-1",
        items=[OrderItemRequest("PROD-1", 2, Decimal("10.00"))]
    )
    response = use_case.execute(request)
    
    assert response.total == Decimal("20.00")
    assert len(event_bus.published) == 1
```

### 3.3 การใช้งาน

**Clean Architecture ใช้เมื่อ:**

1. **Business Logic ซับซ้อน** — Enterprise Application
2. **อายุยาว** — ระบบที่ต้องอยู่ 5+ ปี
3. **ทีมใหญ่** — ต้องแยกงานชัดเจน
4. **ต้อง Test เยอะ** — TDD, High Coverage
5. **เปลี่ยน Technology บ่อย** — Multi-Platform

**เมื่อไม่ควรใช้:**

- Prototype, MVP
- Script เล็กๆ
- CRUD App ง่ายๆ
- Data Pipeline

### 3.4 ข้อดี

- ✅ **Testable** — Business Logic ทดสอบได้
- ✅ **Framework-Independent** — เปลี่ยน Framework ได้
- ✅ **Database-Independent** — เปลี่ยน DB ได้
- ✅ **UI-Independent** — เปลี่ยน UI ได้
- ✅ **Maintainable** — แก้ไขง่าย
- ✅ **Parallel Development** — ทีมทำงานขนานได้

### 3.5 ข้อเสีย

- ❌ **Boilerplate** — โค้ดเยอะ
- ❌ **Learning Curve** — เข้าใจยาก
- ❌ **Over-Engineering** — สำหรับโปรเจกต์เล็ก
- ❌ **Indirection** — ต้องข้าม Layer
- ❌ **Initial Cost** — ลงทุนช่วงแรกสูง

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- อย่าให้ Entity รู้จัก Framework
- อย่าให้ Use Case รู้จัก HTTP
- อย่าให้ Business Logic อยู่ใน Controller
- ระวัง Layer Leakage

**ข้อห้าม:**
- ❌ ห้าม Import จากชั้นนอกในชั้นใน
- ❌ ห้ามใช้ ORM Entity เป็น Domain Entity
- ❌ ห้ามให้ Database Schema กำหนด Domain Model
- ❌ ห้ามให้ Framework Annotations รั่วเข้า Domain

**ข้อจำกัด:**
- Overkill สำหรับ CRUD
- ต้องมี Discipline สูง
- ต้องเข้าใจ Dependency Inversion
- ไม่ได้แก้ปัญหา Performance

### 3.7 สรุป

Clean Architecture คือเครื่องมือที่ทรงพลังสำหรับระบบที่ซับซ้อนและอายุยาว แต่ต้องใช้อย่างมีวิจารณญาณ ไม่ใช่ทุกโปรเจกต์ต้องใช้

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

**Package Structure:**

```
src/
├── domain/                    # Entities
│   ├── entities/
│   │   ├── order.py
│   │   └── customer.py
│   ├── value_objects/
│   │   ├── money.py
│   │   └── address.py
│   └── events/
│       └── order_confirmed.py
│
├── application/               # Use Cases
│   ├── use_cases/
│   │   ├── place_order.py
│   │   └── cancel_order.py
│   ├── ports/
│   │   ├── repositories.py
│   │   └── event_bus.py
│   └── dtos/
│       └── order_dto.py
│
├── infrastructure/            # Adapters
│   ├── persistence/
│   │   ├── postgres_order_repo.py
│   │   └── models.py
│   ├── messaging/
│   │   └── kafka_event_bus.py
│   └── external/
│       └── stripe_client.py
│
└── presentation/              # Frameworks
    ├── api/
    │   ├── controllers/
    │   └── routes.py
    └── cli/
        └── commands.py
```

### 4.2 โครงสร้างทำงานอย่างไร

**Data Flow:**

```
HTTP Request
     ↓
Controller (Presentation)
     ↓
Use Case (Application)
     ↓
Entity (Domain)
     ↓
Repository Interface (Application)
     ↓
Repository Impl (Infrastructure)
     ↓
Database
```

**Dependency Direction:**

```
Presentation ──▶ Application ──▶ Domain
     │                │
     └──▶ Infrastructure ◀──┘
     
(Infrastructure implements interfaces defined in Application)
```

### 4.3 โครงสร้างการใช้งาน

| Layer | ขึ้นกับ | ถูกขึ้นกับโดย |
|-------|---------|---------------|
| Domain | ไม่ขึ้นกับใคร | Application |
| Application | Domain | Infrastructure, Presentation |
| Infrastructure | Application, Domain | Presentation |
| Presentation | Application | - |

### 4.4 สรุป

โครงสร้างที่ชัดเจนทำให้ Dependency Rule ทำงานได้ และทำให้ระบบ Testable

---

## 5. แนวทางการประยุกต์ใช้

**Framework การนำไปใช้:**

```
1. เริ่มจาก Domain
   - Entities, Value Objects
   - Business Rules

2. กำหนด Ports
   - Repository Interfaces
   - Service Interfaces

3. เขียน Use Cases
   - Orchestration
   - Transaction Boundary

4. Implement Adapters
   - Repository, Event Bus
   - External Services

5. Wire Up
   - Dependency Injection
   - Composition Root
```

**Composition Root:**

```python
# main.py
def create_app():
    # Infrastructure
    db = PostgresConnection(config.DB_URL)
    order_repo = PostgresOrderRepository(db)
    event_bus = KafkaEventBus(config.KAFKA_URL)
    
    # Use Cases
    place_order = PlaceOrderUseCase(order_repo, event_bus)
    
    # Controllers
    order_controller = OrderController(place_order)
    
    # Framework
    app = Flask(__name__)
    app.add_url_rule("/orders", view_func=order_controller.handle)
    return app
```

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา: RAG Pipeline ด้วย Clean Architecture**

```
domain/
├── entities/
│   ├── document.py          # Document, Chunk
│   └── query.py             # Query, Answer
└── value_objects/
    ├── embedding.py          # Embedding Vector
    └── relevance.py          # Relevance Score

application/
├── use_cases/
│   ├── ingest_document.py
│   ├── answer_query.py
│   └── evaluate_answer.py
└── ports/
    ├── vector_store.py       # Interface
    ├── llm_provider.py       # Interface
    └── embedding_provider.py # Interface

infrastructure/
├── vector_stores/
│   ├── milvus_adapter.py
│   └── faiss_adapter.py
├── llms/
│   ├── openai_adapter.py
│   └── azure_adapter.py
└── embeddings/
    ├── cohere_adapter.py
    └── openai_adapter.py

presentation/
├── api/
│   └── routes.py
└── streamlit/
    └── app.py
```

**ประโยชน์:**
- เปลี่ยน Vector DB: Milvus → FAISS โดยไม่แก้ Business Logic
- เปลี่ยน LLM: OpenAI → Azure โดยไม่แก้ Use Case
- Test Use Case โดยไม่ต้องเรียก LLM จริง

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| Boilerplate เยอะ | Layer เยอะ | ใช้ Code Generator |
| Layer Leakage | ไม่มี Discipline | Code Review, ArchUnit |
| Over-Engineering | ใช้กับ CRUD | เลือกใช้ตาม Context |
| Testing ยาก | Dependency ซับซ้อน | Composition Root |
| Performance | Indirection | Profile, Optimize Hot Path |
| Team ไม่เข้าใจ | ไม่มี Training | Workshop, Pair |

---

# บทที่ 3: Hexagonal Architecture (Ports & Adapters)

## 1. บทนำ

Hexagonal Architecture หรือ Ports & Adapters ถูกเสนอโดย Alistair Cockburn ในปี 2005 เป็นแนวคิดที่มาแรงก่อน Clean Architecture และเป็นรากฐานสำคัญของมัน จุดเด่นคือการแยก Core Domain ออกจาก External Concerns อย่างชัดเจน ผ่านแนวคิด "Ports" (Interface) และ "Adapters" (Implementation)

ชื่อ "Hexagonal" มาจากการวาด Diagram ที่ Core อยู่ตรงกลาง และมี Adapters ล้อมรอบ 6 ด้าน (แต่จริงๆ มีกี่ด้านก็ได้)

## 2. บทนิยาม

**Hexagonal Architecture** หมายถึง สถาปัตยกรรมที่แยก Core Business Logic ออกจาก External Systems ผ่าน Ports (Interfaces) และ Adapters (Implementations)

**คำนิยามของ Alistair Cockburn:**
> "Allow an application to equally be driven by users, programs, automated test or batch scripts, and to be developed and tested in isolation from its eventual run-time devices and databases."

**หลักการสำคัญ:**
> "The application is at the center, and all external systems are at the edges."

## 3. บทหัวข้อ

### 3.1 Hexagonal Architecture คืออะไร

**Diagram:**

```
                    ┌─────────────┐
                    │   REST API  │
                    │   Adapter   │
                    └──────┬──────┘
                           │
                    ┌──────▼──────┐
    ┌──────────┐    │             │    ┌──────────┐
    │   CLI    │───▶│   Ports     │◀───│  GraphQL │
    │ Adapter  │    │             │    │ Adapter  │
    └──────────┘    │  ┌───────┐  │    └──────────┘
                    │  │ Core  │  │
    ┌──────────┐    │  │Domain │  │    ┌──────────┐
    │  Kafka   │───▶│  └───────┘  │◀───│  Stripe  │
    │ Adapter  │    │             │    │ Adapter  │
    └──────────┘    │   Ports     │    └──────────┘
                    └──────┬──────┘
                           │
                    ┌──────▼──────┐
                    │  PostgreSQL │
                    │   Adapter   │
                    └─────────────┘
```

**แนวคิดหลัก:**

| แนวคิด | ความหมาย |
|--------|----------|
| **Core** | Business Logic บริสุทธิ์ |
| **Port** | Interface ที่ Core เปิดให้ |
| **Adapter** | Implementation ของ Port |
| **Driving Port** | Input (Use Case) |
| **Driven Port** | Output (Repository) |

**ประเภทของ Ports:**

```
Driving Ports (Primary/Inbound):
- ถูกเรียกโดย External
- ตัวอย่าง: UseCase Interface
- Adapters: REST, CLI, GraphQL, gRPC

Driven Ports (Secondary/Outbound):
- Core เรียก External
- ตัวอย่าง: Repository Interface
- Adapters: PostgreSQL, Kafka, Stripe
```

### 3.2 ทำงานอย่างไร

**ตัวอย่าง: Order System**

```python
# Core Domain
class Order:
    def __init__(self, id, customer_id):
        self.id = id
        self.customer_id = customer_id
        self.items = []
        self.status = "DRAFT"
    
    def add_item(self, product_id, quantity, price):
        if self.status != "DRAFT":
            raise ValueError("Cannot modify confirmed order")
        self.items.append(OrderItem(product_id, quantity, price))
    
    def confirm(self):
        if not self.items:
            raise ValueError("Empty order")
        self.status = "CONFIRMED"

# Driving Port (Input)
class PlaceOrderPort(ABC):
    @abstractmethod
    def place_order(self, request: PlaceOrderRequest) -> PlaceOrderResponse:
        pass

# Driven Port (Output)
class OrderRepositoryPort(ABC):
    @abstractmethod
    def save(self, order: Order): pass
    
    @abstractmethod
    def find_by_id(self, id: str) -> Order: pass

class EventPublisherPort(ABC):
    @abstractmethod
    def publish(self, event): pass

# Core Service (implements Driving Port, uses Driven Ports)
class OrderService(PlaceOrderPort):
    def __init__(self, repo: OrderRepositoryPort, publisher: EventPublisherPort):
        self.repo = repo
        self.publisher = publisher
    
    def place_order(self, request):
        order = Order(uuid4(), request.customer_id)
        for item in request.items:
            order.add_item(item.product_id, item.quantity, item.price)
        order.confirm()
        self.repo.save(order)
        self.publisher.publish(OrderConfirmed(order.id))
        return PlaceOrderResponse(order.id)

# Driving Adapter: REST
class OrderRestController:
    def __init__(self, port: PlaceOrderPort):
        self.port = port
    
    def handle_post(self, http_request):
        request = PlaceOrderRequest.from_json(http_request.body)
        response = self.port.place_order(request)
        return {"order_id": response.order_id}, 201

# Driving Adapter: CLI
class OrderCliAdapter:
    def __init__(self, port: PlaceOrderPort):
        self.port = port
    
    def handle_command(self, args):
        request = PlaceOrderRequest(
            customer_id=args.customer,
            items=[OrderItemRequest(args.product, args.qty, args.price)]
        )
        response = self.port.place_order(request)
        print(f"Order created: {response.order_id}")

# Driven Adapter: PostgreSQL
class PostgresOrderAdapter(OrderRepositoryPort):
    def __init__(self, connection):
        self.conn = connection
    
    def save(self, order: Order):
        self.conn.execute("INSERT INTO orders ...", order.to_dict())
    
    def find_by_id(self, id: str) -> Order:
        row = self.conn.query("SELECT * FROM orders WHERE id = %s", id)
        return Order.from_dict(row)

# Driven Adapter: Kafka
class KafkaEventPublisher(EventPublisherPort):
    def __init__(self, producer):
        self.producer = producer
    
    def publish(self, event):
        self.producer.send(event.topic, event.to_dict())
```

**การทดสอบ:**

```python
# In-Memory Adapter สำหรับ Test
class InMemoryOrderAdapter(OrderRepositoryPort):
    def __init__(self):
        self.orders = {}
    
    def save(self, order):
        self.orders[order.id] = order
    
    def find_by_id(self, id):
        return self.orders.get(id)

class InMemoryEventPublisher(EventPublisherPort):
    def __init__(self):
        self.events = []
    
    def publish(self, event):
        self.events.append(event)

def test_place_order():
    service = OrderService(
        InMemoryOrderAdapter(),
        InMemoryEventPublisher()
    )
    response = service.place_order(PlaceOrderRequest(
        customer_id="CUST-1",
        items=[OrderItemRequest("PROD-1", 2, 10.0)]
    ))
    assert response.order_id is not None
```

### 3.3 การใช้งาน

**Hexagonal ใช้เมื่อ:**

1. **Multi-Channel** — REST, CLI, GraphQL, gRPC
2. **Testability สูง** — ต้อง Test โดยไม่พึ่ง External
3. **External Systems เปลี่ยนบ่อย** — DB, Queue, API
4. **Domain ซับซ้อน** — Business Logic เยอะ
5. **Team แยก** — Core Team + Integration Team

**เมื่อไม่ควรใช้:**

- Simple CRUD
- Prototype
- Script เล็กๆ
- Data Pipeline ง่ายๆ

### 3.4 ข้อดี

- ✅ **Testable** — Test Core โดยไม่พึ่ง External
- ✅ **Flexible** — เปลี่ยน Adapter ได้
- ✅ **Multi-Channel** — หลาย Input/Output
- ✅ **Isolated Core** — Business Logic บริสุทธิ์
- ✅ **Clear Boundaries** — ขอบเขตชัดเจน
- ✅ **Technology Agnostic** — ไม่ผูกเทคโนโลยี

### 3.5 ข้อเสีย

- ❌ **Boilerplate** — Interface + Implementation
- ❌ **Learning Curve** — เข้าใจยาก
- ❌ **Over-Engineering** — สำหรับโปรเจกต์เล็ก
- ❌ **Mapping Overhead** — แปลงข้อมูลบ่อย
- ❌ **Initial Cost** — ลงทุนช่วงแรก

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- อย่าให้ Adapter มี Business Logic
- อย่าให้ Core รู้จัก Adapter
- ระวัง Mapping ที่ซับซ้อน
- ระวัง Anemic Domain

**ข้อห้าม:**
- ❌ ห้าม Import Adapter ใน Core
- ❌ ห้ามให้ Core รู้จัก HTTP, SQL
- ❌ ห้ามใช้ Framework Entity เป็น Domain
- ❌ ห้ามให้ Adapter เรียก Adapter โดยตรง

**ข้อจำกัด:**
- Overkill สำหรับ CRUD
- ต้องมี Discipline
- Mapping Overhead
- ไม่ได้แก้ Performance

### 3.7 สรุป

Hexagonal Architecture เป็นแนวคิดที่ทรงพลัง โดยเฉพาะระบบที่มี Multi-Channel และต้องการ Testability สูง

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

```
src/
├── core/                          # Core Domain
│   ├── domain/
│   │   ├── order.py
│   │   └── customer.py
│   ├── ports/
│   │   ├── driving/
│   │   │   └── place_order_port.py
│   │   └── driven/
│   │       ├── order_repository_port.py
│   │       └── event_publisher_port.py
│   └── services/
│       └── order_service.py
│
├── adapters/                      # Adapters
│   ├── driving/
│   │   ├── rest/
│   │   │   └── order_controller.py
│   │   ├── cli/
│   │   │   └── order_cli.py
│   │   └── graphql/
│   │       └── order_resolver.py
│   └── driven/
│       ├── postgres/
│       │   └── order_repository.py
│       ├── kafka/
│       │   └── event_publisher.py
│       └── stripe/
│           └── payment_adapter.py
│
└── config/
    └── composition_root.py
```

### 4.2 โครงสร้างทำงานอย่างไร

```
Driving Adapter → Driving Port → Core Service → Driven Port → Driven Adapter
     (REST)         (Interface)     (Logic)       (Interface)    (PostgreSQL)
```

**Dependency Direction:**

```
Core ไม่รู้จัก Adapter เลย
Adapter ขึ้นกับ Core (ผ่าน Ports)
```

### 4.3 โครงสร้างการใช้งาน

| Layer | ขึ้นกับ | ตัวอย่าง |
|-------|---------|----------|
| Core Domain | ไม่มี | Order, Customer |
| Ports | Core Domain | PlaceOrderPort |
| Core Service | Ports, Domain | OrderService |
| Driving Adapters | Ports | OrderController |
| Driven Adapters | Ports | PostgresAdapter |

### 4.4 สรุป

โครงสร้าง Hexagonal ทำให้ Core บริสุทธิ์ และ Adapter เปลี่ยนได้

---

## 5. แนวทางการประยุกต์ใช้

**Framework:**

```
1. ระบุ Core Domain
   - Entities, Value Objects
   - Business Rules

2. กำหนด Ports
   - Driving (Input)
   - Driven (Output)

3. Implement Core Service
   - Orchestration
   - ใช้ Ports

4. Implement Adapters
   - Driving: REST, CLI
   - Driven: DB, Queue

5. Wire Up
   - Composition Root
```

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา: RAG System ด้วย Hexagonal**

```
core/
├── domain/
│   ├── document.py
│   ├── chunk.py
│   └── query.py
├── ports/
│   ├── driving/
│   │   ├── ingest_port.py
│   │   └── query_port.py
│   └── driven/
│       ├── vector_store_port.py
│       ├── embedding_port.py
│       └── llm_port.py
└── services/
    ├── ingestion_service.py
    └── query_service.py

adapters/
├── driving/
│   ├── rest_api.py
│   └── streamlit_ui.py
└── driven/
    ├── milvus_adapter.py
    ├── openai_embedding.py
    └── azure_llm.py
```

**ประโยชน์:**
- เปลี่ยน Vector DB: Milvus → FAISS
- เปลี่ยน LLM: OpenAI → Azure
- เปลี่ยน UI: Streamlit → React
- Test Core โดยไม่เรียก LLM จริง

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| Mapping ซับซ้อน | Layer เยอะ | ใช้ Mapper Library |
| Adapter มี Logic | ไม่มี Discipline | Code Review |
| Over-Abstraction | Port เยอะเกิน | รวม Port ที่คล้ายกัน |
| Testing ยาก | Dependency ซับซ้อน | Composition Root |
| Performance | Indirection | Profile, Optimize |

---

# บทที่ 4: Event-Driven Architecture (EDA)

## 1. บทนำ

Event-Driven Architecture (EDA) คือสถาปัตยกรรมที่ Components สื่อสารกันผ่าน Events แทนการเรียกกันโดยตรง (Request-Response) แนวคิดนี้เหมาะกับระบบที่ต้องการ Loose Coupling, Scalability สูง, และ Real-time Processing

บริษัทอย่าง Uber, Netflix, LinkedIn ใช้ EDA เป็นแกนหลักของระบบ เพราะช่วยให้ Scale ทีมและระบบได้อย่างอิสระ

## 2. บทนิยาม

**Event-Driven Architecture (EDA)** หมายถึง สถาปัตยกรรมที่ Components ผลิต (Produce) และบริโภค (Consume) Events เพื่อสื่อสารกัน โดยไม่รู้จักกันโดยตรง

**คำนิยามของ Martin Fowler:**
> "Event-Driven Architecture is a style of building software where components communicate by emitting and reacting to events."

**องค์ประกอบหลัก:**

| องค์ประกอบ | ความหมาย |
|-----------|----------|
| **Event** | เหตุการณ์ที่เกิดขึ้น |
| **Producer** | ผู้ผลิต Event |
| **Consumer** | ผู้บริโภค Event |
| **Broker** | ตัวกลาง (Kafka, RabbitMQ) |
| **Channel** | ช่องทาง (Topic, Queue) |

## 3. บทหัวข้อ

### 3.1 EDA คืออะไร

**ประเภทของ Events:**

| ประเภท | ความหมาย | ตัวอย่าง |
|--------|----------|----------|
| **Domain Event** | เหตุการณ์ใน Domain | OrderPlaced |
| **Integration Event** | เหตุการณ์ข้ามระบบ | UserCreated |
| **Notification** | แจ้งเตือน | EmailSent |
| **Event-Carried State** | พาข้อมูลมาด้วย | OrderPlaced(order_data) |

**Patterns ของ EDA:**

| Pattern | ลักษณะ | ใช้เมื่อ |
|---------|--------|----------|
| **Event Notification** | แจ้งเหตุเท่านั้น | Loose Coupling |
| **Event-Carried State** | พาข้อมูลมาด้วย | ลด Coupling |
| **Event Sourcing** | เก็บ Events เป็น Source of Truth | Audit, Replay |
| **CQRS** | แยก Read/Write | Read/Write ต่างกัน |
| **Saga** | Distributed Transaction | ข้าม Service |

**Event Sourcing:**

```
Traditional:
State = Current Value
UPDATE orders SET status = 'CONFIRMED' WHERE id = 'ORD-1'

Event Sourcing:
State = Replay(Events)
Event 1: OrderCreated(ORD-1)
Event 2: ItemAdded(ORD-1, PROD-1, 2)
Event 3: ItemAdded(ORD-1, PROD-2, 1)
Event 4: OrderConfirmed(ORD-1)

State = Replay([Event1, Event2, Event3, Event4])
```

**CQRS:**

```
Write Model (Command):
Command → CommandHandler → Write DB → Publish Event

Read Model (Query):
Event → EventHandler → Update Read DB
Query → QueryHandler → Read DB → Response
```

### 3.2 ทำงานอย่างไร

**ตัวอย่าง: E-Commerce**

```python
# Domain Events
@dataclass
class OrderPlaced:
    order_id: str
    customer_id: str
    total: Decimal
    timestamp: datetime

@dataclass
class PaymentSucceeded:
    order_id: str
    transaction_id: str
    timestamp: datetime

@dataclass
class InventoryReserved:
    order_id: str
    items: list
    timestamp: datetime

# Producer
class OrderService:
    def __init__(self, repo, event_bus):
        self.repo = repo
        self.event_bus = event_bus
    
    def place_order(self, request):
        order = Order.create(request)
        self.repo.save(order)
        self.event_bus.publish(OrderPlaced(
            order_id=order.id,
            customer_id=order.customer_id,
            total=order.total(),
            timestamp=datetime.utcnow()
        ))
        return order.id

# Consumers
class PaymentService:
    def __init__(self, event_bus, payment_gateway):
        self.event_bus = event_bus
        self.gateway = payment_gateway
        event_bus.subscribe(OrderPlaced, self.on_order_placed)
    
    def on_order_placed(self, event: OrderPlaced):
        try:
            tx = self.gateway.charge(event.customer_id, event.total)
            self.event_bus.publish(PaymentSucceeded(
                order_id=event.order_id,
                transaction_id=tx.id,
                timestamp=datetime.utcnow()
            ))
        except PaymentError as e:
            self.event_bus.publish(PaymentFailed(
                order_id=event.order_id,
                reason=str(e)
            ))

class InventoryService:
    def __init__(self, event_bus, inventory_repo):
        self.event_bus = event_bus
        self.repo = inventory_repo
        event_bus.subscribe(OrderPlaced, self.on_order_placed)
    
    def on_order_placed(self, event: OrderPlaced):
        # Reserve inventory
        self.repo.reserve(event.order_id, event.items)
        self.event_bus.publish(InventoryReserved(
            order_id=event.order_id,
            items=event.items
        ))
```

**Event Bus Implementation:**

```python
class EventBus:
    def __init__(self):
        self._handlers = defaultdict(list)
    
    def subscribe(self, event_type, handler):
        self._handlers[event_type].append(handler)
    
    def publish(self, event):
        for handler in self._handlers[type(event)]:
            try:
                handler(event)
            except Exception as e:
                # Dead Letter Queue
                self._handle_error(event, handler, e)
    
    def _handle_error(self, event, handler, error):
        logger.error(f"Handler {handler} failed for {event}: {error}")
        # Send to DLQ
```

**Kafka-Based Implementation:**

```python
from kafka import KafkaProducer, KafkaConsumer
import json

class KafkaEventBus:
    def __init__(self, bootstrap_servers):
        self.producer = KafkaProducer(
            bootstrap_servers=bootstrap_servers,
            value_serializer=lambda v: json.dumps(v).encode()
        )
    
    def publish(self, topic, event):
        self.producer.send(topic, event.to_dict())
        self.producer.flush()
    
    def subscribe(self, topic, group_id, handler):
        consumer = KafkaConsumer(
            topic,
            bootstrap_servers=self.bootstrap_servers,
            group_id=group_id,
            value_deserializer=lambda v: json.loads(v)
        )
        for message in consumer:
            handler(message.value)
```

### 3.3 การใช้งาน

**EDA ใช้เมื่อ:**

1. **Loose Coupling** — Services ไม่รู้จักกัน
2. **Async Processing** — ไม่ต้องรอ Response
3. **Scalability** — Scale Producer/Consumer แยก
4. **Real-time** — ประมวลผลทันที
5. **Audit Trail** — ต้องเก็บ History
6. **Multiple Consumers** — หลายระบบสนใจ Event เดียว

**เมื่อไม่ควรใช้:**

- Simple CRUD
- ต้องการ Strong Consistency ทันที
- ทีมเล็ก
- Debugging ง่ายสำคัญ

### 3.4 ข้อดี

- ✅ **Loose Coupling** — Services อิสระ
- ✅ **Scalability** — Scale แยก
- ✅ **Async** — ไม่ Block
- ✅ **Audit** — เก็บ Events
- ✅ **Replay** — ย้อนเหตุการณ์
- ✅ **Multiple Consumers** — หลายระบบฟัง
- ✅ **Fault Tolerance** — Producer/Consumer ล่มได้

### 3.5 ข้อเสีย

- ❌ **Complexity** — ซับซ้อน
- ❌ **Eventual Consistency** — ไม่ Strong ทันที
- ❌ **Debugging** — ยาก
- ❌ **Duplicate Events** — ต้อง Idempotent
- ❌ **Ordering** — ยาก
- ❌ **Schema Evolution** — ต้องจัดการ

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- ระวัง Event ที่ใหญ่เกินไป
- ระวัง Event ที่มี Sensitive Data
- ระวัง Infinite Loop
- ระวัง Event Storm

**ข้อห้าม:**
- ❌ ห้ามใช้ EDA เป็น Synchronous RPC
- ❌ ห้าม Assume Ordering ข้าม Partition
- ❌ ห้าม Assume Exactly-Once
- ❌ ห้าม Publish Event ก่อน Commit Transaction
- ❌ ห้าม Ignore Idempotency

**ข้อจำกัด:**
- Eventual Consistency
- Debugging ยาก
- Schema Evolution ซับซ้อน
- ต้องมี Observability ดี

### 3.7 สรุป

EDA เป็นเครื่องมือที่ทรงพลังสำหรับระบบที่ต้องการ Loose Coupling และ Scalability แต่ต้องแลกกับ Complexity

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

```
┌─────────────────────────────────────────────┐
│              Event Broker                   │
│         (Kafka, RabbitMQ, Pulsar)           │
└─────────────────────────────────────────────┘
        ▲                    │
        │ Publish            │ Subscribe
        │                    ▼
┌───────────────┐    ┌───────────────┐
│  Producer 1   │    │  Consumer 1   │
│  Producer 2   │    │  Consumer 2   │
│  Producer 3   │    │  Consumer 3   │
└───────────────┘    └───────────────┘
```

### 4.2 โครงสร้างทำงานอย่างไร

**Event Flow:**

```
1. Producer สร้าง Event
2. Publish ไปที่ Broker
3. Broker เก็บใน Topic/Partition
4. Consumer Subscribe
5. Consumer ประมวลผล
6. Commit Offset
```

**Kafka Architecture:**

```
Topic: orders (3 Partitions, RF=3)

Partition 0: [Event1][Event3][Event5]
Partition 1: [Event2][Event4][Event6]
Partition 2: [Event7][Event8][Event9]

Consumer Group A:
- Consumer A1 → Partition 0
- Consumer A2 → Partition 1
- Consumer A3 → Partition 2

Consumer Group B:
- Consumer B1 → Partition 0, 1
- Consumer B2 → Partition 2
```

### 4.3 โครงสร้างการใช้งาน

| Component | หน้าที่ | ตัวอย่าง |
|-----------|---------|----------|
| Broker | เก็บ Events | Kafka, RabbitMQ |
| Topic | หมวด Events | orders, payments |
| Partition | แบ่งขนาน | 3 partitions |
| Consumer Group | กลุ่ม Consumer | payment-service |
| Offset | ตำแหน่ง | 12345 |

### 4.4 สรุป

โครงสร้าง EDA ต้องมี Broker, Topic, Partition, Consumer Group ที่ออกแบบดี

---

## 5. แนวทางการประยุกต์ใช้

**Framework:**

```
1. ระบุ Events
   - Domain Events
   - Integration Events

2. ออกแบบ Schema
   - Versioning
   - Backward Compatible

3. เลือก Broker
   - Kafka: High Throughput
   - RabbitMQ: Routing ซับซ้อน
   - Pulsar: Multi-Tenant

4. ออกแบบ Consumers
   - Idempotent
   - Error Handling
   - DLQ

5. Observability
   - Tracing
   - Metrics
   - Logging
```

**Event Schema Evolution:**

```python
# Version 1
{
    "event_type": "OrderPlaced",
    "version": 1,
    "order_id": "ORD-1",
    "total": 99.99
}

# Version 2 (เพิ่ม field, Backward Compatible)
{
    "event_type": "OrderPlaced",
    "version": 2,
    "order_id": "ORD-1",
    "total": 99.99,
    "currency": "USD"  # ใหม่
}
```

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา: Uber's Event-Driven Architecture**

**Scale:**
- หลายพัน Services
- ล้าน Events/second
- Kafka เป็นแกน

**Patterns:**
- **Domain Events** — TripCompleted
- **Event Sourcing** — Trip State
- **CQRS** — Read/Write แยก
- **Saga** — Payment Flow

**Architecture:**

```
Rider App → Trip Service → Kafka → [Matching, Pricing, Payment, Notification]
                │
                ▼
         Event Store (Cassandra)
```

**กรณีศึกษา: RAG Pipeline**

```
Document Upload → Ingestion Service → DocumentIngested Event
                                              │
                    ┌─────────────────────────┼─────────────────┐
                    ▼                         ▼                 ▼
            Chunking Service          Metadata Service    Audit Service
                    │
                    ▼
            ChunksCreated Event
                    │
                    ▼
            Embedding Service → EmbeddingsCreated Event
                    │
                    ▼
            Vector Store Service
```

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| Duplicate Events | At-least-once | Idempotency Key |
| Out-of-Order | Multiple Partitions | Partition Key |
| Event Storm | Loop | Circuit Breaker |
| Schema Breaking | ไม่มี Versioning | Schema Registry |
| Debugging ยาก | Async | Correlation ID, Tracing |
| Lost Events | Broker ล่ม | Replication, Durability |
| Slow Consumer | Processing นาน | Scale, Batch |

---

# บทที่ 5: Microservices vs Monolith

## 1. บทนำ

การเลือกหว่าง Microservices กับ Monolith เป็นการตัดสินใจเชิงสถาปัตยกรรมที่สำคัญที่สุดอย่างหนึ่ง ไม่มีคำตอบที่ถูกสำหรับทุกบริบท — Netflix, Uber, Amazon ใช้ Microservices ขณะที่ Shopify, Basecamp, Stack Overflow ใช้ Monolith สำเร็จ

บทนี้จะพาคุณเข้าใจทั้งสองแนวทางอย่างเป็นกลาง พร้อม Framework การตัดสินใจ

## 2. บทนิยาม

**Monolith** หมายถึง Application ที่ Deploy เป็นหน่วยเดียว ทุก Component อยู่ใน Process เดียว

**Microservices** หมายถึง สถาปัตยกรรมที่แยก Application เป็น Services เล็กๆ ที่ Deploy อิสระ สื่อสารผ่าน Network

**คำนิยามของ Martin Fowler:**
> "The microservice architectural style is an approach to developing a single application as a suite of small services, each running in its own process and communicating with lightweight mechanisms."

**คำนิยามของ Simon Brown:**
> "If you can't build a monolith, what makes you think microservices will solve your problems?"

## 3. บทหัวข้อ

### 3.1 Microservices vs Monolith คืออะไร

**Monolith:**

```
┌─────────────────────────────────────┐
│         Monolith Application        │
│  ┌─────────┐ ┌─────────┐ ┌────────┐│
│  │ Order   │ │ User    │ │Payment ││
│  │ Module  │ │ Module  │ │Module  ││
│  └─────────┘ └─────────┘ └────────┘│
│  ┌─────────────────────────────────┐│
│  │      Shared Database            ││
│  └─────────────────────────────────┘│
└─────────────────────────────────────┘
         Single Deployment Unit
```

**Microservices:**

```
┌─────────┐  ┌─────────┐  ┌─────────┐
│ Order   │  │ User    │  │ Payment │
│ Service │  │ Service │  │ Service │
└────┬────┘  └────┬────┘  └────┬────┘
     │            │            │
┌────▼────┐  ┌────▼────┐  ┌────▼────┐
│ Order DB│  │ User DB │  │Payment DB│
└─────────┘  └─────────┘  └─────────┘
     │            │            │
     └────────────┼────────────┘
                  │
            Message Bus
```

**Modular Monolith (ทางสายกลาง):**

```
┌─────────────────────────────────────┐
│      Modular Monolith               │
│  ┌─────────┐ ┌─────────┐ ┌────────┐│
│  │ Order   │ │ User    │ │Payment ││
│  │ Module  │ │ Module  │ │Module  ││
│  └─────────┘ └─────────┘ └────────┘│
│  ┌─────────────────────────────────┐│
│  │      Shared Database            ││
│  │  (Schema per Module)            ││
│  └─────────────────────────────────┘│
└─────────────────────────────────────┘
     Single Deploy, Clear Boundaries
```

### 3.2 ทำงานอย่างไร

**Monolith Communication:**

```python
# Direct function call
class OrderService:
    def __init__(self):
        self.user_service = UserService()  # Direct
        self.payment_service = PaymentService()
    
    def place_order(self, request):
        user = self.user_service.get_user(request.user_id)
        order = Order.create(user, request.items)
        self.payment_service.charge(user, order.total)
        return order
```

**Microservices Communication:**

```python
# HTTP/gRPC
class OrderService:
    def __init__(self, user_client, payment_client):
        self.user_client = user_client      # HTTP Client
        self.payment_client = payment_client
    
    def place_order(self, request):
        user = self.user_client.get_user(request.user_id)
        order = Order.create(user, request.items)
        self.payment_client.charge(user.id, order.total)
        return order
```

**Event-Driven Communication:**

```python
class OrderService:
    def __init__(self, event_bus):
        self.event_bus = event_bus
    
    def place_order(self, request):
        order = Order.create(request)
        self.repo.save(order)
        self.event_bus.publish(OrderPlaced(order.id, order.total))
        return order

# Payment Service ฟัง Event
class PaymentService:
    def on_order_placed(self, event):
        self.charge(event.order_id, event.total)
```

**Database per Service:**

```
✅ ถูก:
Order Service → Order DB
User Service → User DB
Payment Service → Payment DB

❌ ผิด:
Order Service ─┐
User Service ──┼→ Shared DB
Payment Service┘
```

### 3.3 การใช้งาน

**Comparison Table:**

| มิติ | Monolith | Microservices |
|------|----------|---------------|
| **Deployment** | ทั้งก้อน | แยก Service |
| **Scaling** | ทั้งก้อน | แยก Service |
| **Technology** | เดียว | Polyglot |
| **Team** | ใหญ่ | เล็ก per Service |
| **Database** | Shared | Per Service |
| **Communication** | In-Process | Network |
| **Latency** | ต่ำ | สูง |
| **Complexity** | ต่ำ | สูง |
| **Debugging** | ง่าย | ยาก |
| **Testing** | ง่าย | ซับซ้อน |
| **Transaction** | ACID | Saga |
| **Consistency** | Strong | Eventual |

**Decision Framework:**

```
ขนาดทีม:
< 10 คน      → Monolith
10-50 คน     → Modular Monolith
> 50 คน      → Microservices

Domain Complexity:
ต่ำ          → Monolith
กลาง         → Modular Monolith
สูง          → Microservices

Scale:
ต่ำ          → Monolith
กลาง         → Modular Monolith
สูงมาก       → Microservices

อายุระบบ:
สั้น         → Monolith
ยาว          → Modular Monolith → Microservices
```

### 3.4 ข้อดี

**Monolith:**
- ✅ ง่าย — Develop, Test, Deploy
- ✅ Performance — In-Process Call
- ✅ Consistency — ACID
- ✅ Debugging — Stack Trace เดียว
- ✅ Cost — ต่ำ

**Microservices:**
- ✅ Scalability — Scale แยก
- ✅ Team Autonomy — ทีมอิสระ
- ✅ Technology Freedom — Polyglot
- ✅ Fault Isolation — ล่มแยก
- ✅ Deployment — Deploy แยก

### 3.5 ข้อเสีย

**Monolith:**
- ❌ Scale ทั้งก้อน
- ❌ Coupling สูง
- ❌ Deploy ช้า
- ❌ Technology Lock-in
- ❌ Team Coordination

**Microservices:**
- ❌ Complexity สูง
- ❌ Distributed Debugging
- ❌ Network Latency
- ❌ Eventual Consistency
- ❌ Operational Overhead
- ❌ Cost สูง

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- อย่าเริ่มจาก Microservices
- อย่าแยก Service ตาม Technical Layer
- อย่า Share Database
- ระวัง Distributed Monolith

**ข้อห้าม:**
- ❌ ห้าม Microservices สำหรับ Startup
- ❌ ห้าม Share Database ระหว่าง Services
- ❌ ห้าม Synchronous Chain ยาว
- ❌ ห้าม Distributed Transaction (2PC)
- ❌ ห้ามแยก Service โดยไม่มี Domain Boundary

**ข้อจำกัด:**
- Microservices ต้องการ Maturity สูง
- ต้องการ Observability ดี
- ต้องการ DevOps Culture
- ต้องการ Team Size ที่เหมาะ

### 3.7 สรุป

ไม่มีคำตอบเดียว — ขึ้นกับ Context เริ่มจาก Modular Monolith แล้ว Evolve เมื่อจำเป็น

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

**Evolution Path:**

```
Phase 1: Monolith
┌─────────────────────┐
│   Everything        │
└─────────────────────┘

Phase 2: Modular Monolith
┌─────────────────────┐
│ Module A │ Module B │
└─────────────────────┘

Phase 3: Selective Services
┌─────────┐ ┌─────────────────────┐
│Service A│ │ Modular Monolith    │
└─────────┘ │ Module B │ Module C │
            └─────────────────────┘

Phase 4: Microservices
┌─────────┐ ┌─────────┐ ┌─────────┐
│Service A│ │Service B│ │Service C│
└─────────┘ └─────────┘ └─────────┘
```

### 4.2 โครงสร้างทำงานอย่างไร

**Modular Monolith:**

```
src/
├── modules/
│   ├── order/
│   │   ├── domain/
│   │   ├── application/
│   │   ├── infrastructure/
│   │   └── api/
│   ├── user/
│   │   └── ...
│   └── payment/
│       └── ...
├── shared/
│   └── kernel/
└── main.py
```

**Module Boundaries:**

```python
# order/module.py
class OrderModule:
    def __init__(self, db, event_bus):
        self.repo = PostgresOrderRepository(db)
        self.service = OrderService(self.repo, event_bus)
    
    def get_service(self):
        return self.service
    
    # Public API
    def place_order(self, request):
        return self.service.place_order(request)

# user/module.py
class UserModule:
    def __init__(self, db):
        self.repo = PostgresUserRepository(db)
        self.service = UserService(self.repo)
    
    # Public API
    def get_user(self, user_id):
        return self.service.get_user(user_id)

# main.py
class Application:
    def __init__(self):
        db = PostgresConnection()
        event_bus = InMemoryEventBus()
        
        self.order = OrderModule(db, event_bus)
        self.user = UserModule(db)
        self.payment = PaymentModule(db, event_bus)
```

### 4.3 โครงสร้างการใช้งาน

| Phase | Team Size | Architecture |
|-------|-----------|--------------|
| 1-10 | Startup | Monolith |
| 10-30 | Growth | Modular Monolith |
| 30-100 | Scale | Selective Services |
| 100+ | Enterprise | Microservices |

### 4.4 สรุป

Evolution Path ที่ดีคือเริ่มจากง่าย แล้วค่อยๆ แยกเมื่อจำเป็น

---

## 5. แนวทางการประยุกต์ใช้

**Strangler Fig Pattern:**

```
Phase 1:
┌─────────────────────┐
│   Monolith          │
│   (All Features)    │
└─────────────────────┘

Phase 2:
┌─────────┐ ┌─────────┐
│ New     │ │Monolith │
│ Service │ │(Rest)   │
└─────────┘ └─────────┘
     ▲           ▲
     └─────┬─────┘
       API Gateway

Phase 3:
┌─────────┐ ┌─────────┐ ┌─────────┐
│Service A│ │Service B│ │Monolith │
└─────────┘ └─────────┘ │(Small)  │
                        └─────────┘
```

**Framework:**

```
1. เริ่มจาก Modular Monolith
2. ระบุ Bounded Context
3. แยก Module ที่มีปัญหาชัดเจน
4. ใช้ Strangler Fig Pattern
5. วัดผลก่อน/หลัง
```

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา 1: Shopify — Modular Monolith**

- **Scale:** ล้าน Requests/second
- **Architecture:** Modular Monolith
- **Modules:** ~100 Modules
- **Deployment:** Single Unit
- **Team:** หลายพัน Engineers

**บทเรียน:** Monolith ที่มี Boundaries ดี Scale ได้

**กรณีศึกษา 2: Netflix — Microservices**

- **Scale:** 200M+ Subscribers
- **Services:** 1,000+ Microservices
- **Communication:** gRPC, Kafka
- **Deployment:** Kubernetes
- **Team:** หลายพัน Engineers

**บทเรียน:** Microservices เหมาะกับ Scale ใหญ่มาก

**กรณีศึกษา 3: Stack Overflow — Monolith**

- **Scale:** 1.3B Page Views/month
- **Architecture:** Monolith
- **Servers:** 9 Web Servers
- **Database:** SQL Server
- **Team:** เล็ก

**บทเรียน:** Monolith ที่ Optimize ดี Scale ได้

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | แนวทางแก้ไข |
|-------|-------------|
| Distributed Monolith | แยก Database, Async |
| Service Too Small | รวม Service |
| Service Too Big | แยกตาม Domain |
| Shared Database | Database per Service |
| Sync Chain ยาว | Async, Event-Driven |
| Debugging ยาก | Distributed Tracing |
| Deploy ซับซ้อน | CI/CD, Kubernetes |
| Team Coordination | Platform Team |

---

# 📘 สรุปเล่มที่ 4

**สิ่งที่ได้เรียนรู้:**

1. **Architecture Principles** — Quality Attributes, ADR
2. **Clean Architecture** — Dependency Rule, Layers
3. **Hexagonal Architecture** — Ports & Adapters
4. **Event-Driven Architecture** — Events, CQRS, Event Sourcing
5. **Microservices vs Monolith** — Trade-offs, Evolution Path

**คำแนะนำ:**
- เริ่มจาก Modular Monolith
- ใช้ Clean/Hexagonal Architecture
- เพิ่ม EDA เมื่อจำเป็น
- แยก Microservices เมื่อ Scale ต้องการ

**หนังสือแนะนำ:**
- "Clean Architecture" — Robert C. Martin
- "Building Evolutionary Architectures" — Neal Ford
- "Software Architecture: The Hard Parts" — Neal Ford
- "Monolith to Microservices" — Sam Newman
- "Building Event-Driven Microservices" — Adam Bellemare

---

# 📘 เล่มถัดไป (โครงร่าง)

## เล่มที่ 5: Domain-Driven Design
- บทที่ 1: Strategic DDD (Bounded Context, Ubiquitous Language)
- บทที่ 2: Tactical DDD (Entity, Value Object, Aggregate)
- บทที่ 3: DDD in Practice

## เล่มที่ 6: DevOps & Cloud
- บทที่ 1: CI/CD Pipeline
- บทที่ 2: Cloud Platform AWS
- บทที่ 3: Infrastructure as Code

## เล่มที่ 7: AI Systems Architecture
- บทที่ 1: RAG Pipeline Architecture
- บทที่ 2: Agentic AI Architecture
- บทที่ 3: LLM Platform Engineering

---
 