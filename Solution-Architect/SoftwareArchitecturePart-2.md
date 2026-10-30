## 📘 เล่มที่ 2: กระบวนทัศน์การเขียนโปรแกรม (Programming Paradigms)

---

# บทที่ 1: Object-Oriented Programming (OOP)

## 1. บทนำ

OOP คือกระบวนทัศน์การเขียนโปรแกรมที่ Dominant ที่สุดในอุตสาหกรรมซอฟต์แวร์มานานกว่า 40 ปี ภาษาเกือบทุกภาษาสมัยใหม่รองรับ OOP ไม่ว่าจะเป็น Java, C#, Python, TypeScript, Go, Swift หรือ Kotlin แต่ทักษะที่หายากไม่ใช่ "เขียน OOP ได้" — มันคือ "เขียน OOP ได้ดี" โค้ดที่เต็มไปด้วย Inheritance ลึก 5 ชั้น, God Class ที่มี 3,000 บรรทัด, หรือ Method ที่ชื่อ `processDataAndSaveToDatabaseAndSendEmail()` — ทั้งหมดนี้คืออาการของ OOP ที่ถูกใช้ผิด

บทนี้จะพาคุณเข้าใจ OOP อย่างลึกซึ้ง ตั้งแต่หลักการพื้นฐาน 4 ประการ ไปจนถึงหลัก SOLID ที่เป็นรากฐานของ Clean Code และ Design Patterns ที่ใช้จริงใน Production

## 2. บทนิยาม

**Object-Oriented Programming (OOP)** หมายถึง กระบวนทัศน์การเขียนโปรแกรมที่จัดโครงสร้างซอฟต์แวร์ให้อยู่ในรูปของ "วัตถุ" (Objects) ซึ่งรวมข้อมูล (State) และพฤติกรรม (Behavior) ไว้ด้วยกัน

**คำนิยามเชิงปฏิบัติ:**
> OOP = การจำลองโลกจริงด้วย Objects ที่มี State + Behavior + Identity

**Alan Kay (ผู้บัญญัติคำว่า OOP):**
> "OOP to me means only messaging, local retention and protection and hiding of state-process, and extreme late-binding of all things."

**หมายเหตุสำคัญ:** Alan Kay เน้น **Messaging** ไม่ใช่ Inheritance — ซึ่งเป็นสิ่งที่คนส่วนใหญ่เข้าใจผิด

## 3. บทหัวข้อ

### 3.1 OOP คืออะไร

OOP ประกอบด้วย 4 หลักการหลัก (Pillars of OOP):

| หลักการ | ความหมาย | ตัวอย่าง |
|---------|----------|----------|
| **Encapsulation** | ซ่อน State ภายใน เปิดเผยเฉพาะ Interface | `private` fields, public methods |
| **Abstraction** | ซ่อนความซับซ้อน เผยเฉพาะสิ่งจำเป็น | Interface, Abstract Class |
| **Inheritance** | สืบทอดคุณสมบัติจาก Parent | `class Dog extends Animal` |
| **Polymorphism** | หลายรูปแบบ ทำงานตาม Type จริง | Method Overriding, Overloading |

**นอกจากนี้ยังมีหลักการสำคัญอื่นๆ:**

- **Composition over Inheritance** — ประกอบดีกว่าสืบทอด
- **SOLID Principles** — หลักการออกแบบ 5 ข้อ
- **Law of Demeter** — อย่าคุยกับคนแปลกหน้า
- **DRY / KISS / YAGNI** — หลักการพื้นฐาน

### 3.2 ทำงานอย่างไร

**Encapsulation:**

```python
class BankAccount:
    def __init__(self, balance):
        self.__balance = balance  # private
    
    def deposit(self, amount):
        if amount <= 0:
            raise ValueError("Amount must be positive")
        self.__balance += amount
    
    def get_balance(self):
        return self.__balance

# ใช้งาน
account = BankAccount(1000)
account.deposit(500)
print(account.get_balance())  # 1500
# account.__balance = 999999  # ไม่สามารถเข้าถึงได้โดยตรง
```

**Abstraction:**

```python
from abc import ABC, abstractmethod

class PaymentProcessor(ABC):
    @abstractmethod
    def process(self, amount):
        pass

class StripeProcessor(PaymentProcessor):
    def process(self, amount):
        # Stripe-specific logic
        return f"Processed ${amount} via Stripe"

class PayPalProcessor(PaymentProcessor):
    def process(self, amount):
        # PayPal-specific logic
        return f"Processed ${amount} via PayPal"

# Client ไม่ต้องรู้ Implementation
def checkout(processor: PaymentProcessor, amount):
    return processor.process(amount)
```

**Inheritance:**

```python
class Animal:
    def __init__(self, name):
        self.name = name
    
    def speak(self):
        raise NotImplementedError

class Dog(Animal):
    def speak(self):
        return f"{self.name} says Woof!"

class Cat(Animal):
    def speak(self):
        return f"{self.name} says Meow!"
```

**Polymorphism:**

```python
animals = [Dog("Rex"), Cat("Whiskers")]
for animal in animals:
    print(animal.speak())  # ทำงานต่างกันตาม Type จริง
```

**SOLID Principles:**

| หลักการ | ชื่อเต็ม | ความหมาย |
|---------|----------|----------|
| **S** | Single Responsibility | 1 Class = 1 หน้าที่ |
| **O** | Open/Closed | เปิดให้ขยาย ปิดให้แก้ไข |
| **L** | Liskov Substitution | Subclass แทน Superclass ได้ |
| **I** | Interface Segregation | Interface เล็กดีกว่าใหญ่ |
| **D** | Dependency Inversion | ขึ้นกับ Abstraction ไม่ใช่ Concrete |

**ตัวอย่าง SRP:**

```python
# ❌ ผิด: Class ทำหลายอย่าง
class User:
    def save_to_db(self): ...
    def send_email(self): ...
    def generate_report(self): ...

# ✅ ถูก: แยกหน้าที่
class User:
    def __init__(self, name, email):
        self.name = name
        self.email = email

class UserRepository:
    def save(self, user): ...

class EmailService:
    def send(self, user, message): ...

class ReportGenerator:
    def generate(self, user): ...
```

**ตัวอย่าง DIP:**

```python
# ❌ ผิด: ขึ้นกับ Concrete
class OrderService:
    def __init__(self):
        self.repo = MySQLOrderRepository()  # ผูกติด MySQL

# ✅ ถูก: ขึ้นกับ Abstraction
class OrderRepository(ABC):
    @abstractmethod
    def save(self, order): pass

class OrderService:
    def __init__(self, repo: OrderRepository):
        self.repo = repo  # Inject ได้
```

### 3.3 การใช้งาน

**OOP ใช้เมื่อ:**

1. **Domain มี Entities ชัดเจน** — User, Order, Product
2. **มี State ที่ต้องจัดการ** — Session, Cart, Game State
3. **ต้องการ Polymorphism** — Payment Methods, Plugins
4. **ทีมใหญ่ต้องมี Shared Vocabulary** — Ubiquitous Language
5. **ระบบมี Business Rules ซับซ้อน** — Enterprise Application

**เมื่อไม่ควรใช้ OOP:**

1. **Data Pipeline** — Functional เหมาะกว่า
2. **Stateless Computation** — Pure Function ดีกว่า
3. **Concurrent System** — Actor Model / CSP อาจเหมาะกว่า
4. **Script เล็กๆ** — Procedural พอ

### 3.4 ข้อดี

- ✅ **จำลองโลกจริงได้ดี** — Objects สื่อความหมาย
- ✅ **Encapsulation** — ลด Coupling, เพิ่ม Cohesion
- ✅ **Reusability** — Inheritance, Composition
- ✅ **Maintainability** — แก้ไขที่เดียว
- ✅ **Team Scalability** — แบ่งงานตาม Class
- ✅ **Ecosystem ใหญ่** — Framework ส่วนใหญ่เป็น OOP

### 3.5 ข้อเสีย

- ❌ **Over-Engineering** — Class เยอะเกินจำเป็น
- ❌ **Inheritance Hell** — ลึกหลายชั้น เข้าใจยาก
- ❌ **Mutable State** — ปัญหาใน Concurrent
- ❌ **Hidden Dependencies** — Singleton, Global State
- ❌ **Ceremony** — boilerplate เยอะ
- ❌ **Testing ยาก** — ถ้าไม่ใช้ DIP

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- ระวัง **Anemic Domain Model** — Class ที่มีแค่ Getter/Setter ไม่มี Behavior
- ระวัง **God Object** — Class ที่ทำทุกอย่าง
- ระวัง **Deep Inheritance** — เกิน 3 ชั้นให้สงสัย
- ระวัง **Circular Dependency** — A ใช้ B, B ใช้ A

**ข้อห้าม:**
- ❌ ห้ามใช้ Inheritance เพื่อ Reuse Code (ใช้ Composition)
- ❌ ห้ามเข้าถึง Field โดยตรงจาก Outside (ใช้ Method)
- ❌ ห้ามสร้าง Singleton ทุกที่
- ❌ ห้ามใช้ `instanceof` / `isinstance` ใน Business Logic
- ❌ ห้าม Inherit จาก Concrete Class

**ข้อจำกัด:**
- OOP ไม่เหมาะกับ Stateless Computation
- OOP มี Overhead ใน Memory-Constrained Environment
- Multiple Inheritance มีปัญหา Diamond Problem (ยกเว้นภาษาเช่น C++ ที่จัดการได้)

### 3.7 สรุป

OOP เป็นเครื่องมือที่ทรงพลัง แต่ต้องใช้อย่างมีวินัย หลัก SOLID และ Composition over Inheritance คือหัวใจสำคัญ เป้าหมายไม่ใช่ "เขียน OOP" แต่คือ "เขียนโค้ดที่ maintainable และ testable"

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

โครงสร้างของ OOP ประกอบด้วย:

```
┌─────────────────────────────────────┐
│           Application               │
│  ┌─────────────────────────────┐    │
│  │      Domain Layer           │    │
│  │  ┌──────────┐ ┌──────────┐  │    │
│  │  │ Entity   │ │ Value Obj│  │    │
│  │  └──────────┘ └──────────┘  │    │
│  └─────────────────────────────┘    │
│  ┌─────────────────────────────┐    │
│  │    Service Layer            │    │
│  │  ┌──────────┐ ┌──────────┐  │    │
│  │  │ Use Case │ │ Service  │  │    │
│  │  └──────────┘ └──────────┘  │    │
│  └─────────────────────────────┘    │
│  ┌─────────────────────────────┐    │
│  │  Infrastructure Layer       │    │
│  │  ┌──────────┐ ┌──────────┐  │    │
│  │  │   Repo   │ │  Client  │  │    │
│  │  └──────────┘ └──────────┘  │    │
│  └─────────────────────────────┘    │
└─────────────────────────────────────┘
```

### 4.2 โครงสร้างทำงานอย่างไร

**Relationships ระหว่าง Classes:**

| Relationship | สัญลักษณ์ | ความหมาย | ตัวอย่าง |
|--------------|-----------|----------|----------|
| Association | ─── | รู้จักกัน | Student ─ Course |
| Aggregation | ◇── | มี (weak) | Department ◇─ Professor |
| Composition | ◆── | มี (strong) | House ◆─ Room |
| Inheritance | ──▷ | เป็น | Dog ─▷ Animal |
| Realization | ┄▷ | Implement | Stripe ┄▷ Payment |
| Dependency | ┄┄> | ใช้ชั่วคราว | Service ┄> Logger |

**ตัวอย่าง Composition:**

```python
class Engine:
    def start(self):
        return "Engine started"

class Car:
    def __init__(self):
        self.engine = Engine()  # Composition
    
    def start(self):
        return self.engine.start()

# ถ้า Car ถูกทำลาย Engine ก็ถูกทำลายด้วย
```

**ตัวอย่าง Aggregation:**

```python
class Professor:
    def __init__(self, name):
        self.name = name

class Department:
    def __init__(self, name):
        self.name = name
        self.professors = []  # Aggregation
    
    def add_professor(self, prof):
        self.professors.append(prof)
```

### 4.3 โครงสร้างการใช้งาน

| Layer | หน้าที่ | ตัวอย่าง Class |
|-------|---------|----------------|
| Domain | Business Rules | Order, Customer, Money |
| Application | Orchestration | PlaceOrderUseCase |
| Infrastructure | Technical | MySQLRepo, StripeClient |
| Presentation | UI/API | OrderController, OrderView |

### 4.4 สรุป

โครงสร้างที่ดีจะทำให้ Business Logic บริสุทธิ์ ไม่ผูกติดกับ Infrastructure ทำให้ทดสอบง่ายและเปลี่ยนเทคโนโลยีได้

---

## 5. แนวทางการประยุกต์ใช้

**Framework การตัดสินใจ:**

```
1. Class นี้มี Behavior จริงไหม?
   → ไม่ → อาจเป็น Data Class / Struct
   → ใช่ → ดำเนินการต่อ

2. Class นี้มี Responsibility เดียวไหม?
   → ไม่ → แยก

3. ต้อง Inherit ไหม?
   → ใช่ → มี Behavior ร่วมจริงหรือไม่?
      → ใช่ → Inheritance
      → ไม่ → Composition
   → ไม่ → Composition

4. ขึ้นกับ Concrete หรือ Abstraction?
   → Concrete → ใช้ DIP
```

**หลักการสำคัญ:**

1. **Favor Composition over Inheritance**
2. **Program to Interface, not Implementation**
3. **Keep Classes Small** — < 200 บรรทัด
4. **Keep Methods Small** — < 20 บรรทัด
5. **Avoid Anemic Domain Model**

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา 1: E-Commerce Domain**

```python
# Value Object
class Money:
    def __init__(self, amount, currency):
        self.amount = amount
        self.currency = currency
    
    def add(self, other):
        if self.currency != other.currency:
            raise ValueError("Currency mismatch")
        return Money(self.amount + other.amount, self.currency)

# Entity
class Order:
    def __init__(self, id, customer):
        self.id = id
        self.customer = customer
        self.items = []
        self.status = "DRAFT"
    
    def add_item(self, product, quantity):
        if self.status != "DRAFT":
            raise ValueError("Cannot modify confirmed order")
        self.items.append(OrderItem(product, quantity))
    
    def confirm(self):
        if not self.items:
            raise ValueError("Empty order")
        self.status = "CONFIRMED"
        return OrderConfirmed(self.id)  # Domain Event

# Repository Interface
class OrderRepository(ABC):
    @abstractmethod
    def save(self, order): pass
    
    @abstractmethod
    def find_by_id(self, id): pass

# Use Case
class PlaceOrderUseCase:
    def __init__(self, repo: OrderRepository, event_bus):
        self.repo = repo
        self.event_bus = event_bus
    
    def execute(self, customer_id, items):
        order = Order(uuid4(), customer_id)
        for item in items:
            order.add_item(item.product, item.quantity)
        order.confirm()
        self.repo.save(order)
        self.event_bus.publish(OrderConfirmed(order.id))
```

**กรณีศึกษา 2: Payment Gateway Abstraction**

```python
class PaymentGateway(ABC):
    @abstractmethod
    def charge(self, amount, token): pass
    
    @abstractmethod
    def refund(self, transaction_id): pass

class StripeGateway(PaymentGateway):
    def charge(self, amount, token):
        return stripe.Charge.create(amount=amount, source=token)

class OmiseGateway(PaymentGateway):
    def charge(self, amount, token):
        return omise.Charges.create(amount=amount, token=token)

# Client Code ไม่ต้องรู้ Implementation
class CheckoutService:
    def __init__(self, gateway: PaymentGateway):
        self.gateway = gateway
    
    def checkout(self, cart, token):
        return self.gateway.charge(cart.total, token)
```

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| God Class | ไม่แยก Responsibility | ใช้ SRP, แยก Service |
| Deep Inheritance | Reuse Code ผิดวิธี | ใช้ Composition |
| Anemic Domain | Business Logic อยู่ใน Service | ย้าย Logic เข้า Entity |
| Circular Dependency | Coupling สูง | ใช้ Interface, Event |
| Singleton ทุกที่ | Global State | ใช้ Dependency Injection |
| Testing ยาก | ผูกติด Concrete | ใช้ DIP, Mock |
| Fragile Base Class | Inheritance ลึก | ใช้ Composition |

---

# บทที่ 2: Functional Programming (FP)

## 1. บทนำ

Functional Programming กำลังกลับมาได้รับความนิยมอย่างมากในยุคของ Big Data, Concurrent Systems และ AI/ML ภาษาเช่น Haskell, Erlang, Elixir, Clojure, F#, Scala ถูกใช้ในระบบที่ต้องการ Reliability สูง ขณะที่ภาษา OOP อย่าง Java, Python, JavaScript ก็เพิ่ม FP Features เข้ามา (Lambda, Stream, Optional)

FP ไม่ใช่แค่ "การเขียน Function" แต่เป็นวิธีคิดที่แตกต่าง fundamentally จาก OOP — แทนที่จะบอก "ทำอย่างไร" (Imperative) FP บอก "อะไร" (Declarative) และแทนที่จะใช้ State ที่เปลี่ยนได้ FP ใช้ Immutability

บทนี้จะพาคุณเข้าใจ FP ตั้งแต่ Pure Function ไปจนถึง Monad และวิธีประยุกต์ใช้ใน Production

## 2. บทนิยาม

**Functional Programming (FP)** หมายถึง กระบวนทัศน์การเขียนโปรแกรมที่มอง Computation เป็นการประเมิน Mathematical Functions และหลีกเลี่ยงการเปลี่ยน State และ Mutable Data

**คำนิยามเชิงปฏิบัติ:**
> FP = การเขียนโปรแกรมด้วย Pure Functions + Immutable Data + Composition

**John Hughes (Why Functional Programming Matters):**
> "Functional programming is so called because its fundamental operation is the application of functions to arguments."

**ลักษณะสำคัญของ FP:**

| ลักษณะ | ความหมาย |
|--------|----------|
| Pure Functions | Input เดิม → Output เดิม เสมอ |
| Immutability | ข้อมูลเปลี่ยนแปลงไม่ได้ |
| First-Class Functions | Function เป็น Value ได้ |
| Higher-Order Functions | Function รับ/คืน Function |
| Referential Transparency | แทน Expression ด้วย Value ได้ |
| Lazy Evaluation | ประเมินเมื่อจำเป็น |
| Recursion | แทน Loop |

## 3. บทหัวข้อ

### 3.1 Functional Programming คืออะไร

**Pure Function:**

```python
# Pure: Input เดิม → Output เดิม
def add(a, b):
    return a + b

# Impure: มี Side Effect
counter = 0
def increment():
    global counter
    counter += 1  # Side Effect
    return counter
```

**Immutability:**

```python
# ❌ Mutable
numbers = [1, 2, 3]
numbers.append(4)  # แก้ไข List เดิม

# ✅ Immutable
numbers = [1, 2, 3]
new_numbers = numbers + [4]  # สร้าง List ใหม่
```

**First-Class & Higher-Order Functions:**

```python
# Function เป็น Value
def greet(name):
    return f"Hello, {name}"

say_hello = greet  # กำหนดให้ตัวแปร
print(say_hello("World"))

# Higher-Order Function
def apply_twice(func, value):
    return func(func(value))

def add_one(x):
    return x + 1

print(apply_twice(add_one, 5))  # 7
```

**Function Composition:**

```python
from functools import reduce

def compose(*functions):
    return reduce(lambda f, g: lambda x: f(g(x)), functions)

def double(x): return x * 2
def increment(x): return x + 1

pipeline = compose(double, increment)
print(pipeline(5))  # (5+1)*2 = 12
```

### 3.2 ทำงานอย่างไร

**Map, Filter, Reduce:**

```python
numbers = [1, 2, 3, 4, 5]

# Map: แปลงทุก Element
doubled = list(map(lambda x: x * 2, numbers))
# [2, 4, 6, 8, 10]

# Filter: กรอง
evens = list(filter(lambda x: x % 2 == 0, numbers))
# [2, 4]

# Reduce: รวม
total = reduce(lambda acc, x: acc + x, numbers, 0)
# 15
```

**Currying:**

```python
# ปกติ
def add(a, b, c):
    return a + b + c

# Curried
def add_curried(a):
    def add_b(b):
        def add_c(c):
            return a + b + c
        return add_c
    return add_b

# ใช้งาน
add_5 = add_curried(5)
add_5_10 = add_5(10)
print(add_5_10(3))  # 18
```

**Recursion แทน Loop:**

```python
# Imperative
def factorial_iter(n):
    result = 1
    for i in range(1, n + 1):
        result *= i
    return result

# Functional
def factorial(n):
    if n <= 1:
        return 1
    return n * factorial(n - 1)

# Tail Recursion (บางภาษา optimize ได้)
def factorial_tail(n, acc=1):
    if n <= 1:
        return acc
    return factorial_tail(n - 1, n * acc)
```

**Monad:**

Monad คือ Design Pattern ใน FP ที่ใช้ห่อ Value และ Chain Operations

```python
# Maybe Monad (สำหรับ Null Safety)
class Maybe:
    def __init__(self, value):
        self._value = value
    
    @staticmethod
    def of(value):
        return Maybe(value)
    
    def map(self, func):
        if self._value is None:
            return Maybe(None)
        return Maybe(func(self._value))
    
    def flat_map(self, func):
        if self._value is None:
            return Maybe(None)
        return func(self._value)
    
    def get_or_else(self, default):
        return self._value if self._value is not None else default

# ใช้งาน
result = (Maybe.of({"user": {"name": "Alice"}})
          .map(lambda d: d.get("user"))
          .map(lambda u: u.get("name"))
          .get_or_else("Unknown"))
# "Alice"
```

**Either Monad (สำหรับ Error Handling):**

```python
class Either:
    def __init__(self, value, is_right):
        self.value = value
        self.is_right = is_right
    
    @staticmethod
    def right(value): return Either(value, True)
    
    @staticmethod
    def left(error): return Either(error, False)
    
    def map(self, func):
        if self.is_right:
            return Either.right(func(self.value))
        return self
    
    def flat_map(self, func):
        if self.is_right:
            return func(self.value)
        return self
```

### 3.3 การใช้งาน

**FP ใช้เมื่อ:**

1. **Data Transformation** — ETL, Data Pipeline
2. **Concurrent Systems** — Immutability ป้องกัน Race Condition
3. **Event Processing** — Stream Processing
4. **Mathematical Computation** — AI/ML
5. **Error Handling** — Either, Result Type
6. **UI State Management** — Redux, Elm Architecture

**ภาษาและ FP Features:**

| ภาษา | FP Features |
|------|-------------|
| Haskell | Pure FP |
| Erlang/Elixir | Actor + FP |
| Clojure | Lisp + FP |
| Scala | OOP + FP |
| F# | .NET FP |
| Python | Lambda, Map, Filter, Decorators |
| JavaScript | First-Class Functions, Arrow |
| Java 8+ | Lambda, Stream, Optional |
| Rust | Ownership, Pattern Matching |

### 3.4 ข้อดี

- ✅ **Predictable** — Pure Function ทดสอบง่าย
- ✅ **Concurrent-Safe** — Immutability ป้องกัน Race
- ✅ **Composable** — ต่อ Function เล็กเป็นใหญ่
- ✅ **Testable** — ไม่ต้อง Mock
- ✅ **Less Bugs** — ไม่มี Hidden State
- ✅ **Parallelizable** — แบ่งงานได้ง่าย

### 3.5 ข้อเสีย

- ❌ **Learning Curve สูง** — Monad, Functor ยาก
- ❌ **Performance** — Immutability มี Overhead
- ❌ **Memory Usage** — สร้าง Object ใหม่บ่อย
- ❌ **Verbose** — บาง Operation ยาวกว่า Imperative
- ❌ **Ecosystem เล็ก** — ในบาง Domain
- ❌ **Debugging ยาก** — Stack Trace ไม่ตรง

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- ระวัง **Performance** — Immutability มีต้นทุน
- ระวัง **Stack Overflow** — Recursion ลึก
- ระวัง **Over-Abstraction** — Monad ทุกที่
- ระวัง **Lazy Evaluation** — Memory Leak

**ข้อห้าม:**
- ❌ ห้ามใช้ Mutable State ใน FP Core
- ❌ ห้ามใช้ Side Effect ใน Pure Function
- ❌ ห้าม Mix Imperative + FP โดยไม่มีขอบเขตชัดเจน
- ❌ ห้ามใช้ Monad เพื่อความเท่

**ข้อจำกัด:**
- FP บริสุทธิ์ยากใน System Programming
- I/O เป็น Side Effect โดยธรรมชาติ
- Performance-Critical Code ต้องการ Mutability
- บาง Domain เข้าใจยากกว่า OOP

### 3.7 สรุป

FP เป็นเครื่องมือที่ทรงพลังสำหรับ Data Transformation และ Concurrent Systems ไม่จำเป็นต้องเลือกอย่างใดอย่างหนึ่ง — ภาษาสมัยใหม่ผสมทั้ง OOP และ FP ได้

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

โครงสร้างของ FP ประกอบด้วย:

```
┌─────────────────────────────────────┐
│           Pure Core                 │
│  ┌─────────────────────────────┐    │
│  │  Pure Functions             │    │
│  │  Immutable Data             │    │
│  │  Composition                │    │
│  └─────────────────────────────┘    │
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│      Functional Core                │
│      Imperative Shell               │
│  ┌─────────────────────────────┐    │
│  │  I/O, Database, Network     │    │
│  │  Side Effects               │    │
│  └─────────────────────────────┘    │
└─────────────────────────────────────┘
```

**Functional Core, Imperative Shell** — แนวคิดสำคัญ:
- Core เป็น Pure Functions ทั้งหมด
- Shell จัดการ I/O และ Side Effects

### 4.2 โครงสร้างทำงานอย่างไร

**Data Flow ใน FP:**

```
Input → Transform → Transform → Transform → Output
         ↓            ↓            ↓
       Pure         Pure         Pure
```

**ตัวอย่าง Pipeline:**

```python
from functools import reduce

def pipeline(*functions):
    return lambda data: reduce(lambda acc, f: f(acc), functions, data)

# สร้าง Pipeline
process = pipeline(
    lambda users: filter(lambda u: u["active"], users),
    lambda users: map(lambda u: {**u, "name": u["name"].upper()}, users),
    lambda users: sorted(users, key=lambda u: u["name"]),
    list
)

users = [
    {"name": "alice", "active": True},
    {"name": "bob", "active": False},
    {"name": "charlie", "active": True},
]

result = process(users)
# [{'name': 'ALICE', 'active': True}, {'name': 'CHARLIE', 'active': True}]
```

### 4.3 โครงสร้างการใช้งาน

| Layer | หน้าที่ | ตัวอย่าง |
|-------|---------|----------|
| Pure Core | Business Logic | Validation, Transformation |
| Effect Layer | Side Effects | I/O, DB, Network |
| Composition | เชื่อม Functions | pipe, compose |
| Types | จำกัดค่า | Maybe, Either, Result |

### 4.4 สรุป

โครงสร้าง FP ที่ดีแยก Pure Core ออกจาก Imperative Shell ทำให้ทดสอบง่ายและ Reason เกี่ยวกับโค้ดได้

---

## 5. แนวทางการประยุกต์ใช้

**Framework การตัดสินใจ:**

```
1. งานนี้เป็น Data Transformation ไหม?
   → ใช่ → FP เหมาะ

2. ต้อง Concurrent ไหม?
   → ใช่ → FP ช่วยเรื่อง Immutability

3. มี I/O เยอะไหม?
   → ใช่ → แยกเป็น Imperative Shell

4. ทีมคุ้นเคยกับ FP ไหม?
   → ไม่ → เริ่มจาก Map/Filter/Reduce
```

**หลักการสำคัญ:**

1. **Start with Pure Functions**
2. **Push Side Effects to Edges**
3. **Use Immutable Data Structures**
4. **Compose Small Functions**
5. **Use Types to Model Domain**

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา 1: Redux State Management**

```javascript
// Reducer เป็น Pure Function
function todosReducer(state = [], action) {
  switch (action.type) {
    case 'ADD_TODO':
      return [...state, { text: action.text, done: false }];
    case 'TOGGLE_TODO':
      return state.map((todo, i) =>
        i === action.index ? { ...todo, done: !todo.done } : todo
      );
    default:
      return state;
  }
}
```

**กรณีศึกษา 2: Data Pipeline ด้วย Python**

```python
from dataclasses import dataclass
from typing import List

@dataclass(frozen=True)
class User:
    id: int
    name: str
    age: int
    active: bool

def filter_active(users: List[User]) -> List[User]:
    return [u for u in users if u.active]

def filter_adults(users: List[User]) -> List[User]:
    return [u for u in users if u.age >= 18]

def to_dict(user: User) -> dict:
    return {"id": user.id, "name": user.name}

def process_users(users: List[User]) -> List[dict]:
    return (
        users
        |> filter_active
        |> filter_adults
        |> (lambda us: map(to_dict, us))
        |> list
    )
```

**กรณีศึกษา 3: Either Monad ใน Go**

```go
type Result[T any] struct {
    value T
    err   error
}

func Ok[T any](v T) Result[T] {
    return Result[T]{value: v}
}

func Err[T any](e error) Result[T] {
    return Result[T]{err: e}
}

func (r Result[T]) Map(f func(T) T) Result[T] {
    if r.err != nil {
        return r
    }
    return Ok(f(r.value))
}
```

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| Performance ตก | Immutability | ใช้ Persistent Data Structures |
| Memory สูง | Copy ข้อมูลบ่อย | ใช้ Structural Sharing |
| Stack Overflow | Recursion ลึก | ใช้ Trampoline / Loop |
| อ่านยาก | Monad ซับซ้อน | ใช้ Named Functions |
| ทีมไม่คุ้น | Learning Curve | เริ่มจาก Map/Filter |
| Debugging ยาก | Point-Free Style | ใช้ Named Intermediate |

---

# บทที่ 3: Design Patterns

## 1. บทนำ

Design Patterns คือ "คำศัพท์กลาง" ของนักออกแบบซอฟต์แวร์ ช่วยให้ทีมสื่อสารกันได้ว่า "ตรงนี้ใช้ Strategy Pattern" แทนที่จะอธิบายยาว 10 นาที แต่ Patterns ก็เป็นดาบสองคม — ถ้าใช้ผิดที่ ผิดเวลา จะกลายเป็น Over-Engineering ที่ทำให้โค้ดซับซ้อนโดยไม่จำเป็น

บทนี้จะพาคุณเข้าใจ Design Patterns ตั้งแต่ GoF 23 Patterns ไปจนถึง Enterprise Patterns ที่ใช้จริงใน Production พร้อมเหตุผลว่าเมื่อไรควรใช้ และเมื่อไรควรหลีกเลี่ยง

## 2. บทนิยาม

**Design Pattern** หมายถึง วิธีแก้ปัญหาทั่วไป (General Solution) ที่พิสูจน์แล้วว่าดี สำหรับปัญหาที่พบบ่อยในการออกแบบซอฟต์แวร์

**คำนิยามของ Christopher Alexander (ผู้บัญญัติแนวคิด):**
> "Each pattern describes a problem which occurs over and over again in our environment, and then describes the core of the solution to that problem."

**GoF (Gang of Four):**
> Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides — ผู้เขียน "Design Patterns: Elements of Reusable Object-Oriented Software" (1994)

## 3. บทหัวข้อ

### 3.1 Design Patterns คืออะไร

**จำแนกเป็น 3 กลุ่มหลัก (GoF):**

| กลุ่ม | จุดประสงค์ | Patterns |
|-------|-----------|----------|
| **Creational** | การสร้าง Object | Singleton, Factory, Builder, Prototype, Abstract Factory |
| **Structural** | การประกอบ Object | Adapter, Decorator, Facade, Proxy, Composite, Bridge, Flyweight |
| **Behavioral** | การสื่อสารระหว่าง Object | Observer, Strategy, Command, State, Template Method, Iterator, Mediator, Chain of Responsibility, Visitor, Memento, Interpreter |

**Enterprise Patterns:**

| Pattern | จุดประสงค์ |
|---------|-----------|
| Repository | แยก Data Access |
| Unit of Work | จัดการ Transaction |
| Service Layer | Orchestration |
| DTO | Data Transfer |
| Specification | Business Rules |
| Domain Event | Event Notification |
| CQRS | แยก Read/Write |
| Saga | Distributed Transaction |

### 3.2 ทำงานอย่างไร

**Singleton:**

```python
class Database:
    _instance = None
    
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance.connection = "connected"
        return cls._instance

db1 = Database()
db2 = Database()
print(db1 is db2)  # True
```

**Factory:**

```python
class PaymentFactory:
    @staticmethod
    def create(method):
        if method == "stripe":
            return StripeProcessor()
        elif method == "paypal":
            return PayPalProcessor()
        raise ValueError(f"Unknown method: {method}")

processor = PaymentFactory.create("stripe")
```

**Builder:**

```python
class QueryBuilder:
    def __init__(self):
        self._select = "*"
        self._from = ""
        self._where = []
    
    def select(self, fields):
        self._select = fields
        return self
    
    def from_table(self, table):
        self._from = table
        return self
    
    def where(self, condition):
        self._where.append(condition)
        return self
    
    def build(self):
        query = f"SELECT {self._select} FROM {self._from}"
        if self._where:
            query += " WHERE " + " AND ".join(self._where)
        return query

query = (QueryBuilder()
    .select("id, name")
    .from_table("users")
    .where("age > 18")
    .where("active = true")
    .build())
# SELECT id, name FROM users WHERE age > 18 AND active = true
```

**Strategy:**

```python
class SortStrategy(ABC):
    @abstractmethod
    def sort(self, data): pass

class QuickSort(SortStrategy):
    def sort(self, data):
        return sorted(data)

class BubbleSort(SortStrategy):
    def sort(self, data):
        # Bubble sort implementation
        return sorted(data)  # simplified

class Sorter:
    def __init__(self, strategy: SortStrategy):
        self.strategy = strategy
    
    def sort(self, data):
        return self.strategy.sort(data)
```

**Observer:**

```python
class EventEmitter:
    def __init__(self):
        self._listeners = {}
    
    def on(self, event, callback):
        self._listeners.setdefault(event, []).append(callback)
    
    def emit(self, event, data):
        for callback in self._listeners.get(event, []):
            callback(data)

emitter = EventEmitter()
emitter.on("user_created", lambda u: print(f"Welcome {u['name']}"))
emitter.emit("user_created", {"name": "Alice"})
```

**Repository:**

```python
class UserRepository(ABC):
    @abstractmethod
    def find_by_id(self, id): pass
    
    @abstractmethod
    def save(self, user): pass

class PostgresUserRepository(UserRepository):
    def __init__(self, connection):
        self.conn = connection
    
    def find_by_id(self, id):
        row = self.conn.query("SELECT * FROM users WHERE id = %s", id)
        return User(**row) if row else None
    
    def save(self, user):
        self.conn.execute("INSERT INTO users ...", user)
```

**Decorator:**

```python
def log_calls(func):
    def wrapper(*args, **kwargs):
        print(f"Calling {func.__name__}")
        result = func(*args, **kwargs)
        print(f"Finished {func.__name__}")
        return result
    return wrapper

@log_calls
def process_order(order):
    return f"Processed {order}"
```

### 3.3 การใช้งาน

**เมื่อควรใช้:**

| Pattern | ใช้เมื่อ |
|---------|----------|
| Singleton | ต้องการ Instance เดียว (Config, Logger) |
| Factory | ซ่อน Logic การสร้าง Object |
| Builder | Object ซับซ้อน มี Parameter เยอะ |
| Strategy | มี Algorithm หลายแบบ สลับได้ |
| Observer | ต้อง Notify หลายส่วน |
| Decorator | เพิ่ม Behavior โดยไม่แก้ Class |
| Adapter | เชื่อม Interface ที่ไม่เข้ากัน |
| Repository | แยก Data Access |
| CQRS | Read/Write ต่างกันมาก |

**เมื่อไม่ควรใช้:**

- เมื่อปัญหายังไม่เกิด (YAGNI)
- เมื่อภาษาแก้ปัญหาให้แล้ว (First-Class Function แทน Strategy)
- เมื่อ Over-Engineering
- เมื่อทีมไม่เข้าใจ Pattern

### 3.4 ข้อดี

- ✅ **Shared Vocabulary** — สื่อสารง่าย
- ✅ **Proven Solutions** — ผ่านการพิสูจน์
- ✅ **Maintainability** — โครงสร้างชัดเจน
- ✅ **Flexibility** — ขยายได้ง่าย
- ✅ **Reusability** — ใช้ซ้ำได้

### 3.5 ข้อเสีย

- ❌ **Over-Engineering** — ใช้เกินจำเป็น
- ❌ **Complexity** — เพิ่ม Abstraction
- ❌ **Learning Curve** — ต้องเข้าใจก่อนใช้
- ❌ **Boilerplate** — โค้ดเยอะ
- ❌ **Misapplication** — ใช้ผิดที่

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- อย่าใช้ Pattern ก่อนเข้าใจปัญหา
- อย่าใช้ Singleton ทุกที่ (Global State)
- อย่าใช้ Abstract Factory เมื่อ Factory พอ
- ระวัง Pattern Fever

**ข้อห้าม:**
- ❌ ห้ามใช้ Pattern เพื่อความเท่
- ❌ ห้ามใช้ Singleton กับ Test
- ❌ ห้ามใช้ Inheritance เมื่อ Composition พอ
- ❌ ห้ามใช้ Pattern แทนการ Refactor

**ข้อจำกัด:**
- บาง Pattern ไม่จำเป็นในภาษาสมัยใหม่
- Strategy = First-Class Function ใน FP
- Observer = Reactive Streams
- Visitor = Pattern Matching

### 3.7 สรุป

Design Patterns เป็นเครื่องมือ ไม่ใช่เป้าหมาย ใช้เมื่อแก้ปัญหาจริง ไม่ใช่เพราะ "ควรใช้"

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

Pattern แต่ละตัวมีโครงสร้างเฉพาะ:

```
Strategy Pattern:
┌─────────────┐         ┌──────────────┐
│  Context    │────────>│  Strategy    │
│             │         │  (Abstract)  │
└─────────────┘         └──────┬───────┘
                               │
                    ┌──────────┼──────────┐
                    ▼          ▼          ▼
              ┌─────────┐ ┌─────────┐ ┌─────────┐
              │StrategyA│ │StrategyB│ │StrategyC│
              └─────────┘ └─────────┘ └─────────┘
```

### 4.2 โครงสร้างทำงานอย่างไร

**Observer Pattern Flow:**

```
Subject ──notify()──> Observer1
        ──notify()──> Observer2
        ──notify()──> Observer3

Observer ──subscribe()──> Subject
```

### 4.3 โครงสร้างการใช้งาน

| ระดับ | Patterns | ใช้เมื่อ |
|-------|----------|----------|
| Object | Factory, Singleton | สร้าง Object |
| Class | Adapter, Decorator | ประกอบ Class |
| Interaction | Observer, Mediator | สื่อสาร |
| Architecture | Repository, CQRS | ระดับระบบ |

### 4.4 สรุป

โครงสร้างของ Pattern ช่วยให้เข้าใจและสื่อสารได้ แต่ต้องเลือกให้เหมาะกับบริบท

---

## 5. แนวทางการประยุกต์ใช้

**Framework การเลือก Pattern:**

```
1. ปัญหาคืออะไร?
   → การสร้าง Object → Creational
   → การประกอบ → Structural
   → การสื่อสาร → Behavioral

2. มี Pattern ที่ตรงไหม?
   → ใช่ → ใช้
   → ไม่ → ออกแบบเอง

3. ซับซ้อนเกินไปไหม?
   → ใช่ → ใช้วิธีง่ายกว่า

4. ทีมเข้าใจไหม?
   → ไม่ → Document ให้ดี
```

**Pattern ที่ใช้บ่อยใน Production:**

1. **Repository** — ทุก Enterprise App
2. **Dependency Injection** — ทุก Framework
3. **Factory** — สร้าง Object ซับซ้อน
4. **Strategy** — Algorithm หลายแบบ
5. **Observer** — Event-Driven
6. **Decorator** — เพิ่ม Behavior
7. **Adapter** — เชื่อม Third-Party

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา 1: E-Commerce — Strategy + Factory**

```python
class ShippingStrategy(ABC):
    @abstractmethod
    def calculate(self, weight, distance): pass

class StandardShipping(ShippingStrategy):
    def calculate(self, weight, distance):
        return weight * 0.5 + distance * 0.1

class ExpressShipping(ShippingStrategy):
    def calculate(self, weight, distance):
        return weight * 1.5 + distance * 0.3

class ShippingFactory:
    _strategies = {
        "standard": StandardShipping,
        "express": ExpressShipping,
    }
    
    @classmethod
    def get(cls, method):
        return cls._strategies[method]()

# ใช้งาน
strategy = ShippingFactory.get("express")
cost = strategy.calculate(weight=10, distance=100)
```

**กรณีศึกษา 2: Event-Driven — Observer + Mediator**

```python
class EventBus:
    def __init__(self):
        self._handlers = {}
    
    def subscribe(self, event_type, handler):
        self._handlers.setdefault(event_type, []).append(handler)
    
    def publish(self, event):
        for handler in self._handlers.get(type(event), []):
            handler(event)

# Domain Events
@dataclass
class OrderPlaced:
    order_id: str
    customer_id: str
    total: float

# Handlers
def send_confirmation(event: OrderPlaced):
    print(f"Email sent for order {event.order_id}")

def update_inventory(event: OrderPlaced):
    print(f"Inventory updated for order {event.order_id}")

def notify_warehouse(event: OrderPlaced):
    print(f"Warehouse notified for order {event.order_id}")

# Wire up
bus = EventBus()
bus.subscribe(OrderPlaced, send_confirmation)
bus.subscribe(OrderPlaced, update_inventory)
bus.subscribe(OrderPlaced, notify_warehouse)

bus.publish(OrderPlaced("ORD-001", "CUST-123", 99.99))
```

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| Pattern Fever | ใช้ทุกที่ | YAGNI, ใช้เมื่อจำเป็น |
| Over-Abstraction | Abstraction เกิน | เริ่มจาก Concrete |
| Singleton Test | Global State | ใช้ DI |
| Factory ซับซ้อน | ซ่อน Logic มาก | แยก Registry |
| Observer Leak | ไม่ Unsubscribe | ใช้ Weak Reference |
| Strategy เยอะ | Class ระเบิด | ใช้ Function |
| Decorator ลึก | ซ้อนหลายชั้น | ใช้ Middleware |

---

# 📘 สรุปเล่มที่ 2

**สิ่งที่ได้เรียนรู้:**

1. **OOP** — กระบวนทัศน์หลัก ใช้ SOLID + Composition
2. **FP** — Pure Functions + Immutability + Composition
3. **Design Patterns** — คำศัพท์กลาง ใช้เมื่อจำเป็น

**คำแนะนำ:**
- ฝึกเขียน OOP ที่มี SOLID
- ลอง FP ด้วย Map/Filter/Reduce
- ใช้ Pattern เมื่อเจอปัญหาจริง
- อย่า Over-Engineer

**หนังสือแนะนำ:**
- "Clean Code" — Robert C. Martin
- "Design Patterns" — GoF
- "Functional Programming in Scala" — Paul Chiusano
- "Refactoring" — Martin Fowler
- "Patterns of Enterprise Application Architecture" — Martin Fowler

---

# 📘 เล่มถัดไป (โครงร่าง)

## เล่มที่ 3: การออกแบบระบบ (System Design)
- บทที่ 1: System Design Fundamentals (CAP, Load Balancing, Caching)
- บทที่ 2: Scalability (Horizontal, Vertical, Database Scaling)
- บทที่ 3: Distributed Systems (Consensus, Consistency, Partitioning)
- บทที่ 4: Case Studies (URL Shortener, Chat, News Feed)

## เล่มที่ 4: สถาปัตยกรรมซอฟต์แวร์
- บทที่ 1: Software Architecture Principles
- บทที่ 2: Clean Architecture
- บทที่ 3: Hexagonal Architecture
- บทที่ 4: Event-Driven Architecture
- บทที่ 5: Microservices vs Monolith

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
 