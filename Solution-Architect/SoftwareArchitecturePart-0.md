# 📚 ชุดคู่มือ Software Architecture ฉบับสมบูรณ์
# (The Complete Software Architecture Handbook)

---

## หน้าปก

```
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║           ชุดคู่มือ Software Architecture ฉบับสมบูรณ์        ║
║                                                              ║
║           The Complete Software Architecture Handbook        ║
║                                                              ║
║           ─────────────────────────────────────              ║
║                                                              ║
║           ตั้งแต่รากฐานการคำนวณ → AI Systems Architecture    ║
║                                                              ║
║           รวม 7 เล่ม ในไฟล์เดียว                             ║
║                                                              ║
║           สำหรับวิศวกรซอฟต์แวร์ทุกระดับ                      ║
║           Junior → Mid → Senior → Architect → Principal      ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
```

---

## คำนำ (Preface)

หนังสือเล่มนี้เกิดจากความเชื่อที่ว่า **วิศวกรซอฟต์แวร์ที่ดีไม่ได้เกิดจาก talent แต่เกิดจากพื้นฐานที่แข็งแรง + การฝึกฝนอย่างเป็นระบบ** หลายคนเริ่มต้นอาชีพด้วยการเรียนภาษาโปรแกรมมิ่ง แต่ไม่เคยเข้าใจว่าทำไมระบบถึงพัง ทำไมโค้ดถึงแก้ยาก ทำไมทีมถึงช้า

หนังสือเล่มนี้รวบรวมองค์ความรู้ที่จำเป็นสำหรับวิศวกรซอฟต์แวร์ตั้งแต่ระดับ Junior ไปจนถึง Principal Engineer แบ่งเป็น 7 เล่ม โดยแต่ละเล่มสามารถอ่านแยกได้ แต่เมื่ออ่านครบทั้ง 7 เล่ม ผู้อ่านจะเห็นภาพรวมของศาสตร์ Software Architecture อย่างสมบูรณ์

**กลุ่มเป้าหมาย:**
- นักศึกษาวิทยาการคอมพิวเตอร์ที่ต้องการเห็นภาพรวม
- Junior Developer ที่ต้องการเติบโต
- Mid-Level ที่ต้องการเป็น Senior
- Senior ที่ต้องการเป็น Architect
- Architect ที่ต้องการอัปเดตความรู้สมัยใหม่

**วิธีการอ่าน:**
- เล่ม 1-2: อ่านทุกบท ลงมือทำแบบฝึกหัด
- เล่ม 3-4: อ่านและวิเคราะห์ Case Studies
- เล่ม 5-6: ฝึกใช้ในโปรเจกต์จริง
- เล่ม 7: อ่านเมื่อทำงานกับ AI Systems

---

## สารบัญ (Master Table of Contents)

```
ส่วนนำ
├── คำนำ
├── สารบัญ
├── วิธีการอ่าน
└── แผนที่การเรียนรู้ (Learning Roadmap)

─────────────────────────────────────────────

📘 เล่มที่ 1: รากฐานการคำนวณ (Computing Foundations)
├── บทที่ 1: Data Structures
├── บทที่ 2: Algorithms
└── บทที่ 3: Big O Notation

📘 เล่มที่ 2: กระบวนทัศน์การเขียนโปรแกรม (Programming Paradigms)
├── บทที่ 1: Object-Oriented Programming (OOP)
├── บทที่ 2: Functional Programming (FP)
└── บทที่ 3: Design Patterns

📘 เล่มที่ 3: การออกแบบระบบ (System Design)
├── บทที่ 1: System Design Fundamentals
├── บทที่ 2: Scalability
├── บทที่ 3: Distributed Systems
└── บทที่ 4: System Design Case Studies

📘 เล่มที่ 4: สถาปัตยกรรมซอฟต์แวร์ (Software Architecture)
├── บทที่ 1: Software Architecture Principles
├── บทที่ 2: Clean Architecture
├── บทที่ 3: Hexagonal Architecture
├── บทที่ 4: Event-Driven Architecture
└── บทที่ 5: Microservices vs Monolith

📘 เล่มที่ 5: Domain-Driven Design (DDD)
├── บทที่ 1: Strategic DDD
├── บทที่ 2: Tactical DDD
└── บทที่ 3: DDD in Practice

📘 เล่มที่ 6: DevOps & Cloud
├── บทที่ 1: CI/CD Pipeline
├── บทที่ 2: Cloud Platform AWS
└── บทที่ 3: Infrastructure as Code

📘 เล่มที่ 7: AI Systems Architecture
├── บทที่ 1: RAG Pipeline Architecture
├── บทที่ 2: Agentic AI Architecture
├── บทที่ 3: LLM Platform Engineering
└── บทที่ 4: Production AI Case Studies

─────────────────────────────────────────────

ภาคผนวก
├── A: แผนที่การเรียนรู้ 12 เดือน
├── B: แหล่งข้อมูลแนะนำ
├── C: คำศัพท์ (Glossary)
└── D: ดัชนี (Index)
```

---

## แผนที่การเรียนรู้ (Learning Roadmap)

```
┌─────────────────────────────────────────────────────────────┐
│                    LEARNING ROADMAP                         │
│                    Software Architecture                    │
└─────────────────────────────────────────────────────────────┘

Phase 1: Foundation (เดือน 1-3)
┌─────────────────────────────────────────────┐
│  📘 เล่ม 1: รากฐานการคำนวณ                   │
│  - Data Structures                          │
│  - Algorithms                               │
│  - Big O Notation                           │
│                                             │
│  📘 เล่ม 2: กระบวนทัศน์การเขียนโปรแกรม       │
│  - OOP (SOLID)                              │
│  - Functional Programming                   │
│  - Design Patterns                          │
└─────────────────────────────────────────────┘
                    ↓
Phase 2: Design (เดือน 4-6)
┌─────────────────────────────────────────────┐
│  📘 เล่ม 3: การออกแบบระบบ                    │
│  - System Design Fundamentals               │
│  - Scalability                              │
│  - Distributed Systems                      │
│                                             │
│  📘 เล่ม 4: สถาปัตยกรรมซอฟต์แวร์             │
│  - Architecture Principles                  │
│  - Clean Architecture                       │
│  - Hexagonal Architecture                   │
│  - Event-Driven Architecture                │
│  - Microservices vs Monolith                │
└─────────────────────────────────────────────┘
                    ↓
Phase 3: Domain (เดือน 7-9)
┌─────────────────────────────────────────────┐
│  📘 เล่ม 5: Domain-Driven Design            │
│  - Strategic DDD                            │
│  - Tactical DDD                             │
│  - DDD in Practice                          │
└─────────────────────────────────────────────┘
                    ↓
Phase 4: Operations (เดือน 10-11)
┌─────────────────────────────────────────────┐
│  📘 เล่ม 6: DevOps & Cloud                  │
│  - CI/CD Pipeline                           │
│  - Cloud Platform AWS                       │
│  - Infrastructure as Code                   │
└─────────────────────────────────────────────┘
                    ↓
Phase 5: AI Systems (เดือน 12)
┌─────────────────────────────────────────────┐
│  📘 เล่ม 7: AI Systems Architecture         │
│  - RAG Pipeline                             │
│  - Agentic AI                               │
│  - LLM Platform                             │
│  - Production Case Studies                  │
└─────────────────────────────────────────────┘
```

---

# 📘 เล่มที่ 1: รากฐานการคำนวณ (Computing Foundations)

---

## บทที่ 1: Data Structures

### 1. บทนำ

Data Structures คือ "ภาษากาย" ของนักเขียนโปรแกรม ถ้าเลือกโครงสร้างข้อมูลผิดตั้งแต่ต้น ต่อให้อัลกอริทึมดีแค่ไหน ระบบก็จะช้าและพังในที่สุด บทนี้จะพาคุณเข้าใจตั้งแต่ Array ไปจนถึง Trie อย่างลึกซึ้ง

### 2. บทนิยาม

**Data Structure** หมายถึง วิธีการจัดเก็บและจัดระเบียบข้อมูลในหน่วยความจำ เพื่อให้สามารถเข้าถึง แก้ไข และประมวลผลได้อย่างมีประสิทธิภาพ

**Niklaus Wirth:**
> "Algorithms + Data Structures = Programs"

### 3. บทหัวข้อ

#### 3.1 Data Structures คืออะไร

**ตารางเปรียบเทียบโครงสร้างข้อมูลหลัก:**

| โครงสร้าง | Access | Search | Insert | Delete | ใช้เมื่อ |
|-----------|--------|--------|--------|--------|----------|
| Array | O(1) | O(n) | O(n) | O(n) | Random Access |
| Linked List | O(n) | O(n) | O(1) | O(1) | แทรก/ลบบ่อย |
| Hash Table | O(1) | O(1) | O(1) | O(1) | Lookup เร็ว |
| BST | O(log n) | O(log n) | O(log n) | O(log n) | Sorted Data |
| Heap | O(1) peek | O(n) | O(log n) | O(log n) | Priority Queue |
| Graph | - | O(V+E) | O(1) | O(V+E) | ความสัมพันธ์ |
| Trie | O(m) | O(m) | O(m) | O(m) | String Search |

#### 3.2 ทำงานอย่างไร

**Hash Table:**
```
hash(key) % array_size = index

"apple"  → hash → 45812 → % 10 = 2 → table[2]
"banana" → hash → 71234 → % 10 = 4 → table[4]
"cherry" → hash → 45822 → % 10 = 2 → COLLISION!
```

**Collision Resolution:**
1. **Chaining:** เก็บ Linked List ในแต่ละ Slot
2. **Open Addressing:** หา Slot ว่างถัดไป

**Load Factor = n/m** — เมื่อเกิน 0.7 ควร Rehash

**B+ Tree (Database Index):**
```
                [10 | 20 | 30]
               /      |      \
       [5|7]      [15|17]      [25|27|29]
```

#### 3.3 การใช้งาน

| โครงสร้าง | Use Case จริง |
|-----------|---------------|
| Array | Buffer, Image Pixel |
| Linked List | LRU Cache, Blockchain |
| Hash Table | Database Index, Cache |
| Tree | File System, DOM |
| Heap | Task Scheduler, Dijkstra |
| Graph | Social Network, Map |
| Trie | Autocomplete, Spell Checker |

#### 3.4 ข้อดี
- ✅ เพิ่มประสิทธิภาพ Algorithm
- ✅ เป็นพื้นฐานของ Database, Compiler, OS
- ✅ ทำให้โค้ดอ่านง่ายขึ้น

#### 3.5 ข้อเสีย
- ❌ ต้องเข้าใจ Trade-off
- ❌ โครงสร้างซับซ้อนอาจ Overkill
- ❌ ไม่มีโครงสร้างเดียวที่ตอบโจทย์ทุกอย่าง

#### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- Hash Function ที่ไม่ดี → Collision เยอะ
- Tree ที่ไม่ Balance → กลายเป็น Linked List

**ข้อห้าม:**
- ❌ ห้ามใช้ List เป็น Queue (ใช้ `deque`)
- ❌ ห้าม Iterate Hash Table แล้วแก้ไข
- ❌ ห้าม Implement Hash Table เองใน Production

#### 3.7 สรุป

Data Structures คือเครื่องมือพื้นฐาน ต้องเลือกให้เหมาะกับงาน ไม่มี "ดีที่สุด" มีแต่ "เหมาะที่สุด"

### 4. โครงสร้าง (Structure)

**Array (Contiguous):**
```
Memory: [A][B][C][D][E]
Index:   0  1  2  3  4
         ↑ Random Access O(1)
```

**Linked List (Scattered):**
```
[A|→]  [B|→]  [C|→]  [D|null]
1000   2500   1800   3200
```

### 5. แนวทางการประยุกต์ใช้

```
1. ต้อง Lookup บ่อยไหม? → Hash Table / Tree
2. ต้องเรียงลำดับไหม? → Tree / Heap
3. ต้องแทรก/ลบบ่อยไหม? → Linked List
4. ต้อง Random Access ไหม? → Array
5. ข้อมูลมีความสัมพันธ์ไหม? → Graph
```

### 6. การนำไปใช้งานจริง

**Redis:**
- String: SDS
- Hash: Hash Table + Ziplist
- Sorted Set: Skip List + Hash Table
- List: Quicklist

### 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | แนวทางแก้ไข |
|-------|-------------|
| Hash Collision สูง | ใช้ MurmurHash / xxHash |
| Tree ไม่ Balance | ใช้ AVL / Red-Black / B-Tree |
| Memory เยอะเกิน | ใช้ Bloom Filter |
| Cache Hit Rate ต่ำ | ปรับ LRU → LFU → ARC |

---

## บทที่ 2: Algorithms

### 1. บทนำ

Algorithms คือหัวใจของการแก้ปัญหา บทนี้จะเจาะลึกอัลกอริทึมที่ใช้จริงใน Production

### 2. บทนิยาม

**Algorithm** หมายถึง ลำดับขั้นตอนที่ชัดเจนและจำกัด ในการแก้ปัญหาหนึ่งๆ

**คุณสมบัติ (Donald Knuth):**
1. Finiteness — ต้องจบ
2. Definiteness — ชัดเจน
3. Input — มีข้อมูลเข้า
4. Output — มีผลลัพธ์
5. Effectiveness — ทำได้จริง

### 3. บทหัวข้อ

#### 3.1 Algorithms คืออะไร

| Paradigm | แนวคิด | ตัวอย่าง |
|----------|--------|----------|
| Brute Force | ลองทุกทาง | Linear Search |
| Divide & Conquer | แบ่งแล้วเอาชนะ | Merge Sort |
| Greedy | เลือกที่ดีที่สุด | Dijkstra |
| Dynamic Programming | จำผลลัพธ์ย่อย | Fibonacci |
| Backtracking | ลองแล้วย้อนกลับ | N-Queens |
| Randomized | ใช้ความสุ่ม | QuickSelect |

#### 3.2 ทำงานอย่างไร

**Merge Sort:**
```
[38, 27, 43, 3, 9, 82, 10]
        ↓ แบ่ง
[38, 27, 43] [3, 9, 82, 10]
        ↓ แบ่งต่อ
[38][27,43] [3,9][82,10]
        ↓ เรียง
[27,38,43] [3,9,10,82]
        ↓ รวม
[3,9,10,27,38,43,82]
```
Time: O(n log n) | Space: O(n)

**Dijkstra's Algorithm:**
```
A --4-- B
|      / |
1     2  5
|   /    |
C --3-- D

Start: A
ระยะทางสั้นสุด: A=0, C=1, B=4, D=4
```

#### 3.3 การใช้งาน

| Algorithm | ใช้ใน |
|-----------|-------|
| Quick Sort | Python sorted(), V8 sort() |
| Tim Sort | Java, Python |
| Dijkstra | Google Maps |
| A* | Game Pathfinding |
| BFS/DFS | Web Crawler |
| KMP | Text Editor Search |
| PageRank | Google Search |

#### 3.4-3.6 ข้อดี / ข้อเสีย / ข้อควรระวัง

**ข้อดี:** แก้ปัญหาได้มีประสิทธิภาพ, เป็นพื้นฐานของระบบใหญ่
**ข้อเสีย:** อาจซับซ้อนเกินจำเป็น, Theoretical ≠ Real Performance
**ข้อห้าม:** อย่า Implement Sort เอง, อย่าใช้ O(n²) กับข้อมูลล้านแถว

#### 3.7 สรุป

Algorithm ที่ดีคือ Algorithm ที่เหมาะกับปัญหาจริง

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง, ปัญหา

**Binary Search:**
```python
def binary_search(arr, target):
    low, high = 0, len(arr) - 1
    while low <= high:
        mid = (low + high) // 2
        if arr[mid] == target: return mid
        elif arr[mid] < target: low = mid + 1
        else: high = mid - 1
    return -1
```

**Google PageRank:**
```
PR(A) = (1-d) + d * Σ(PR(Ti)/C(Ti))
ใช้ MapReduce กับ Web Graph พันล้านหน้า
```

---

## บทที่ 3: Big O Notation

### 1. บทนำ

Big O คือภาษากลางที่ใช้คุยเรื่องประสิทธิภาพ

### 2. บทนิยาม

**Big O Notation** คือสัญลักษณ์ที่อธิบาย Upper Bound ของอัตราการเติบโตของฟังก์ชัน

### 3. บทหัวข้อ

#### 3.1 Big O คืออะไร

| n | O(1) | O(log n) | O(n) | O(n log n) | O(n²) | O(2ⁿ) |
|---|------|----------|------|------------|-------|-------|
| 10 | 1 | 3 | 10 | 33 | 100 | 1,024 |
| 100 | 1 | 7 | 100 | 664 | 10K | 10³⁰ |
| 1M | 1 | 20 | 1M | 20M | 10¹² | ∞ |

**Hierarchy:**
```
O(1) < O(log n) < O(√n) < O(n) < O(n log n) < O(n²) < O(2ⁿ) < O(n!)
```

#### 3.2 ทำงานอย่างไร

**กฎการคำนวณ:**
1. Drop Constants: O(2n) → O(n)
2. Drop Non-Dominant: O(n² + n) → O(n²)
3. Nested Loops: คูณ
4. Sequential: บวก

**Master Theorem:**
```
T(n) = aT(n/b) + f(n)

Merge Sort: T(n) = 2T(n/2) + O(n) → Θ(n log n)
```

#### 3.3-3.7 การใช้งาน, ข้อดี, ข้อเสีย, สรุป

**ใช้เมื่อ:** เปรียบเทียบ Algorithm, เลือก Data Structure, ออกแบบ Index
**ข้อจำกัด:** ไม่บอกเวลาจริง, ไม่พิจารณา Cache, Worst Case อาจไม่เกิดจริง

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**Database Query:**
```
SELECT * FROM users WHERE email = 'x@y.com'

ไม่มี Index: O(n) — 10 วินาที ที่ 10M rows
B-Tree Index: O(log n) — 0.01 วินาที
Hash Index: O(1) — 0.001 วินาที
```

---

# 📘 เล่มที่ 2: กระบวนทัศน์การเขียนโปรแกรม

---

## บทที่ 1: Object-Oriented Programming (OOP)

### 1. บทนำ

OOP คือกระบวนทัศน์ที่ Dominant ที่สุดในอุตสาหกรรม ทักษะที่หายากไม่ใช่ "เขียน OOP ได้" — มันคือ "เขียน OOP ได้ดี"

### 2. บทนิยาม

**OOP** หมายถึง กระบวนทัศน์ที่จัดโครงสร้างซอฟต์แวร์ในรูปของ Objects ที่รวม State + Behavior

**Alan Kay:**
> "OOP to me means only messaging, local retention and protection and hiding of state-process, and extreme late-binding of all things."

### 3. บทหัวข้อ

#### 3.1 OOP คืออะไร

**4 Pillars:**

| หลักการ | ความหมาย |
|---------|----------|
| Encapsulation | ซ่อน State |
| Abstraction | ซ่อนความซับซ้อน |
| Inheritance | สืบทอด |
| Polymorphism | หลายรูปแบบ |

**SOLID Principles:**

| หลักการ | ความหมาย |
|---------|----------|
| S | Single Responsibility |
| O | Open/Closed |
| L | Liskov Substitution |
| I | Interface Segregation |
| D | Dependency Inversion |

#### 3.2 ทำงานอย่างไร

**Encapsulation:**
```python
class BankAccount:
    def __init__(self, balance):
        self.__balance = balance  # private
    
    def deposit(self, amount):
        if amount <= 0:
            raise ValueError("Amount must be positive")
        self.__balance += amount
```

**Dependency Inversion:**
```python
# ❌ ผิด: ขึ้นกับ Concrete
class OrderService:
    def __init__(self):
        self.repo = MySQLOrderRepository()

# ✅ ถูก: ขึ้นกับ Abstraction
class OrderService:
    def __init__(self, repo: OrderRepository):
        self.repo = repo
```

#### 3.3-3.7 การใช้งาน, ข้อดี, ข้อเสีย, สรุป

**ใช้เมื่อ:** Domain มี Entities ชัดเจน, มี State, ต้องการ Polymorphism
**ไม่ควรใช้:** Data Pipeline, Stateless Computation

**ข้อห้าม:**
- ❌ ห้ามใช้ Inheritance เพื่อ Reuse Code
- ❌ ห้ามเข้าถึง Field โดยตรง
- ❌ ห้ามใช้ Singleton ทุกที่
- ❌ ห้าม Inherit จาก Concrete Class

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**E-Commerce Domain:**
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
    def add_item(self, product, quantity):
        if self.status != "DRAFT":
            raise ValueError("Cannot modify confirmed order")
        self.items.append(OrderItem(product, quantity))
```

---

## บทที่ 2: Functional Programming (FP)

### 1. บทนำ

FP กำลังกลับมาได้รับความนิยมในยุคของ Big Data, Concurrent Systems และ AI/ML

### 2. บทนิยาม

**FP** หมายถึง กระบวนทัศน์ที่มอง Computation เป็นการประเมิน Mathematical Functions

**John Hughes:**
> "Functional programming is so called because its fundamental operation is the application of functions to arguments."

### 3. บทหัวข้อ

#### 3.1 FP คืออะไร

| ลักษณะ | ความหมาย |
|--------|----------|
| Pure Functions | Input เดิม → Output เดิม |
| Immutability | ข้อมูลเปลี่ยนแปลงไม่ได้ |
| First-Class Functions | Function เป็น Value |
| Higher-Order Functions | รับ/คืน Function |
| Referential Transparency | แทน Expression ด้วย Value |

#### 3.2 ทำงานอย่างไร

**Map, Filter, Reduce:**
```python
numbers = [1, 2, 3, 4, 5]
doubled = list(map(lambda x: x * 2, numbers))
evens = list(filter(lambda x: x % 2 == 0, numbers))
total = reduce(lambda acc, x: acc + x, numbers, 0)
```

**Maybe Monad:**
```python
result = (Maybe.of({"user": {"name": "Alice"}})
          .map(lambda d: d.get("user"))
          .map(lambda u: u.get("name"))
          .get_or_else("Unknown"))
```

#### 3.3-3.7 การใช้งาน, ข้อดี, ข้อเสีย, สรุป

**ใช้เมื่อ:** Data Transformation, Concurrent, Error Handling
**ข้อห้าม:** อย่าใช้ Mutable State, อย่า Mix โดยไม่มีขอบเขต

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**Redux Reducer:**
```javascript
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

---

## บทที่ 3: Design Patterns

### 1. บทนำ

Design Patterns คือ "คำศัพท์กลาง" ของนักออกแบบซอฟต์แวร์

### 2. บทนิยาม

**Design Pattern** หมายถึง วิธีแก้ปัญหาทั่วไปที่พิสูจน์แล้ว

**Christopher Alexander:**
> "Each pattern describes a problem which occurs over and over again in our environment, and then describes the core of the solution to that problem."

### 3. บทหัวข้อ

#### 3.1 Design Patterns คืออะไร

| กลุ่ม | Patterns |
|-------|----------|
| Creational | Singleton, Factory, Builder, Prototype, Abstract Factory |
| Structural | Adapter, Decorator, Facade, Proxy, Composite |
| Behavioral | Observer, Strategy, Command, State, Template Method |

**Enterprise Patterns:**
- Repository, Unit of Work, Service Layer, DTO, Specification
- Domain Event, CQRS, Saga

#### 3.2 ทำงานอย่างไร

**Strategy:**
```python
class SortStrategy(ABC):
    @abstractmethod
    def sort(self, data): pass

class QuickSort(SortStrategy):
    def sort(self, data):
        return sorted(data)

class Sorter:
    def __init__(self, strategy: SortStrategy):
        self.strategy = strategy
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
```

#### 3.3-3.7 การใช้งาน, ข้อดี, ข้อเสีย, สรุป

**ใช้เมื่อ:** เจอปัญหาจริง, ทีมเข้าใจ Pattern
**ข้อห้าม:** อย่าใช้เพื่อความเท่, อย่าใช้ Singleton กับ Test

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**E-Commerce Event Bus:**
```python
bus = EventBus()
bus.subscribe(OrderPlaced, send_confirmation)
bus.subscribe(OrderPlaced, update_inventory)
bus.subscribe(OrderPlaced, notify_warehouse)
bus.publish(OrderPlaced("ORD-001", "CUST-123", 99.99))
```

---

# 📘 เล่มที่ 3: การออกแบบระบบ

---

## บทที่ 1: System Design Fundamentals

### 1. บทนำ

System Design คือทักษะที่แยก "นักเขียนโค้ด" ออกจาก "วิศวกรซอฟต์แวร์"

### 2. บทนิยาม

**System Design** หมายถึง กระบวนการกำหนดสถาปัตยกรรม องค์ประกอบ โมดูล Interface และข้อมูลของระบบ

**Non-Functional Requirements:**

| NFR | ตัวอย่าง |
|-----|----------|
| Scalability | 1M → 100M users |
| Availability | 99.99% (4 nines) |
| Performance | P99 < 200ms |
| Consistency | Strong vs Eventual |

**Availability:**

| Level | Downtime/ปี |
|-------|-------------|
| 99% | 3.65 วัน |
| 99.9% | 8.76 ชั่วโมง |
| 99.99% | 52.6 นาที |
| 99.999% | 5.26 นาที |

### 3. บทหัวข้อ

#### 3.1 Fundamentals คืออะไร

**CAP Theorem:**
```
        Consistency
           /\
          /  \
         /    \
        /      \
       /        \
      /          \
Availability ── Partition Tolerance
```

- CA: Single Node DB
- CP: MongoDB, HBase
- AP: Cassandra, DynamoDB

**PACELC:** ในสภาวะปกติ เลือก Latency หรือ Consistency

#### 3.2 ทำงานอย่างไร

**Load Balancing:**

| Algorithm | ใช้เมื่อ |
|-----------|----------|
| Round Robin | Server เท่ากัน |
| Least Connections | Request ใช้เวลานาน |
| IP Hash | Session Sticky |
| Consistent Hash | Cache, Sharding |

**Caching Strategies:**

| Strategy | ใช้เมื่อ |
|----------|----------|
| Cache-Aside | ทั่วไป |
| Read-Through | Read-Heavy |
| Write-Through | Consistency สูง |
| Write-Behind | Write-Heavy |

**Database Sharding:**
```
Shard 1: user A-H
Shard 2: user I-P
Shard 3: user Q-Z
```

#### 3.3-3.7 การใช้งาน, ข้อดี, ข้อเสีย, สรุป

**ข้อห้าม:**
- ❌ ห้ามใช้ Distributed System ถ้า Monolith พอ
- ❌ ห้าม Sharding ก่อน Index
- ❌ ห้าม Sync Replication ข้าม Region

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**RESHADED Framework:**
```
R - Requirements
E - Estimation
S - Storage Schema
H - High-Level Design
A - API Design
D - Deep Dive
E - Evaluate
D - Deliver
```

**Back-of-Envelope:**
```
QPS = DAU × Requests per User / 86400
Peak QPS = QPS × 2-3
Storage = DAU × Data per User × Retention
```

---

## บทที่ 2: Scalability

### 1-3. บทนำ, นิยาม, หัวข้อ

**Vertical vs Horizontal:**

| มิติ | Vertical | Horizontal |
|------|----------|------------|
| วิธี | เพิ่ม Resource | เพิ่มเครื่อง |
| ข้อดี | ง่าย | Scale ไม่จำกัด |
| ข้อเสีย | มีขีดจำกัด | State Management ยาก |

**Amdahl's Law:**
```
Speedup = 1 / (S + P/N)
```

**Read Replica:**
```
Master (Write) → Replica 1 (Read)
              → Replica 2 (Read)
```

**Auto-scaling (K8s HPA):**
```yaml
minReplicas: 2
maxReplicas: 100
metrics:
- type: Resource
  resource:
    name: cpu
    target:
      averageUtilization: 70
```

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**Netflix Scaling:**
- 2007: Monolith
- 2009: AWS
- 2011: Microservices
- 2016: 100% Cloud
- ปัจจุบัน: 1,000+ Microservices

---

## บทที่ 3: Distributed Systems

### 1-3. บทนำ, นิยาม, หัวข้อ

**Fallacies of Distributed Computing:**
1. Network is reliable
2. Latency is zero
3. Bandwidth is infinite
4. Network is secure
5. Topology doesn't change
6. There is one administrator
7. Transport cost is zero
8. Network is homogeneous

**Consistency Models:**

| Model | ตัวอย่าง |
|-------|----------|
| Strong | Spanner, etcd |
| Sequential | ZooKeeper |
| Causal | MongoDB |
| Eventual | Cassandra |

**Raft States:**
```
Follower → Candidate → Leader
```

**Saga Pattern:**
```
Order → Payment → Inventory → Shipping
  ↓        ↓         ↓          ↓
Compensate ในลำดับย้อนกลับ
```

**Circuit Breaker:**
```python
class CircuitBreaker:
    def call(self, func):
        if self.state == "OPEN":
            raise CircuitOpenError()
        try:
            result = func()
            self.state = "CLOSED"
            return result
        except:
            self.failures += 1
            if self.failures >= threshold:
                self.state = "OPEN"
            raise
```

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**Kafka Architecture:**
```
Producer → Topic (Partitioned) → Consumer Groups
              │
         Partition 0, 1, 2
         Replication Factor = 3
```

**Cassandra (Leaderless):**
```
W + R > N → Strong Consistency
```

---

## บทที่ 4: System Design Case Studies

### Case 1: URL Shortener

**Requirements:** 100M URLs/day, P99 < 100ms
**Estimation:**
```
Write: ~1,200 QPS
Read: ~120,000 QPS
Storage: ~91 TB / 5 years
```
**Key Generation:** Base62 (7 chars = 3.5T)

### Case 2: Chat System

**Design:**
```
Client ←→ WebSocket Gateway ←→ Chat Service
                                    │
                         ┌──────────┼──────────┐
                         ▼          ▼          ▼
                   Cassandra    Redis      Kafka
                   (Messages)  (Presence)  (Events)
```

### Case 3: News Feed

**Hybrid Approach:**
- User ทั่วไป → Fan-out on Write
- Celebrity → Fan-out on Read

### Case 4: Video Streaming

**Architecture:**
```
Upload → S3 (Raw) → Transcoding → S3 (Processed) → CDN
```

### Case 5: Rate Limiter

**Token Bucket:**
```python
class TokenBucket:
    def allow(self, tokens=1):
        now = time.time()
        elapsed = now - self.last_refill
        self.tokens = min(capacity, self.tokens + elapsed * rate)
        if self.tokens >= tokens:
            self.tokens -= tokens
            return True
        return False
```

---

# 📘 เล่มที่ 4: สถาปัตยกรรมซอฟต์แวร์

---

## บทที่ 1: Software Architecture Principles

### 1-3. บทนำ, นิยาม, หัวข้อ

**คำนิยาม Ralph Johnson:**
> "Architecture is the decisions that you wish you could get right early in a project."

**หลักการ 10 ประการ:**
1. Separation of Concerns
2. Single Responsibility
3. Loose Coupling
4. High Cohesion
5. Abstraction
6. Encapsulation
7. Dependency Inversion
8. Interface Segregation
9. Law of Demeter
10. YAGNI

**Quality Attributes (ISO 25010):**
- Functional Suitability, Performance, Compatibility
- Usability, Reliability, Security
- Maintainability, Portability

**ADR Example:**
```markdown
# ADR-001: ใช้ PostgreSQL

## Status
Accepted

## Context
ระบบต้องเก็บข้อมูล Transactional ที่ต้องการ ACID

## Decision
ใช้ PostgreSQL 16

## Consequences
### Positive
- ACID Transactions
- Team Expertise
### Negative
- Horizontal Scaling ยากกว่า
```

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**C4 Model:**
```
Level 1: System Context
Level 2: Container
Level 3: Component
Level 4: Code
```

---

## บทที่ 2: Clean Architecture

### 1-3. บทนำ, นิยาม, หัวข้อ

**Robert C. Martin:**
> "The goal of software architecture is to minimize the human resources required to build and maintain the required system."

**Dependency Rule:**
```
Frameworks → Adapters → Use Cases → Entities
```

**Layers:**

| Layer | หน้าที่ | ตัวอย่าง |
|-------|---------|----------|
| Entities | Enterprise Rules | Order, Customer |
| Use Cases | Application Rules | PlaceOrder |
| Adapters | แปลงข้อมูล | Controllers |
| Frameworks | เทคโนโลยี | Express, PostgreSQL |

**ตัวอย่าง:**
```python
# Layer 1: Entities
class Order:
    def add_item(self, product_id, quantity, price):
        if self.status != "DRAFT":
            raise ValueError("Cannot modify confirmed order")
        self.items.append(OrderItem(product_id, quantity, price))

# Layer 2: Use Cases
class PlaceOrderUseCase:
    def __init__(self, repo: OrderRepository, event_bus):
        self.repo = repo
        self.event_bus = event_bus
    
    def execute(self, request):
        order = Order(uuid4(), request.customer_id)
        for item in request.items:
            order.add_item(item.product_id, item.quantity, item.price)
        order.confirm()
        self.repo.save(order)
        self.event_bus.publish(OrderConfirmed(order.id))
        return PlaceOrderResponse(order.id)
```

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**Package Structure:**
```
src/
├── domain/
│   ├── entities/
│   ├── value_objects/
│   └── events/
├── application/
│   ├── use_cases/
│   ├── ports/
│   └── dtos/
├── infrastructure/
│   ├── persistence/
│   ├── messaging/
│   └── external/
└── presentation/
    ├── api/
    └── cli/
```

**RAG Pipeline ด้วย Clean Architecture:**
- เปลี่ยน Vector DB: Milvus → FAISS โดยไม่แก้ Business Logic
- เปลี่ยน LLM: OpenAI → Azure โดยไม่แก้ Use Case
- Test Use Case โดยไม่ต้องเรียก LLM จริง

---

## บทที่ 3: Hexagonal Architecture

### 1-3. บทนำ, นิยาม, หัวข้อ

**Alistair Cockburn:**
> "Allow an application to equally be driven by users, programs, automated test or batch scripts."

**Diagram:**
```
    REST API    CLI    GraphQL
        ↓        ↓        ↓
    ┌───────────────────────┐
    │    Ports (Driving)    │
    │  ┌─────────────────┐  │
    │  │   Core Domain   │  │
    │  └─────────────────┘  │
    │    Ports (Driven)     │
    └───────────────────────┘
        ↑        ↑        ↑
    PostgreSQL  Kafka   Stripe
```

**Driving vs Driven Ports:**

| ประเภท | ความหมาย | ตัวอย่าง |
|--------|----------|----------|
| Driving | Input | UseCase Interface |
| Driven | Output | Repository Interface |

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**Structure:**
```
src/
├── core/
│   ├── domain/
│   ├── ports/
│   │   ├── driving/
│   │   └── driven/
│   └── services/
├── adapters/
│   ├── driving/
│   │   ├── rest/
│   │   └── cli/
│   └── driven/
│       ├── postgres/
│       └── kafka/
└── config/
```

---

## บทที่ 4: Event-Driven Architecture

### 1-3. บทนำ, นิยาม, หัวข้อ

**Martin Fowler:**
> "Event-Driven Architecture is a style of building software where components communicate by emitting and reacting to events."

**Patterns:**

| Pattern | ใช้เมื่อ |
|---------|----------|
| Event Notification | Loose Coupling |
| Event-Carried State | ลด Coupling |
| Event Sourcing | Audit, Replay |
| CQRS | Read/Write ต่างกัน |
| Saga | Distributed Transaction |

**Event Sourcing:**
```
Traditional:
UPDATE orders SET status = 'CONFIRMED'

Event Sourcing:
Event 1: OrderCreated
Event 2: ItemAdded
Event 3: OrderConfirmed
State = Replay(Events)
```

**CQRS:**
```
Write: Command → Handler → Write DB → Publish Event
Read: Event → Handler → Read DB
```

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**Kafka Architecture:**
```
Topic: orders (3 Partitions, RF=3)

Consumer Group A:
- Consumer A1 → Partition 0
- Consumer A2 → Partition 1
- Consumer A3 → Partition 2
```

**Uber's EDA:**
- หลายพัน Services
- ล้าน Events/second
- Kafka เป็นแกน

---

## บทที่ 5: Microservices vs Monolith

### 1-3. บทนำ, นิยาม, หัวข้อ

**Simon Brown:**
> "If you can't build a monolith, what makes you think microservices will solve your problems?"

**Comparison:**

| มิติ | Monolith | Microservices |
|------|----------|---------------|
| Deployment | ทั้งก้อน | แยก Service |
| Scaling | ทั้งก้อน | แยก Service |
| Database | Shared | Per Service |
| Latency | ต่ำ | สูง |
| Complexity | ต่ำ | สูง |
| Debugging | ง่าย | ยาก |
| Transaction | ACID | Saga |

**Decision Framework:**
```
ขนาดทีม:
< 10 คน      → Monolith
10-50 คน     → Modular Monolith
> 50 คน      → Microservices
```

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**Evolution Path:**
```
Phase 1: Monolith
Phase 2: Modular Monolith
Phase 3: Selective Services
Phase 4: Microservices
```

**Strangler Fig Pattern:**
```
Phase 1: Monolith
Phase 2: New Service + Monolith (API Gateway)
Phase 3: Service A + Service B + Small Monolith
```

**Case Studies:**
- **Shopify:** Modular Monolith, ล้าน Requests/second
- **Netflix:** 1,000+ Microservices, 200M+ Subscribers
- **Stack Overflow:** Monolith, 1.3B Page Views/month

---

# 📘 เล่มที่ 5: Domain-Driven Design

---

## บทที่ 1: Strategic DDD

### 1-3. บทนำ, นิยาม, หัวข้อ

**Eric Evans:**
> "Domain-Driven Design is not a technology or a methodology. It is a way of thinking and a set of priorities."

**Subdomain Types:**

| ประเภท | กลยุทธ์ |
|--------|----------|
| Core Domain | สร้างเอง, ลงทุนสูง |
| Supporting | สร้างเอง, ลงทุนกลาง |
| Generic | ซื้อ, Open Source |

**Ubiquitous Language:**
```
❌ ผิด:
Domain Expert: "ลูกค้าสั่งซื้อสินค้า"
Developer: "User creates Purchase Record"
Code: "create_transaction()"

✅ ถูก:
Domain Expert: "ลูกค้าสั่งซื้อสินค้า"
Developer: "Customer places Order"
Code: "customer.place_order()"
```

**Context Mapping Patterns:**

| Pattern | ใช้เมื่อ |
|---------|----------|
| Partnership | ทีมเท่ากัน |
| Shared Kernel | ทีมใกล้ชิด |
| Customer-Supplier | Upstream-Downstream |
| Conformist | ไม่มีอำนาจต่อรอง |
| Anticorruption Layer | ระบบเก่า |
| Open Host Service | หลาย Consumer |

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**Event Storming:**
```
1. Discover Events (สีส้ม)
2. Add Commands (สีฟ้า)
3. Add Actors (สีเหลือง)
4. Add Policies (สีม่วง)
5. Add Read Models (สีเขียว)
6. Identify Bounded Contexts
7. Define Context Map
```

**E-Commerce Subdomains:**

| Subdomain | ประเภท |
|-----------|--------|
| Product Catalog | Core |
| Order Management | Core |
| Pricing | Core |
| User Management | Supporting |
| Authentication | Generic |

---

## บทที่ 2: Tactical DDD

### 1-3. บทนำ, นิยาม, หัวข้อ

**Building Blocks:**

| Block | ความหมาย |
|-------|----------|
| Entity | มี Identity |
| Value Object | ไม่มี Identity |
| Aggregate | กลุ่ม Entities/VOs |
| Aggregate Root | Entry Point |
| Domain Event | เหตุการณ์ |
| Repository | ที่เก็บ Aggregate |
| Domain Service | Logic ข้าม Aggregate |
| Factory | สร้าง Complex Object |

**Entity vs Value Object:**
```python
# Entity: เท่ากันถ้า id เดียวกัน
c1 = Customer(CustomerId("C1"), CustomerName("Alice"))
c2 = Customer(CustomerId("C1"), CustomerName("Bob"))
assert c1 == c2  # True

# Value Object: เท่ากันถ้าค่าทุกอย่างเท่ากัน
m1 = Money(100, "USD")
m2 = Money(100, "USD")
assert m1 == m2  # True
```

**Aggregate:**
```python
class Order:  # Aggregate Root
    def add_item(self, product_id, quantity, price):
        if self.status != OrderStatus.DRAFT:
            raise DomainError("Cannot modify confirmed order")
        if len(self.items) >= 100:
            raise DomainError("Too many items")
        self.items.append(OrderItem(product_id, quantity, price))
        self._events.append(ItemAdded(self.id, product_id, quantity))
    
    def confirm(self):
        if not self.items:
            raise DomainError("Cannot confirm empty order")
        self.status = OrderStatus.CONFIRMED
        self._events.append(OrderConfirmed(self.id, self.total()))
```

**Aggregate Design Rules:**
1. Protect Invariants
2. Reference by ID
3. One Transaction per Aggregate
4. Small Aggregates
5. Eventual Consistency

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**Repository:**
```python
class OrderRepository(ABC):
    @abstractmethod
    def save(self, order: Order) -> None: pass
    
    @abstractmethod
    def find_by_id(self, id: OrderId) -> Optional[Order]: pass
```

**Banking Example:**
```python
class Account:  # Aggregate Root
    def deposit(self, amount: Money):
        if amount.amount <= 0:
            raise DomainError("Deposit must be positive")
        self.balance = self.balance.add(amount)
        self._events.append(MoneyDeposited(self.number, amount))
    
    def withdraw(self, amount: Money):
        if amount.amount > self.balance.amount:
            raise DomainError("Insufficient funds")
        self.balance = self.balance.subtract(amount)
```

---

## บทที่ 3: DDD in Practice

### 1-3. บทนำ, นิยาม, หัวข้อ

**CQRS:**
```python
# Write Model
class PlaceOrderHandler:
    def handle(self, command: PlaceOrderCommand):
        order = Order.create(command.customer_id, command.items)
        self.repo.save(order)
        for event in order.pull_events():
            self.event_bus.publish(event)

# Read Model
class OrderSummaryProjection:
    def on_order_confirmed(self, event: OrderConfirmed):
        self.read_db.execute(
            "UPDATE order_summaries SET status = 'CONFIRMED' WHERE order_id = %s",
            event.order_id
        )
```

**Event Sourcing:**
```python
class EventStore:
    def append(self, aggregate_id, events, expected_version):
        current_version = self._get_version(aggregate_id)
        if current_version != expected_version:
            raise ConcurrencyError()
        for i, event in enumerate(events):
            self.conn.execute(
                "INSERT INTO events (aggregate_id, version, event_type, data) "
                "VALUES (%s, %s, %s, %s)",
                aggregate_id, expected_version + i + 1,
                type(event).__name__, json.dumps(asdict(event))
            )
```

**Saga Pattern:**
```python
class OrderSaga:
    def execute(self, order):
        try:
            reservation_id = self.inventory.reserve(order.items)
            payment_id = self.payment.charge(order.customer_id, order.total())
            shipping_id = self.shipping.schedule(order.id, order.address)
            return SagaResult.success()
        except Exception as e:
            return self._compensate(e)
    
    def _compensate(self, error):
        if "shipping_id" in self.state:
            self.shipping.cancel(self.state["shipping_id"])
        if "payment_id" in self.state:
            self.payment.refund(self.state["payment_id"])
        if "reservation_id" in self.state:
            self.inventory.release(self.state["reservation_id"])
        return SagaResult.failure(error)
```

**Outbox Pattern:**
```python
def place_order(self, request):
    with self.db.transaction():
        order = Order.create(request)
        self.db.execute("INSERT INTO orders ...", order)
        for event in order.pull_events():
            self.db.execute(
                "INSERT INTO outbox (event_type, data, published) "
                "VALUES (%s, %s, false)",
                type(event).__name__, json.dumps(asdict(event))
            )
    self._publish_pending()
```

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**Structure:**
```
src/
├── domain/
│   ├── model/
│   │   ├── order/
│   │   │   ├── order.py
│   │   │   ├── order_item.py
│   │   │   ├── order_id.py
│   │   │   └── events.py
│   │   └── customer/
│   ├── services/
│   └── repositories/
├── application/
│   ├── commands/
│   ├── queries/
│   └── sagas/
├── infrastructure/
│   ├── persistence/
│   ├── messaging/
│   └── projections/
└── presentation/
    ├── rest/
    └── graphql/
```

---

# 📘 เล่มที่ 6: DevOps & Cloud

---

## บทที่ 1: CI/CD Pipeline

### 1-3. บทนำ, นิยาม, หัวข้อ

**Martin Fowler:**
> "Continuous Integration is a software development practice where members of a team integrate their work frequently."

**CI vs CD:**

| มิติ | CI | Continuous Delivery | Continuous Deployment |
|------|-----|---------------------|----------------------|
| Deploy | ไม่ | Manual Approval | อัตโนมัติ |
| ความเสี่ยง | ต่ำ | กลาง | สูง |

**Pipeline Stages:**
```
Code → Build → Test → Deploy → Monitor
```

**Branching Strategies:**

| Strategy | ใช้เมื่อ |
|----------|----------|
| Trunk-Based | Elite Teams |
| GitHub Flow | ทั่วไป |
| GitFlow | Release Cycles ยาว |

**Deployment Strategies:**

| Strategy | ข้อดี | ข้อเสีย |
|----------|-------|---------|
| Rolling | ไม่มี Downtime | ช้า |
| Blue-Green | Rollback เร็ว | ทรัพยากร 2x |
| Canary | ความเสี่ยงต่ำ | ซับซ้อน |

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**GitHub Actions:**
```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: pytest --cov=src
  
  build:
    needs: test
    steps:
      - uses: docker/build-push-action@v5
        with:
          push: true
          tags: ghcr.io/${{ github.repository }}:${{ github.sha }}
  
  deploy:
    needs: build
    environment: production
    steps:
      - run: kubectl set image deployment/app app=$IMAGE
```

**DORA Metrics:**

| Metric | Elite |
|--------|-------|
| Deploy Frequency | On-demand |
| Lead Time | < 1 hour |
| MTTR | < 1 hour |
| Change Failure Rate | 0-15% |

---

## บทที่ 2: Cloud Platform AWS

### 1-3. บทนำ, นิยาม, หัวข้อ

**Core Services:**

| หมวด | Services |
|------|----------|
| Compute | EC2, Lambda, ECS, EKS |
| Storage | S3, EBS, EFS, Glacier |
| Database | RDS, DynamoDB, ElastiCache |
| Network | VPC, Route 53, CloudFront |

**Well-Architected Framework:**
1. Operational Excellence
2. Security
3. Reliability
4. Performance
5. Cost Optimization
6. Sustainability

**Lambda Example:**
```python
def handler(event, context):
    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        
        response = s3.get_object(Bucket=bucket, Key=key)
        content = response['Body'].read()
        
        result = process(content)
        
        table.put_item(Item={
            'id': f"{bucket}/{key}",
            'processed_at': datetime.utcnow().isoformat(),
            'status': 'SUCCESS'
        })
```

**S3 Storage Classes:**

| Class | ใช้เมื่อ |
|-------|----------|
| Standard | บ่อย |
| Intelligent-Tiering | ไม่แน่ใจ |
| Standard-IA | นานๆ ที |
| Glacier | Archive |

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**Multi-Account Strategy:**
```
AWS Organizations
├── Management Account
├── Security OU
├── Infrastructure OU
└── Workloads OU
    ├── Prod
    ├── Staging
    └── Dev
```

**RAG System บน AWS:**
```
CloudFront → API Gateway → Lambda → S3, OpenSearch, DynamoDB
                                    ↓
                                  Bedrock
```

---

## บทที่ 3: Infrastructure as Code

### 1-3. บทนำ, นิยาม, หัวข้อ

**Kief Morris:**
> "Infrastructure as Code is an approach to infrastructure automation based on practices from software development."

**Terraform vs CloudFormation vs Pulumi:**

| มิติ | Terraform | CloudFormation | Pulumi |
|------|-----------|----------------|--------|
| Cloud | Multi | AWS Only | Multi |
| ภาษา | HCL | YAML | Python, Go |
| State | External | Managed | Managed |

**State Management:**
```
Remote State (S3 + DynamoDB):
S3 Bucket → terraform.tfstate
DynamoDB → LockID
```

**Terraform Example:**
```hcl
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  
  tags = {
    Name = "my-vpc-${var.environment}"
  }
}

resource "aws_db_instance" "main" {
  engine         = "postgres"
  engine_version = "16.1"
  instance_class = var.environment == "prod" ? "db.r6g.xlarge" : "db.t3.medium"
  multi_az       = var.environment == "prod"
  storage_encrypted = true
}
```

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**Structure:**
```
terraform/
├── modules/
│   ├── vpc/
│   ├── eks/
│   └── rds/
├── environments/
│   ├── dev/
│   ├── staging/
│   └── prod/
└── policies/
    └── vpc.rego
```

**Policy as Code:**
```rego
package terraform

deny[msg] {
    resource := input.resource_changes[_]
    resource.type == "aws_db_instance"
    not resource.change.after.storage_encrypted
    msg := "RDS must have storage encryption"
}
```

---

# 📘 เล่มที่ 7: AI Systems Architecture

---

## บทที่ 1: RAG Pipeline Architecture

### 1-3. บทนำ, นิยาม, หัวข้อ

**RAG** หมายถึง สถาปัตยกรรม AI ที่ Retrieval System ดึงข้อมูลที่เกี่ยวข้องจาก Knowledge Base แล้วส่งให้ LLM ใช้สร้างคำตอบ

**Complete RAG Architecture:**
```
INGESTION:
Source → Loader → Chunker → Embedder → Vector Store

QUERY:
User Query → Query Transform → Retrieval → Rerank → 
Prompt Build → LLM → Response + Citations
```

**Chunking Strategies:**

| Strategy | ใช้เมื่อ |
|----------|----------|
| Fixed Size | Prototype |
| Recursive | ทั่วไป |
| Semantic | Production |
| Hierarchical | เอกสารยาว |

**Embedding Models:**

| Model | Dimensions | ภาษาไทย |
|-------|-----------|---------|
| OpenAI text-embedding-3-large | 3072 | ดี |
| Cohere embed-multilingual-v3 | 1024 | ดีมาก |
| BGE-M3 | 1024 | ดี |

**Vector Stores:**

| Store | ข้อดี | ข้อเสีย |
|-------|-------|---------|
| Milvus | Scale ใหญ่ | ต้อง Setup |
| Qdrant | ง่าย, Rust | Ecosystem เล็ก |
| Pinecone | Managed | แพง |
| pgvector | ใช้ Postgres | Scale จำกัด |

**Hybrid Retrieval:**
```python
vector_retriever = VectorIndexRetriever(index=index, similarity_top_k=20)
bm25_retriever = BM25Retriever.from_defaults(docstore=index.docstore)

hybrid_retriever = QueryFusionRetriever(
    [vector_retriever, bm25_retriever],
    similarity_top_k=10,
    num_queries=3,
    mode="reciprocal_rerank",
)

reranker = CohereRerank(model="rerank-multilingual-v3.0", top_n=5)
```

**RAG Prompt:**
```python
RAG_PROMPT = """คุณเป็นผู้ช่วยตอบคำถามที่แม่นยำ

ข้อมูลอ้างอิง:
{context_str}

คำถาม: {query_str}

คำแนะนำ:
1. ตอบโดยอ้างอิงจากข้อมูลอ้างอิงเท่านั้น
2. ถ้าข้อมูลไม่เพียงพอ ให้บอกว่า "ไม่พบข้อมูล"
3. อ้างอิงแหล่งที่มาด้วย [1], [2]

คำตอบ:"""
```

**Evaluation (RAGAS):**

| Metric | วัดอะไร |
|--------|---------|
| Faithfulness | คำตอบตรง Context |
| Answer Relevancy | คำตอบตรงคำถาม |
| Context Precision | Context ตรง |
| Context Recall | Context ครบ |

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**Structure:**
```
rag-system/
├── ingestion/
│   ├── loaders/
│   ├── chunkers/
│   ├── embedders/
│   └── pipeline.py
├── retrieval/
│   ├── vector_store/
│   ├── retrievers/
│   └── rerankers/
├── generation/
│   ├── llms/
│   ├── prompts/
│   └── query_engine.py
├── evaluation/
│   ├── metrics/
│   └── ragas_runner.py
└── api/
    └── main.py
```

**Performance Optimization:**

| เทคนิค | ผลลัพธ์ |
|--------|---------|
| Semantic Caching | ลด 60% LLM Calls |
| Async Retrieval | ลด 40% Latency |
| Batch Embedding | ลด 50% Cost |
| Streaming Response | ลด TTFT 70% |

---

## บทที่ 2: Agentic AI Architecture

### 1-3. บทนำ, นิยาม, หัวข้อ

**AI Agent** หมายถึง ระบบ AI ที่สามารถรับรู้สภาพแวดล้อม ตัดสินใจ และลงมือทำเพื่อบรรลุเป้าหมาย

**Agent Patterns:**

| Pattern | ใช้เมื่อ |
|---------|----------|
| ReAct | ทั่วไป |
| Plan-and-Execute | งานซับซ้อน |
| Reflexion | ต้องการคุณภาพ |
| Tool Use | ต้องการ Action |
| Multi-Agent | งานใหญ่ |

**ReAct Pattern:**
```python
from langchain.agents import AgentExecutor, create_react_agent

tools = [
    Tool(name="Search", func=search_web),
    Tool(name="Calculator", func=calculator),
    Tool(name="Database", func=query_database),
]

agent = create_react_agent(llm, tools, prompt)
agent_executor = AgentExecutor(
    agent=agent, tools=tools,
    max_iterations=10, verbose=True
)

result = agent_executor.invoke({
    "input": "ยอดขายเดือนที่แล้วเป็นเท่าไร? เพิ่ม 15% เป็นเท่าไร?"
})
```

**ReAct Loop:**
```
Thought:  ต้องหายอดขายเดือนที่แล้ว
Action:   query_database("SELECT SUM(amount) FROM sales")
Observation: 1,000,000

Thought:  ต้องคำนวณ 15%
Action:   calculator("1000000 * 1.15")
Observation: 1,150,000

Answer:   ยอดขาย 1,000,000 เพิ่ม 15% เป็น 1,150,000
```

**Tool Calling:**
```python
tools = [
    {
        "type": "function",
        "function": {
            "name": "get_weather",
            "description": "ดึงข้อมูลอากาศ",
            "parameters": {
                "type": "object",
                "properties": {
                    "city": {"type": "string"},
                },
                "required": ["city"],
            },
        },
    },
]
```

**Multi-Agent (LangGraph):**
```python
workflow = StateGraph(AgentState)
workflow.add_node("supervisor", supervisor)
workflow.add_node("researcher", researcher_agent)
workflow.add_node("analyst", analyst_agent)
workflow.add_node("writer", writer_agent)

workflow.set_entry_point("supervisor")
workflow.add_conditional_edges(
    "supervisor",
    lambda x: x["next_agent"],
    {"researcher": "researcher", "analyst": "analyst", "writer": "writer"}
)
```

**Guardrails:**
```python
class ActionValidator:
    DANGEROUS_ACTIONS = ["delete", "drop", "truncate"]
    
    def validate(self, action, params):
        if any(d in action.lower() for d in self.DANGEROUS_ACTIONS):
            raise UnsafeActionError()
        
        if "sql" in params:
            if re.search(r"\b(DROP|TRUNCATE)\b", params["sql"], re.I):
                raise UnsafeActionError("DDL not allowed")
```

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**Structure:**
```
agent-system/
├── agents/
│   ├── react_agent.py
│   ├── plan_execute.py
│   └── multi_agent.py
├── tools/
│   ├── search.py
│   ├── calculator.py
│   └── database.py
├── memory/
│   ├── short_term.py
│   └── long_term.py
├── guardrails/
│   ├── input_filter.py
│   └── action_validator.py
└── observability/
    └── tracer.py
```

**Customer Support Agent Results:**

| Metric | Target | Actual |
|--------|--------|--------|
| Auto-Resolution | 70% | 73% |
| CSAT | > 4.0 | 4.3 |
| Cost/Ticket | < $0.20 | $0.15 |

---

## บทที่ 3: LLM Platform Engineering

### 1-3. บทนำ, นิยาม, หัวข้อ

**LLM Platform** หมายถึง ชุดของ Infrastructure, Services, และ Tooling ที่รองรับ AI Applications

**Evolution:**
```
Prototype → Product → Platform
```

**Key Services:**

| Service | Tools |
|---------|-------|
| Model Gateway | LiteLLM, OpenRouter |
| Prompt Registry | Langfuse, PromptLayer |
| Evaluation | RAGAS, DeepEval |
| Observability | Langfuse, LangSmith |
| Cache | Redis, GPTCache |

**Model Gateway (LiteLLM):**
```python
from litellm import Router

router = Router(
    model_list=[
        {"model_name": "gpt-4o", "litellm_params": {"model": "azure/gpt-4o"}},
        {"model_name": "claude", "litellm_params": {"model": "anthropic/claude-3-5-sonnet"}},
    ],
    routing_strategy="latency-based-routing",
    fallbacks=[{"gpt-4o": ["claude"]}],
    num_retries=3,
    cache_responses=True,
)
```

**Prompt Registry:**
```python
from langfuse import Langfuse

langfuse = Langfuse()
prompt = langfuse.get_prompt(name="rag-qa", version=3)
response = llm.complete(prompt.compile(context=ctx, query=q))
```

**Evaluation:**
```python
from ragas import evaluate
from ragas.metrics import faithfulness, answer_relevancy

result = evaluate(
    dataset=eval_dataset,
    metrics=[faithfulness, answer_relevancy],
    llm=evaluator_llm,
)
# {'faithfulness': 0.92, 'answer_relevancy': 0.88}
```

**Semantic Cache:**
```python
from langchain.cache import RedisSemanticCache
set_llm_cache(RedisSemanticCache(
    redis_url="redis://localhost:6379",
    embedding=OpenAIEmbeddings(),
    score_threshold=0.95,
))
```

**Observability (OpenTelemetry):**
```python
with tracer.start_as_current_span("rag-query") as span:
    span.set_attribute("user.id", user_id)
    
    with tracer.start_as_current_span("retrieval"):
        context = retrieve(query)
    
    with tracer.start_as_current_span("llm-call"):
        response = llm.generate(query, context)
        span.set_attribute("llm.tokens.input", response.usage.input)
```

### 4-7. โครงสร้าง, การประยุกต์, การใช้งานจริง

**Structure:**
```
llm-platform/
├── gateway/
│   ├── router.py
│   └── fallbacks.py
├── prompts/
│   ├── registry.py
│   └── templates/
├── evaluation/
│   ├── metrics/
│   └── runner.py
├── observability/
│   ├── tracing.py
│   └── langfuse_client.py
├── cache/
│   └── semantic.py
├── safety/
│   └── pii_detector.py
└── cost/
    └── tracker.py
```

**Enterprise LLM Platform Results:**

| Metric | Before | After |
|--------|--------|-------|
| Cost/day | $18K | $8K |
| Latency P99 | 5s | 2s |
| Availability | 95% | 99.9% |
| Teams | 3 | 10 |

---

## บทที่ 4: Production AI Case Studies

### Case 1: Enterprise RAG

**Results:**

| Metric | Before | After |
|--------|--------|-------|
| Answer Accuracy | 65% | 92% |
| Latency P99 | 8s | 2.5s |
| Cost/Query | $0.05 | $0.02 |

### Case 2: Customer Support Agent

**Results:**

| Metric | Target | Actual |
|--------|--------|--------|
| Auto-Resolution | 70% | 73% |
| Avg Handle Time | < 2 min | 1.5 min |
| CSAT | > 4.0 | 4.3 |

### Case 3: Document Processing

**Results:**

| Metric | Target | Actual |
|--------|--------|--------|
| Throughput | 40K/day | 45K/day |
| Accuracy | 95% | 97% |
| Cost/Doc | $0.05 | $0.03 |

### Lessons Learned

| บทเรียน | รายละเอียด |
|---------|-----------|
| Start Simple | อย่า Over-Engineer |
| Measure Everything | วัดผลทุกอย่าง |
| Cache Aggressively | Cache ลด Cost |
| Guardrails First | Safety มาก่อน |
| Observability | ต้องมี Day 1 |
| Cost Control | Budgets, Alerts |

---

# 📚 ภาคผนวก

## A: แผนที่การเรียนรู้ 12 เดือน

```
เดือน 1-3: Foundation
├── สัปดาห์ 1-4:   Big O + Data Structures
├── สัปดาห์ 5-8:   Algorithms
├── สัปดาห์ 9-12:  OOP + Design Patterns

เดือน 4-6: Design
├── สัปดาห์ 13-16: Functional Programming
├── สัปดาห์ 17-20: System Design
├── สัปดาห์ 21-24: Software Architecture

เดือน 7-9: Domain
├── สัปดาห์ 25-28: Strategic DDD
├── สัปดาห์ 29-32: Tactical DDD
├── สัปดาห์ 33-36: DDD in Practice

เดือน 10-11: Operations
├── สัปดาห์ 37-40: CI/CD
├── สัปดาห์ 41-44: Cloud + IaC

เดือน 12: AI Systems
├── สัปดาห์ 45-48: RAG + Agentic AI
└── สัปดาห์ 49-52: Capstone Project
```

## B: แหล่งข้อมูลแนะนำ

**หนังสือ:**
- "Introduction to Algorithms" — CLRS
- "Clean Code" — Robert C. Martin
- "Design Patterns" — GoF
- "Designing Data-Intensive Applications" — Martin Kleppmann
- "Clean Architecture" — Robert C. Martin
- "Domain-Driven Design" — Eric Evans
- "Accelerate" — Nicole Forsgren
- "Building LLM Powered Applications" — Valentina Alto
- "AI Engineering" — Chip Huyen

**คอร์ส:**
- Python for Everybody — University of Michigan
- Introduction to Generative AI — Google
- Google Data Analytics
- Google Project Management
- Foundations of Cybersecurity
- Google UX Design
- Data Science & Generative AI — IBM

**แหล่งออนไลน์:**
- roadmap.sh
- Martin Fowler's Blog
- Netflix Tech Blog
- Uber Engineering Blog
- AWS Architecture Center

## C: คำศัพท์ (Glossary)

| คำ | ความหมาย |
|-----|----------|
| ADR | Architecture Decision Record |
| Aggregate | กลุ่ม Entities ที่ถือเป็นหน่วยเดียว |
| Bounded Context | ขอบเขตของ Model |
| CAP | Consistency, Availability, Partition Tolerance |
| CI/CD | Continuous Integration/Delivery |
| CQRS | Command Query Responsibility Segregation |
| DDD | Domain-Driven Design |
| DI | Dependency Injection |
| DORA | DevOps Research and Assessment |
| EDA | Event-Driven Architecture |
| IaC | Infrastructure as Code |
| LLM | Large Language Model |
| RAG | Retrieval-Augmented Generation |
| SOLID | 5 หลักการ OOP |
| SRE | Site Reliability Engineering |
| Ubiquitous Language | ภาษากลางใน DDD |

## D: ดัชนี (Index)

```
A
├── Aggregate .............. 5.2
├── Algorithm .............. 1.2
├── Anticorruption Layer ... 5.1
├── API Gateway ............ 3.1
└── Availability ........... 3.1

B
├── Big O .................. 1.3
├── Bounded Context ........ 5.1
└── Builder Pattern ........ 2.3

C
├── CAP Theorem ............ 3.1
├── CI/CD .................. 6.1
├── Clean Architecture ..... 4.2
├── CQRS ................... 5.3
└── Circuit Breaker ........ 3.3

D
├── Data Structures ........ 1.1
├── DDD .................... 5.1
├── Design Patterns ........ 2.3
└── Distributed Systems .... 3.3

E
├── Entity ................. 5.2
├── Event Sourcing ......... 4.4
└── Event-Driven ........... 4.4

F
├── Factory Pattern ........ 2.3
└── Functional Programming . 2.2

G
├── GitOps ................. 6.3
└── GraphQL ................ 4.3

H
├── Hash Table ............. 1.1
└── Hexagonal Architecture . 4.3

I
├── IaC .................... 6.3
└── Infrastructure as Code . 6.3

K
├── Kafka .................. 3.3
└── Kubernetes ............. 6.2

L
├── Lambda ................. 6.2
└── LLM Platform ........... 7.3

M
├── Microservices .......... 4.5
├── Monolith ............... 4.5
└── Multi-Agent ............ 7.2

O
├── Observer Pattern ....... 2.3
├── OOP .................... 2.1
└── Outbox Pattern ......... 5.3

P
├── Ports & Adapters ....... 4.3
└── Prompt Engineering ..... 7.1

R
├── RAG .................... 7.1
├── Repository ............. 5.2
└── Reranking .............. 7.1

S
├── Saga Pattern ........... 5.3
├── Scalability ............ 3.2
├── SOLID .................. 2.1
├── Strategy Pattern ....... 2.3
└── System Design .......... 3.1

T
├── Tactical DDD ........... 5.2
├── Terraform .............. 6.3
└── Tool Calling ........... 7.2

U
├── Ubiquitous Language .... 5.1
└── Use Case ............... 4.2

V
├── Value Object ........... 5.2
└── Vector Store ........... 7.1

W
├── WebSocket .............. 3.4
└── Well-Architected ....... 6.2
```

---

# บทส่งท้าย (Epilogue)

หนังสือเล่มนี้รวบรวมองค์ความรู้ที่จำเป็นสำหรับวิศวกรซอฟต์แวร์ตั้งแต่ระดับ Junior ไปจนถึง Principal Engineer ผ่าน 7 เล่มที่เชื่อมโยงกัน:

1. **รากฐานการคำนวณ** — พื้นฐานที่ขาดไม่ได้
2. **กระบวนทัศน์การเขียนโปรแกรม** — เครื่องมือในการเขียนโค้ด
3. **การออกแบบระบบ** — ทักษะในการออกแบบ
4. **สถาปัตยกรรมซอฟต์แวร์** — ศิลปะในการจัดโครงสร้าง
5. **Domain-Driven Design** — การจำลองธุรกิจ
6. **DevOps & Cloud** — การนำไปใช้จริง
7. **AI Systems Architecture** — อนาคตของซอฟต์แวร์

**ข้อความส่งท้าย:**

> "Architecture is not about predicting the future. It's about making decisions that let you change your mind later — cheaply."

พื้นฐานที่แข็งแรง + สถาปัตยกรรมที่ยืดหยุ่น + การลงมือทำจริง = วิศวกรซอฟต์แวร์ที่ยั่งยืนในทุกยุคเทคโนโลยี

**ขอให้สนุกกับการเรียนรู้ครับ** 📚

---

```
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║                 จบชุดคู่มือ Software Architecture            ║
║                                                              ║
║                      ฉบับสมบูรณ์                             ║
║                                                              ║
║                    รวม 7 เล่ม ในไฟล์เดียว                    ║
║                                                              ║
║                         ────────                             ║
║                                                              ║
║           "จากรากฐานสู่ AI — ครบทุกศาสตร์"                  ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
```

---

 