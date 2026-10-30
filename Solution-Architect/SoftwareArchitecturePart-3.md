## 📘 เล่มที่ 3: การออกแบบระบบ (System Design)

---

# บทที่ 1: System Design Fundamentals

## 1. บทนำ

System Design คือทักษะที่แยก "นักเขียนโค้ด" ออกจาก "วิศวกรซอฟต์แวร์" การเขียนโค้ดให้ทำงานได้บนเครื่องเดียวเป็นเรื่องง่าย แต่การออกแบบระบบที่รองรับผู้ใช้ 100 ล้านคน, ทำงานได้ 99.99% Availability, และกู้คืนจาก Disaster ได้ภายในไม่กี่นาที — นั่นคือสิ่งที่ System Design เข้ามาเกี่ยวข้อง

บริษัทเทคโนโลยีชั้นนำอย่าง Google, Amazon, Meta, Netflix ใช้ System Design Interview เพื่อคัดกรองวิศวกรระดับ Senior ขึ้นไป เพราะทักษะนี้สะท้อนความสามารถในการคิดเชิงระบบ (Systems Thinking) ซึ่งเป็นสิ่งที่ขาดแคลนที่สุดในตลาด

บทนี้จะพาคุณเข้าใจ fundamentals ของ System Design ตั้งแต่ CAP Theorem ไปจนถึง Load Balancing, Caching, และ Database Sharding พร้อมกรณีศึกษาจริง

## 2. บทนิยาม

**System Design** หมายถึง กระบวนการกำหนดสถาปัตยกรรม องค์ประกอบ โมดูล Interface และข้อมูลของระบบ เพื่อให้ตอบสนองความต้องการทั้ง Functional และ Non-Functional Requirements

**คำนิยามเชิงปฏิบัติ:**
> System Design = การแปลง Requirements → Architecture ที่รองรับ Scale, Reliability, และ Cost

**Non-Functional Requirements (NFR) ที่สำคัญ:**

| NFR | ความหมาย | ตัวอย่าง |
|-----|----------|----------|
| **Scalability** | รองรับการเติบโต | 1M → 100M users |
| **Availability** | ความพร้อมใช้งาน | 99.99% (4 nines) |
| **Reliability** | ความน่าเชื่อถือ | ไม่มี Data Loss |
| **Performance** | ความเร็ว | P99 < 200ms |
| **Consistency** | ความสอดคล้อง | Strong vs Eventual |
| **Maintainability** | บำรุงรักษา | Deploy ได้บ่อย |
| **Cost** | ต้นทุน | $0.01/user/month |
| **Security** | ความปลอดภัย | Encryption, Auth |

**คำนิยามของ Availability:**

| Availability | Downtime/ปี | เรียก |
|--------------|-------------|-------|
| 99% | 3.65 วัน | Two nines |
| 99.9% | 8.76 ชั่วโมง | Three nines |
| 99.99% | 52.6 นาที | Four nines |
| 99.999% | 5.26 นาที | Five nines |

## 3. บทหัวข้อ

### 3.1 System Design Fundamentals คืออะไร

Fundamentals ประกอบด้วย 6 กลุ่มหลัก:

1. **Networking** — DNS, CDN, Load Balancer, API Gateway
2. **Compute** — Server, Container, Serverless, Auto-scaling
3. **Storage** — SQL, NoSQL, Object Storage, Cache
4. **Communication** — REST, gRPC, WebSocket, Message Queue
5. **Reliability** — Replication, Failover, Circuit Breaker
6. **Observability** — Logging, Metrics, Tracing

### 3.2 ทำงานอย่างไร

**CAP Theorem (Eric Brewer):**

```
        Consistency
           /\
          /  \
         /    \
        /      \
       /        \
      /          \
     /            \
    /              \
   /                \
  /                  \
Availability ────── Partition Tolerance
```

ในสภาวะ Network Partition ระบบต้องเลือก 2 จาก 3:
- **CA** — ยอมสละ Partition Tolerance (Single Node DB)
- **CP** — ยอมสละ Availability (MongoDB, HBase)
- **AP** — ยอมสละ Consistency (Cassandra, DynamoDB)

**ในความเป็นจริง:** Partition เกิดขึ้นแน่นอน ดังนั้นต้องเลือก CP หรือ AP

**PACELC Theorem (Extension):**

```
ในสภาวะ Partition: เลือก A หรือ C
ในสภาวะปกติ: เลือก Latency หรือ Consistency
```

**Load Balancing Algorithms:**

| Algorithm | หลักการ | ใช้เมื่อ |
|-----------|---------|----------|
| Round Robin | วนไปเรื่อยๆ | Server เท่ากัน |
| Weighted RR | ตามน้ำหนัก | Server ต่างกัน |
| Least Connections | ไปที่ว่างสุด | Request ใช้เวลานาน |
| IP Hash | ตาม IP | Session Sticky |
| Consistent Hash | Hash Ring | Cache, Sharding |

**Caching Strategies:**

| Strategy | ลักษณะ | ใช้เมื่อ |
|----------|--------|----------|
| Cache-Aside | App จัดการ Cache | ทั่วไป |
| Read-Through | Cache โหลดเอง | Read-Heavy |
| Write-Through | เขียน Cache + DB พร้อม | Consistency สูง |
| Write-Behind | เขียน Cache ก่อน | Write-Heavy |
| Refresh-Ahead | โหลดล่วงหน้า | Predictable |

**ตัวอย่าง Cache-Aside:**

```python
def get_user(user_id):
    # 1. ลองดึงจาก Cache
    cached = redis.get(f"user:{user_id}")
    if cached:
        return json.loads(cached)
    
    # 2. ถ้าไม่มี ดึงจาก DB
    user = db.query("SELECT * FROM users WHERE id = %s", user_id)
    
    # 3. เก็บใน Cache
    if user:
        redis.setex(f"user:{user_id}", 3600, json.dumps(user))
    
    return user
```

**Database Sharding:**

```
                    ┌─────────────┐
                    │  Router     │
                    │  (hash)     │
                    └──────┬──────┘
                           │
        ┌──────────────────┼──────────────────┐
        ▼                  ▼                  ▼
   ┌─────────┐        ┌─────────┐        ┌─────────┐
   │Shard 1  │        │Shard 2  │        │Shard 3  │
   │user A-H │        │user I-P │        │user Q-Z │
   └─────────┘        └─────────┘        └─────────┘
```

**Sharding Strategies:**

| Strategy | ข้อดี | ข้อเสีย |
|----------|-------|---------|
| Range-based | Range Query ง่าย | Hotspot |
| Hash-based | กระจายดี | Range Query ยาก |
| Directory-based | ยืดหยุ่น | Single Point |
| Geo-based | Latency ต่ำ | ซับซ้อน |

### 3.3 การใช้งาน

**System Design ใช้เมื่อ:**

1. **ออกแบบระบบใหม่** — Greenfield Project
2. **ขยายระบบเดิม** — Scale Up/Out
3. **แก้ปัญหา Performance** — Latency สูง
4. **วางแผน Capacity** — คาดการณ์การเติบโต
5. **Interview** — Senior/Staff Engineer
6. **Post-Mortem** — วิเคราะห์สาเหตุ

### 3.4 ข้อดี

- ✅ **Scalability** — รองรับการเติบโต
- ✅ **Reliability** — ทนต่อความล้มเหลว
- ✅ **Cost Optimization** — ใช้ทรัพยากรคุ้มค่า
- ✅ **Team Alignment** — ทีมเข้าใจตรงกัน
- ✅ **Risk Mitigation** — ลดความเสี่ยง

### 3.5 ข้อเสีย

- ❌ **Complexity** — ระบบซับซ้อนขึ้น
- ❌ **Cost** — ลงทุนสูงช่วงแรก
- ❌ **Over-Engineering** — ออกแบบเกินจำเป็น
- ❌ **Operational Overhead** — ต้องดูแลมากขึ้น
- ❌ **Distributed Debugging** — หา Bug ยาก

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- อย่า Premature Optimization
- อย่าละเลย Observability
- อย่าออกแบบโดยไม่มี NFR
- ระวัง Single Point of Failure (SPOF)
- ระวัง Thundering Herd

**ข้อห้าม:**
- ❌ ห้ามใช้ Distributed System ถ้า Monolith พอ
- ❌ ห้าม Sharding ก่อน Index
- ❌ ห้าม Cache โดยไม่มี Eviction Policy
- ❌ ห้าม Sync Replication ข้าม Region
- ❌ ห้าม Ignore Network Partition

**ข้อจำกัด:**
- CAP Theorem จำกัด Consistency
- Latency ของ Light Speed (~200ms ระหว่างทวีป)
- Cost ของ Bandwidth
- Team Size vs Architecture Complexity

### 3.7 สรุป

System Design Fundamentals เป็นพื้นฐานที่ต้องเข้าใจก่อนออกแบบระบบจริง CAP Theorem, Load Balancing, Caching, Sharding — ล้วนเป็นเครื่องมือที่ต้องเลือกใช้ตามบริบท

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

โครงสร้างของ System Design ประกอบด้วย Layer ต่างๆ:

```
┌─────────────────────────────────────────────┐
│              Client Layer                   │
│         (Web, Mobile, Desktop)              │
└──────────────────┬──────────────────────────┘
                   │
┌──────────────────▼──────────────────────────┐
│              Edge Layer                     │
│         (CDN, DNS, WAF, DDoS)               │
└──────────────────┬──────────────────────────┘
                   │
┌──────────────────▼──────────────────────────┐
│           Gateway Layer                     │
│    (API Gateway, Load Balancer)             │
└──────────────────┬──────────────────────────┘
                   │
┌──────────────────▼──────────────────────────┐
│          Application Layer                  │
│    (Microservices, Serverless)              │
└──────────────────┬──────────────────────────┘
                   │
┌──────────────────▼──────────────────────────┐
│              Data Layer                     │
│   (SQL, NoSQL, Cache, Queue, Search)        │
└─────────────────────────────────────────────┘
```

### 4.2 โครงสร้างทำงานอย่างไร

**Request Flow ปกติ:**

```
1. Client → DNS → CDN (Static)
2. Client → API Gateway → Load Balancer
3. LB → App Server (Business Logic)
4. App → Cache (Redis) → Hit? Return
5. Miss → Database (Read Replica)
6. App → Message Queue (Async)
7. Response → Client
```

**ตัวอย่าง E-Commerce Architecture:**

```
                    ┌──────────┐
                    │  Users   │
                    └────┬─────┘
                         │
                    ┌────▼─────┐
                    │   CDN    │
                    └────┬─────┘
                         │
                    ┌────▼─────┐
                    │API Gateway│
                    └────┬─────┘
        ┌────────────────┼────────────────┐
        ▼                ▼                ▼
   ┌─────────┐      ┌─────────┐      ┌─────────┐
   │Product  │      │ Order   │      │Payment  │
   │Service  │      │Service  │      │Service  │
   └────┬────┘      └────┬────┘      └────┬────┘
        │                │                │
   ┌────▼────┐      ┌────▼────┐      ┌────▼────┐
   │Postgres │      │Kafka    │      │Stripe   │
   │+ Redis  │      │+ Mongo  │      │+ Vault  │
   └─────────┘      └─────────┘      └─────────┘
```

### 4.3 โครงสร้างการใช้งาน

| Layer | Components | หน้าที่ |
|-------|-----------|----------|
| Client | Browser, Mobile | UI/UX |
| Edge | CDN, WAF | Static, Security |
| Gateway | LB, API GW | Routing, Auth |
| App | Services | Business Logic |
| Data | DB, Cache, Queue | Storage, Async |

### 4.4 สรุป

โครงสร้างที่ดีแยก Concerns ชัดเจน ทำให้ Scale แต่ละ Layer ได้อิสระ

---

## 5. แนวทางการประยุกต์ใช้

**Framework การออกแบบ (RESHADED):**

```
R - Requirements (Functional + NFR)
E - Estimation (QPS, Storage, Bandwidth)
S - Storage Schema
H - High-Level Design
A - API Design
D - Deep Dive (Bottlenecks)
E - Evaluate (Trade-offs)
D - Deliver (Document)
```

**ขั้นตอนการออกแบบ:**

```
1. Clarify Requirements
   - Functional: ระบบทำอะไร?
   - Non-Functional: Scale, Latency, Availability?

2. Estimate Scale
   - DAU: 10M users
   - QPS: 10M * 10 req/day / 86400 ≈ 1,200 QPS
   - Peak: 3x = 3,600 QPS
   - Storage: 10M * 1KB * 365 = 3.65 TB/year

3. High-Level Design
   - Components
   - Data Flow

4. Deep Dive
   - Database Schema
   - API Design
   - Bottlenecks

5. Trade-offs
   - SQL vs NoSQL
   - Consistency vs Availability
   - Cost vs Performance
```

**Back-of-Envelope Estimation:**

```
QPS = DAU × Requests per User per Day / 86400
Peak QPS = QPS × 2-3
Storage = DAU × Data per User × Retention Days
Bandwidth = QPS × Average Response Size
Servers = Peak QPS / QPS per Server
```

**ตัวอย่าง: Twitter-like Feed**
```
DAU: 100M
Tweets/User/Day: 2
Read:Write = 100:1
Write QPS: 100M × 2 / 86400 ≈ 2,300
Read QPS: 2,300 × 100 = 230,000
Peak Read: 700,000 QPS
```

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา 1: URL Shortener (bit.ly)**

**Requirements:**
- Functional: สร้าง Short URL, Redirect, Analytics
- NFR: 100M URLs/day, 99.99% Availability, P99 < 100ms

**Estimation:**
```
Write: 100M / 86400 ≈ 1,200 QPS
Read: 1,200 × 100 = 120,000 QPS
Storage: 100M × 500 bytes × 365 × 5 years ≈ 91 TB
```

**Design:**

```
Client → API Gateway → LB → App Servers
                              │
                    ┌─────────┼─────────┐
                    ▼         ▼         ▼
              ┌─────────┐ ┌───────┐ ┌────────┐
              │Postgres │ │ Redis │ │ Kafka  │
              │(URLs)   │ │(Cache)│ │(Events)│
              └─────────┘ └───────┘ └────────┘
```

**Key Generation:**
- Base62 Encoding: `[a-zA-Z0-9]` → 62^7 ≈ 3.5 trillion
- Counter-based: ใช้ Distributed Counter (Snowflake ID)
- Hash-based: MD5 → ตัด 7 ตัว (ต้องจัดการ Collision)

**กรณีศึกษา 2: Chat System (WhatsApp-like)**

**Requirements:**
- 1:1 Chat, Group Chat, Online Status, Read Receipts
- 50M Concurrent Users, P99 < 100ms

**Design:**

```
Client ←→ WebSocket Gateway ←→ Chat Service
                                      │
                         ┌────────────┼────────────┐
                         ▼            ▼            ▼
                   ┌─────────┐  ┌─────────┐  ┌─────────┐
                   │Cassandra│  │  Redis  │  │  Kafka  │
                   │(Messages)│ │(Presence)│ │(Events) │
                   └─────────┘  └─────────┘  └─────────┘
```

**Key Decisions:**
- WebSocket แทน HTTP Polling (Latency ต่ำ)
- Cassandra สำหรับ Messages (Write-Heavy)
- Redis สำหรับ Presence (Ephemeral)
- Kafka สำหรับ Fan-out

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| SPOF | Component เดียว | Redundancy, Failover |
| Thundering Herd | Cache Expire พร้อมกัน | Jitter, Stagger |
| Hot Partition | Key ไม่กระจาย | Salt Key, Composite Key |
| Cascading Failure | Dependency ล่ม | Circuit Breaker |
| Data Loss | ไม่มี Replication | Multi-AZ, Backup |
| Latency สูง | Cross-Region | Edge, CDN, Geo-Routing |
| Cost บาน | Over-Provisioning | Auto-scaling, Spot |

---

# บทที่ 2: Scalability

## 1. บทนำ

Scalability คือความสามารถของระบบในการรองรับการเติบโต — ไม่ว่าจะเป็น Users, Data, Traffic, หรือ Transactions ระบบที่ Scale ไม่ได้จะกลายเป็นคอขวดทางธุรกิจ บทนี้จะพาคุณเข้าใจศาสตร์ของการ Scale ตั้งแต่ Vertical vs Horizontal ไปจนถึง Database Scaling, Caching Strategies, และ Async Processing

## 2. บทนิยาม

**Scalability** หมายถึง ความสามารถของระบบในการรองรับงานที่เพิ่มขึ้น โดยไม่ลด Performance ลงอย่างมีนัยสำคัญ

**คำนิยามเชิงปฏิบัติ:**
> Scalability = (Performance คงที่) เมื่อ (Load เพิ่มขึ้น)

**ประเภทของ Scalability:**

| ประเภท | ความหมาย |
|--------|----------|
| **Vertical (Scale Up)** | เพิ่ม Resource ในเครื่องเดียว |
| **Horizontal (Scale Out)** | เพิ่มจำนวนเครื่อง |
| **Diagonal** | ผสมทั้งสอง |
| **Elastic** | Auto-scale ตาม Load |

**Amdahl's Law:**

```
Speedup = 1 / (S + P/N)

S = ส่วนที่ Parallelize ไม่ได้
P = ส่วนที่ Parallelize ได้
N = จำนวน Processor
```

** implication:** ถ้า S = 10% ต่อให้ N = ∞ ก็ได้ Speedup แค่ 10x

## 3. บทหัวข้อ

### 3.1 Scalability คืออะไร

**Vertical Scaling:**

```
Before:              After:
┌─────────┐         ┌─────────────┐
│ 4 CPU   │   →     │ 32 CPU      │
│ 16 GB   │         │ 256 GB      │
│ 1 TB    │         │ 16 TB       │
└─────────┘         └─────────────┘

ข้อดี: ง่าย, ไม่ต้องแก้โค้ด
ข้อเสีย: มีขีดจำกัด, แพง, SPOF
```

**Horizontal Scaling:**

```
Before:              After:
┌─────────┐         ┌─────────┐ ┌─────────┐ ┌─────────┐
│ 1 Server│   →     │Server 1 │ │Server 2 │ │Server 3 │
└─────────┘         └─────────┘ └─────────┘ └─────────┘

ข้อดี: Scale ได้ไม่จำกัด, ทน Fail
ข้อเสีย: ต้องแก้โค้ด, State Management ยาก
```

**Stateless vs Stateful:**

| ลักษณะ | Stateless | Stateful |
|--------|-----------|----------|
| State | เก็บใน DB/Cache | เก็บใน Memory |
| Scale | ง่าย | ยาก |
| Failover | ง่าย | ซับซ้อน |
| ตัวอย่าง | REST API | WebSocket |

**Database Scaling:**

```
Vertical:              Horizontal:
┌─────────┐            ┌─────────┐ ┌─────────┐
│  Big DB │            │Shard 1  │ │Shard 2  │
└─────────┘            └─────────┘ └─────────┘
                       + Read Replicas
                       + Caching
```

**Read Replica Pattern:**

```
        ┌─────────┐
        │  App    │
        └────┬────┘
             │
    ┌────────┼────────┐
    ▼        ▼        ▼
┌───────┐ ┌───────┐ ┌───────┐
│Master │ │Replica│ │Replica│
│(Write)│ │(Read) │ │(Read) │
└───┬───┘ └───────┘ └───────┘
    │         ▲         ▲
    └─────────┴─────────┘
      Replication
```

### 3.2 ทำงานอย่างไร

**Auto-scaling:**

```yaml
# Kubernetes HPA
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: web-app
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: web-app
  minReplicas: 2
  maxReplicas: 100
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70
  - type: Resource
    resource:
      name: memory
      target:
        type: Utilization
        averageUtilization: 80
```

**Caching Layers:**

```
Layer 1: Browser Cache
Layer 2: CDN Cache
Layer 3: API Gateway Cache
Layer 4: Application Cache (Redis)
Layer 5: Database Cache (Buffer Pool)
Layer 6: Query Cache
```

**Cache Invalidation Strategies:**

| Strategy | ข้อดี | ข้อเสีย |
|----------|-------|---------|
| TTL | ง่าย | Stale Data |
| Write-Through | Consistency | Latency |
| Event-Based | Real-time | ซับซ้อน |
| Version-Based | Atomic | ต้อง Track |

**Async Processing:**

```
Sync:
Client → API → Process (5s) → Response
       └── Block 5s ──┘

Async:
Client → API → Queue → Response (50ms)
                │
                ▼
         Worker → Process (5s) → Callback
```

**Message Queue Patterns:**

| Pattern | ใช้เมื่อ |
|---------|----------|
| Point-to-Point | Task Distribution |
| Pub/Sub | Event Notification |
| Request-Reply | RPC Async |
| Dead Letter | Error Handling |
| Priority Queue | Urgent Tasks |

### 3.3 การใช้งาน

**Scalability ใช้เมื่อ:**

1. **Traffic เพิ่ม** — ผู้ใช้เยอะขึ้น
2. **Data โต** — Database ใหญ่ขึ้น
3. **Geographic Expansion** — ขยายตลาด
4. **Peak Events** — Black Friday, Songkran
5. **Cost Optimization** — ใช้ Auto-scaling

### 3.4 ข้อดี

- ✅ **รองรับการเติบโต** — ไม่ต้อง Rewrite
- ✅ **Cost-Effective** — จ่ายตามใช้
- ✅ **High Availability** — Redundancy
- ✅ **Performance คงที่** — User Experience ดี
- ✅ **Elasticity** — ปรับตาม Demand

### 3.5 ข้อเสีย

- ❌ **Complexity** — ระบบซับซ้อน
- ❌ **Distributed Challenges** — Consistency, Debugging
- ❌ **Operational Cost** — ต้องมี SRE
- ❌ **Over-Engineering** — Scale เกินจำเป็น
- ❌ **Development Overhead** — ต้องคิด Distributed ตั้งแต่ต้น

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- ระวัง Database เป็นคอขวด
- ระวัง Cache Stampede
- ระวัง Connection Pool Exhaustion
- ระวัง N+1 Query Problem

**ข้อห้าม:**
- ❌ ห้าม Scale ก่อน Optimize
- ❌ ห้าม Share Database ระหว่าง Services
- ❌ ห้ามใช้ Sync Replication ข้าม Region
- ❌ ห้าม Scale โดยไม่มี Monitoring
- ❌ ห้าม Ignore Tail Latency

**ข้อจำกัด:**
- Amdahl's Law จำกัด Speedup
- Network Latency ไม่ลดลง
- Consistency แลกกับ Availability
- Cost ไม่เป็น Linear

### 3.7 สรุป

Scalability คือการเลือก Trade-off อย่างชาญฉลาด ระหว่าง Vertical/Horizontal, Consistency/Availability, Cost/Performance

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

```
┌─────────────────────────────────────────────┐
│         Load Balancer (L4/L7)               │
└──────────────────┬──────────────────────────┘
                   │
    ┌──────────────┼──────────────┐
    ▼              ▼              ▼
┌─────────┐   ┌─────────┐   ┌─────────┐
│App Node1│   │App Node2│   │App Node3│
└────┬────┘   └────┬────┘   └────┬────┘
     │             │             │
     └─────────────┼─────────────┘
                   │
    ┌──────────────┼──────────────┐
    ▼              ▼              ▼
┌─────────┐   ┌─────────┐   ┌─────────┐
│ Redis   │   │Postgres │   │ Kafka   │
│ Cluster │   │+Replica │   │ Cluster │
└─────────┘   └─────────┘   └─────────┘
```

### 4.2 โครงสร้างทำงานอย่างไร

**L4 vs L7 Load Balancer:**

| ลักษณะ | L4 (Transport) | L7 (Application) |
|--------|----------------|------------------|
| ดู | IP, Port | HTTP, Header |
| Speed | เร็วกว่า | ช้ากว่า |
| Features | Simple | Content-based |
| ตัวอย่าง | AWS NLB | AWS ALB |

**Consistent Hashing:**

```
Hash Ring:
        0
       / \
      /   \
   300     60
    |       |
   270     90
    |       |
   240    120
      \   /
       \ /
       180

Node A: 0-120
Node B: 120-240
Node C: 240-360

เพิ่ม Node D → แค่ Key ที่อยู่ระหว่าง C-D ต้อง Move
```

### 4.3 โครงสร้างการใช้งาน

| Component | Scaling Strategy |
|-----------|------------------|
| Web Server | Horizontal (Stateless) |
| App Server | Horizontal |
| Cache | Cluster, Sharding |
| Database | Read Replica, Sharding |
| Queue | Partition |
| Storage | Object Storage (S3) |

### 4.4 สรุป

โครงสร้างที่ Scale ได้ต้องแยก State ออกจาก Compute และใช้ Asynchronous Communication

---

## 5. แนวทางการประยุกต์ใช้

**Framework การ Scale:**

```
1. วัดก่อน Scale
   - Profile, Monitor, Identify Bottleneck

2. Optimize ก่อน Scale
   - Query, Index, Algorithm

3. Scale Layer ที่เป็นคอขวด
   - Web? DB? Cache?

4. เลือกวิธีที่เหมาะ
   - Vertical: ง่าย, มีขีดจำกัด
   - Horizontal: ยาก, ไม่จำกัด

5. วัดผลหลัง Scale
   - ดีขึ้นจริงไหม? Cost คุ้มไหม?
```

**Scaling Decision Tree:**

```
Bottleneck อยู่ที่ไหน?
├─ CPU → Scale Up หรือ Scale Out
├─ Memory → Scale Up หรือ Cache
├─ Disk I/O → SSD, Sharding
├─ Network → CDN, Compression
├─ Database → Read Replica, Sharding
└─ Application → Optimize Code
```

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา 1: Netflix Scaling**

- **2007:** Monolith บน Datacenter
- **2009:** ย้ายขึ้น AWS
- **2011:** เริ่ม Microservices
- **2016:** ครบ 100% Cloud
- **ปัจจุบัน:** 1,000+ Microservices, 200M+ Subscribers

**Key Strategies:**
- Chaos Engineering (Chaos Monkey)
- Multi-Region Active-Active
- CDN (Open Connect) — 95% Traffic
- Async Processing (Kafka)

**กรณีศึกษา 2: Shopee Flash Sale**

**Challenge:** 10M Users ใน 1 นาที

**Strategies:**
1. **Pre-warm Cache** — โหลด Stock ล่วงหน้า
2. **Queue** — รับ Request แล้วประมวลผลตามลำดับ
3. **Rate Limiting** — จำกัด Request ต่อ User
4. **Database Sharding** — แยกตาม Product Category
5. **Async Processing** — ไม่ Block Response
6. **Circuit Breaker** — ป้องกัน Cascade

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| DB Bottleneck | Read/Write เยอะ | Read Replica, Sharding |
| Cache Stampede | TTL หมดพร้อมกัน | Jitter, Mutex |
| Hot Key | Key เดียวถูกบ่อย | Local Cache, Replicate |
| Connection Pool เต็ม | Connections เยอะ | Pool Tuning, PgBouncer |
| Thundering Herd | Retry พร้อมกัน | Exponential Backoff |
| Stateful Scale | Session ใน Memory | Redis Session |
| Cross-Region Latency | ระยะทาง | Edge, Geo-Routing |

---

# บทที่ 3: Distributed Systems

## 1. บทนำ

Distributed Systems คือหัวใจของระบบสมัยใหม่ แต่ก็เป็นสิ่งที่ซับซ้อนที่สุดในวิศวกรรมซอฟต์แวร์ ระบบ Distributed มี Failure Mode ที่ไม่เกิดใน Single Node — Network Partition, Clock Skew, Partial Failure, Split Brain — และการจัดการกับสิ่งเหล่านี้ต้องใช้ทั้งทฤษฎีและประสบการณ์

บทนี้จะพาคุณเข้าใจ Distributed Systems ตั้งแต่ Consistency Models ไปจนถึง Consensus Algorithms, Distributed Transactions, และ Saga Pattern

## 2. บทนิยาม

**Distributed System** หมายถึง ระบบที่ Components หลายตัวอยู่บนเครื่องต่างกัน สื่อสารผ่าน Network และปรากฏต่อผู้ใช้เป็นระบบเดียว

**คำนิยามของ Leslie Lamport:**
> "A distributed system is one in which the failure of a computer you didn't even know existed can render your own computer unusable."

**Fallacies of Distributed Computing (Peter Deutsch):**

1. Network is reliable
2. Latency is zero
3. Bandwidth is infinite
4. Network is secure
5. Topology doesn't change
6. There is one administrator
7. Transport cost is zero
8. Network is homogeneous

## 3. บทหัวข้อ

### 3.1 Distributed Systems คืออะไร

**Consistency Models:**

| Model | ความหมาย | ตัวอย่าง |
|-------|----------|----------|
| **Strong** | อ่านเห็นค่าเขียนล่าสุดเสมอ | Spanner, etcd |
| **Sequential** | ทุกคนเห็นลำดับเดียวกัน | ZooKeeper |
| **Causal** | เห็นเหตุ-ผล | MongoDB (Session) |
| **Eventual** | สุดท้ายจะตรงกัน | Cassandra, DynamoDB |

**Consistency Spectrum:**

```
Strong ────────────────────────────► Weak
Spanner   etcd   MongoDB   Cassandra   DNS
  CP       CP      CP/AP      AP        AP
```

**Replication Strategies:**

| Strategy | ลักษณะ | ข้อดี | ข้อเสีย |
|----------|--------|-------|---------|
| **Leader-Follower** | Leader รับ Write | ง่าย | Leader SPOF |
| **Multi-Leader** | หลาย Leader | HA | Conflict |
| **Leaderless** | ทุก Node เท่ากัน | ทน Fail | ซับซ้อน |

**Consensus Algorithms:**

| Algorithm | ใช้ใน | ลักษณะ |
|-----------|-------|--------|
| Paxos | Chubby, Spanner | Theoretical |
| Raft | etcd, Consul | เข้าใจง่าย |
| ZAB | ZooKeeper | Atomic Broadcast |
| PBFT | Hyperledger | Byzantine |

**Raft States:**

```
┌──────────┐  Timeout   ┌──────────┐
│ Follower │──────────►│Candidate │
└────┬─────┘            └────┬─────┘
     │                       │
     │ ◄── Heartbeat ────    │ Majority
     │                       ▼
     │                 ┌──────────┐
     └─────────────────│  Leader  │
                       └──────────┘
```

### 3.2 ทำงานอย่างไร

**Distributed Transactions:**

**2PC (Two-Phase Commit):**

```
Phase 1: Prepare
Coordinator → Participant 1: "Prepare?"
Coordinator → Participant 2: "Prepare?"
Participant 1 → Coordinator: "Yes"
Participant 2 → Coordinator: "Yes"

Phase 2: Commit
Coordinator → Participant 1: "Commit"
Coordinator → Participant 2: "Commit"
```

**ปัญหา:** Blocking, Coordinator SPOF

**Saga Pattern:**

```
Order Service → Payment Service → Inventory Service → Shipping
     │              │                  │                │
     ▼              ▼                  ▼                ▼
  Create Order   Charge Card      Reserve Stock    Ship Order
     │              │                  │                │
     └──────────────┴──────────────────┴────────────────┘
                    Compensation (ถ้าล้มเหลว)
```

**Saga แบบ Choreography:**

```python
# Event-Driven
class OrderService:
    def create_order(self, order):
        self.db.save(order)
        self.event_bus.publish(OrderCreated(order.id))
    
    def on_payment_failed(self, event):
        self.db.cancel(event.order_id)

class PaymentService:
    def on_order_created(self, event):
        try:
            self.charge(event.customer_id, event.total)
            self.event_bus.publish(PaymentSucceeded(event.order_id))
        except PaymentError:
            self.event_bus.publish(PaymentFailed(event.order_id))
```

**Saga แบบ Orchestration:**

```python
class OrderSaga:
    def execute(self, order):
        try:
            self.payment.charge(order)
            self.inventory.reserve(order)
            self.shipping.schedule(order)
        except Exception as e:
            self.compensate(order, e)
    
    def compensate(self, order, error):
        if order.shipping_scheduled:
            self.shipping.cancel(order)
        if order.inventory_reserved:
            self.inventory.release(order)
        if order.payment_charged:
            self.payment.refund(order)
```

**Distributed Locking:**

```python
# Redis-based Lock
import redis
import uuid

class RedisLock:
    def __init__(self, redis_client, key, ttl=10):
        self.redis = redis_client
        self.key = f"lock:{key}"
        self.ttl = ttl
        self.token = str(uuid.uuid4())
    
    def acquire(self):
        return self.redis.set(
            self.key, self.token, nx=True, ex=self.ttl
        )
    
    def release(self):
        # Lua script สำหรับ atomic check-and-delete
        script = """
        if redis.call("get", KEYS[1]) == ARGV[1] then
            return redis.call("del", KEYS[1])
        else
            return 0
        end
        """
        self.redis.eval(script, 1, self.key, self.token)
```

**Circuit Breaker:**

```python
class CircuitBreaker:
    def __init__(self, failure_threshold=5, timeout=60):
        self.failure_threshold = failure_threshold
        self.timeout = timeout
        self.failures = 0
        self.state = "CLOSED"
        self.last_failure_time = None
    
    def call(self, func, *args, **kwargs):
        if self.state == "OPEN":
            if time.time() - self.last_failure_time > self.timeout:
                self.state = "HALF_OPEN"
            else:
                raise CircuitOpenError()
        
        try:
            result = func(*args, **kwargs)
            if self.state == "HALF_OPEN":
                self.state = "CLOSED"
                self.failures = 0
            return result
        except Exception as e:
            self.failures += 1
            self.last_failure_time = time.time()
            if self.failures >= self.failure_threshold:
                self.state = "OPEN"
            raise
```

### 3.3 การใช้งาน

**Distributed Systems ใช้เมื่อ:**

1. **Scale เกิน Single Machine** — Data > 1TB
2. **Geographic Distribution** — ผู้ใช้ทั่วโลก
3. **High Availability** — 99.99%+
4. **Fault Tolerance** — ทน Disaster
5. **Specialized Workloads** — ML Training

### 3.4 ข้อดี

- ✅ **Scalability** — ไม่จำกัด
- ✅ **Availability** — Redundancy
- ✅ **Latency** — ใกล้ผู้ใช้
- ✅ **Fault Tolerance** — ทน Fail
- ✅ **Cost** — ใช้ Commodity Hardware

### 3.5 ข้อเสีย

- ❌ **Complexity** — สูงมาก
- ❌ **Consistency** — ยาก
- ❌ **Debugging** — ยากมาก
- ❌ **Network Overhead** — Latency
- ❌ **Operational Cost** — ต้อง SRE

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- ระวัง Clock Skew — ใช้ Logical Clock
- ระวัง Partial Failure
- ระวัง Split Brain
- ระวัง Network Partition

**ข้อห้าม:**
- ❌ ห้าม Assume Network Reliable
- ❌ ห้าม Assume Clock Synchronized
- ❌ ห้าม Assume Zero Latency
- ❌ ห้ามใช้ Distributed Lock โดยไม่มี TTL
- ❌ ห้าม Ignore Idempotency

**ข้อจำกัด:**
- CAP Theorem
- FLP Impossibility
- Byzantine Fault Tolerance ต้อง 3f+1 Nodes

### 3.7 สรุป

Distributed Systems เป็นเรื่องของ Trade-off ระหว่าง Consistency, Availability, Latency, และ Cost ไม่มีคำตอบเดียวที่ถูกทุกบริบท

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

```
┌─────────────────────────────────────────────┐
│              Control Plane                  │
│     (Service Discovery, Config, LB)         │
└──────────────────┬──────────────────────────┘
                   │
┌──────────────────▼──────────────────────────┐
│              Data Plane                     │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐     │
│  │Node 1   │  │Node 2   │  │Node 3   │     │
│  │Leader   │  │Follower │  │Follower │     │
│  └─────────┘  └─────────┘  └─────────┘     │
└─────────────────────────────────────────────┘
```

### 4.2 โครงสร้างทำงานอย่างไร

**Raft Consensus Flow:**

```
1. Leader Election
   - Follower Timeout → Candidate
   - ขอ Votes → Majority → Leader

2. Log Replication
   - Client → Leader
   - Leader → Append Entry → Followers
   - Majority ACK → Commit

3. Safety
   - Leader Completeness
   - Log Matching
```

**Gossip Protocol:**

```
Node A: "I know about X, Y, Z"
   ↓
Node B: "I know about Y, Z, W"
   ↓
Merge → "X, Y, Z, W"
   ↓
Spread to other nodes
```

### 4.3 โครงสร้างการใช้งาน

| Layer | Components | หน้าที่ |
|-------|-----------|----------|
| Coordination | etcd, ZooKeeper | Leader Election, Config |
| Communication | gRPC, Message Queue | RPC, Async |
| Data | Cassandra, Kafka | Storage, Stream |
| Compute | Kubernetes | Orchestration |
| Observability | Jaeger, Prometheus | Tracing, Metrics |

### 4.4 สรุป

โครงสร้าง Distributed ที่ดีต้องมี Coordination Layer, Data Plane, และ Observability

---

## 5. แนวทางการประยุกต์ใช้

**Framework การออกแบบ Distributed:**

```
1. ระบุ Consistency Requirement
   - Strong? Eventual?

2. เลือก Replication Strategy
   - Leader-Follower? Multi-Leader? Leaderless?

3. ออกแบบ Failure Handling
   - Retry, Circuit Breaker, Fallback

4. ออกแบบ Idempotency
   - Idempotency Key, Deduplication

5. ออกแบบ Observability
   - Trace ID, Correlation ID

6. ออกแบบ Recovery
   - Backup, Restore, Replay
```

**Consistency Decision:**

```
ต้องการ Strong Consistency?
├─ ใช่ → ใช้ Consensus (Raft, Paxos)
│        แลกกับ Latency และ Availability
└─ ไม่ → ใช้ Eventual Consistency
         ต้องจัดการ Conflict Resolution
```

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา 1: Kafka — Distributed Log**

**Architecture:**
```
Producer → Topic (Partitioned) → Consumer Groups
              │
         ┌────┼────┐
         ▼    ▼    ▼
      Partition 0, 1, 2
         │
      Replication Factor = 3
         │
      Leader + 2 Followers
```

**Key Features:**
- Partition = Unit of Parallelism
- Replication = Fault Tolerance
- ISR (In-Sync Replicas)
- Exactly-Once Semantics

**กรณีศึกษา 2: Cassandra — Leaderless**

**Architecture:**
```
Client → Coordinator Node
              │
    ┌─────────┼─────────┐
    ▼         ▼         ▼
 Replica1  Replica2  Replica3
    │         │         │
    └─────────┴─────────┘
         Quorum Read/Write

W + R > N → Strong Consistency
W = Write Quorum
R = Read Quorum
N = Replication Factor
```

**Conflict Resolution:**
- Last Write Wins (Timestamp)
- Vector Clocks
- CRDTs

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| Split Brain | Partition | Quorum, Fencing |
| Clock Skew | NTP ไม่ตรง | Logical Clock, HLC |
| Duplicate Message | Retry | Idempotency Key |
| Out-of-Order | Async | Sequence Number |
| Data Loss | Replica ล่ม | Replication, Backup |
| Cascading Failure | Dependency | Circuit Breaker, Bulkhead |
| Thundering Herd | Retry พร้อมกัน | Exponential Backoff, Jitter |

---

# บทที่ 4: System Design Case Studies

## 1. บทนำ

ทฤษฎีสำคัญ แต่การประยุกต์ใช้จริงสำคัญกว่า บทนี้จะพาคุณผ่าน Case Studies ที่พบบ่อยใน Interview และ Production ตั้งแต่ URL Shortener, Chat System, News Feed, Video Streaming ไปจนถึง Rate Limiter และ Distributed Queue

## 2. บทนิยาม

**Case Study** หมายถึง การวิเคราะห์ระบบจริงหรือระบบสมมติ เพื่อฝึกทักษะการออกแบบและการตัดสินใจ

## 3. บทหัวข้อ

### 3.1 Case Studies คืออะไร

Case Studies ที่สำคัญ:

1. **URL Shortener** — Key Generation, Redirect
2. **Chat System** — WebSocket, Presence, Fan-out
3. **News Feed** — Fan-out on Write vs Read
4. **Video Streaming** — CDN, Transcoding, Adaptive Bitrate
5. **Rate Limiter** — Token Bucket, Sliding Window
6. **Distributed Queue** — Partition, Consumer Group
7. **Search Autocomplete** — Trie, Ranking
8. **Payment System** — Idempotency, Saga

### 3.2 ทำงานอย่างไร

**Case 1: News Feed (Twitter-like)**

**Requirements:**
- 100M DAU
- 500M Tweets/day
- Feed โหลด < 200ms

**Approach 1: Fan-out on Write (Push)**
```
User Tweet → เขียนลงทุก Follower's Timeline Cache
ข้อดี: Read เร็ว
ข้อเสีย: Write แพง (Celebrity Problem)
```

**Approach 2: Fan-out on Read (Pull)**
```
User เปิด Feed → ดึงจากทุก Following → Merge
ข้อดี: Write ถูก
ข้อเสีย: Read แพง
```

**Hybrid Approach:**
```
User ทั่วไป → Fan-out on Write
Celebrity (> 1M followers) → Fan-out on Read
```

**Architecture:**

```
Write Path:
Tweet → Tweet Service → Kafka → Fan-out Service
                                    │
                                    ▼
                              Timeline Cache (Redis)

Read Path:
User → Feed Service → Merge:
                      - Timeline Cache (fast)
                      - Celebrity Tweets (pull)
                      - Ranking Algorithm
                      → Return Feed
```

**Case 2: Rate Limiter**

**Algorithms:**

| Algorithm | ข้อดี | ข้อเสีย |
|-----------|-------|---------|
| Token Bucket | Burst ได้ | ต้อง Sync |
| Leaky Bucket | Smooth | Burst ไม่ได้ |
| Fixed Window | ง่าย | Boundary Issue |
| Sliding Window | แม่นยำ | Memory |

**Token Bucket Implementation:**

```python
import time

class TokenBucket:
    def __init__(self, capacity, refill_rate):
        self.capacity = capacity
        self.tokens = capacity
        self.refill_rate = refill_rate  # tokens per second
        self.last_refill = time.time()
    
    def allow(self, tokens=1):
        now = time.time()
        elapsed = now - self.last_refill
        self.tokens = min(
            self.capacity,
            self.tokens + elapsed * self.refill_rate
        )
        self.last_refill = now
        
        if self.tokens >= tokens:
            self.tokens -= tokens
            return True
        return False
```

**Distributed Rate Limiter (Redis):**

```python
def is_allowed(user_id, limit=100, window=60):
    key = f"rate:{user_id}"
    now = time.time()
    
    # Sliding Window ด้วย Sorted Set
    pipe = redis.pipeline()
    pipe.zremrangebyscore(key, 0, now - window)
    pipe.zadd(key, {str(now): now})
    pipe.zcard(key)
    pipe.expire(key, window)
    results = pipe.execute()
    
    return results[2] <= limit
```

**Case 3: Video Streaming (YouTube-like)**

**Requirements:**
- Upload, Transcode, Store, Stream
- 1B Videos, 500 Hours/min Uploaded
- Global Users

**Architecture:**

```
Upload Path:
User → Upload Service → S3 (Raw) → Kafka → Transcoding Service
                                              │
                                              ▼
                                    Multiple Formats:
                                    - 240p, 360p, 480p, 720p, 1080p, 4K
                                    - HLS, DASH
                                              │
                                              ▼
                                    S3 (Processed) → CDN

Watch Path:
User → CDN → Video Player
         │
         └─ ถ้าไม่ Hit → Origin (S3)
```

**Key Decisions:**
- **Chunked Upload** — Resume ได้
- **Async Transcoding** — ไม่ Block
- **Adaptive Bitrate** — ตาม Network
- **CDN** — ลด Latency
- **Pre-signed URL** — Security

### 3.3 การใช้งาน

Case Studies ใช้เพื่อ:
- เตรียม Interview
- ฝึก Systems Thinking
- เข้าใจ Trade-offs
- สร้าง Pattern Library

### 3.4 ข้อดี

- ✅ **Practical** — ใช้จริงได้
- ✅ **Pattern Recognition** — เห็น Pattern ซ้ำ
- ✅ **Trade-off Analysis** — เข้าใจการตัดสินใจ
- ✅ **Interview Prep** — ผ่าน Interview

### 3.5 ข้อเสีย

- ❌ **Simplified** — ไม่ครอบคลุม Edge Cases
- ❌ **No Silver Bullet** — ใช้กับทุกอย่างไม่ได้
- ❌ **Outdated** — เทคโนโลยีเปลี่ยน

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- อย่า Copy Architecture โดยไม่เข้าใจ Context
- อย่าละเลย Constraints จริง
- อย่า Over-Engineer

**ข้อห้าม:**
- ❌ ห้ามใช้ Architecture ของ Google กับ Startup
- ❌ ห้าม Ignore Cost
- ❌ ห้าม Ignore Team Size

### 3.7 สรุป

Case Studies เป็นเครื่องมือฝึกคิด ไม่ใช่ Template ที่ Copy ได้ทุกบริบท

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

```
Case Study Structure:
1. Requirements (Functional + NFR)
2. Estimation (QPS, Storage, Bandwidth)
3. High-Level Design
4. Deep Dive
5. Bottlenecks & Solutions
6. Trade-offs
```

### 4.2 โครงสร้างทำงานอย่างไร

**ตัวอย่าง: URL Shortener**

```
Requirements:
- Functional: Shorten, Redirect, Analytics
- NFR: 100M URLs/day, P99 < 100ms, 99.99%

Estimation:
- Write QPS: ~1,200
- Read QPS: ~120,000
- Storage: ~90 TB / 5 years

Design:
- API: POST /shorten, GET /{code}
- Key Gen: Base62 (7 chars = 3.5T)
- Storage: Postgres (sharded) + Redis
- Analytics: Kafka → ClickHouse
```

### 4.3 โครงสร้างการใช้งาน

| Case | Key Challenge | Solution |
|------|---------------|----------|
| URL Shortener | Key Generation | Base62, Counter |
| Chat | Real-time | WebSocket |
| News Feed | Fan-out | Hybrid |
| Video | Storage, CDN | S3 + CDN |
| Rate Limiter | Distributed | Redis |
| Queue | Ordering | Partition |

### 4.4 สรุป

โครงสร้าง Case Study ช่วยให้วิเคราะห์อย่างเป็นระบบ

---

## 5. แนวทางการประยุกต์ใช้

**Framework การทำ Case Study:**

```
1. Clarify (5 นาที)
   - Functional Requirements
   - Non-Functional Requirements
   - Out of Scope

2. Estimate (5 นาที)
   - QPS, Storage, Bandwidth
   - Servers, Cost

3. Design (15 นาที)
   - API
   - Data Model
   - High-Level Architecture

4. Deep Dive (20 นาที)
   - Bottlenecks
   - Scaling
   - Failure Handling

5. Wrap Up (5 นาที)
   - Trade-offs
   - Future Improvements
```

---

## 6. การนำไปใช้งานจริง

**Case 4: Distributed Job Queue**

**Requirements:**
- 1M Jobs/day
- At-least-once Delivery
- Priority Support
- Retry with Backoff

**Design:**

```
Producer → API → Queue (Kafka/Redis)
                    │
                    ▼
              Worker Pool
                    │
         ┌──────────┼──────────┐
         ▼          ▼          ▼
      Success    Failure    Timeout
         │          │          │
         ▼          ▼          ▼
      Archive    Retry      DLQ
                (Backoff)
```

**Job Schema:**

```python
@dataclass
class Job:
    id: str
    type: str
    payload: dict
    priority: int
    attempts: int = 0
    max_attempts: int = 3
    scheduled_at: datetime
    created_at: datetime
```

**Worker:**

```python
def process_job(job):
    try:
        handler = HANDLERS[job.type]
        handler(job.payload)
        mark_complete(job.id)
    except RetryableError as e:
        if job.attempts < job.max_attempts:
            delay = 2 ** job.attempts  # Exponential Backoff
            schedule_retry(job, delay)
        else:
            move_to_dlq(job, e)
    except FatalError as e:
        move_to_dlq(job, e)
```

**Case 5: Search Autocomplete**

**Requirements:**
- P99 < 50ms
- 10M Queries/day
- Top 10 Suggestions

**Design:**

```
User → API → Cache (Redis) → Hit? Return
                │
                Miss
                │
                ▼
         Trie Service
                │
                ▼
         Top-K per Prefix
```

**Trie with Top-K:**

```python
class TrieNode:
    def __init__(self):
        self.children = {}
        self.top_k = []  # [(query, score)]

class Autocomplete:
    def __init__(self):
        self.root = TrieNode()
    
    def insert(self, query, score):
        node = self.root
        for char in query:
            if char not in node.children:
                node.children[char] = TrieNode()
            node = node.children[char]
            # Update top-k
            node.top_k.append((query, score))
            node.top_k.sort(key=lambda x: -x[1])
            node.top_k = node.top_k[:10]
    
    def search(self, prefix):
        node = self.root
        for char in prefix:
            if char not in node.children:
                return []
            node = node.children[char]
        return node.top_k
```

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | แนวทางแก้ไข |
|-------|-------------|
| Key Collision | ตรวจสอบ + Retry |
| Hot Key | Local Cache, Replicate |
| Celebrity Problem | Hybrid Fan-out |
| Video Storage | Tiered Storage, Lifecycle |
| Rate Limit Bypass | Multiple Dimensions |
| Job Duplicate | Idempotency Key |
| Autocomplete Stale | TTL, Rebuild |

---

# 📘 สรุปเล่มที่ 3

**สิ่งที่ได้เรียนรู้:**

1. **Fundamentals** — CAP, Load Balancing, Caching, Sharding
2. **Scalability** — Vertical vs Horizontal, Auto-scaling
3. **Distributed Systems** — Consensus, Saga, Circuit Breaker
4. **Case Studies** — URL Shortener, Chat, Feed, Video, Rate Limiter

**คำแนะนำ:**
- ฝึก Estimation ทุกวัน
- อ่าน Engineering Blogs (Netflix, Uber, Airbnb)
- ลงมือออกแบบระบบจริง
- เรียนจาก Failure (Post-Mortem)

**หนังสือแนะนำ:**
- "Designing Data-Intensive Applications" — Martin Kleppmann
- "System Design Interview" — Alex Xu (Vol 1, 2)
- "Site Reliability Engineering" — Google
- "Release It!" — Michael Nygard

---

# 📘 เล่มถัดไป (โครงร่าง)

## เล่มที่ 4: สถาปัตยกรรมซอฟต์แวร์
- บทที่ 1: Software Architecture Principles
- บทที่ 2: Clean Architecture
- บทที่ 3: Hexagonal Architecture
- บทที่ 4: Event-Driven Architecture
- บทที่ 5: Microservices vs Monolith

## เล่มที่ 5: Domain-Driven Design
- บทที่ 1: Strategic DDD
- บทที่ 2: Tactical DDD
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