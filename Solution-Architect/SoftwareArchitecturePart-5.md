# 📘 เล่มที่ 5: Domain-Driven Design (DDD)

---

# บทที่ 1: Strategic DDD

## 1. บทนำ

Domain-Driven Design (DDD) คือแนวทางการออกแบบซอฟต์แวร์ที่ Eric Evans นำเสนอในปี 2003 ผ่านหนังสือ "Domain-Driven Design: Tackling Complexity in the Heart of Software" หัวใจของ DDD ไม่ใช่ Pattern หรือเทคนิค แต่คือ **การให้ความสำคัญกับ Domain เป็นอันดับแรก**

ปัญหาที่ DDD แก้คือ **ความซับซ้อนของ Business Logic** ในระบบ Enterprise ที่ต้องการความแม่นยำสูง เช่น Banking, Insurance, Logistics, Healthcare — ระบบที่ถ้า Business Logic ผิดแม้แต่นิดเดียว อาจนำไปสู่ความเสียหายมหาศาล

Strategic DDD คือส่วนที่ว่าด้วย **ภาพใหญ่** — การแบ่งระบบออกเป็น Bounded Contexts, การสร้าง Ubiquitous Language, และการออกแบบความสัมพันธ์ระหว่าง Contexts

## 2. บทนิยาม

**Domain-Driven Design (DDD)** หมายถึง แนวทางการออกแบบซอฟต์แวร์ที่ให้ความสำคัญกับ Domain Model เป็นศูนย์กลาง โดยอาศัยความร่วมมือระหว่าง Domain Experts และ Developers

**คำนิยามของ Eric Evans:**
> "Domain-Driven Design is not a technology or a methodology. It is a way of thinking and a set of priorities, aimed at accelerating software projects that have to deal with complicated domains."

**คำนิยามเชิงปฏิบัติ:**
> DDD = การจำลอง Domain ลงในโค้ด ผ่านภาษากลางที่ทุกคนเข้าใจ

**Strategic vs Tactical DDD:**

| มิติ | Strategic DDD | Tactical DDD |
|------|---------------|--------------|
| **ขอบเขต** | ภาพใหญ่ | ภาพเล็ก |
| **โฟกัส** | Bounded Context | Entity, Value Object |
| **ผู้เกี่ยวข้อง** | ทุกคน | Developers |
| **เวลา** | ก่อนเริ่ม | ระหว่างImplement |

## 3. บทหัวข้อ

### 3.1 Strategic DDD คืออะไร

Strategic DDD ประกอบด้วย 5 แนวคิดหลัก:

| แนวคิด | ความหมาย |
|--------|----------|
| **Domain** | ขอบเขตธุรกิจ |
| **Subdomain** | ส่วนย่อยของ Domain |
| **Ubiquitous Language** | ภาษากลาง |
| **Bounded Context** | ขอบเขตของ Model |
| **Context Map** | แผนที่ความสัมพันธ์ |

**ประเภทของ Subdomain:**

| ประเภท | ความหมาย | กลยุทธ์ |
|--------|----------|---------|
| **Core Domain** | หัวใจธุรกิจ | สร้างเอง, ลงทุนสูง |
| **Supporting** | สนับสนุน | สร้างเอง, ลงทุนกลาง |
| **Generic** | ทั่วไป | ซื้อ, ใช้ Open Source |

**ตัวอย่าง E-Commerce:**

```
Core Domain:
- Product Catalog
- Order Management
- Pricing

Supporting:
- User Management
- Notification
- Reporting

Generic:
- Authentication (Auth0)
- Payment (Stripe)
- Email (SendGrid)
```

**Ubiquitous Language:**

คำที่ใช้ใน Domain ต้องใช้เหมือนกันทั้ง:
- การพูดคุยกับ Domain Expert
- เอกสาร
- โค้ด
- Database Schema

**ตัวอย่าง:**

```
❌ ผิด:
Domain Expert: "ลูกค้าสั่งซื้อสินค้า"
Developer: "User creates Purchase Record"
Database: "tbl_transaction"
Code: "create_transaction()"

✅ ถูก:
Domain Expert: "ลูกค้าสั่งซื้อสินค้า"
Developer: "Customer places Order"
Database: "orders"
Code: "customer.place_order()"
```

**Bounded Context:**

```
┌─────────────────────────────────────┐
│         Sales Context               │
│  Customer = ผู้ซื้อ                 │
│  Product = สินค้าที่ขาย             │
│  Order = คำสั่งซื้อ                 │
└─────────────────────────────────────┘

┌─────────────────────────────────────┐
│        Support Context              │
│  Customer = ผู้ติดต่อ               │
│  Product = สินค้าที่มีปัญหา         │
│  Ticket = ใบแจ้งปัญหา               │
└─────────────────────────────────────┘

คำว่า "Customer" หมายต่างกันในแต่ละ Context
```

### 3.2 ทำงานอย่างไร

**Context Mapping Patterns:**

| Pattern | ความสัมพันธ์ | ใช้เมื่อ |
|---------|-------------|----------|
| **Partnership** | สองทีมร่วมมือ | ทีมเท่ากัน |
| **Shared Kernel** | แชร์ Model | ทีมใกล้ชิด |
| **Customer-Supplier** | Upstream-Downstream | ทีม上下游 |
| **Conformist** | ตาม Upstream | ไม่มีอำนาจต่อรอง |
| **Anticorruption Layer** | แปลง Model | ระบบเก่า/ภายนอก |
| **Open Host Service** | API สาธารณะ | หลาย Consumer |
| **Published Language** | ภาษากลาง | หลาย Context |
| **Separate Ways** | ไม่เชื่อม | ไม่จำเป็น |

**ตัวอย่าง Context Map:**

```
                    ┌─────────────┐
                    │   Sales     │
                    │  (Core)     │
                    └──────┬──────┘
                           │
                    Customer-Supplier
                           │
                    ┌──────▼──────┐
                    │  Shipping   │
                    │(Supporting) │
                    └──────┬──────┘
                           │
                    Anticorruption Layer
                           │
                    ┌──────▼──────┐
                    │  Legacy     │
                    │  ERP System │
                    └─────────────┘
```

**Anticorruption Layer (ACL):**

```python
# Legacy System ส่งข้อมูลแบบนี้
legacy_data = {
    "CUST_NO": "12345",
    "CUST_NM": "John Doe",
    "ORD_DT": "20240115",
    "ORD_AMT": "99.99"
}

# ACL แปลงเป็น Model ของเรา
class LegacyCustomerAdapter:
    def to_domain(self, legacy_data):
        return Customer(
            id=CustomerId(legacy_data["CUST_NO"]),
            name=CustomerName(legacy_data["CUST_NM"])
        )

class LegacyOrderAdapter:
    def to_domain(self, legacy_data):
        return Order(
            customer_id=CustomerId(legacy_data["CUST_NO"]),
            placed_at=datetime.strptime(legacy_data["ORD_DT"], "%Y%m%d"),
            total=Money(Decimal(legacy_data["ORD_AMT"]), "USD")
        )
```

**Context Mapping Process:**

```
1. Event Storming
   - รวบรวม Domain Events
   - ระบุ Commands, Actors

2. ระบุ Bounded Contexts
   - จัดกลุ่ม Events
   - หา Boundaries

3. สร้าง Context Map
   - ระบุความสัมพันธ์
   - กำหนด Patterns

4. กำหนด Ubiquitous Language
   - ต่อ Context
   - Glossary

5. ออกแบบ Integration
   - API, Events
   - ACL
```

### 3.3 การใช้งาน

**Strategic DDD ใช้เมื่อ:**

1. **Domain ซับซ้อน** — Banking, Insurance, Healthcare
2. **ทีมใหญ่** — หลายทีมทำงานร่วมกัน
3. **ระบบอายุยาว** — ต้อง Evolve หลายปี
4. **Business Logic เยอะ** — ไม่ใช่ CRUD
5. **Domain Experts เข้าถึงได้** — ร่วมมือได้

**เมื่อไม่ควรใช้:**

- CRUD Application
- Prototype, MVP
- Domain ง่าย
- ทีมเล็กมาก
- ไม่มี Domain Expert

### 3.4 ข้อดี

- ✅ **Shared Understanding** — ทุกคนเข้าใจตรงกัน
- ✅ **Clear Boundaries** — ขอบเขตชัดเจน
- ✅ **Team Autonomy** — ทีมอิสระ
- ✅ **Business Alignment** — ตรงกับธุรกิจ
- ✅ **Scalability** — Scale ทีมและระบบ
- ✅ **Maintainability** — บำรุงรักษาง่าย

### 3.5 ข้อเสีย

- ❌ **Learning Curve** — เข้าใจยาก
- ❌ **Time Investment** — ใช้เวลามาก
- ❌ **Requires Domain Expert** — ต้องมีผู้เชี่ยวชาญ
- ❌ **Over-Engineering** — สำหรับ Domain ง่าย
- ❌ **Political Challenges** — การเมืององค์กร
- ❌ **Hard to Measure** — วัดผลยาก

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- อย่าใช้ DDD กับทุกโปรเจกต์
- อย่าละเลย Domain Expert
- อย่า Bounded Context ตาม Technical Layer
- ระวัง Distributed Monolith

**ข้อห้าม:**
- ❌ ห้ามใช้ Ubiquitous Language ผิด Context
- ❌ ห้าม Share Database ระหว่าง Contexts
- ❌ ห้ามใช้ Model เดียวทั้งระบบ
- ❌ ห้าม Ignore Context Mapping
- ❌ ห้ามใช้ DDD เพื่อความเท่

**ข้อจำกัด:**
- ต้องการ Domain Expert ที่เข้าถึงได้
- ต้องการทีมที่มีประสบการณ์
- ต้องการเวลาและงบประมาณ
- ไม่เหมาะกับทุก Domain

### 3.7 สรุป

Strategic DDD เป็นเครื่องมือที่ทรงพลังสำหรับระบบที่ซับซ้อน แต่ต้องใช้อย่างมีวิจารณญาณ ไม่ใช่ทุกโปรเจกต์ต้องใช้ DDD

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

```
┌─────────────────────────────────────────────┐
│              Domain                         │
│  ┌─────────────┐ ┌─────────────┐           │
│  │ Core Domain │ │  Supporting │           │
│  │  (Sales)    │ │  (Shipping) │           │
│  └─────────────┘ └─────────────┘           │
│  ┌─────────────┐                           │
│  │  Generic    │                           │
│  │  (Payment)  │                           │
│  └─────────────┘                           │
└─────────────────────────────────────────────┘
         │
    ┌────▼────┐
    │Bounded  │
    │Contexts │
    └────┬────┘
         │
    ┌────▼────┐
    │ Context │
    │   Map   │
    └─────────┘
```

### 4.2 โครงสร้างทำงานอย่างไร

**Bounded Context Boundary:**

```
┌─────────────────────────────────────┐
│         Sales Context               │
│  ┌─────────────────────────────┐    │
│  │   Ubiquitous Language       │    │
│  │  - Customer                 │    │
│  │  - Order                    │    │
│  │  - Product                  │    │
│  └─────────────────────────────┘    │
│  ┌─────────────────────────────┐    │
│  │      Domain Model           │    │
│  └─────────────────────────────┘    │
│  ┌─────────────────────────────┐    │
│  │      Database               │    │
│  └─────────────────────────────┘    │
└─────────────────────────────────────┘
```

### 4.3 โครงสร้างการใช้งาน

| Layer | หน้าที่ | ตัวอย่าง |
|-------|---------|----------|
| Domain | Business Logic | Order, Customer |
| Subdomain | ส่วนย่อย | Sales, Shipping |
| Bounded Context | ขอบเขต Model | Sales Context |
| Context Map | ความสัมพันธ์ | Sales → Shipping |

### 4.4 สรุป

โครงสร้าง Strategic DDD ช่วยให้เห็นภาพใหญ่ และแบ่งระบบอย่างมีเหตุผล

---

## 5. แนวทางการประยุกต์ใช้

**Event Storming:**

```
1. Preparations
   - เชิญ Domain Experts + Developers
   - เตรียม Post-it

2. Discover Events (สีส้ม)
   - OrderPlaced, PaymentReceived

3. Add Commands (สีฟ้า)
   - PlaceOrder, ProcessPayment

4. Add Actors (สีเหลือง)
   - Customer, Admin

5. Add Policies (สีม่วง)
   - When OrderPlaced → SendEmail

6. Add Read Models (สีเขียว)
   - Order Summary

7. Identify Bounded Contexts
   - จัดกลุ่ม Events

8. Define Context Map
   - ระบุความสัมพันธ์
```

**Framework:**

```
1. เข้าใจ Domain
   - พูดคุย Domain Expert
   - Event Storming

2. ระบุ Subdomains
   - Core, Supporting, Generic

3. แบ่ง Bounded Contexts
   - ตาม Model Boundary

4. สร้าง Context Map
   - ระบุ Patterns

5. กำหนด Ubiquitous Language
   - Glossary ต่อ Context

6. ออกแบบ Integration
   - API, Events, ACL
```

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา: E-Commerce Platform**

**Subdomains:**

| Subdomain | ประเภท | ทีม |
|-----------|--------|-----|
| Product Catalog | Core | Team A |
| Order Management | Core | Team B |
| Pricing | Core | Team C |
| User Management | Supporting | Team D |
| Notification | Supporting | Team D |
| Authentication | Generic | ใช้ Auth0 |
| Payment | Generic | ใช้ Stripe |

**Bounded Contexts:**

```
┌─────────────┐      ┌─────────────┐
│  Catalog    │      │   Order     │
│  Context    │◄────►│   Context   │
│             │      │             │
│  Product    │      │  Order      │
│  Category   │      │  OrderItem  │
└─────────────┘      └──────┬──────┘
                            │
                     Customer-Supplier
                            │
                     ┌──────▼──────┐
                     │  Payment    │
                     │  Context    │
                     └─────────────┘
```

**Ubiquitous Language ต่อ Context:**

| คำ | Catalog Context | Order Context |
|----|----------------|---------------|
| Product | สินค้า | รายการสั่งซื้อ |
| Customer | ผู้เยี่ยมชม | ผู้สั่งซื้อ |
| Order | ไม่มี | คำสั่งซื้อ |

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| Bounded Context ไม่ชัด | ไม่มี Domain Expert | Event Storming |
| Ubiquitous Language ไม่ตรง | สื่อสารไม่ดี | Glossary, Workshop |
| Context Map ซับซ้อน | Integration เยอะ | ลด Coupling |
| ทีมไม่ Buy-in | ไม่เข้าใจประโยชน์ | Training, Workshop |
| Over-Engineering | ใช้ผิดที่ | เลือกใช้ตาม Context |

---

# บทที่ 2: Tactical DDD

## 1. บทนำ

Tactical DDD คือส่วนที่ว่าด้วย **Building Blocks** — เครื่องมือที่ใช้สร้าง Domain Model ประกอบด้วย Entity, Value Object, Aggregate, Domain Event, Repository, Service, Factory — ทั้งหมดนี้คือคำศัพท์ที่ Developers ต้องเข้าใจเพื่อจำลอง Domain ลงในโค้ด

บทนี้จะพาคุณเจาะลึกแต่ละ Building Block พร้อมตัวอย่างโค้ดที่ใช้ได้จริง

## 2. บทนิยาม

**Tactical DDD** หมายถึง ชุดของ Building Blocks และ Pattern ที่ใช้สร้าง Domain Model ภายใน Bounded Context

**Building Blocks หลัก:**

| Building Block | ความหมาย |
|----------------|----------|
| **Entity** | Object ที่มี Identity |
| **Value Object** | Object ที่ไม่มี Identity |
| **Aggregate** | กลุ่มของ Entities/VOs |
| **Aggregate Root** | Entry Point ของ Aggregate |
| **Domain Event** | เหตุการณ์ใน Domain |
| **Repository** | ที่เก็บ Aggregate |
| **Domain Service** | Logic ที่ไม่ใช่ของ Entity |
| **Factory** | สร้าง Complex Object |
| **Module** | จัดกลุ่ม Concept |

## 3. บทหัวข้อ

### 3.1 Tactical DDD คืออะไร

**Entity:**

Object ที่มี Identity เฉพาะตัว และ Identity นี้คงอยู่ตลอด lifecycle

```python
class Customer:
    def __init__(self, id: CustomerId, name: CustomerName):
        self.id = id          # Identity
        self.name = name
        self.email = None
    
    def __eq__(self, other):
        return isinstance(other, Customer) and self.id == other.id
    
    def __hash__(self):
        return hash(self.id)

# สอง Customers เท่ากันถ้ามี id เดียวกัน
c1 = Customer(CustomerId("C1"), CustomerName("Alice"))
c2 = Customer(CustomerId("C1"), CustomerName("Bob"))
assert c1 == c2  # True
```

**Value Object:**

Object ที่ไม่มี Identity เท่ากันถ้าค่าทุกอย่างเท่ากัน ควร Immutable

```python
from dataclasses import dataclass
from decimal import Decimal

@dataclass(frozen=True)
class Money:
    amount: Decimal
    currency: str
    
    def __post_init__(self):
        if self.amount < 0:
            raise ValueError("Amount cannot be negative")
        if self.currency not in ["USD", "EUR", "THB"]:
            raise ValueError("Invalid currency")
    
    def add(self, other: "Money") -> "Money":
        if self.currency != other.currency:
            raise ValueError("Currency mismatch")
        return Money(self.amount + other.amount, self.currency)
    
    def multiply(self, factor: Decimal) -> "Money":
        return Money(self.amount * factor, self.currency)

@dataclass(frozen=True)
class Address:
    street: str
    city: str
    country: str
    postal_code: str

@dataclass(frozen=True)
class CustomerId:
    value: str

@dataclass(frozen=True)
class Email:
    value: str
    
    def __post_init__(self):
        if "@" not in self.value:
            raise ValueError("Invalid email")
```

**Aggregate:**

กลุ่มของ Entities และ Value Objects ที่ถือเป็นหน่วยเดียวกัน ผ่าน Aggregate Root

```python
class Order:  # Aggregate Root
    def __init__(self, id: OrderId, customer_id: CustomerId):
        self.id = id
        self.customer_id = customer_id
        self.items: List[OrderItem] = []
        self.status = OrderStatus.DRAFT
        self._events = []
    
    def add_item(self, product_id: ProductId, quantity: int, price: Money):
        if self.status != OrderStatus.DRAFT:
            raise DomainError("Cannot modify confirmed order")
        if quantity <= 0:
            raise DomainError("Quantity must be positive")
        
        # Business Rule: ห้ามเกิน 100 items
        if len(self.items) >= 100:
            raise DomainError("Order cannot have more than 100 items")
        
        self.items.append(OrderItem(product_id, quantity, price))
        self._events.append(ItemAdded(self.id, product_id, quantity))
    
    def remove_item(self, product_id: ProductId):
        if self.status != OrderStatus.DRAFT:
            raise DomainError("Cannot modify confirmed order")
        self.items = [i for i in self.items if i.product_id != product_id]
    
    def confirm(self):
        if not self.items:
            raise DomainError("Cannot confirm empty order")
        if self.status != OrderStatus.DRAFT:
            raise DomainError("Order already confirmed")
        
        self.status = OrderStatus.CONFIRMED
        self._events.append(OrderConfirmed(self.id, self.total()))
    
    def total(self) -> Money:
        if not self.items:
            return Money(Decimal("0"), "USD")
        return sum(
            (item.subtotal() for item in self.items),
            Money(Decimal("0"), "USD")
        )
    
    def pull_events(self):
        events = self._events[:]
        self._events.clear()
        return events

class OrderItem:  # Entity ภายใน Aggregate
    def __init__(self, product_id: ProductId, quantity: int, price: Money):
        self.product_id = product_id
        self.quantity = quantity
        self.price = price
    
    def subtotal(self) -> Money:
        return self.price.multiply(Decimal(self.quantity))
```

**Aggregate Design Rules:**

1. **Protect Invariants** — Business Rules ต้องถูกบังคับภายใน Aggregate
2. **Reference by ID** — Aggregate อื่นอ้างถึงด้วย ID เท่านั้น
3. **One Transaction per Aggregate** — 1 Transaction = 1 Aggregate
4. **Small Aggregates** — Aggregate ยิ่งเล็กยิ่งดี
5. **Eventual Consistency** — ระหว่าง Aggregates ใช้ Eventual

**Domain Event:**

```python
from dataclasses import dataclass
from datetime import datetime

@dataclass(frozen=True)
class DomainEvent:
    occurred_at: datetime

@dataclass(frozen=True)
class OrderConfirmed(DomainEvent):
    order_id: str
    total_amount: Decimal
    currency: str

@dataclass(frozen=True)
class OrderCancelled(DomainEvent):
    order_id: str
    reason: str
```

**Repository:**

```python
class OrderRepository(ABC):
    @abstractmethod
    def save(self, order: Order) -> None: pass
    
    @abstractmethod
    def find_by_id(self, id: OrderId) -> Optional[Order]: pass
    
    @abstractmethod
    def find_by_customer(self, customer_id: CustomerId) -> List[Order]: pass
    
    @abstractmethod
    def next_id(self) -> OrderId: pass

class PostgresOrderRepository(OrderRepository):
    def __init__(self, connection):
        self.conn = connection
    
    def save(self, order: Order):
        # Save aggregate
        with self.conn.transaction():
            self.conn.execute(
                "INSERT INTO orders (id, customer_id, status, total) "
                "VALUES (%s, %s, %s, %s) "
                "ON CONFLICT (id) DO UPDATE SET status = EXCLUDED.status",
                order.id.value,
                order.customer_id.value,
                order.status.value,
                order.total().amount
            )
            # Save items
            self.conn.execute("DELETE FROM order_items WHERE order_id = %s", order.id.value)
            for item in order.items:
                self.conn.execute(
                    "INSERT INTO order_items (order_id, product_id, quantity, price) "
                    "VALUES (%s, %s, %s, %s)",
                    order.id.value, item.product_id.value, item.quantity, item.price.amount
                )
    
    def find_by_id(self, id: OrderId) -> Optional[Order]:
        row = self.conn.query_one("SELECT * FROM orders WHERE id = %s", id.value)
        if not row:
            return None
        order = Order(OrderId(row["id"]), CustomerId(row["customer_id"]))
        for item_row in self.conn.query("SELECT * FROM order_items WHERE order_id = %s", id.value):
            order.items.append(OrderItem(
                ProductId(item_row["product_id"]),
                item_row["quantity"],
                Money(item_row["price"], "USD")
            ))
        order.status = OrderStatus(row["status"])
        return order
```

**Domain Service:**

Logic ที่ไม่ใช่ของ Entity หรือ Value Object โดยธรรมชาติ

```python
class PricingService:
    """Logic การคิดราคาที่ขึ้นกับหลาย Aggregate"""
    
    def __init__(self, product_repo, discount_repo):
        self.product_repo = product_repo
        self.discount_repo = discount_repo
    
    def calculate_total(self, order: Order, customer: Customer) -> Money:
        subtotal = order.total()
        
        # Discount ตาม Customer Tier
        discount = self.discount_repo.get_for_customer(customer.id)
        
        # Promotion
        promotion = self._get_active_promotion(order)
        
        return self._apply_discounts(subtotal, discount, promotion)
```

**Factory:**

```python
class OrderFactory:
    def __init__(self, id_generator, product_repo):
        self.id_generator = id_generator
        self.product_repo = product_repo
    
    def create_order(self, customer: Customer, items_data: List[dict]) -> Order:
        order = Order(self.id_generator.next(), customer.id)
        for item_data in items_data:
            product = self.product_repo.find_by_id(item_data["product_id"])
            if not product:
                raise DomainError(f"Product not found: {item_data['product_id']}")
            order.add_item(
                product_id=product.id,
                quantity=item_data["quantity"],
                price=product.current_price
            )
        return order
```

### 3.2 ทำงานอย่างไร

**Aggregate Lifecycle:**

```
1. Create
   Factory → new Aggregate → Validate Invariants

2. Modify
   Load from Repo → Call Methods → Validate Rules

3. Persist
   Save to Repo → Publish Events

4. Delete
   Mark as Deleted → Publish Event
```

**Transaction Boundary:**

```
✅ ถูก:
┌─────────────────────────┐
│  Transaction            │
│  ┌─────────────────┐    │
│  │  Order          │    │
│  │  (Aggregate)    │    │
│  └─────────────────┘    │
└─────────────────────────┘

❌ ผิด:
┌─────────────────────────┐
│  Transaction            │
│  ┌─────────┐ ┌─────────┐│
│  │ Order   │ │Customer ││
│  │Aggregate│ │Aggregate││
│  └─────────┘ └─────────┘│
└─────────────────────────┘
```

**Event Publishing:**

```python
class OrderService:
    def __init__(self, repo, event_bus):
        self.repo = repo
        self.event_bus = event_bus
    
    def confirm_order(self, order_id: OrderId):
        order = self.repo.find_by_id(order_id)
        if not order:
            raise DomainError("Order not found")
        
        order.confirm()
        self.repo.save(order)
        
        # Publish events หลัง save สำเร็จ
        for event in order.pull_events():
            self.event_bus.publish(event)
```

### 3.3 การใช้งาน

**เมื่อใช้ Building Block ไหน:**

| Building Block | ใช้เมื่อ |
|----------------|----------|
| Entity | มี Identity, Lifecycle |
| Value Object | ไม่มี Identity, Immutable |
| Aggregate | มี Invariants ต้องป้องกัน |
| Domain Event | ต้องแจ้งเหตุการณ์ |
| Repository | ต้อง Persist Aggregate |
| Domain Service | Logic ข้าม Aggregate |
| Factory | สร้าง Complex Aggregate |

### 3.4 ข้อดี

- ✅ **Expressive Model** — สื่อ Business ได้
- ✅ **Invariant Protection** — Business Rules แน่น
- ✅ **Testable** — Test Domain ได้
- ✅ **Maintainable** — แก้ไขง่าย
- ✅ **Ubiquitous Language** — โค้ดตรงกับธุรกิจ

### 3.5 ข้อเสีย

- ❌ **Learning Curve** — เข้าใจยาก
- ❌ **Boilerplate** — โค้ดเยอะ
- ❌ **Performance** — Load ทั้ง Aggregate
- ❌ **Over-Engineering** — สำหรับ CRUD

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- ระวัง Aggregate ใหญ่เกินไป
- ระวัง Anemic Domain Model
- ระวัง Lazy Loading ที่ผิด
- ระวัง N+1 Query

**ข้อห้าม:**
- ❌ ห้าม Reference Aggregate อื่นด้วย Object
- ❌ ห้าม 1 Transaction ข้าม Aggregate
- ❌ ห้าม Getter/Setter ทุก Field
- ❌ ห้าม Business Logic ใน Service
- ❌ ห้ามใช้ ORM Entity เป็น Domain Entity

**ข้อจำกัด:**
- Aggregate ใหญ่ = Performance ตก
- Eventual Consistency ระหว่าง Aggregates
- ต้องมี Discipline สูง

### 3.7 สรุป

Tactical DDD ให้เครื่องมือที่ทรงพลังในการจำลอง Domain แต่ต้องใช้อย่างมีวินัย

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

```
┌─────────────────────────────────────────────┐
│            Bounded Context                  │
│  ┌─────────────────────────────────────┐    │
│  │         Application Layer           │    │
│  │  ┌─────────────┐ ┌─────────────┐   │    │
│  │  │ Use Case    │ │ Domain      │   │    │
│  │  │             │ │ Service     │   │    │
│  │  └─────────────┘ └─────────────┘   │    │
│  └─────────────────────────────────────┘    │
│  ┌─────────────────────────────────────┐    │
│  │           Domain Layer              │    │
│  │  ┌─────────┐ ┌─────────┐           │    │
│  │  │Aggregate│ │  Value  │           │    │
│  │  │  Root   │ │ Object  │           │    │
│  │  └─────────┘ └─────────┘           │    │
│  │  ┌─────────┐ ┌─────────┐           │    │
│  │  │ Entity  │ │  Domain │           │    │
│  │  │         │ │  Event  │           │    │
│  │  └─────────┘ └─────────┘           │    │
│  └─────────────────────────────────────┘    │
│  ┌─────────────────────────────────────┐    │
│  │       Infrastructure Layer          │    │
│  │  ┌─────────────┐ ┌─────────────┐   │    │
│  │  │ Repository  │ │  Event Bus  │   │    │
│  │  │    Impl     │ │    Impl     │   │    │
│  │  └─────────────┘ └─────────────┘   │    │
│  └─────────────────────────────────────┘    │
└─────────────────────────────────────────────┘
```

### 4.2 โครงสร้างทำงานอย่างไร

**Aggregate Boundary:**

```
┌─────────────────────────────────────┐
│      Order Aggregate                │
│  ┌─────────────────────────────┐    │
│  │      Order (Root)           │    │
│  │  - id: OrderId              │    │
│  │  - customer_id: CustomerId  │    │
│  │  - items: List<OrderItem>   │    │
│  │  - status: OrderStatus      │    │
│  └──────────┬──────────────────┘    │
│             │                        │
│  ┌──────────▼──────────────────┐    │
│  │      OrderItem              │    │
│  │  - product_id: ProductId    │    │
│  │  - quantity: int            │    │
│  │  - price: Money             │    │
│  └─────────────────────────────┘    │
└─────────────────────────────────────┘
         │
    Reference by ID
         │
┌────────▼────────┐
│ Customer        │
│ (อื่น Aggregate)│
└─────────────────┘
```

### 4.3 โครงสร้างการใช้งาน

| Layer | หน้าที่ | ตัวอย่าง |
|-------|---------|----------|
| Domain | Business Logic | Order, Money |
| Application | Orchestration | PlaceOrderUseCase |
| Infrastructure | Technical | PostgresRepo |

### 4.4 สรุป

โครงสร้าง Tactical DDD ทำให้ Business Logic บริสุทธิ์ และ Testable

---

## 5. แนวทางการประยุกต์ใช้

**Framework:**

```
1. ระบุ Aggregate
   - Consistency Boundary
   - Invariants

2. ออกแบบ Aggregate Root
   - Public Methods
   - Invariant Checks

3. ระบุ Value Objects
   - Immutable
   - Self-Validating

4. ระบุ Domain Events
   - Past Tense
   - Business Meaning

5. ออกแบบ Repository
   - 1 Repo per Aggregate
   - Collection-like Interface

6. ระบุ Domain Service
   - Logic ข้าม Aggregate
```

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา: Banking System**

```python
# Value Objects
@dataclass(frozen=True)
class AccountNumber:
    value: str

@dataclass(frozen=True)
class Money:
    amount: Decimal
    currency: str
    
    def add(self, other): ...
    def subtract(self, other): ...

# Entity
class Transaction:
    def __init__(self, id, amount, type, timestamp):
        self.id = id
        self.amount = amount
        self.type = type
        self.timestamp = timestamp

# Aggregate Root
class Account:
    def __init__(self, number: AccountNumber, balance: Money):
        self.number = number
        self.balance = balance
        self.transactions: List[Transaction] = []
        self._events = []
    
    def deposit(self, amount: Money):
        if amount.amount <= 0:
            raise DomainError("Deposit must be positive")
        if amount.currency != self.balance.currency:
            raise DomainError("Currency mismatch")
        
        self.balance = self.balance.add(amount)
        self.transactions.append(Transaction(
            id=uuid4(),
            amount=amount,
            type="DEPOSIT",
            timestamp=datetime.utcnow()
        ))
        self._events.append(MoneyDeposited(self.number, amount))
    
    def withdraw(self, amount: Money):
        if amount.amount <= 0:
            raise DomainError("Withdrawal must be positive")
        if amount.amount > self.balance.amount:
            raise DomainError("Insufficient funds")
        
        self.balance = self.balance.subtract(amount)
        self.transactions.append(Transaction(
            id=uuid4(),
            amount=amount,
            type="WITHDRAWAL",
            timestamp=datetime.utcnow()
        ))
        self._events.append(MoneyWithdrawn(self.number, amount))
    
    def transfer(self, to: AccountNumber, amount: Money):
        # Transfer ต้องใช้ Saga เพราะข้าม Aggregate
        self.withdraw(amount)
        self._events.append(TransferInitiated(self.number, to, amount))
```

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| Aggregate ใหญ่ | Load ทั้งก้อน | แยกเป็น Aggregate เล็ก |
| Anemic Model | Logic ใน Service | ย้าย Logic เข้า Entity |
| N+1 Query | Lazy Loading | Eager Loading, Batch |
| Eventual Consistency | ข้าม Aggregate | Saga, Domain Event |
| Performance | Load Aggregate | CQRS, Read Model |

---

# บทที่ 3: DDD in Practice

## 1. บทนำ

ทฤษฎีสำคัญ แต่การนำไปใช้จริงยากกว่า บทนี้จะพาคุณผ่านการประยุกต์ใช้ DDD ใน Production ตั้งแต่การ Integrate กับ Clean Architecture, การทำ CQRS, Event Sourcing, Saga Pattern ไปจนถึง Case Studies จริง

## 2. บทนิยาม

**DDD in Practice** หมายถึง การนำ Strategic และ Tactical DDD ไปใช้ในระบบ Production จริง

## 3. บทหัวข้อ

### 3.1 DDD in Practice คืออะไร

**การ Integrate กับ Architecture:**

| Architecture | ความสัมพันธ์ |
|--------------|--------------|
| Clean Architecture | Domain อยู่ชั้นในสุด |
| Hexagonal | Domain อยู่ Core |
| Event-Driven | Domain Events เป็นแกน |
| CQRS | แยก Read/Write Model |

**DDD + Clean Architecture:**

```
┌─────────────────────────────────────────────┐
│         Frameworks & Drivers                │
│  ┌───────────────────────────────────────┐  │
│  │      Interface Adapters              │  │
│  │  ┌─────────────────────────────────┐  │  │
│  │  │      Application               │  │  │
│  │  │  ┌─────────────────────────┐   │  │  │
│  │  │  │      Domain           │   │  │  │
│  │  │  │  - Entity             │   │  │  │
│  │  │  │  - Value Object       │   │  │  │
│  │  │  │  - Aggregate          │   │  │  │
│  │  │  │  - Domain Event       │   │  │  │
│  │  │  │  - Repository (I)     │   │  │  │
│  │  │  └─────────────────────────┘   │  │  │
│  │  └─────────────────────────────────┘  │  │
│  └───────────────────────────────────────┘  │
└─────────────────────────────────────────────┘
```

### 3.2 ทำงานอย่างไร

**CQRS Implementation:**

```python
# Write Model (Command)
@dataclass
class PlaceOrderCommand:
    customer_id: str
    items: List[dict]

class PlaceOrderHandler:
    def __init__(self, repo, event_bus):
        self.repo = repo
        self.event_bus = event_bus
    
    def handle(self, command: PlaceOrderCommand):
        order = Order.create(command.customer_id, command.items)
        self.repo.save(order)
        for event in order.pull_events():
            self.event_bus.publish(event)
        return order.id

# Read Model (Query)
@dataclass
class OrderSummary:
    order_id: str
    customer_name: str
    total: Decimal
    status: str

class OrderSummaryProjection:
    """ฟัง Events แล้วอัปเดต Read Model"""
    
    def __init__(self, read_db):
        self.read_db = read_db
    
    def on_order_confirmed(self, event: OrderConfirmed):
        self.read_db.execute(
            "UPDATE order_summaries SET status = 'CONFIRMED' WHERE order_id = %s",
            event.order_id
        )
    
    def on_customer_updated(self, event: CustomerUpdated):
        self.read_db.execute(
            "UPDATE order_summaries SET customer_name = %s WHERE customer_id = %s",
            event.name, event.customer_id
        )

# Query Handler
class GetOrderSummaryHandler:
    def __init__(self, read_db):
        self.read_db = read_db
    
    def handle(self, order_id: str) -> OrderSummary:
        row = self.read_db.query_one(
            "SELECT * FROM order_summaries WHERE order_id = %s",
            order_id
        )
        return OrderSummary(**row)
```

**Event Sourcing:**

```python
class EventStore:
    def __init__(self, connection):
        self.conn = connection
    
    def append(self, aggregate_id: str, events: List[DomainEvent], expected_version: int):
        with self.conn.transaction():
            # Optimistic Concurrency
            current_version = self._get_version(aggregate_id)
            if current_version != expected_version:
                raise ConcurrencyError()
            
            for i, event in enumerate(events):
                self.conn.execute(
                    "INSERT INTO events (aggregate_id, version, event_type, data, occurred_at) "
                    "VALUES (%s, %s, %s, %s, %s)",
                    aggregate_id,
                    expected_version + i + 1,
                    type(event).__name__,
                    json.dumps(asdict(event)),
                    event.occurred_at
                )
    
    def load(self, aggregate_id: str) -> List[DomainEvent]:
        rows = self.conn.query(
            "SELECT event_type, data FROM events WHERE aggregate_id = %s ORDER BY version",
            aggregate_id
        )
        return [self._deserialize(row) for row in rows]

class OrderRepository:
    def __init__(self, event_store):
        self.event_store = event_store
    
    def save(self, order: Order):
        events = order.pull_events()
        self.event_store.append(order.id.value, events, order.version)
    
    def find_by_id(self, id: OrderId) -> Order:
        events = self.event_store.load(id.value)
        order = Order()
        for event in events:
            order.apply(event)
        return order

# Aggregate with Event Sourcing
class Order:
    def __init__(self):
        self.id = None
        self.items = []
        self.status = None
        self.version = 0
        self._events = []
    
    @classmethod
    def create(cls, customer_id, items):
        order = cls()
        order._apply(OrderCreated(
            order_id=str(uuid4()),
            customer_id=customer_id,
            occurred_at=datetime.utcnow()
        ))
        for item in items:
            order._apply(ItemAdded(
                order_id=order.id,
                product_id=item["product_id"],
                quantity=item["quantity"],
                price=item["price"],
                occurred_at=datetime.utcnow()
            ))
        return order
    
    def apply(self, event):
        self._apply(event)
        self.version += 1
    
    def _apply(self, event):
        handler = getattr(self, f"_on_{type(event).__name__}")
        handler(event)
        self._events.append(event)
    
    def _on_OrderCreated(self, event):
        self.id = OrderId(event.order_id)
        self.status = "DRAFT"
    
    def _on_ItemAdded(self, event):
        self.items.append(OrderItem(
            ProductId(event.product_id),
            event.quantity,
            Money(event.price, "USD")
        ))
```

**Saga Pattern:**

```python
class OrderSaga:
    """Orchestration Saga"""
    
    def __init__(self, payment_service, inventory_service, shipping_service):
        self.payment = payment_service
        self.inventory = inventory_service
        self.shipping = shipping_service
        self.state = {}
    
    def execute(self, order: Order):
        try:
            # Step 1: Reserve Inventory
            reservation_id = self.inventory.reserve(order.items)
            self.state["reservation_id"] = reservation_id
            
            # Step 2: Charge Payment
            payment_id = self.payment.charge(order.customer_id, order.total())
            self.state["payment_id"] = payment_id
            
            # Step 3: Schedule Shipping
            shipping_id = self.shipping.schedule(order.id, order.address)
            self.state["shipping_id"] = shipping_id
            
            return SagaResult.success()
        
        except InventoryError as e:
            return self._compensate(e)
        
        except PaymentError as e:
            return self._compensate(e)
        
        except ShippingError as e:
            return self._compensate(e)
    
    def _compensate(self, error):
        # Rollback ในลำดับย้อนกลับ
        if "shipping_id" in self.state:
            self.shipping.cancel(self.state["shipping_id"])
        if "payment_id" in self.state:
            self.payment.refund(self.state["payment_id"])
        if "reservation_id" in self.state:
            self.inventory.release(self.state["reservation_id"])
        
        return SagaResult.failure(error)
```

### 3.3 การใช้งาน

**เมื่อใช้ Pattern ไหน:**

| Pattern | ใช้เมื่อ |
|---------|----------|
| CQRS | Read/Write ต่างกันมาก |
| Event Sourcing | ต้องการ Audit, Time Travel |
| Saga | Distributed Transaction |
| Outbox | Atomic Event Publishing |
| Process Manager | Long-Running Process |

**Outbox Pattern:**

```python
class OrderService:
    def __init__(self, db, event_bus):
        self.db = db
        self.event_bus = event_bus
    
    def place_order(self, request):
        with self.db.transaction():
            # 1. Save Aggregate
            order = Order.create(request)
            self.db.execute("INSERT INTO orders ...", order)
            
            # 2. Save Events to Outbox (ใน Transaction เดียวกัน)
            for event in order.pull_events():
                self.db.execute(
                    "INSERT INTO outbox (event_type, data, published) "
                    "VALUES (%s, %s, false)",
                    type(event).__name__, json.dumps(asdict(event))
                )
        
        # 3. Publish Events (Background Job)
        self._publish_pending()
    
    def _publish_pending(self):
        events = self.db.query(
            "SELECT * FROM outbox WHERE published = false ORDER BY id LIMIT 100"
        )
        for event in events:
            try:
                self.event_bus.publish(event)
                self.db.execute(
                    "UPDATE outbox SET published = true WHERE id = %s",
                    event["id"]
                )
            except Exception:
                break  # Retry later
```

### 3.4 ข้อดี

- ✅ **Auditability** — เก็บ History
- ✅ **Scalability** — Read/Write แยก
- ✅ **Flexibility** — เพิ่ม Read Model ได้
- ✅ **Temporal Queries** — ดู State อดีต
- ✅ **Event Replay** — Rebuild State

### 3.5 ข้อเสีย

- ❌ **Complexity** — สูงมาก
- ❌ **Eventual Consistency** — ไม่ Strong
- ❌ **Event Versioning** — ยาก
- ❌ **Storage** — เก็บ Events เยอะ
- ❌ **Debugging** — ยาก

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- ระวัง Event Schema Evolution
- ระวัง Event Store โต
- ระวัง Snapshot
- ระวัง Projection Rebuild

**ข้อห้าม:**
- ❌ ห้ามใช้ Event Sourcing กับทุก Aggregate
- ❌ ห้าม Publish Event ก่อน Commit
- ❌ ห้าม Assume Exactly-Once
- ❌ ห้าม Ignore Idempotency
- ❌ ห้ามใช้ CQRS โดยไม่มี Reason

**ข้อจำกัด:**
- ต้องมี Infrastructure รองรับ
- ต้องมี Team Maturity
- ต้องมี Observability ดี

### 3.7 สรุป

DDD in Practice ต้อง Balance ระหว่าง Idealism vs Pragmatism ใช้เท่าที่จำเป็น

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

```
src/
├── domain/                    # Core Domain
│   ├── model/
│   │   ├── order/
│   │   │   ├── order.py       # Aggregate Root
│   │   │   ├── order_item.py  # Entity
│   │   │   ├── order_id.py    # Value Object
│   │   │   └── events.py      # Domain Events
│   │   └── customer/
│   ├── services/              # Domain Services
│   └── repositories/          # Repository Interfaces
│
├── application/               # Use Cases
│   ├── commands/
│   │   ├── place_order.py
│   │   └── handlers.py
│   ├── queries/
│   │   ├── get_order.py
│   │   └── handlers.py
│   └── sagas/
│       └── order_saga.py
│
├── infrastructure/            # Adapters
│   ├── persistence/
│   │   ├── postgres_order_repo.py
│   │   └── event_store.py
│   ├── messaging/
│   │   ├── kafka_publisher.py
│   │   └── kafka_consumer.py
│   └── projections/
│       └── order_summary.py
│
└── presentation/              # API
    ├── rest/
    └── graphql/
```

### 4.2 โครงสร้างทำงานอย่างไร

```
Command → CommandHandler → Aggregate → Repository → EventStore
                                │
                                ▼
                          Domain Events
                                │
                    ┌───────────┼───────────┐
                    ▼           ▼           ▼
              Projection   Saga        Notification
                    │
                    ▼
              Read Model
                    │
                    ▲
Query ──────────────┘
```

### 4.3 โครงสร้างการใช้งาน

| Layer | หน้าที่ | ตัวอย่าง |
|-------|---------|----------|
| Domain | Business Logic | Order, Money |
| Application | Orchestration | PlaceOrderHandler |
| Infrastructure | Technical | PostgresRepo |
| Presentation | API | REST Controller |

### 4.4 สรุป

โครงสร้างที่ชัดเจนทำให้ DDD ทำงานได้จริงใน Production

---

## 5. แนวทางการประยุกต์ใช้

**Framework:**

```
1. เริ่มจาก Strategic DDD
   - Bounded Contexts
   - Context Map

2. เลือก Tactical Patterns
   - Entity, VO, Aggregate
   - Domain Events

3. Integrate กับ Architecture
   - Clean Architecture
   - Hexagonal

4. เพิ่ม Advanced Patterns
   - CQRS
   - Event Sourcing
   - Saga

5. Observability
   - Tracing
   - Metrics
   - Logging
```

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา: E-Commerce Platform**

**Bounded Contexts:**

| Context | Core? | Patterns |
|---------|-------|----------|
| Catalog | Core | Entity, VO |
| Order | Core | Aggregate, Events |
| Payment | Core | Aggregate, Saga |
| Shipping | Supporting | Entity |
| User | Supporting | Entity |
| Notification | Generic | Simple |

**Order Context:**

```python
# Domain
class Order:  # Aggregate Root
    ...

class OrderRepository(ABC):  # Port
    ...

# Application
class PlaceOrderHandler:  # Use Case
    ...

# Infrastructure
class PostgresOrderRepository(OrderRepository):  # Adapter
    ...

class KafkaEventPublisher:  # Adapter
    ...

# Projection
class OrderSummaryProjection:
    ...

# Saga
class OrderFulfillmentSaga:
    ...
```

**Integration:**

```
Order Context ──Event──► Payment Context
     │                        │
     │                        │
     └──Event──► Shipping Context
                      │
                      │
                      └──Event──► Notification Context
```

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| Event Schema เปลี่ยน | ไม่มี Versioning | Schema Registry |
| Event Store โต | เก็บทุก Event | Snapshot, Archive |
| Projection ช้า | Rebuild บ่อย | Incremental, Cache |
| Saga ซับซ้อน | หลาย Steps | State Machine |
| Eventual Consistency | Async | UI Feedback |
| Debugging ยาก | Distributed | Tracing, Correlation ID |
| Performance | Load Aggregate | CQRS, Snapshot |

---

# 📘 สรุปเล่มที่ 5

**สิ่งที่ได้เรียนรู้:**

1. **Strategic DDD** — Bounded Context, Ubiquitous Language, Context Map
2. **Tactical DDD** — Entity, Value Object, Aggregate, Domain Event
3. **DDD in Practice** — CQRS, Event Sourcing, Saga, Outbox

**คำแนะนำ:**
- เริ่มจาก Strategic DDD
- ใช้ Tactical DDD ตามความจำเป็น
- Integrate กับ Clean Architecture
- ใช้ Advanced Patterns เมื่อจำเป็น

**หนังสือแนะนำ:**
- "Domain-Driven Design" — Eric Evans
- "Implementing Domain-Driven Design" — Vaughn Vernon
- "Domain-Driven Design Distilled" — Vaughn Vernon
- "Patterns, Principles, and Practices of DDD" — Scott Millett
- "Learning Domain-Driven Design" — Vlad Khononov

---

# 📘 เล่มถัดไป (โครงร่าง)

## เล่มที่ 6: DevOps & Cloud
- บทที่ 1: CI/CD Pipeline
- บทที่ 2: Cloud Platform AWS
- บทที่ 3: Infrastructure as Code

## เล่มที่ 7: AI Systems Architecture
- บทที่ 1: RAG Pipeline Architecture
- บทที่ 2: Agentic AI Architecture
- บทที่ 3: LLM Platform Engineering

---
 