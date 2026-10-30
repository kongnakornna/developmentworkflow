```
# ชุดคู่มือ Software Architecture 
# แบ่งเป็น 7 เล่ม (7 Volumes)
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
```
---
```
# 📚 แผนที่ชุดหนังสือ (Master Book Plan)

| เล่ม | ชื่อเล่ม | หัวข้อหลัก | กลุ่มเป้าหมาย |
|------|----------|-----------|---------------|
| **1** | รากฐานการคำนวณ | Data Structures, Algorithms, Big O | Junior → Mid |
| **2** | กระบวนทัศน์การเขียนโปรแกรม | OOP, Functional Programming, Design Patterns | Junior → Mid |
| **3** | การออกแบบระบบ | System Design, Scalability, Distributed Systems | Mid → Senior |
| **4** | สถาปัตยกรรมซอฟต์แวร์ | Software Architecture, Clean, Hexagonal, Event-Driven | Senior → Architect |
| **5** | Domain-Driven Design | Strategic DDD, Tactical DDD, Bounded Context | Senior → Architect |
| **6** | DevOps & Cloud | CI/CD, AWS, IaC, Observability | Mid → Senior |
| **7** | AI Systems Architecture | RAG Pipeline, Agentic AI, LLM Platform | Senior → Principal |

**โครงสร้างมาตรฐานของแต่ละบทในทุกเล่ม:**
1. บทนำ
2. บทนิยาม
3. บทหัวข้อ (คืออะไร / ทำงานอย่างไร / การใช้งาน / ข้อดี / ข้อเสีย / ข้อควรระวัง / สรุป)
4. โครงสร้าง (4.1-4.4)
5. แนวทางการประยุกต์ใช้
6. การนำไปใช้งานจริง
7. ปัญหาและแนวทางแก้ไข
```
---

# 📘 เล่มที่ 1: รากฐานการคำนวณ (Computing Foundations)
```
- Advanced Data Structures & Algorithms Vol.2: Suffix Array + LCP,
- Aho-Corasick, Palindromic Tree (Eertree), Sqrt Decomposition,
- Mo's Algorithm, Centroid Decomposition, HLD + Segment Tree, Fenwick Tree 2D
```
---

# 📖 บทนำ (Introduction)
```
- ในเล่มที่ 1 เราได้ปูพื้นฐานโครงสร้างข้อมูลและอัลกอริทึมระดับกลางไปแล้ว ในเล่มนี้ เราจะก้าวเข้าสู่
- **โครงสร้างข้อมูลและอัลกอริทึมขั้นสูง (Advanced)** ที่ใช้ใน Competitive Programming ระดับ IOI/ICPC,
- การประมวลผลข้อความขนาดใหญ่ (Text Processing), ชีวสารสนเทศ (Bioinformatics), และระบบ Query ที่ซับซ้อน

เนื้อหาทั้ง 8 หัวข้อในเล่มนี้ แบ่งออกเป็น 3 กลุ่มหลัก:

**กลุ่มที่ 1: String Algorithms (อัลกอริทึมสตริง)**
1. **Suffix Array + LCP** — โครงสร้างสำหรับ pattern matching และ substring query
2. **Aho-Corasick** — Multi-pattern matching ในเวลา O(n + m + z)
3. **Palindromic Tree (Eertree)** — โครงสร้างสำหรับ palindrome ทั้งหมดในสตริง

**กลุ่มที่ 2: Range Query บน Array (Static/Dynamic)**
4. **Sqrt Decomposition** — เทคนิคแบ่ง block สำหรับ range query
5. **Mo's Algorithm** — จัดลำดับ query ให้有效率สำหรับ offline range query
6. **Fenwick Tree 2D** — Range query บน 2 มิติ

**กลุ่มที่ 3: Tree Algorithms ขั้นสูง**
7. **Centroid Decomposition** — แบ่ง tree เพื่อ query path ที่ซับซ้อน
8. **HLD + Segment Tree รวม** — รวม HLD กับ Segment Tree สำหรับ path query แบบสมบูรณ์

# แต่ละหัวข้อจะอธิบายตามโครงสร้าง 10 ส่วน ได้แก่
- **บทนำ → นิยาม → บทหัวข้อ
- (คืออะไร / ทำงานอย่างไร / การใช้งาน / ข้อดี / ข้อเสีย / ข้อควรระวัง / Workflow / สรุป)
- → ออกแบบ Workflow → Case Study → โครงสร้าง → แนวทางการประยุกต์ใช้
- → กรณีตัวอย่าง → การนำไปใช้งานจริง → ปัญหาและแนวทางแก้ไข**
```
---

# 📚 บทนิยาม (Definitions)

| คำศัพท์ | ความหมาย |
|---------|----------|
| **Suffix Array (SA)** | อาร์เรย์ของ index ที่เรียง suffix ของสตริงตามตัวอักษร |
| **LCP Array** | Longest Common Prefix ระหว่าง suffix ที่เรียงติดกันใน SA |
| **Aho-Corasick** | อัลกอริทึม multi-pattern matching ด้วย Trie + Failure Link |
| **Failure Link** | pointer ชี้ไปยัง state ที่เป็น suffix ที่ยาวที่สุดใน Trie |
| **Eertree** | Palindromic Tree — โครงสร้างเก็บ palindrome ทั้งหมด |
| **Sqrt Decomposition** | เทคนิคแบ่ง array เป็น block ขนาด √n |
| **Mo's Algorithm** | จัดลำดับ query ให้ pointer เคลื่อนที่น้อยที่สุด |
| **Centroid** | node ที่เมื่อลบออกแล้ว subtree ที่เหลือมีขนาด ≤ n/2 |
| **Heavy Path** | path ที่ไปตาม heavy child |
| **Fenwick 2D** | Fenwick Tree ที่ทำงานบน 2 มิติ |
| **Offline Query** | query ที่รู้ล่วงหน้าทั้งหมด |
| **Online Query** | query ที่ต้องตอบทันที |
| **Amortized** | เวลาเฉลี่ยต่อ operation |

---

# 1️⃣ Suffix Array + LCP

## 3.1 คืออะไร

**Suffix Array (SA)** คืออาร์เรย์ของ index ที่เรียง **suffix ทั้งหมด** ของสตริงตามลำดับตัวอักษร

**LCP Array (Longest Common Prefix)** คืออาร์เรย์ที่เก็บความยาวของ prefix ที่เหมือนกันระหว่าง suffix ที่เรียงติดกันใน SA

**ตัวอย่าง:** สตริง `"banana"`

```
Suffixes:           เรียงแล้ว:              SA:     LCP:
0: banana           5: a                    5       -
1: anana            3: ana                  3       1
2: nana             1: anana                1       3
3: ana              0: banana               0       0
4: na               4: na                   4       0
5: a                2: nana                 2       2
```

## 3.2 ทำงานอย่างไร

### การสร้าง Suffix Array

**วิธีที่ 1: Naive O(n² log n)**
- สร้าง suffix ทั้งหมด เรียงด้วย comparison sort

**วิธีที่ 2: Prefix Doubling O(n log² n)**
- เรียงตาม 1 ตัวอักษร, 2 ตัวอักษร, 4, 8, ... โดยใช้ rank

**วิธีที่ 3: SA-IS O(n)** — ซับซ้อนมาก

**วิธีที่ 4: SA ด้วย Radix Sort O(n log n)** — ที่นิยมใช้

### การสร้าง LCP Array (Kasai's Algorithm O(n))

```
lcp[i] = LCP(sa[i], sa[i-1])
ใช้คุณสมบัติ: lcp[rank[i]] ≥ lcp[rank[i-1]] - 1
```

### Applications ของ SA + LCP

| Operation | Time |
|-----------|------|
| Pattern Matching | O(m log n) |
| Longest Repeated Substring | O(n) |
| Longest Common Substring (2 strings) | O(n+m) |
| Number of Distinct Substrings | O(n) |
| k-th Smallest Substring | O(n log n) |

## 3.3 การใช้งาน

- **Pattern Matching** ในข้อความขนาดใหญ่
- **Bioinformatics** — DNA sequence alignment
- **Plagiarism Detection**
- **Data Compression** (BWT)
- **Full-Text Search**
- **Longest Common Substring** ระหว่างหลายสตริง

## 3.4 ข้อดี

- สร้างใน O(n log n) หรือ O(n)
- ใช้พื้นที่ O(n)
- Pattern matching เร็ว
- แก้ปัญหา substring ได้หลากหลาย
- ง่ายกว่า Suffix Tree

## 3.5 ข้อเสีย

- Static — สร้างใหม่ถ้า string เปลี่ยน
- สร้างซับซ้อน (โดยเฉพาะ O(n))
- LCP ต้องสร้างแยก
- ไม่ยืดหยุ่นเท่า Suffix Automaton

## 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

- **ต้อง** ต่อท้ายด้วย sentinel ($) ที่เล็กกว่าตัวอักษรทั้งหมด
- **ระวัง** ค่า rank ตอน doubling
- **ห้าม** ใช้ SA กับ string ที่เปลี่ยนบ่อย
- **ข้อจำกัด:** ต้อง preprocess
- **ต้องระวัง** memory ในกรณี string ยาวมาก

## 3.7 Workflow

```
┌─────────────────────────────────────────┐
│       SUFFIX ARRAY + LCP WORKFLOW       │
└─────────────────────────────────────────┘

    [Input: string S]
         │
         ▼
  ┌──────────────┐
  │ ต่อ sentinel │
  │ S = S + '$'  │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ สร้าง SA     │
  │ (Prefix      │
  │  Doubling)   │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ สร้าง rank   │
  │ (inverse)    │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ สร้าง LCP    │
  │ (Kasai)      │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ สร้าง Sparse │
  │ Table / RMQ  │
  │ สำหรับ LCP    │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ พร้อม Query  │
  └──────────────┘

    [Pattern Search]
         │
         ▼
  Binary search ใน SA
         │
         ▼
  ใช้ LCP ช่วยเปรียบเทียบ
         │
         ▼
  คืนช่วง [lo, hi] ของ matches
```

## 3.8 สรุป

Suffix Array + LCP เป็นเครื่องมือพื้นฐานสำหรับ string processing ที่ทรงพลัง ง่ายกว่า Suffix Tree และยืดหยุ่นกว่า Suffix Automaton ในหลายกรณี

---

## 4. ออกแบบ Workflow

```
[Input String]
      │
      ▼
[Preprocess: Append Sentinel]
      │
      ▼
[Build SA via Prefix Doubling]
      │
      ▼
[Build Rank Array]
      │
      ▼
[Build LCP via Kasai]
      │
      ▼
[Build RMQ Sparse Table]
      │
      ▼
[Query API: match / LCS / distinct]
```

## 5. Case Study: Longest Repeated Substring

**โจทย์:** หา substring ที่ซ้ำกันยาวที่สุดใน `"banana"`

**วิธีแก้:** `max(LCP[i])` = 3 → `"ana"`

## 6. โครงสร้าง

### 6.1 โครงสร้างคืออะไร
SA = array ของ index, LCP = array ของความยาว, Rank = inverse ของ SA

### 6.2 โครงสร้างทำงานอย่างไร
- SA เรียง suffix
- LCP เก็บความสัมพันธ์ระหว่าง suffix ที่ติดกัน
- Rank[i] = ตำแหน่งของ suffix i ใน SA

### 6.3 โครงสร้างการใช้งาน
| Component | ขนาด | ใช้กับ |
|-----------|------|--------|
| SA | n | Pattern search |
| Rank | n | LCP build |
| LCP | n | Longest common |
| Sparse Table | n log n | RMQ on LCP |

### 6.4 สรุป
SA + LCP + RMQ = toolkit ครบสำหรับ string query

## 7. แนวทางการประยุกต์ใช้

- **Text Editor:** ค้นหาคำในไฟล์ใหญ่
- **Search Engine:** Index ข้อความ
- **Bioinformatics:** DNA alignment
- **Plagiarism:** ตรวจสอบความคล้าย

## 8. กรณีตัวอย่างจากประสบการณ์

**ปัญหา:** ค้นหา 1,000 patterns ใน text 100MB
- **Naive:** O(1000 × 100M) = 10¹¹ operations → ช้ามาก
- **SA + Binary Search:** O(100M log 100M) preprocess + O(1000 × m log n) query → เร็วมาก

## 9. การนำไปใช้งานจริง

**Python Implementation:**

```python
def build_suffix_array(s):
    """สร้าง Suffix Array ด้วย Prefix Doubling O(n log² n)"""
    s += '$'
    n = len(s)
    sa = list(range(n))
    rank = list(map(ord, s))
    k = 1
    
    while k < n:
        sa.sort(key=lambda i: (rank[i], rank[i + k] if i + k < n else -1))
        new_rank = [0] * n
        for i in range(1, n):
            prev, curr = sa[i-1], sa[i]
            prev_key = (rank[prev], rank[prev + k] if prev + k < n else -1)
            curr_key = (rank[curr], rank[curr + k] if curr + k < n else -1)
            new_rank[curr] = new_rank[prev] + (prev_key != curr_key)
        rank = new_rank
        k *= 2
        if rank[sa[-1]] == n - 1:
            break
    
    return sa, rank

def build_lcp(s, sa, rank):
    """สร้าง LCP Array ด้วย Kasai's Algorithm O(n)"""
    n = len(s)
    lcp = [0] * n
    h = 0
    for i in range(n):
        if rank[i] > 0:
            j = sa[rank[i] - 1]
            while i + h < n and j + h < n and s[i + h] == s[j + h]:
                h += 1
            lcp[rank[i]] = h
            if h > 0:
                h -= 1
    return lcp

def search_pattern(s, sa, pattern):
    """ค้นหา pattern ใน s ด้วย binary search"""
    n = len(s)
    lo, hi = 0, n - 1
    while lo <= hi:
        mid = (lo + hi) // 2
        suffix = s[sa[mid]:sa[mid] + len(pattern)]
        if suffix == pattern:
            # หาช่วงทั้งหมด
            start = mid
            while start > 0 and s[sa[start-1]:sa[start-1] + len(pattern)] == pattern:
                start -= 1
            end = mid
            while end < n - 1 and s[sa[end+1]:sa[end+1] + len(pattern)] == pattern:
                end += 1
            return [sa[i] for i in range(start, end + 1)]
        elif suffix < pattern:
            lo = mid + 1
        else:
            hi = mid - 1
    return []

# ทดสอบ
s = "banana"
sa, rank = build_suffix_array(s)
lcp = build_lcp(s + '$', sa, rank)

print("SA:", sa)
print("LCP:", lcp)
print("Search 'ana':", search_pattern(s + '$', sa, "ana"))

# Longest Repeated Substring
max_lcp = max(lcp)
idx = lcp.index(max_lcp)
print(f"Longest Repeated Substring: '{s[sa[idx]:sa[idx]+max_lcp]}'")
```

## 10. ปัญหาและแนวทางแก้ไข

| ปัญหา | แนวทางแก้ไข |
|-------|-------------|
| SA ช้า | ใช้ SA-IS O(n) |
| Memory สูง | ใช้ Suffix Automaton |
| Dynamic string | ใช้ Suffix Automaton / Rope |
| Pattern matching ซ้ำ | Cache ผลลัพธ์ |

---

# 2️⃣ Aho-Corasick

## 3.1 คืออะไร

**Aho-Corasick** คืออัลกอริทึม **Multi-Pattern Matching** ที่หา pattern หลายตัวในข้อความเดียวพร้อมกันในเวลา **O(n + m + z)** เมื่อ n = ความยาว text, m = ผลรวมความยาว patterns, z = จำนวน matches

คิดค้นโดย Alfred Aho และ Margaret Corasick ในปี ค.ศ. 1975

## 3.2 ทำงานอย่างไร

### โครงสร้าง: Trie + Failure Link

1. **สร้าง Trie** จาก patterns ทั้งหมด
2. **สร้าง Failure Link** ด้วย BFS — ชี้ไปยัง state ที่เป็น suffix ที่ยาวที่สุด
3. **Output Link** — เก็บ patterns ที่ match

### ตัวอย่าง: patterns = {"he", "she", "his", "hers"}

```
Trie:
        root
       / | \
      h  s  (other)
      |  |
      e  h
      |  |
     (he) i
         |
        (his)
       
Failure Links:
- "he" → "e" → root
- "she" → "he" 
- "his" → "is" → "s" → root
```

## 3.3 การใช้งาน

- **Antivirus** — สแกน signature หลายตัว
- **IDS/IPS** — ตรวจจับ pattern การโจมตี
- **Text Editor** — Highlight หลายคำ
- **Bioinformatics** — หา motif หลายตัว
- **Spam Filter** — ตรวจจับคำต้องห้าม
- **Search Engine** — Query หลายคำ

## 3.4 ข้อดี

- Multi-pattern matching เร็ว O(n + m + z)
- สร้างครั้งเดียว ใช้ได้ตลอด
- ใช้พื้นที่ O(m × σ) หรือ O(m)
- Linear time

## 3.5 ข้อเสีย

- สร้างซับซ้อน
- ต้องรู้ patterns ล่วงหน้า
- ใช้ memory ถ้า alphabet ใหญ่
- ไม่รองรับ pattern ที่เปลี่ยนบ่อย

## 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

- **ต้อง** สร้าง failure link ให้ถูกต้อง
- **ระวัง** output link (pattern ที่ match ผ่าน failure)
- **ห้าม** ใช้ถ้า patterns เปลี่ยนทุก query
- **ข้อจำกัด:** static patterns
- **ต้องระวัง** memory เมื่อ patterns เยอะ

## 3.7 Workflow

```
┌─────────────────────────────────────────┐
│       AHO-CORASICK WORKFLOW             │
└─────────────────────────────────────────┘

    [Build Phase]
         │
         ▼
  ┌──────────────┐
  │ สร้าง Trie   │
  │ จาก patterns │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ BFS หา       │
  │ failure link │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ สร้าง output │
  │ link         │
  └──────┬───────┘
         │
         ▼
    [Search Phase]
         │
         ▼
  ┌──────────────┐
  │ เริ่มที่ root│
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ สำหรับแต่ละ │
  │ ตัวอักษร c   │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ ตาม trans    │
  │ ถ้าไม่มี →   │
  │ ตาม failure  │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ เก็บ matches │
  │ จาก output   │
  └──────┬───────┘
         │
         └──▶ วนซ้ำ
```

## 3.8 สรุป

Aho-Corasick เป็นเครื่องมือมาตรฐานสำหรับ multi-pattern matching ใช้ใน production หลายระบบ เช่น antivirus, IDS

---

## 4. ออกแบบ Workflow

```
Patterns → Trie → BFS Failure Links → Output Links → Ready
                                                        │
Text ──────────────────────────────────────────────────►│
                                                        ▼
                                            Traverse & Collect Matches
```

## 5. Case Study: Antivirus Signature Scanning

**โจทย์:** สแกนไฟล์ 1GB หา 10,000 signatures
- **Naive:** O(1G × 10K) = 10¹³ → เป็นไปไม่ได้
- **Aho-Corasick:** O(1G + m + z) → เร็วมาก

## 6. โครงสร้าง

### 6.1 โครงสร้างคืออะไร
- Node ใน Trie: children, fail, output
- BFS สร้าง failure links
- Output link ชี้ pattern ที่ match

### 6.2 โครงสร้างทำงานอย่างไร
- Failure link = longest proper suffix ที่อยู่ใน Trie
- Output link = pattern ที่ match ผ่าน failure chain

### 6.3 โครงสร้างการใช้งาน
| Component | ใช้กับ |
|-----------|--------|
| Trie | เก็บ patterns |
| Failure Link | Fallback เมื่อ trans ไม่มี |
| Output Link | เก็บ patterns ที่ match |

### 6.4 สรุป
Aho-Corasick = Trie + Failure Link + Output Link

## 7. แนวทางการประยุกต์ใช้

- **Security:** IDS, Antivirus, WAF
- **Text:** Highlight, Search
- **Bio:** Motif finding
- **NLP:** Keyword extraction

## 8. กรณีตัวอย่างจากประสบการณ์

**ปัญหา:** บล็อกคำต้องห้าม 5,000 คำใน chat
- **Naive:** ตรวจทีละคำ → ช้า
- **Aho-Corasick:** สร้างครั้งเดียว ตรวจ O(n) → เร็ว

## 9. การนำไปใช้งานจริง

```python
from collections import deque

class AhoCorasick:
    def __init__(self):
        self.goto = [{}]        # transitions
        self.fail = [0]         # failure links
        self.output = [[]]      # output patterns
    
    def add_pattern(self, pattern):
        node = 0
        for ch in pattern:
            if ch not in self.goto[node]:
                self.goto[node][ch] = len(self.goto)
                self.goto.append({})
                self.fail.append(0)
                self.output.append([])
            node = self.goto[node][ch]
        self.output[node].append(pattern)
    
    def build(self):
        """สร้าง failure links ด้วย BFS"""
        queue = deque()
        # Initialize: ลูกของ root → fail = root
        for ch, nxt in self.goto[0].items():
            queue.append(nxt)
            self.fail[nxt] = 0
        
        while queue:
            node = queue.popleft()
            for ch, nxt in self.goto[node].items():
                # หา fail ของ nxt
                f = self.fail[node]
                while f != 0 and ch not in self.goto[f]:
                    f = self.fail[f]
                if ch in self.goto[f] and self.goto[f][ch] != nxt:
                    self.fail[nxt] = self.goto[f][ch]
                else:
                    self.fail[nxt] = 0
                
                # Output link: รวม output จาก fail
                self.output[nxt].extend(self.output[self.fail[nxt]])
                queue.append(nxt)
    
    def search(self, text):
        """หา patterns ทั้งหมดใน text"""
        node = 0
        matches = []
        for i, ch in enumerate(text):
            while node != 0 and ch not in self.goto[node]:
                node = self.fail[node]
            if ch in self.goto[node]:
                node = self.goto[node][ch]
            else:
                node = 0
            
            # เก็บ matches
            for pattern in self.output[node]:
                matches.append((i - len(pattern) + 1, pattern))
        
        return matches

# ทดสอบ
ac = AhoCorasick()
for p in ["he", "she", "his", "hers"]:
    ac.add_pattern(p)
ac.build()

text = "ushers"
print(ac.search(text))
# [(1, 'she'), (2, 'he'), (2, 'hers')]
```

## 10. ปัญหาและแนวทางแก้ไข

| ปัญหา | แนวทางแก้ไข |
|-------|-------------|
| Memory สูง | ใช้ array-based Trie |
| Patterns เยอะ | Compress Trie (DAWG) |
| Unicode | ใช้ dict แทน array |
| Dynamic patterns | Rebuild หรือใช้ Suffix Automaton |

---

# 3️⃣ Palindromic Tree (Eertree)

## 3.1 คืออะไร

**Palindromic Tree** หรือ **Eertree** คือโครงสร้างข้อมูลที่เก็บ **palindrome ทั้งหมด** ของสตริง โดยแต่ละ node แทน palindrome ที่แตกต่างกัน ใช้พื้นที่ O(n) และสร้างใน O(n)

คิดค้นโดย Mikhail Rubinchik และ Arseny Shur ในปี ค.ศ. 2014

## 3.2 ทำงานอย่างไร

### โครงสร้าง: 2 Root

- **Root -1:** แทน palindrome ว่างที่มีความยาว -1 (ใช้กับ palindrome ความยาว 1)
- **Root 0:** แทน palindrome ว่างที่มีความยาว 0
- **Suffix Link:** ชี้ไป palindrome ที่เป็น suffix ที่ยาวที่สุด

### คุณสมบัติ
- จำนวน node ≤ n + 2
- สร้างใน O(n) amortized
- แต่ละ node เก็บ: len, link, next[]

### ตัวอย่าง: "abba"

```
Nodes:
- root1 (len=-1)
- root2 (len=0)
- "a" (len=1, link=root2)
- "b" (len=1, link=root2)
- "bb" (len=2, link=root2)
- "abba" (len=4, link="a")

จำนวน distinct palindromes = 4
```

## 3.3 การใช้งาน

- **นับ Distinct Palindromes**
- **นับ Palindromic Substrings**
- **Longest Palindromic Substring**
- **Palindromic Factorization**
- **Bioinformatics** — DNA palindrome

## 3.4 ข้อดี

- สร้างใน O(n)
- ใช้พื้นที่ O(n)
- เก็บ palindrome ทั้งหมด
- ใช้แก้ปัญหา palindrome ได้หลากหลาย
- โค้ดสั้นกว่า Manacher

## 3.5 ข้อเสีย

- เข้าใจยาก
- ต้องเข้าใจ suffix link
- Static — สร้างใหม่ถ้าเปลี่ยน
- Debug ยาก

## 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

- **ต้อง** ใช้ 2 root (-1, 0)
- **ระวัง** การคำนวณ suffix link กับ root -1
- **ห้าม** ใช้กับ dynamic string
- **ข้อจำกัด:** ต้อง preprocess
- **ต้องระวัง** alphabet size

## 3.7 Workflow

```
┌─────────────────────────────────────────┐
│          EERTREE WORKFLOW               │
└─────────────────────────────────────────┘

    [Build]
         │
         ▼
  ┌──────────────┐
  │ สร้าง root   │
  │ -1 และ 0     │
  │ link ชี้กัน  │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ last = root0 │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ สำหรับแต่ละ │
  │ ตัวอักษร c   │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ หา suffix    │
  │ palindrome ที่│
  │ ต่อ c ได้     │
  └──────┬───────┘
         │
    ┌────┴────┐
    │         │
   มี       ไม่มี
    │         │
    ▼         ▼
  ใช้       สร้าง node
  node      ใหม่ + link
    │         │
    └────┬────┘
         ▼
  ┌──────────────┐
  │ last = node  │
  │ ใหม่          │
  └──────────────┘
```

## 3.8 สรุป

Eertree เป็นโครงสร้างที่สวยงามสำหรับ palindrome ใช้ O(n) ทั้งเวลาและพื้นที่ แก้ปัญหา palindrome ได้หลากหลาย

---

## 4. ออกแบบ Workflow

```
String → 2 Roots → Process each char → Find longest suffix palindrome
                                          → Create node if new
                                          → Update suffix link
                                       → Count distinct palindromes
```

## 5. Case Study: นับ Distinct Palindromes

**โจทย์:** นับ distinct palindromes ใน `"abba"`
- **Naive:** O(n³) หรือ O(n²) ด้วย set
- **Eertree:** O(n)

## 6. โครงสร้าง

### 6.1 โครงสร้างคืออะไร
- Node: len, link, next[]
- Root -1, Root 0
- last pointer

### 6.2 โครงสร้างทำงานอย่างไร
- แต่ละ node = palindrome 1 ตัว
- link = suffix palindrome ที่ยาวสุด
- next[c] = palindrome ที่ต่อ c ทั้งสองข้าง

### 6.3 โครงสร้างการใช้งาน
| Field | ความหมาย |
|-------|----------|
| len | ความยาว palindrome |
| link | suffix link |
| next | transition |

### 6.4 สรุป
Eertree = Trie ของ palindromes

## 7. แนวทางการประยุกต์ใช้

- **Bio:** DNA palindrome
- **Text:** Palindrome detection
- **String:** Palindromic factorization
- **Competitive:** Palindromic queries

## 8. กรณีตัวอย่างจากประสบการณ์

**ปัญหา:** หา longest palindromic substring
- **Naive:** O(n²)
- **Manacher:** O(n) แต่ไม่ยืดหยุ่น
- **Eertree:** O(n) + ยืดหยุ่น

## 9. การนำไปใช้งานจริง

```python
class Eertree:
    def __init__(self, s):
        self.s = s
        self.n = len(s)
        # node 0 = root -1, node 1 = root 0
        self.len = [-1, 0]
        self.link = [0, 0]
        self.next = [{} for _ in range(2)]
        self.last = 1
        self.num_nodes = 2
    
    def _get_link(self, v):
        """หา suffix link ที่ต่อ s[i] ได้"""
        while True:
            cur_len = self.len[v]
            if self.i - cur_len - 1 >= 0 and \
               self.s[self.i - cur_len - 1] == self.s[self.i]:
                return v
            v = self.link[v]
    
    def add_char(self, i):
        self.i = i
        c = self.s[i]
        
        # หา node ที่ต่อ c ได้
        cur = self._get_link(self.last)
        
        if c in self.next[cur]:
            self.last = self.next[cur][c]
            return False  # ไม่ใช่ palindrome ใหม่
        
        # สร้าง node ใหม่
        self.num_nodes += 1
        new_node = self.num_nodes - 1
        self.len.append(self.len[cur] + 2)
        self.next.append({})
        self.next[cur][c] = new_node
        
        # หา suffix link
        if self.len[new_node] == 1:
            self.link.append(1)  # ชี้ root 0
        else:
            link_candidate = self._get_link(self.link[cur])
            if c in self.next[link_candidate]:
                self.link.append(self.next[link_candidate][c])
            else:
                self.link.append(1)
        
        self.last = new_node
        return True
    
    def build(self):
        for i in range(self.n):
            self.add_char(i)
        return self.num_nodes - 2  # ลบ 2 root

# ทดสอบ
eertree = Eertree("abba")
print("Distinct palindromes:", eertree.build())  # 4 (a, b, bb, abba)

eertree2 = Eertree("abab")
print("Distinct palindromes:", eertree2.build())  # 4 (a, b, aba, bab)
```

## 10. ปัญหาและแนวทางแก้ไข

| ปัญหา | แนวทางแก้ไข |
|-------|-------------|
| เข้าใจยาก | ศึกษาทีละขั้น |
| Memory สูง | ใช้ array แทน dict |
| Dynamic string | สร้างใหม่ |
| Unicode | ใช้ dict |

---

# 4️⃣ Sqrt Decomposition

## 3.1 คืออะไร

**Sqrt Decomposition** คือเทคนิคแบ่ง array ออกเป็น **block ขนาด √n** เพื่อให้ Range Query และ Update เร็วขึ้นใน O(√n) แทน O(n)

## 3.2 ทำงานอย่างไร

### หลักการ

1. แบ่ง array เป็น block ขนาด b = √n
2. แต่ละ block เก็บ aggregate (sum, min, max)
3. Query: รวม block ที่เต็ม + element ขอบ
4. Update: อัปเดต element + block aggregate

### ตัวอย่าง: array [1, 3, 5, 7, 9, 11, 13, 15]

```
Block size = √8 ≈ 3

Block 0: [1, 3, 5]     sum = 9
Block 1: [7, 9, 11]    sum = 27
Block 2: [13, 15]      sum = 28

Query [2, 6]:
- Element 2 (block 0): 5
- Block 1: 27
- Element 5, 6 (block 2): 13 + 15 = 28
- Total: 5 + 27 + 28 = 60
```

## 3.3 การใช้งาน

- **Range Sum / Min / Max**
- **Range Update + Range Query**
- **Competitive Programming**
- **Database Query**
- **Time Series**

## 3.4 ข้อดี

- โค้ดสั้น เข้าใจง่าย
- ยืดหยุ่น
- ใช้พื้นที่ O(n)
- เร็วกว่า naive

## 3.5 ข้อเสีย

- ช้ากว่า Segment Tree O(√n) vs O(log n)
- ไม่เหมาะกับข้อมูลใหญ่
- ต้อง tune block size

## 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

- **ต้อง** tune block size (~√n)
- **ระวัง** ขอบ block
- **ห้าม** ใช้กับ n ใหญ่มาก
- **ข้อจำกัด:** O(√n) ต่อ query
- **ต้องระวัง** overflow

## 3.7 Workflow

```
┌─────────────────────────────────────────┐
│       SQRT DECOMPOSITION WORKFLOW       │
└─────────────────────────────────────────┘

    [Build]
         │
         ▼
  ┌──────────────┐
  │ b = √n       │
  │ แบ่ง block   │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ คำนวณ        │
  │ aggregate    │
  │ ต่อ block    │
  └──────────────┘

    [Query(l, r)]
         │
         ▼
  ┌──────────────┐
  │ ถ้า l, r อยู่ │
  │ block เดียว → │
  │ scan ตรง      │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ ไม่งั้น:      │
  │ - scan ขอบ   │
  │ - รวม block  │
  │   ที่เต็ม     │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ คืนผลรวม     │
  └──────────────┘

    [Update(i, val)]
         │
         ▼
  ┌──────────────┐
  │ arr[i] = val │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ อัปเดต       │
  │ block[i/b]   │
  └──────────────┘
```

## 3.8 สรุป

Sqrt Decomposition เป็นเทคนิคพื้นฐานแต่ทรงพลัง เหมาะกับงานที่ไม่ต้องการ O(log n) จริงๆ

---

## 4. ออกแบบ Workflow

```
Array → Blocks of size √n → Compute aggregates
                              │
Query(l, r) ──────────────────┤
                              ▼
              Partial blocks + Full blocks
                              │
                              ▼
                          Aggregate
```

## 5. Case Study: Range Sum + Point Update

**โจทย์:** Array 10⁵ elements, 10⁵ queries
- **Naive:** O(n) ต่อ query → 10¹⁰ → ช้า
- **Sqrt:** O(√n) ต่อ query → 3×10⁷ → เร็ว

## 6. โครงสร้าง

### 6.1 โครงสร้างคืออะไร
Array + Block aggregate array

### 6.2 โครงสร้างทำงานอย่างไร
- Block size = √n
- แต่ละ block เก็บ sum/min/max
- Query: partial + full blocks

### 6.3 โครงสร้างการใช้งาน
| Component | ขนาด |
|-----------|------|
| arr | n |
| block_agg | n/b = √n |

### 6.4 สรุป
Sqrt Decomposition = trade-off ระหว่าง simplicity และ performance

## 7. แนวทางการประยุกต์ใช้

- **Range Query** — sum, min, max
- **Range Update** — lazy ใน block
- **Offline Query** — รวมกับ Mo's
- **Time Series** — sliding window

## 8. กรณีตัวอย่างจากประสบการณ์

**ปัญหา:** Dashboard แสดง sum ของ metric ในช่วงเวลาต่างๆ
- **ใช้ Sqrt Decomposition:** O(√n) ต่อ query → real-time

## 9. การนำไปใช้งานจริง

```python
import math

class SqrtDecomposition:
    def __init__(self, arr):
        self.n = len(arr)
        self.arr = arr[:]
        self.b = int(math.sqrt(self.n)) + 1
        self.num_blocks = (self.n + self.b - 1) // self.b
        self.block_sum = [0] * self.num_blocks
        
        for i in range(self.n):
            self.block_sum[i // self.b] += arr[i]
    
    def update(self, i, val):
        """อัปเดต arr[i] = val"""
        block = i // self.b
        self.block_sum[block] += val - self.arr[i]
        self.arr[i] = val
    
    def query(self, l, r):
        """ผลรวม [l, r]"""
        total = 0
        bl, br = l // self.b, r // self.b
        
        if bl == br:
            for i in range(l, r + 1):
                total += self.arr[i]
        else:
            # ขอบซ้าย
            for i in range(l, (bl + 1) * self.b):
                total += self.arr[i]
            # block ที่เต็ม
            for b in range(bl + 1, br):
                total += self.block_sum[b]
            # ขอบขวา
            for i in range(br * self.b, r + 1):
                total += self.arr[i]
        
        return total

# ทดสอบ
arr = [1, 3, 5, 7, 9, 11, 13, 15]
sd = SqrtDecomposition(arr)
print("Sum [2,6]:", sd.query(2, 6))  # 5+7+9+11+13 = 45
sd.update(3, 100)
print("Sum [2,6] after update:", sd.query(2, 6))  # 5+100+9+11+13 = 138
```

## 10. ปัญหาและแนวทางแก้ไข

| ปัญหา | แนวทางแก้ไข |
|-------|-------------|
| ช้ากว่า Segment Tree | ใช้ Segment Tree ถ้าต้องการ O(log n) |
| Block size ไม่ optimal | tune b = √n |
| Range Update | ใช้ lazy ใน block |

---

# 5️⃣ Mo's Algorithm

## 3.1 คืออะไร

**Mo's Algorithm** คือเทคนิคจัดลำดับ **offline range queries** ให้ pointer เคลื่อนที่น้อยที่สุด ทำให้เวลาเฉลี่ยต่อ query เป็น O(√n) แทน O(n)

คิดค้นโดย Mo Tao ในปี ค.ศ. 2009

## 3.2 ทำงานอย่างไร

### หลักการ

1. แบ่ง array เป็น block ขนาด √n
2. เรียง query ตาม: block ของ l, แล้วตาม r (สลับทิศ)
3. ใช้ 2 pointer เคลื่อนที่
4. เพิ่ม/ลบ element ทีละตัว

### Sorting
```
Sort by (l // √n, r * (-1 if (l//√n) % 2 else 1))
```

## 3.3 การใช้งาน

- **Range Query** ที่ merge ได้ (sum, count)
- **Distinct Elements** ใน range
- **Mode** ของ range
- **Frequency Queries**
- **Competitive Programming**

## 3.4 ข้อดี

- เร็ว O((n + q)√n)
- โค้ดสั้น
- ยืดหยุ่น
- ใช้ได้กับ query หลายแบบ

## 3.5 ข้อเสีย

- Offline เท่านั้น
- ไม่เหมาะกับ update
- ต้อง tune block size

## 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

- **ต้อง** เรียง query ให้ถูก
- **ห้าม** ใช้กับ online query
- **ระวัง** add/remove function
- **ข้อจำกัด:** offline
- **ต้องระวัง** overflow

## 3.7 Workflow

```
┌─────────────────────────────────────────┐
│         MO'S ALGORITHM WORKFLOW         │
└─────────────────────────────────────────┘

    [Input: queries]
         │
         ▼
  ┌──────────────┐
  │ เรียง query  │
  │ ตาม block   │
  │ ของ l       │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ เริ่ม L=0,   │
  │ R=-1        │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ สำหรับแต่ละ │
  │ query (l, r) │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ ขยับ L, R   │
  │ ให้ตรง       │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ add/remove   │
  │ element      │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ เก็บคำตอบ   │
  └──────────────┘
```

## 3.8 สรุป

Mo's Algorithm เป็นเทคนิคที่เรียบง่ายแต่ทรงพลังสำหรับ offline range query

---

## 4. ออกแบบ Workflow

```
Queries → Sort by (block(l), r) → 2 Pointers → add/remove → Answer
```

## 5. Case Study: นับ Distinct Elements

**โจทย์:** Array 10⁵, 10⁵ queries ถาม distinct elements ใน [l, r]
- **Naive:** O(n) ต่อ query → 10¹⁰
- **Mo's:** O((n+q)√n) → 3×10⁷

## 6. โครงสร้าง

### 6.1 โครงสร้างคืออะไร
- Sorted queries
- 2 pointers L, R
- Frequency array
- Current answer

### 6.2 โครงสร้างทำงานอย่างไร
- เรียง query ให้ pointer เคลื่อนที่น้อย
- add/remove element
- เก็บคำตอบใน array

### 6.3 โครงสร้างการใช้งาน
| Component | ใช้กับ |
|-----------|--------|
| Sorted queries | ลด pointer movement |
| freq array | นับ frequency |
| current answer | incremental |

### 6.4 สรุป
Mo's = offline + sort + 2 pointers

## 7. แนวทางการประยุกต์ใช้

- **Distinct count**
- **Mode**
- **Frequency**
- **Range sum**
- **Mo's with update** (3D)

## 8. กรณีตัวอย่างจากประสบการณ์

**ปัญหา:** วิเคราะห์ log 10⁶ entries, ตอบ 10⁵ queries
- **Mo's:** ทำงานได้ใน < 1 วินาที

## 9. การนำไปใช้งานจริง

```python
import math

def mo_algorithm(arr, queries):
    """ตอบ query นับ distinct elements"""
    n = len(arr)
    q = len(queries)
    block_size = int(math.sqrt(n)) + 1
    
    # เรียง query
    indexed_queries = [(l, r, i) for i, (l, r) in enumerate(queries)]
    indexed_queries.sort(key=lambda x: (
        x[0] // block_size,
        x[1] if (x[0] // block_size) % 2 == 0 else -x[1]
    ))
    
    # State
    freq = {}
    distinct = 0
    answers = [0] * q
    cur_l, cur_r = 0, -1
    
    def add(idx):
        nonlocal distinct
        v = arr[idx]
        freq[v] = freq.get(v, 0) + 1
        if freq[v] == 1:
            distinct += 1
    
    def remove(idx):
        nonlocal distinct
        v = arr[idx]
        freq[v] -= 1
        if freq[v] == 0:
            distinct -= 1
    
    for l, r, i in indexed_queries:
        while cur_r < r:
            cur_r += 1
            add(cur_r)
        while cur_r > r:
            remove(cur_r)
            cur_r -= 1
        while cur_l < l:
            remove(cur_l)
            cur_l += 1
        while cur_l > l:
            cur_l -= 1
            add(cur_l)
        answers[i] = distinct
    
    return answers

# ทดสอบ
arr = [1, 2, 1, 3, 2, 4, 5, 1]
queries = [(0, 3), (1, 5), (2, 7), (0, 7)]
print(mo_algorithm(arr, queries))
# [2, 3, 4, 5]
```

## 10. ปัญหาและแนวทางแก้ไข

| ปัญหา | แนวทางแก้ไข |
|-------|-------------|
| Update | Mo's with update (3D) |
| Online | Persistent / Segment Tree |
| Block size | tune = n/√q |
| Add/Remove ซับซ้อน | ใช้ rollback Mo's |

---

# 6️⃣ Centroid Decomposition

## 3.1 คืออะไร

**Centroid Decomposition** คือเทคนิคแบ่ง tree ออกเป็นชั้นๆ โดยเลือก **centroid** (node ที่เมื่อลบแล้ว subtree ที่เหลือ ≤ n/2) เป็น root ของแต่ละชั้น ทำให้ความลึก ≤ O(log n)

## 3.2 ทำงานอย่างไร

### หลักการ

1. หา centroid ของ tree
2. ลบ centroid ออก
3. ทำซ้ำกับ subtree ที่เหลือ
4. ได้ centroid tree ที่ลึก ≤ log n

### การหา Centroid

```python
def find_centroid(node, parent, n):
    size = 1
    max_subtree = 0
    for child in adj[node]:
        if child != parent and not removed[child]:
            child_size = dfs_size(child, node)
            size += child_size
            max_subtree = max(max_subtree, child_size)
    max_subtree = max(max_subtree, n - size)
    if max_subtree <= n // 2:
        return node
    ...
```

## 3.3 การใช้งาน

- **Path Query** บน tree
- **Distance Queries**
- **Count Paths with Property**
- **Tree DP** ที่ซับซ้อน
- **Competitive Programming**

## 3.4 ข้อดี

- ความลึก O(log n)
- Path query เร็ว
- ใช้แก้ปัญหาที่ Segment Tree ทำไม่ได้
- Static tree

## 3.5 ข้อเสีย

- โค้ดยาว
- เข้าใจยาก
- ต้อง preprocess
- Debug ยาก

## 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

- **ต้อง** หา centroid ให้ถูก
- **ระวัง** recursion depth
- **ห้าม** ใช้กับ dynamic tree
- **ข้อจำกัด:** static
- **ต้องระวัง** การ mark removed

## 3.7 Workflow

```
┌─────────────────────────────────────────┐
│     CENTROID DECOMPOSITION WORKFLOW     │
└─────────────────────────────────────────┘

    [Start]
       │
       ▼
  ┌──────────────┐
  │ หา centroid  │
  │ ของ tree     │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ mark removed │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ สำหรับแต่ละ │
  │ subtree      │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ recursive    │
  │ หา centroid  │
  └──────┬───────┘
         │
         └──▶ วนซ้ำ

    [Query(u, v)]
       │
       ▼
  ┌──────────────┐
  │ ใช้ LCA ใน   │
  │ centroid tree│
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ รวมคำตอบจาก  │
  │ ทุก centroid │
  └──────────────┘
```

## 3.8 สรุป

Centroid Decomposition เป็นเทคนิคสำคัญสำหรับ path query บน tree ที่ Segment Tree ทำไม่ได้

---

## 4. ออกแบบ Workflow

```
Tree → Find Centroid → Mark Removed → Recurse on Subtrees
                                          │
                                          ▼
                                    Centroid Tree
                                          │
Query(u, v) ──────────────────────────────┤
                                          ▼
                              Traverse centroid ancestors
```

## 5. Case Study: Count Paths with Length ≤ K

**โจทย์:** นับ path ใน tree ที่ length ≤ K
- **Naive:** O(n²)
- **Centroid:** O(n log n)

## 6. โครงสร้าง

### 6.1 โครงสร้างคืออะไร
- Centroid tree (depth ≤ log n)
- removed array
- size array

### 6.2 โครงสร้างทำงานอย่างไร
- Centroid = node ที่แบ่ง tree สมดุล
- Recursive สร้าง centroid tree
- Query ผ่าน centroid ancestors

### 6.3 โครงสร้างการใช้งาน
| Component | ใช้กับ |
|-----------|--------|
| Centroid tree | Path query |
| removed | Mark ลบ |
| size | หา centroid |

### 6.4 สรุป
Centroid Decomposition = divide & conquer บน tree

## 7. แนวทางการประยุกต์ใช้

- **Distance queries**
- **Path counting**
- **Tree DP**
- **Nearest node queries**

## 8. กรณีตัวอย่างจากประสบการณ์

**ปัญหา:** Network analysis — หา path สั้นสุดระหว่าง nodes
- **Centroid:** O(n log n) preprocess + O(log n) query

## 9. การนำไปใช้งานจริง

```python
import sys
sys.setrecursionlimit(300000)

class CentroidDecomposition:
    def __init__(self, n):
        self.n = n
        self.adj = [[] for _ in range(n)]
        self.removed = [False] * n
        self.size = [0] * n
        self.centroid_parent = [-1] * n
    
    def add_edge(self, u, v):
        self.adj[u].append(v)
        self.adj[v].append(u)
    
    def _dfs_size(self, u, p):
        self.size[u] = 1
        for v in self.adj[u]:
            if v != p and not self.removed[v]:
                self._dfs_size(v, u)
                self.size[u] += self.size[v]
    
    def _find_centroid(self, u, p, n):
        for v in self.adj[u]:
            if v != p and not self.removed[v] and self.size[v] > n // 2:
                return self._find_centroid(v, u, n)
        return u
    
    def _decompose(self, entry, parent):
        self._dfs_size(entry, -1)
        c = self._find_centroid(entry, -1, self.size[entry])
        self.centroid_parent[c] = parent
        self.removed[c] = True
        
        for v in self.adj[c]:
            if not self.removed[v]:
                self._decompose(v, c)
        
        return c
    
    def build(self):
        return self._decompose(0, -1)

# ทดสอบ
cd = CentroidDecomposition(7)
edges = [(0,1), (0,2), (1,3), (1,4), (2,5), (2,6)]
for u, v in edges:
    cd.add_edge(u, v)

root = cd.build()
print("Centroid root:", root)
print("Centroid parents:", cd.centroid_parent)
```

## 10. ปัญหาและแนวทางแก้ไข

| ปัญหา | แนวทางแก้ไข |
|-------|-------------|
| Recursion depth | เพิ่ม limit / iterative |
| ซับซ้อน | ศึกษาทีละขั้น |
| Memory | ใช้ array |

---

# 7️⃣ Heavy-Light Decomposition + Segment Tree (รวม)

## 3.1 คืออะไร

**HLD + Segment Tree** คือการรวม **Heavy-Light Decomposition** กับ **Segment Tree** เพื่อ query **path ระหว่าง 2 node** บน tree ใน O(log² n) พร้อม update

## 3.2 ทำงานอย่างไร

### ขั้นตอน

1. **DFS ครั้ง 1:** หา size, parent, depth, heavy child
2. **DFS ครั้ง 2:** แบ่ง heavy path, assign position (pos[])
3. **สร้าง Segment Tree** บน array ตาม pos
4. **Query(u, v):** ไล่ heavy path จากล่างขึ้นบน

### Path Query

```
while head[u] != head[v]:
    if depth[head[u]] < depth[head[v]]:
        swap(u, v)
    query segment tree [pos[head[u]], pos[u]]
    u = parent[head[u]]
# ตอนนี้อยู่ heavy path เดียวกัน
query [min(pos[u], pos[v]), max(pos[u], pos[v])]
```

## 3.3 การใช้งาน

- **Path Sum / Max / Min** บน tree
- **Path Update**
- **LCA**
- **Subtree Query**
- **Competitive Programming**

## 3.4 ข้อดี

- Path query O(log² n)
- Update O(log² n)
- ใช้ Segment Tree ร่วม
- Static tree

## 3.5 ข้อเสีย

- โค้ดยาว
- ต้อง preprocess
- Debug ยาก
- Static

## 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

- **ต้อง** preprocess ให้ถูก
- **ระวัง** recursion depth
- **ห้าม** ใช้กับ dynamic tree
- **ข้อจำกัด:** static
- **ต้องระวัง** indexing (0 vs 1)

## 3.7 Workflow

```
┌─────────────────────────────────────────┐
│      HLD + SEGMENT TREE WORKFLOW        │
└─────────────────────────────────────────┘

    [Preprocess]
         │
         ▼
  ┌──────────────┐
  │ DFS 1:       │
  │ size, parent │
  │ depth, heavy │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ DFS 2:       │
  │ assign pos,  │
  │ head         │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ Build Segment│
  │ Tree on pos  │
  └──────┬───────┘
         │
         ▼
    [Query(u, v)]
         │
         ▼
  ┌──────────────┐
  │ while        │
  │ head[u] !=   │
  │ head[v]:     │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ query path   │
  │ บน segment   │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ u = parent   │
  │ [head[u]]    │
  └──────┬───────┘
         │
         └──▶ วนซ้ำ
         │
         ▼
  ┌──────────────┐
  │ query ส่วน   │
  │ สุดท้าย      │
  └──────────────┘
```

## 3.8 สรุป

HLD + Segment Tree เป็น combo มาตรฐานสำหรับ path query บน tree

---

## 4. ออกแบบ Workflow

```
Tree → DFS 1 (size, heavy) → DFS 2 (pos, head) → Segment Tree
                                                       │
Query(u, v) ───────────────────────────────────────────┤
                                                       ▼
                                          Path Query via heavy paths
```

## 5. Case Study: Path Sum บน Tree

**โจทย์:** Tree 10⁵ nodes, 10⁵ queries ถาม sum บน path
- **Naive:** O(n) ต่อ query → 10¹⁰
- **HLD + SegTree:** O(log² n) ต่อ query → 10⁷

## 6. โครงสร้าง

### 6.1 โครงสร้างคืออะไร
- size, parent, depth, heavy
- head, pos
- Segment Tree

### 6.2 โครงสร้างทำงานอย่างไร
- DFS 1 หา heavy child
- DFS 2 assign pos ต่อเนื่อง
- Segment Tree query

### 6.3 โครงสร้างการใช้งาน
| Component | ใช้กับ |
|-----------|--------|
| heavy[] | แบ่ง path |
| pos[] | index ใน SegTree |
| head[] | ต้น heavy path |

### 6.4 สรุป
HLD = tree → array, SegTree = array query

## 7. แนวทางการประยุกต์ใช้

- **Path Sum/Max/Min**
- **Path Update**
- **LCA**
- **Subtree Query**

## 8. กรณีตัวอย่างจากประสบการณ์

**ปัญหา:** Network monitoring — หา sum ของ latency บน path ระหว่าง 2 nodes
- **HLD:** O(log² n) ต่อ query

## 9. การนำไปใช้งานจริง

```python
import sys
sys.setrecursionlimit(300000)

class HLD:
    def __init__(self, n):
        self.n = n
        self.adj = [[] for _ in range(n)]
        self.parent = [-1] * n
        self.depth = [0] * n
        self.size = [0] * n
        self.heavy = [-1] * n
        self.head = [0] * n
        self.pos = [0] * n
        self.cur_pos = 0
        self.values = [0] * n
    
    def add_edge(self, u, v):
        self.adj[u].append(v)
        self.adj[v].append(u)
    
    def _dfs1(self, u, p):
        self.parent[u] = p
        self.size[u] = 1
        max_size = 0
        for v in self.adj[u]:
            if v != p:
                self.depth[v] = self.depth[u] + 1
                self._dfs1(v, u)
                self.size[u] += self.size[v]
                if self.size[v] > max_size:
                    max_size = self.size[v]
                    self.heavy[u] = v
    
    def _dfs2(self, u, h):
        self.head[u] = h
        self.pos[u] = self.cur_pos
        self.cur_pos += 1
        if self.heavy[u] != -1:
            self._dfs2(self.heavy[u], h)
        for v in self.adj[u]:
            if v != self.parent[u] and v != self.heavy[u]:
                self._dfs2(v, v)
    
    def build(self, root=0):
        self._dfs1(root, -1)
        self._dfs2(root, root)
        # สร้าง Segment Tree จาก values ตาม pos
        self.arr = [0] * self.n
        for i in range(self.n):
            self.arr[self.pos[i]] = self.values[i]
        self.seg = SegmentTree(self.arr)
    
    def set_value(self, u, val):
        self.seg.update(self.pos[u], val)
    
    def query_path(self, u, v):
        """ผลรวมบน path u → v"""
        result = 0
        while self.head[u] != self.head[v]:
            if self.depth[self.head[u]] < self.depth[self.head[v]]:
                u, v = v, u
            result += self.seg.query(self.pos[self.head[u]], self.pos[u])
            u = self.parent[self.head[u]]
        
        if self.depth[u] > self.depth[v]:
            u, v = v, u
        result += self.seg.query(self.pos[u], self.pos[v])
        return result

class SegmentTree:
    def __init__(self, arr):
        self.n = len(arr)
        self.tree = [0] * (4 * self.n)
        self._build(arr, 0, 0, self.n - 1)
    
    def _build(self, arr, node, start, end):
        if start == end:
            self.tree[node] = arr[start]
        else:
            mid = (start + end) // 2
            self._build(arr, 2*node+1, start, mid)
            self._build(arr, 2*node+2, mid+1, end)
            self.tree[node] = self.tree[2*node+1] + self.tree[2*node+2]
    
    def update(self, idx, val, node=0, start=0, end=None):
        if end is None:
            end = self.n - 1
        if start == end:
            self.tree[node] = val
        else:
            mid = (start + end) // 2
            if idx <= mid:
                self.update(idx, val, 2*node+1, start, mid)
            else:
                self.update(idx, val, 2*node+2, mid+1, end)
            self.tree[node] = self.tree[2*node+1] + self.tree[2*node+2]
    
    def query(self, l, r, node=0, start=0, end=None):
        if end is None:
            end = self.n - 1
        if r < start or end < l:
            return 0
        if l <= start and end <= r:
            return self.tree[node]
        mid = (start + end) // 2
        return (self.query(l, r, 2*node+1, start, mid) +
                self.query(l, r, 2*node+2, mid+1, end))

# ทดสอบ
hld = HLD(7)
edges = [(0,1), (0,2), (1,3), (1,4), (2,5), (2,6)]
for u, v in edges:
    hld.add_edge(u, v)

hld.values = [1, 2, 3, 4, 5, 6, 7]
hld.build(0)

print("Path sum 3→5:", hld.query_path(3, 5))  # 4+2+1+3+6 = 16
print("Path sum 3→4:", hld.query_path(3, 4))  # 4+2+5 = 11

hld.set_value(3, 100)
print("After update 3=100, path 3→5:", hld.query_path(3, 5))
```

## 10. ปัญหาและแนวทางแก้ไข

| ปัญหา | แนวทางแก้ไข |
|-------|-------------|
| Recursion depth | iterative DFS |
| Indexing ผิด | ใช้ 0-indexed consistently |
| Update path | ใช้ lazy segment tree |
| Dynamic tree | ใช้ Link-Cut Tree |

---

# 8️⃣ Fenwick Tree 2D

## 3.1 คืออะไร

**Fenwick Tree 2D** คือ Fenwick Tree ที่ทำงานบน **2 มิติ** สำหรับ **2D Prefix Sum** และ **Point Update** ใน O(log² n)

## 3.2 ทำงานอย่างไร

### หลักการ

- 2D array ขนาด n × m
- tree[i][j] เก็บผลรวมของ region
- ใช้ lowbit ทั้ง 2 มิติ

### Operations

| Operation | Time |
|-----------|------|
| Point Update | O(log n · log m) |
| Prefix Sum (1,1) ถึง (x,y) | O(log n · log m) |
| Range Sum | O(log n · log m) |
| Build | O(nm log n log m) |

## 3.3 การใช้งาน

- **2D Range Sum**
- **Image Processing**
- **Grid Queries**
- **Competitive Programming**

## 3.4 ข้อดี

- โค้ดสั้น
- ใช้พื้นที่ O(nm)
- เร็วกว่า naive 2D

## 3.5 ข้อเสีย

- ใช้ memory O(nm)
- ต้อง 1-indexed
- Range update ต้องใช้ 2 BIT

## 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

- **ต้อง** 1-indexed
- **ระวัง** memory
- **ห้าม** ใช้กับ sparse matrix
- **ข้อจำกัด:** ไม่รองรับ range min/max
- **ต้องระวัง** lowbit 2 มิติ

## 3.7 Workflow

```
┌─────────────────────────────────────────┐
│       FENWICK TREE 2D WORKFLOW          │
└─────────────────────────────────────────┘

    [Build]
         │
         ▼
  ┌──────────────┐
  │ tree[n+1][m+1]│
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ Update แต่ละ │
  │ cell         │
  └──────────────┘

    [Update(x, y, delta)]
         │
         ▼
  ┌──────────────┐
  │ i = x        │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ while i ≤ n: │
  │  j = y       │
  │  while j ≤ m:│
  │   tree[i][j] │
  │   += delta   │
  │   j += lowbit│
  │  i += lowbit │
  └──────────────┘

    [Query(x, y)]
         │
         ▼
  ┌──────────────┐
  │ sum = 0      │
  │ i = x        │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ while i > 0: │
  │  j = y       │
  │  while j > 0:│
  │   sum +=     │
  │   tree[i][j] │
  │   j -= lowbit│
  │  i -= lowbit │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ คืน sum      │
  └──────────────┘
```

## 3.8 สรุป

Fenwick Tree 2D เป็นเครื่องมือที่มีประสิทธิภาพสำหรับ 2D range sum

---

## 4. ออกแบบ Workflow

```
2D Grid → Fenwick 2D → Point Update → Prefix Sum → Range Sum
```

## 5. Case Study: 2D Image Sum

**โจทย์:** Image 1000×1000, query sum ใน rectangle
- **Naive:** O(nm) ต่อ query
- **Fenwick 2D:** O(log² n) ต่อ query

## 6. โครงสร้าง

### 6.1 โครงสร้างคืออะไร
- 2D array tree[n+1][m+1]
- ใช้ lowbit

### 6.2 โครงสร้างทำงานอย่างไร
- Update: ไล่ i, j ด้วย lowbit
- Query: ถอย i, j ด้วย lowbit

### 6.3 โครงสร้างการใช้งาน
| Component | ขนาด |
|-----------|------|
| tree | (n+1) × (m+1) |
| lowbit | bit op |

### 6.4 สรุป
Fenwick 2D = 2 มิติของ BIT

## 7. แนวทางการประยุกต์ใช้

- **2D Range Sum**
- **Image Processing**
- **Grid DP**
- **Competitive**

## 8. กรณีตัวอย่างจากประสบการณ์

**ปัญหา:** วิเคราะห์ heatmap — sum ใน region
- **Fenwick 2D:** real-time query

## 9. การนำไปใช้งานจริง

```python
class Fenwick2D:
    def __init__(self, n, m):
        self.n = n
        self.m = m
        self.tree = [[0] * (m + 1) for _ in range(n + 1)]
    
    def update(self, x, y, delta):
        """เพิ่ม delta ที่ (x, y) — 1-indexed"""
        i = x
        while i <= self.n:
            j = y
            while j <= self.m:
                self.tree[i][j] += delta
                j += j & (-j)
            i += i & (-i)
    
    def query(self, x, y):
        """ผลรวม (1,1) ถึง (x,y) — 1-indexed"""
        s = 0
        i = x
        while i > 0:
            j = y
            while j > 0:
                s += self.tree[i][j]
                j -= j & (-j)
            i -= i & (-i)
        return s
    
    def range_query(self, x1, y1, x2, y2):
        """ผลรวม (x1,y1) ถึง (x2,y2)"""
        return (self.query(x2, y2)
                - self.query(x1 - 1, y2)
                - self.query(x2, y1 - 1)
                + self.query(x1 - 1, y1 - 1))

# ทดสอบ
ft = Fenwick2D(4, 4)
grid = [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12],
    [13, 14, 15, 16]
]

for i in range(4):
    for j in range(4):
        ft.update(i + 1, j + 1, grid[i][j])

print("Sum (1,1)-(2,2):", ft.range_query(1, 1, 2, 2))  # 1+2+5+6 = 14
print("Sum (2,2)-(4,4):", ft.range_query(2, 2, 4, 4))  # 6+7+8+10+11+12+14+15+16 = 99
```

## 10. ปัญหาและแนวทางแก้ไข

| ปัญหา | แนวทางแก้ไข |
|-------|-------------|
| Memory สูง | ใช้ sparse / offline |
| Range Update | ใช้ 2 BIT |
| Sparse grid | ใช้ map / coordinate compression |
| 3D+ | ใช้ Fenwick 3D |

---

# 📊 ตารางเปรียบเทียบสรุปทั้งหมด

| โครงสร้าง/อัลกอริทึม | ประเภท | Time | Space | ใช้กับ |
|----------------------|--------|------|-------|--------|
| **Suffix Array + LCP** | String | O(n log n) build | O(n) | Pattern matching |
| **Aho-Corasick** | String | O(n+m+z) | O(m·σ) | Multi-pattern |
| **Eertree** | String | O(n) | O(n) | Palindrome |
| **Sqrt Decomposition** | Range | O(√n) | O(n) | Range query |
| **Mo's Algorithm** | Offline | O((n+q)√n) | O(n) | Distinct/mode |
| **Centroid Decomp** | Tree | O(n log n) build | O(n) | Path counting |
| **HLD + SegTree** | Tree | O(log² n) query | O(n) | Path query |
| **Fenwick 2D** | 2D | O(log² n) | O(nm) | 2D sum |

---

# 🎯 Flow การเลือกใช้

```
┌──────────────────────────────────────────────────────────┐
│                ต้องการอะไร?                                │
├──────────────────────────────────────────────────────────┤
│ • Pattern matching ในข้อความ → Suffix Array + LCP        │
│ • Multi-pattern matching → Aho-Corasick                  │
│ • Palindrome queries → Eertree                            │
│ • Range query ง่ายๆ → Sqrt Decomposition                 │
│ • Offline range query → Mo's Algorithm                   │
│ • Path counting บน tree → Centroid Decomposition         │
│ • Path query + update บน tree → HLD + Segment Tree      │
│ • 2D range sum → Fenwick Tree 2D                         │
├──────────────────────────────────────────────────────────┤
│ ⚡ SA vs Aho-Corasick:                                   │
│   - SA: single pattern, ยืดหยุ่น                         │
│   - AC: multi-pattern, เร็วกว่าเมื่อ patterns เยอะ        │
│                                                          │
│ ⚡ Sqrt vs Segment Tree:                                 │
│   - Sqrt: ง่าย, O(√n)                                    │
│   - SegTree: ยาก, O(log n)                               │
│                                                          │
│ ⚡ Centroid vs HLD:                                      │
│   - Centroid: path counting, distance                    │
│   - HLD: path sum/min/max + update                       │
└──────────────────────────────────────────────────────────┘
```

---

# 🏆 สรุปภาพรวม Advanced Vol.2

โครงสร้างข้อมูลและอัลกอริทึมขั้นสูงเหล่านี้เป็นเครื่องมือสำคัญสำหรับ:

- **Competitive Programming** — IOI, ICPC, Codeforces
- **Text Processing** — Search, Index, Plagiarism
- **Bioinformatics** — DNA, RNA analysis
- **Database** — Advanced indexing
- **Network** — Path queries, monitoring
- **Data Science** — Range queries, statistics

**การเรียนรู้ต้อง:**
1. เข้าใจพื้นฐานก่อน (BST, Segment Tree, Trie)
2. ฝึก implement ทีละตัว
3. ฝึกใช้กับโจทย์จริง
4. เข้าใจ trade-offs

---
# Advanced Data Structures Vol.3: เจาะลึก 7 โครงสร้างข้อมูลขั้นสูงสุด

---

# 📖 บทนำ

ในเอกสารนี้ เราจะเจาะลึก **7 โครงสร้างข้อมูลและอัลกอริทึมขั้นสูงสุด** ที่ใช้ใน Competitive Programming ระดับ IOI/ICPC World Finals, การประมวลผลข้อความขนาดใหญ่, Bioinformatics, และระบบ Query ที่ต้องการประสิทธิภาพสูงสุด

เนื้อหาแบ่งเป็น 3 กลุ่ม:
- **กลุ่ม String:** Suffix Automaton + Suffix Link Tree, Palindromic Automaton
- **กลุ่ม Range Query:** Mo's with Update, Fenwick 2D + Range Update, Wavelet Tree 2D
- **กลุ่ม Tree:** Centroid + Fenwick, HLD + Lazy Segment Tree

---

# 1️⃣ Suffix Automaton + Suffix Link Tree

## 1.1 คืออะไร

**Suffix Automaton (SAM)** คือ Deterministic Finite Automaton (DFA) ที่รับ **suffix ทั้งหมด** ของสตริง ใช้พื้นที่ O(n) สร้างใน O(n) — เป็นโครงสร้าง string ที่ทรงพลังที่สุด

**Suffix Link Tree** คือ tree ที่สร้างจาก **suffix link** ของ SAM โดยแต่ละ node แทน state ใน SAM และ edge แทนความสัมพันธ์ suffix link ทำให้สามารถ query ข้อมูลบน suffix ได้อย่างมีประสิทธิภาพ

**การรวมกัน:** SAM + Suffix Link Tree ทำให้เราตอบคำถามเช่น
- จำนวน occurrence ของ substring
- ความยาวรวมของ distinct substrings
- Longest common substring ระหว่างหลายสตริง
- k-th smallest substring

## 1.2 ทำงานอย่างไร

### โครงสร้าง SAM

| Field | ความหมาย |
|-------|----------|
| **state** | แทนเซตของ endpos ที่เท่ากัน |
| **transition** | ตามตัวอักษร |
| **suffix link** | ชี้ไป state ที่แทน suffix ที่สั้นกว่า |
| **len** | ความยาวสูงสุดของ substring ใน state |
| **occurrence** | จำนวนครั้งที่ substring ปรากฏ |

### โครงสร้าง Suffix Link Tree

- Root = state เริ่มต้น (len = 0)
- Parent = suffix link
- เด็ก = state ที่มี suffix link มาที่ parent
- **คุณสมบัติ:** endpos(v) ⊆ endpos(parent(v))
- **Occurrence count:** นับจาก leaf ขึ้นมา (DP บน tree)

### ตัวอย่าง: "abab"

```
SAM States:
0 (root, len=0)
1 (a, len=1)
2 (ab, len=2)
3 (aba, len=3)
4 (abab, len=4)
5 (b, len=1)
6 (ba, len=2)
7 (bab, len=3)

Suffix Link Tree:
0 ← 1 ← 2 ← 3 ← 4
         ↑
         5 ← 6 ← 7

Occurrence:
state 1 (a): 2 ครั้ง (ตำแหน่ง 0, 2)
state 2 (ab): 2 ครั้ง (ตำแหน่ง 1, 3)
state 4 (abab): 1 ครั้ง
```

### Operations

| Operation | Time |
|-----------|------|
| สร้าง SAM | O(n) |
| สร้าง Suffix Link Tree | O(n) |
| จำนวน occurrence | O(n) preprocess, O(1) query |
| Longest common substring | O(n+m) |
| k-th substring | O(n log σ) |

## 1.3 การใช้งาน

- **Occurrence Counting** — นับจำนวนครั้งที่ substring ปรากฏ
- **Distinct Substrings** — นับจำนวน substring ที่แตกต่าง
- **Longest Common Substring** — ระหว่างหลายสตริง
- **k-th Smallest Substring**
- **Pattern Matching** — ค้นหา pattern
- **Bioinformatics** — DNA motif analysis
- **Plagiarism Detection**

## 1.4 ข้อดี

- สร้างใน O(n) — เร็วที่สุด
- ใช้พื้นที่ O(n) — น้อยกว่า Suffix Tree
- Suffix Link Tree ทำให้ query ซับซ้อนได้
- Occurrence query เร็วมาก
- ใช้แก้ปัญหาได้หลากหลาย

## 1.5 ข้อเสีย

- เข้าใจยากมาก
- โค้ดซับซ้อน
- ต้องเข้าใจ endpos equivalence
- Debug ยาก
- Static — สร้างใหม่ถ้า string เปลี่ยน

## 1.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

- **ต้อง** เข้าใจ suffix link ก่อน
- **ระวัง** การ clone state
- **ห้าม** ใช้กับ dynamic string
- **ข้อจำกัด:** alphabet size (ใช้ map ถ้าใหญ่)
- **ต้องระวัง** memory เมื่อ string ยาวมาก
- **ต้อง** preprocess occurrence count

## 1.7 Workflow

```
┌─────────────────────────────────────────┐
│       SAM + SUFFIX LINK TREE            │
└─────────────────────────────────────────┘

    [Build SAM]
         │
         ▼
  ┌──────────────┐
  │ สร้าง root   │
  │ last = root  │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ สำหรับแต่ละ │
  │ ตัวอักษร c   │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ สร้าง state  │
  │ ใหม่ cur     │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ ไล่ suffix   │
  │ link เพิ่ม   │
  │ trans        │
  └──────┬───────┘
         │
    ┌────┴────┐
    │         │
  เจอ       ถึง root
  trans     โดยไม่มี
    │         │
    ▼         ▼
  ตรวจ q    link=root
    │
    ▼
  ┌──────────────┐
  │ clone ถ้าจำเป็น│
  └──────┬───────┘
         │
         ▼
    [Build Suffix Link Tree]
         │
         ▼
  ┌──────────────┐
  │ สร้าง tree   │
  │ จาก link[]   │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ DFS หา       │
  │ occurrence   │
  └──────┬───────┘
         │
         ▼
    [Query]
         │
         ▼
  ┌──────────────┐
  │ ใช้ state +  │
  │ occurrence   │
  └──────────────┘
```

## 1.8 สรุป

Suffix Automaton + Suffix Link Tree เป็น combo ที่ทรงพลังที่สุดสำหรับ string processing ใช้ O(n) ทั้งเวลาและพื้นที่ แก้ปัญหา substring ได้หลากหลาย ตั้งแต่ occurrence counting ไปจนถึง longest common substring

---

## 2. Case Study: นับ Occurrence ของ Substring

**โจทย์:** ให้สตริง S ยาว 10⁶ และ queries 10⁵ ถามจำนวน occurrence ของ substring P

**วิธีแก้:**
1. สร้าง SAM ของ S ใน O(n)
2. สร้าง Suffix Link Tree
3. DFS นับ occurrence จาก leaf
4. Query: traverse ตาม P ใน SAM แล้วอ่านค่า occurrence → O(|P|)

**ผลลัพธ์:** 10⁵ queries ใช้เวลา < 1 วินาที

## 3. โครงสร้าง

### 3.1 โครงสร้างคืออะไร
- SAM: states, transitions, suffix links
- Suffix Link Tree: tree จาก suffix links
- Occurrence array: นับจาก DFS

### 3.2 โครงสร้างทำงานอย่างไร
- SAM สร้างใน O(n)
- Suffix Link Tree สร้างจาก link[]
- DFS จาก leaf ขึ้น root นับ occurrence

### 3.3 โครงสร้างการใช้งาน
| Component | ใช้กับ |
|-----------|--------|
| SAM | Pattern matching |
| Suffix Link Tree | Occurrence, LCS |
| Occurrence | นับจำนวน |

### 3.4 สรุป
SAM + Suffix Link Tree = toolkit ครบสำหรับ string

## 4. แนวทางการประยุกต์ใช้

- **Search Engine** — Index ข้อความ
- **Bioinformatics** — DNA analysis
- **Plagiarism** — ตรวจความคล้าย
- **Data Compression** — BWT
- **NLP** — Tokenization

### 💻 ตัวอย่างโค้ด

```python
class SuffixAutomaton:
    def __init__(self):
        self.next = [{}]
        self.link = [-1]
        self.len = [0]
        self.last = 0
        self.occurrence = [0]
    
    def extend(self, c):
        cur = len(self.next)
        self.next.append({})
        self.link.append(0)
        self.len.append(self.len[self.last] + 1)
        self.occurrence.append(1)
        
        p = self.last
        while p != -1 and c not in self.next[p]:
            self.next[p][c] = cur
            p = self.link[p]
        
        if p == -1:
            self.link[cur] = 0
        else:
            q = self.next[p][c]
            if self.len[p] + 1 == self.len[q]:
                self.link[cur] = q
            else:
                clone = len(self.next)
                self.next.append(self.next[q].copy())
                self.link.append(self.link[q])
                self.len.append(self.len[p] + 1)
                self.occurrence.append(0)
                
                while p != -1 and self.next[p].get(c) == q:
                    self.next[p][c] = clone
                    p = self.link[p]
                
                self.link[q] = clone
                self.link[cur] = clone
        
        self.last = cur
    
    def build(self, s):
        for c in s:
            self.extend(c)
        self._build_suffix_tree()
    
    def _build_suffix_tree(self):
        n = len(self.next)
        children = [[] for _ in range(n)]
        for i in range(1, n):
            children[self.link[i]].append(i)
        
        def dfs(u):
            for v in children[u]:
                dfs(v)
                self.occurrence[u] += self.occurrence[v]
        
        dfs(0)
    
    def count_occurrence(self, pattern):
        node = 0
        for c in pattern:
            if c not in self.next[node]:
                return 0
            node = self.next[node][c]
        return self.occurrence[node]
    
    def longest_common_substring(self, other):
        """หา longest common substring กับ other"""
        node, l, best, best_pos = 0, 0, 0, 0
        for i, c in enumerate(other):
            while node and c not in self.next[node]:
                node = self.link[node]
                l = self.len[node]
            if c in self.next[node]:
                node = self.next[node][c]
                l += 1
            if l > best:
                best = l
                best_pos = i - l + 1
        return best, best_pos

# ทดสอบ
sam = SuffixAutomaton()
sam.build("ababab")

print("Occurrence 'ab':", sam.count_occurrence("ab"))    # 3
print("Occurrence 'aba':", sam.count_occurrence("aba"))  # 2
print("Occurrence 'b':", sam.count_occurrence("b"))      # 3
print("Occurrence 'xyz':", sam.count_occurrence("xyz"))  # 0

# Longest Common Substring
sam2 = SuffixAutomaton()
sam2.build("xababy")
length, pos = sam2.longest_common_substring("zzabazz")
print(f"LCS: length={length}, pos={pos}")  # length=3, pos=1 ("aba")
```

---

# 2️⃣ Palindromic Automaton

## 1.1 คืออะไร

**Palindromic Automaton** คือ **ส่วนขยายของ Eertree (Palindromic Tree)** ที่เพิ่ม **transition** และ **suffix link** เพื่อให้สามารถ query palindrome ได้หลากหลายขึ้น คล้ายกับ Suffix Automaton แต่สำหรับ palindrome

**จุดต่างจาก Eertree พื้นฐาน:**
- Eertree พื้นฐานเก็บ palindrome ทั้งหมด
- Palindromic Automaton เพิ่ม **Series Link** สำหรับ palindromic factorization
- รองรับ occurrence counting
- รองรับ palindromic queries

## 1.2 ทำงานอย่างไร

### โครงสร้าง

- 2 root: len = -1, len = 0
- แต่ละ node: len, link, next, occurrence
- **Series Link:** สำหรับ palindromic factorization
- **Diff:** len[v] - len[link[v]]

### Operations

| Operation | Time |
|-----------|------|
| สร้าง | O(n) |
| นับ distinct palindromes | O(1) |
| นับ palindromic substrings | O(n) |
| Longest palindromic suffix | O(1) |
| Palindromic factorization | O(n log n) |

### ตัวอย่าง: "abacaba"

```
Palindromes: a, b, c, aba, aca, bacab, abacaba

Eertree Nodes:
- root1 (len=-1)
- root2 (len=0)
- "a" (len=1, link=root2)
- "b" (len=1, link=root2)
- "c" (len=1, link=root2)
- "aba" (len=3, link="a")
- "aca" (len=3, link="a")
- "bacab" (len=5, link="b")
- "abacaba" (len=7, link="aba")
```

## 1.3 การใช้งาน

- **Palindromic Factorization** — แบ่งสตริงเป็น palindrome
- **Count Palindromic Substrings**
- **Longest Palindromic Substring**
- **Palindromic Queries** ใน range
- **Bioinformatics** — DNA palindrome
- **Text Analysis**

## 1.4 ข้อดี

- สร้างใน O(n)
- ใช้พื้นที่ O(n)
- เก็บ palindrome ทั้งหมด
- Series Link ทำให้ factorization เร็ว
- ยืดหยุ่นกว่า Manacher
- Occurrence counting เร็ว

## 1.5 ข้อเสีย

- เข้าใจยาก
- โค้ดซับซ้อน
- Static
- Debug ยาก
- ต้องเข้าใจ suffix link

## 1.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

- **ต้อง** ใช้ 2 root (-1, 0)
- **ระวัง** การคำนวณ link กับ root -1
- **ห้าม** ใช้กับ dynamic string
- **ข้อจำกัด:** static
- **ต้องระวัง** series link ถ้าใช้ factorization
- **ต้องระวัง** alphabet size

## 1.7 Workflow

```
┌─────────────────────────────────────────┐
│      PALINDROMIC AUTOMATON              │
└─────────────────────────────────────────┘

    [Build]
         │
         ▼
  ┌──────────────┐
  │ สร้าง root   │
  │ -1 และ 0     │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ last = root0 │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ สำหรับแต่ละ │
  │ ตัวอักษร c   │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ หา suffix    │
  │ palindrome   │
  │ ที่ต่อ c ได้  │
  └──────┬───────┘
         │
    ┌────┴────┐
    │         │
   มี       ไม่มี
    │         │
    ▼         ▼
  ใช้       สร้าง node
  node      ใหม่ + link
    │         │
    └────┬────┘
         │
         ▼
  ┌──────────────┐
  │ อัปเดต       │
  │ occurrence   │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ คำนวณ series │
  │ link         │
  └──────────────┘

    [Query]
         │
         ▼
  ┌──────────────┐
  │ traverse     │
  │ ตาม next     │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ ใช้ series   │
  │ link สำหรับ  │
  │ factorization│
  └──────────────┘
```

## 1.8 สรุป

Palindromic Automaton เป็นโครงสร้างที่สมบูรณ์สำหรับ palindrome queries ใช้ O(n) ทั้งเวลาและพื้นที่ แก้ปัญหา palindrome ได้หลากหลาย

---

## 2. Case Study: Palindromic Factorization

**โจทย์:** แบ่งสตริงเป็น palindrome น้อยที่สุด

**วิธีแก้:** ใช้ Eertree + Series Link + DP
- DP[i] = จำนวน palindrome น้อยสุดที่แบ่ง s[0..i]
- ใช้ series link ลดเวลาเป็น O(n log n)

## 3. โครงสร้าง

### 3.1 โครงสร้างคืออะไร
- Eertree nodes
- Series Link
- Quick Link
- Occurrence array

### 3.2 โครงสร้างทำงานอย่างไร
- แต่ละ node = palindrome
- Series Link = palindrome ที่มี periodic structure
- DP บน series link

### 3.3 โครงสร้างการใช้งาน
| Component | ใช้กับ |
|-----------|--------|
| Eertree | เก็บ palindrome |
| Series Link | Factorization |
| Occurrence | นับจำนวน |

### 3.4 สรุป
Palindromic Automaton = Eertree + Series Link

## 4. แนวทางการประยุกต์ใช้

- **Palindrome detection**
- **Text compression**
- **DNA analysis**
- **Competitive programming**

### 💻 ตัวอย่างโค้ด

```python
class PalindromicAutomaton:
    def __init__(self, s):
        self.s = s
        self.n = len(s)
        self.len = [-1, 0]
        self.link = [0, 0]
        self.next = [{} for _ in range(2)]
        self.occurrence = [0, 0]
        self.series_link = [0, 0]
        self.diff = [0, 0]
        self.last = 1
        self.num_nodes = 2
        self.i = 0
    
    def _get_link(self, v):
        while True:
            cur_len = self.len[v]
            if self.i - cur_len - 1 >= 0 and \
               self.s[self.i - cur_len - 1] == self.s[self.i]:
                return v
            v = self.link[v]
    
    def add_char(self, i):
        self.i = i
        c = self.s[i]
        cur = self._get_link(self.last)
        
        if c in self.next[cur]:
            self.last = self.next[cur][c]
            self.occurrence[self.last] += 1
            return
        
        self.num_nodes += 1
        new_node = self.num_nodes - 1
        self.len.append(self.len[cur] + 2)
        self.next.append({})
        self.occurrence.append(1)
        self.next[cur][c] = new_node
        
        if self.len[new_node] == 1:
            self.link.append(1)
        else:
            link_candidate = self._get_link(self.link[cur])
            if c in self.next[link_candidate]:
                self.link.append(self.next[link_candidate][c])
            else:
                self.link.append(1)
        
        # คำนวณ series link และ diff
        self.diff.append(self.len[new_node] - self.len[self.link[new_node]])
        if self.diff[new_node] == self.diff[self.link[new_node]]:
            self.series_link.append(self.series_link[self.link[new_node]])
        else:
            self.series_link.append(self.link[new_node])
        
        self.last = new_node
    
    def build(self):
        for i in range(self.n):
            self.add_char(i)
        
        for i in range(self.num_nodes - 1, 1, -1):
            self.occurrence[self.link[i]] += self.occurrence[i]
        
        return self.num_nodes - 2
    
    def count_palindromic_substrings(self):
        return sum(self.occurrence[2:])
    
    def longest_palindrome(self):
        return max(self.len[2:])

# ทดสอบ
pa = PalindromicAutomaton("abacaba")
print("Distinct palindromes:", pa.build())  # 7
print("Palindromic substrings:", pa.count_palindromic_substrings())
print("Longest palindrome:", pa.longest_palindrome())  # 7

pa2 = PalindromicAutomaton("aaa")
print("\nDistinct palindromes in 'aaa':", pa2.build())  # 3
print("Palindromic substrings:", pa2.count_palindromic_substrings())  # 6
```

---

# 3️⃣ Mo's Algorithm with Update

## 1.1 คืออะไร

**Mo's Algorithm with Update** คือส่วนขยายของ Mo's Algorithm ที่รองรับ **Update** ระหว่าง query โดยใช้ **3D Mo's** (L, R, Time) แบ่งเป็น block ตาม L และ R และเรียงตาม Time

## 1.2 ทำงานอย่างไร

### หลักการ

1. แบ่ง array เป็น block ขนาด **n^(2/3)**
2. เรียง query ตาม: block(L), block(R), Time
3. ใช้ 3 pointer: L, R, Time
4. Update: apply/revert การเปลี่ยนแปลง

### Block Size
```
block = n^(2/3)
```

### Complexity
```
O(n^(5/3)) สำหรับ n queries
```

### ตัวอย่าง

```
Array: [1, 2, 3, 4, 5]
Operations:
- Q1: sum [0, 2]
- Update: arr[1] = 10
- Q2: sum [1, 3]
- Update: arr[3] = 20
- Q3: sum [0, 4]
```

## 1.3 การใช้งาน

- **Range Query + Update** แบบ offline
- **Dynamic Distinct Count**
- **Dynamic Mode**
- **Competitive Programming**

## 1.4 ข้อดี

- รองรับ update
- โค้ดสั้น
- ยืดหยุ่น
- ใช้ได้กับ query หลายแบบ

## 1.5 ข้อเสีย

- Offline เท่านั้น
- ช้ากว่า Mo's ปกติ
- ต้อง tune block size
- ซับซ้อนกว่า

## 1.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

- **ต้อง** เรียง query ให้ถูก
- **ห้าม** ใช้กับ online
- **ระวัง** apply/revert update
- **ข้อจำกัด:** offline
- **ต้องระวัง** ordering ของ operations
- **ต้อง** tune block size = n^(2/3)

## 1.7 Workflow

```
┌─────────────────────────────────────────┐
│     MO'S ALGORITHM WITH UPDATE          │
└─────────────────────────────────────────┘

    [Input: queries + updates]
         │
         ▼
  ┌──────────────┐
  │ แยก query    │
  │ และ update   │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ เรียง query  │
  │ ตาม block(L),│
  │ block(R),    │
  │ Time         │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ เริ่ม L=0,   │
  │ R=-1, T=0    │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ สำหรับแต่ละ │
  │ query        │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ ขยับ T       │
  │ (apply/      │
  │  revert)     │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ ขยับ L, R   │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ เก็บคำตอบ   │
  └──────────────┘
```

## 1.8 สรุป

Mo's with Update เป็นเครื่องมือสำหรับ offline query ที่มี update ใช้ 3D Mo's แก้ปัญหา dynamic range query ได้

---

## 2. Case Study: Dynamic Distinct Count

**โจทย์:** Array 10⁵, 10⁵ queries (รวม update) ถาม distinct elements

**วิธีแก้:** Mo's with Update ใช้ block = n^(2/3)
- **Naive:** O(n) ต่อ query → 10¹⁰
- **Mo's with Update:** O(n^(5/3)) → ~10⁷

## 3. โครงสร้าง

### 3.1 โครงสร้างคืออะไร
- 3 pointers: L, R, T
- Current state
- Update history

### 3.2 โครงสร้างทำงานอย่างไร
- Sort queries ตาม block
- Apply/revert updates
- Maintain current answer

### 3.3 โครงสร้างการใช้งาน
| Component | ใช้กับ |
|-----------|--------|
| L, R, T | 3D pointers |
| Update list | apply/revert |
| State | current answer |

### 3.4 สรุป
Mo's with Update = 3D Mo's + update tracking

## 4. แนวทางการประยุกต์ใช้

- **Dynamic distinct**
- **Dynamic mode**
- **Range sum with update**
- **Competitive**

### 💻 ตัวอย่างโค้ด

```python
import math

class MoWithUpdate:
    def __init__(self, arr):
        self.n = len(arr)
        self.arr = arr[:]
        self.current_arr = arr[:]
        self.freq = {}
        self.distinct = 0
    
    def _add(self, idx):
        v = self.current_arr[idx]
        self.freq[v] = self.freq.get(v, 0) + 1
        if self.freq[v] == 1:
            self.distinct += 1
    
    def _remove(self, idx):
        v = self.current_arr[idx]
        self.freq[v] -= 1
        if self.freq[v] == 0:
            self.distinct -= 1
    
    def _apply_update(self, t, updates, cur_l, cur_r):
        pos, new_val = updates[t]
        old_val = self.current_arr[pos]
        
        if cur_l <= pos <= cur_r:
            self.freq[old_val] -= 1
            if self.freq[old_val] == 0:
                self.distinct -= 1
            self.freq[new_val] = self.freq.get(new_val, 0) + 1
            if self.freq[new_val] == 1:
                self.distinct += 1
        
        self.current_arr[pos] = new_val
        return old_val
    
    def _revert_update(self, t, updates, cur_l, cur_r, old_val):
        pos, _ = updates[t]
        new_val = self.current_arr[pos]
        
        if cur_l <= pos <= cur_r:
            self.freq[new_val] -= 1
            if self.freq[new_val] == 0:
                self.distinct -= 1
            self.freq[old_val] = self.freq.get(old_val, 0) + 1
            if self.freq[old_val] == 1:
                self.distinct += 1
        
        self.current_arr[pos] = old_val
    
    def solve(self, operations):
        queries = []
        updates = []
        q_idx = 0
        history = []
        
        for op in operations:
            if op[0] == 'Q':
                _, l, r = op
                queries.append((l, r, len(updates), q_idx))
                q_idx += 1
            else:
                _, pos, val = op
                updates.append((pos, val))
        
        if not queries:
            return []
        
        block = max(1, int(self.n ** (2/3)))
        queries.sort(key=lambda x: (
            x[0] // block,
            x[1] // block,
            x[2] if (x[0] // block + x[1] // block) % 2 == 0 else -x[2]
        ))
        
        answers = [0] * len(queries)
        cur_l, cur_r, cur_t = 0, -1, 0
        self.current_arr = self.arr[:]
        
        for l, r, t, idx in queries:
            # ขยับ T
            while cur_t < t:
                old_val = self.current_arr[updates[cur_t][0]]
                history.append((cur_t, old_val))
                self._apply_update(cur_t, updates, cur_l, cur_r)
                cur_t += 1
            
            while cur_t > t:
                cur_t -= 1
                _, old_val = history.pop()
                self._revert_update(cur_t, updates, cur_l, cur_r, old_val)
            
            # ขยับ L, R
            while cur_r < r:
                cur_r += 1
                self._add(cur_r)
            while cur_r > r:
                self._remove(cur_r)
                cur_r -= 1
            while cur_l < l:
                self._remove(cur_l)
                cur_l += 1
            while cur_l > l:
                cur_l -= 1
                self._add(cur_l)
            
            answers[idx] = self.distinct
        
        return answers

# ทดสอบ
arr = [1, 2, 3, 4, 5]
ops = [
    ('Q', 0, 2),      # distinct = 3
    ('U', 1, 100),    # arr[1] = 100
    ('Q', 0, 2),      # distinct = 3
    ('Q', 1, 3),      # distinct = 3
    ('U', 3, 1),      # arr[3] = 1
    ('Q', 0, 4),      # distinct = 5
]

mo = MoWithUpdate(arr)
print(mo.solve(ops))  # [3, 3, 3, 5]
```

---

# 4️⃣ Centroid Decomposition + Fenwick

## 1.1 คืออะไร

**Centroid Decomposition + Fenwick** คือการรวม Centroid Decomposition กับ Fenwick Tree เพื่อ query **path counting** และ **distance queries** บน tree ได้อย่างมีประสิทธิภาพ

## 1.2 ทำงานอย่างไร

### หลักการ

1. สร้าง Centroid Tree (depth ≤ log n)
2. สำหรับแต่ละ centroid เก็บข้อมูลใน Fenwick Tree
3. Query: traverse centroid ancestors
4. Update: อัปเดตทุก centroid ancestor

### Operations

| Operation | Time |
|-----------|------|
| Build | O(n log n) |
| Update | O(log² n) |
| Query | O(log² n) |

### ตัวอย่าง

```
Tree:           Centroid Tree:
    1                  3
   /|\                / \
  2 3 4              1   4
    |                / \
    5               2   5

Query(2, distance ≤ 2):
- traverse centroid ancestors ของ 2: 2 → 1 → 3
- รวมคำตอบจากแต่ละ centroid
```

## 1.3 การใช้งาน

- **Distance Queries** — จำนวน node ที่ระยะ ≤ k
- **Path Counting**
- **Nearest Node Queries**
- **Competitive Programming**

## 1.4 ข้อดี

- Query เร็ว O(log² n)
- ใช้ Fenwick เป็น storage
- Static tree
- แก้ปัญหา distance ได้ดี

## 1.5 ข้อเสีย

- โค้ดยาวมาก
- เข้าใจยาก
- Memory สูง
- Debug ยาก

## 1.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

- **ต้อง** สร้าง Centroid Tree ให้ถูก
- **ระวัง** การนับซ้ำ
- **ห้าม** ใช้กับ dynamic tree
- **ข้อจำกัด:** static
- **ต้องระวัง** memory

## 1.7 Workflow

```
┌─────────────────────────────────────────┐
│    CENTROID + FENWICK WORKFLOW          │
└─────────────────────────────────────────┘

    [Build Centroid Tree]
         │
         ▼
  ┌──────────────┐
  │ หา centroid  │
  │ recursive    │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ สร้าง        │
  │ Fenwick ต่อ  │
  │ centroid     │
  └──────┬───────┘
         │
         ▼
    [Update(node, dist)]
         │
         ▼
  ┌──────────────┐
  │ สำหรับแต่ละ │
  │ centroid     │
  │ ancestor:    │
  │ update       │
  │ Fenwick      │
  └──────┬───────┘
         │
         └──▶ วนซ้ำ

    [Query(node, k)]
         │
         ▼
  ┌──────────────┐
  │ สำหรับแต่ละ │
  │ centroid     │
  │ ancestor:    │
  │ query        │
  │ Fenwick      │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ รวมคำตอบ     │
  └──────────────┘
```

## 1.8 สรุป

Centroid + Fenwick เป็น combo ที่ทรงพลังสำหรับ distance queries บน tree ใช้ O(log² n) ต่อ query

---

## 2. Case Study: Count Nodes within Distance K

**โจทย์:** Tree 10⁵ nodes, 10⁵ queries ถามจำนวน node ที่ระยะ ≤ K จาก node u

**วิธีแก้:** Centroid + Fenwick
- **Naive:** O(n) ต่อ query
- **Centroid + Fenwick:** O(log² n) ต่อ query

## 3. โครงสร้าง

### 3.1 โครงสร้างคืออะไร
- Centroid Tree
- Fenwick ต่อ centroid
- Distance cache

### 3.2 โครงสร้างทำงานอย่างไร
- Centroid Tree depth ≤ log n
- Fenwick เก็บ distance
- Query traverse centroid ancestors

### 3.3 โครงสร้างการใช้งาน
| Component | ใช้กับ |
|-----------|--------|
| Centroid Tree | Path structure |
| Fenwick | Distance count |
| Distance cache | LCA distance |

### 3.4 สรุป
Centroid + Fenwick = distance queries เร็ว

## 4. แนวทางการประยุกต์ใช้

- **Distance queries**
- **Nearest node**
- **Path counting**
- **Network analysis**

### 💻 ตัวอย่างโค้ด

```python
import sys
sys.setrecursionlimit(300000)

class CentroidFenwick:
    def __init__(self, n):
        self.n = n
        self.adj = [[] for _ in range(n)]
        self.removed = [False] * n
        self.size = [0] * n
        self.centroid_parent = [-1] * n
        self.dist_cache = {}  # (node, centroid) -> distance
    
    def add_edge(self, u, v):
        self.adj[u].append(v)
        self.adj[v].append(u)
    
    def _dfs_size(self, u, p):
        self.size[u] = 1
        for v in self.adj[u]:
            if v != p and not self.removed[v]:
                self._dfs_size(v, u)
                self.size[u] += self.size[v]
    
    def _find_centroid(self, u, p, n):
        for v in self.adj[u]:
            if v != p and not self.removed[v] and self.size[v] > n // 2:
                return self._find_centroid(v, u, n)
        return u
    
    def _dfs_dist(self, u, p, dist, centroid):
        self.dist_cache[(u, centroid)] = dist
        for v in self.adj[u]:
            if v != p and not self.removed[v]:
                self._dfs_dist(v, u, dist + 1, centroid)
    
    def _decompose(self, entry, parent):
        self._dfs_size(entry, -1)
        c = self._find_centroid(entry, -1, self.size[entry])
        self.centroid_parent[c] = parent
        self._dfs_dist(c, -1, 0, c)
        self.removed[c] = True
        
        for v in self.adj[c]:
            if not self.removed[v]:
                self._decompose(v, c)
        
        return c
    
    def build(self):
        self._decompose(0, -1)
    
    def count_within_distance(self, u, k):
        """นับ node ที่ระยะ ≤ k จาก u"""
        count = 0
        node = u
        prev = -1
        
        while node != -1:
            d = self.dist_cache.get((u, node), 0)
            if d <= k:
                count += 1
            
            # นับ node ใน subtree ของ centroid ที่ไม่ใช่ path ไป u
            # (ต้องลบซ้ำ)
            for v in self.adj[node]:
                if not self.removed[v] and v != prev:
                    # ตรวจสอบว่า v อยู่ใน path ไป u หรือไม่
                    pass
            
            prev = node
            node = self.centroid_parent[node]
        
        return count

# ทดสอบ
cf = CentroidFenwick(7)
edges = [(0,1), (0,2), (1,3), (1,4), (2,5), (2,6)]
for u, v in edges:
    cf.add_edge(u, v)

cf.build()
print("Centroid parents:", cf.centroid_parent)
print("Distance cache (sample):", dict(list(cf.dist_cache.items())[:5]))
```

---

# 5️⃣ HLD + Lazy Segment Tree

## 1.1 คืออะไร

**HLD + Lazy Segment Tree** คือการรวม **Heavy-Light Decomposition** กับ **Lazy Segment Tree** เพื่อ query และ update **path ระหว่าง 2 node** บน tree ใน O(log² n)

## 1.2 ทำงานอย่างไร

### หลักการ

1. **DFS 1:** หา size, parent, depth, heavy child
2. **DFS 2:** แบ่ง heavy path, assign position (pos[])
3. **Lazy Segment Tree:** รองรับ range update + range query
4. **Path Update/Query:** ไล่ heavy path จากล่างขึ้นบน

### Operations

| Operation | Time |
|-----------|------|
| Build | O(n) |
| Path Update | O(log² n) |
| Path Query | O(log² n) |
| Subtree Update | O(log n) |
| Subtree Query | O(log n) |

## 1.3 การใช้งาน

- **Path Sum/Max/Min + Update**
- **Path Add + Query**
- **Subtree Update + Query**
- **Competitive Programming**

## 1.4 ข้อดี

- Path query + update เร็ว
- ใช้ Lazy ลดเวลา update
- Subtree query ก็เร็ว
- Static tree

## 1.5 ข้อเสีย

- โค้ดยาวมาก
- เข้าใจยาก
- Debug ยาก
- Static

## 1.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

- **ต้อง** preprocess ให้ถูก
- **ระวัง** recursion depth
- **ห้าม** ใช้กับ dynamic tree
- **ข้อจำกัด:** static
- **ต้องระวัง** lazy propagation

## 1.7 Workflow

```
┌─────────────────────────────────────────┐
│   HLD + LAZY SEGMENT TREE WORKFLOW      │
└─────────────────────────────────────────┘

    [Preprocess]
         │
         ▼
  ┌──────────────┐
  │ DFS 1:       │
  │ size, parent │
  │ depth, heavy │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ DFS 2:       │
  │ assign pos,  │
  │ head         │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ Build Lazy   │
  │ Segment Tree │
  └──────┬───────┘
         │
         ▼
    [Update(u, v, val)]
         │
         ▼
  ┌──────────────┐
  │ while        │
  │ head[u] !=   │
  │ head[v]:     │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ update path  │
  │ บน segment   │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ u = parent   │
  │ [head[u]]    │
  └──────┬───────┘
         │
         └──▶ วนซ้ำ
         │
         ▼
  ┌──────────────┐
  │ update ส่วน  │
  │ สุดท้าย      │
  └──────────────┘
```

## 1.8 สรุป

HLD + Lazy Segment Tree เป็น combo มาตรฐานสำหรับ path update + query บน tree

---

## 2. Case Study: Path Add + Path Sum

**โจทย์:** Tree 10⁵ nodes, 10⁵ operations: add val ให้ทุก node บน path, ถาม sum บน path

**วิธีแก้:** HLD + Lazy Segment Tree
- **Naive:** O(n) ต่อ operation
- **HLD + Lazy:** O(log² n) ต่อ operation

## 3. โครงสร้าง

### 3.1 โครงสร้างคืออะไร
- size, parent, depth, heavy
- head, pos
- Lazy Segment Tree

### 3.2 โครงสร้างทำงานอย่างไร
- DFS 1 หา heavy child
- DFS 2 assign pos ต่อเนื่อง
- Lazy Segment Tree query/update

### 3.3 โครงสร้างการใช้งาน
| Component | ใช้กับ |
|-----------|--------|
| heavy[] | แบ่ง path |
| pos[] | index ใน SegTree |
| head[] | ต้น heavy path |
| lazy[] | range update |

### 3.4 สรุป
HLD = tree → array, Lazy SegTree = range update

## 4. แนวทางการประยุกต์ใช้

- **Path Sum/Max/Min + Update**
- **Subtree Query**
- **LCA**
- **Network monitoring**

### 💻 ตัวอย่างโค้ด

```python
import sys
sys.setrecursionlimit(300000)

class LazySegmentTree:
    def __init__(self, arr):
        self.n = len(arr)
        self.tree = [0] * (4 * self.n)
        self.lazy = [0] * (4 * self.n)
        self._build(arr, 0, 0, self.n - 1)
    
    def _build(self, arr, node, start, end):
        if start == end:
            self.tree[node] = arr[start]
        else:
            mid = (start + end) // 2
            self._build(arr, 2*node+1, start, mid)
            self._build(arr, 2*node+2, mid+1, end)
            self.tree[node] = self.tree[2*node+1] + self.tree[2*node+2]
    
    def _push(self, node, start, end):
        if self.lazy[node] != 0:
            mid = (start + end) // 2
            left, right = 2*node+1, 2*node+2
            self.tree[left] += self.lazy[node] * (mid - start + 1)
            self.tree[right] += self.lazy[node] * (end - mid)
            self.lazy[left] += self.lazy[node]
            self.lazy[right] += self.lazy[node]
            self.lazy[node] = 0
    
    def update_range(self, l, r, val, node=0, start=0, end=None):
        if end is None:
            end = self.n - 1
        if r < start or end < l:
            return
        if l <= start and end <= r:
            self.tree[node] += val * (end - start + 1)
            self.lazy[node] += val
            return
        self._push(node, start, end)
        mid = (start + end) // 2
        self.update_range(l, r, val, 2*node+1, start, mid)
        self.update_range(l, r, val, 2*node+2, mid+1, end)
        self.tree[node] = self.tree[2*node+1] + self.tree[2*node+2]
    
    def query(self, l, r, node=0, start=0, end=None):
        if end is None:
            end = self.n - 1
        if r < start or end < l:
            return 0
        if l <= start and end <= r:
            return self.tree[node]
        self._push(node, start, end)
        mid = (start + end) // 2
        return (self.query(l, r, 2*node+1, start, mid) +
                self.query(l, r, 2*node+2, mid+1, end))


class HLDWithLazy:
    def __init__(self, n):
        self.n = n
        self.adj = [[] for _ in range(n)]
        self.parent = [-1] * n
        self.depth = [0] * n
        self.size = [0] * n
        self.heavy = [-1] * n
        self.head = [0] * n
        self.pos = [0] * n
        self.cur_pos = 0
        self.values = [0] * n
    
    def add_edge(self, u, v):
        self.adj[u].append(v)
        self.adj[v].append(u)
    
    def _dfs1(self, u, p):
        self.parent[u] = p
        self.size[u] = 1
        max_size = 0
        for v in self.adj[u]:
            if v != p:
                self.depth[v] = self.depth[u] + 1
                self._dfs1(v, u)
                self.size[u] += self.size[v]
                if self.size[v] > max_size:
                    max_size = self.size[v]
                    self.heavy[u] = v
    
    def _dfs2(self, u, h):
        self.head[u] = h
        self.pos[u] = self.cur_pos
        self.cur_pos += 1
        if self.heavy[u] != -1:
            self._dfs2(self.heavy[u], h)
        for v in self.adj[u]:
            if v != self.parent[u] and v != self.heavy[u]:
                self._dfs2(v, v)
    
    def build(self, root=0):
        self._dfs1(root, -1)
        self._dfs2(root, root)
        self.arr = [0] * self.n
        for i in range(self.n):
            self.arr[self.pos[i]] = self.values[i]
        self.seg = LazySegmentTree(self.arr)
    
    def update_path(self, u, v, val):
        """บวก val ให้ทุก node บน path u → v"""
        while self.head[u] != self.head[v]:
            if self.depth[self.head[u]] < self.depth[self.head[v]]:
                u, v = v, u
            self.seg.update_range(self.pos[self.head[u]], self.pos[u], val)
            u = self.parent[self.head[u]]
        
        if self.depth[u] > self.depth[v]:
            u, v = v, u
        self.seg.update_range(self.pos[u], self.pos[v], val)
    
    def query_path(self, u, v):
        """ผลรวมบน path u → v"""
        result = 0
        while self.head[u] != self.head[v]:
            if self.depth[self.head[u]] < self.depth[self.head[v]]:
                u, v = v, u
            result += self.seg.query(self.pos[self.head[u]], self.pos[u])
            u = self.parent[self.head[u]]
        
        if self.depth[u] > self.depth[v]:
            u, v = v, u
        result += self.seg.query(self.pos[u], self.pos[v])
        return result

# ทดสอบ
hld = HLDWithLazy(7)
edges = [(0,1), (0,2), (1,3), (1,4), (2,5), (2,6)]
for u, v in edges:
    hld.add_edge(u, v)

hld.values = [1, 2, 3, 4, 5, 6, 7]
hld.build(0)

print("Path sum 3→5:", hld.query_path(3, 5))  # 4+2+1+3+6 = 16
hld.update_path(3, 5, 10)  # บวก 10 ให้ทุก node บน path
print("After update, path sum 3→5:", hld.query_path(3, 5))  # 16 + 5*10 = 66
```

---

# 6️⃣ Fenwick 2D + Range Update

## 1.1 คืออะไร

**Fenwick 2D + Range Update** คือส่วนขยายของ Fenwick 2D ที่รองรับ **Range Update** (บวกค่าทั้ง rectangle) และ **Range Query** (ผลรวมใน rectangle) ใน O(log² n)

## 1.2 ทำงานอย่างไร

### หลักการ: 4 BIT

ใช้ Fenwick 2D **4 ตัว** ตามสูตร 2D Difference Array:

```
Range Update [x1,x2] × [y1,y2] ด้วย val:
- update(x1, y1, +val)
- update(x2+1, y1, -val)
- update(x1, y2+1, -val)
- update(x2+1, y2+1, +val)

Range Query [1,x] × [1,y]:
sum = x*y*B1 + y*B2 + x*B3 + B4
```

### Operations

| Operation | Time |
|-----------|------|
| Range Update | O(log² n) |
| Range Query | O(log² n) |
| Build | O(nm) |

## 1.3 การใช้งาน

- **2D Range Add + Range Sum**
- **Image Processing**
- **Grid DP**
- **Competitive Programming**

## 1.4 ข้อดี

- รองรับ range update + range query
- โค้ดสั้น
- ใช้พื้นที่ O(nm)
- เร็วกว่า naive

## 1.5 ข้อเสีย

- ต้อง 4 BIT
- Memory สูง
- ต้อง 1-indexed
- ไม่รองรับ min/max

## 1.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

- **ต้อง** 1-indexed
- **ระวัง** memory 4×(n+1)×(m+1)
- **ห้าม** ใช้กับ sparse matrix
- **ข้อจำกัด:** ไม่รองรับ range min/max
- **ต้องระวัง** สูตร 4 BIT

## 1.7 Workflow

```
┌─────────────────────────────────────────┐
│   FENWICK 2D + RANGE UPDATE WORKFLOW    │
└─────────────────────────────────────────┘

    [Build: 4 BIT]
         │
         ▼
  ┌──────────────┐
  │ B1, B2, B3,  │
  │ B4 = 0       │
  └──────┬───────┘
         │
         ▼
    [Range Update]
         │
         ▼
  ┌──────────────┐
  │ update(x1,y1,│
  │  +val)       │
  │ update(x2+1, │
  │  y1, -val)   │
  │ update(x1,   │
  │  y2+1, -val) │
  │ update(x2+1, │
  │  y2+1,+val)  │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ อัปเดต B1-B4│
  └──────┬───────┘
         │
         ▼
    [Range Query]
         │
         ▼
  ┌──────────────┐
  │ sum = x*y*B1 │
  │     + y*B2   │
  │     + x*B3   │
  │     + B4     │
  └──────────────┘
```

## 1.8 สรุป

Fenwick 2D + Range Update เป็นเครื่องมือสำหรับ 2D range update + query ใช้ 4 BIT

---

## 2. Case Study: 2D Range Add + Range Sum

**โจทย์:** Grid 1000×1000, queries: add val ให้ rectangle, ถาม sum ใน rectangle

**วิธีแก้:** Fenwick 2D + Range Update
- **Naive:** O(nm) ต่อ operation
- **Fenwick 2D + Range Update:** O(log² n) ต่อ operation

## 3. โครงสร้าง

### 3.1 โครงสร้างคืออะไร
- 4 Fenwick 2D (B1, B2, B3, B4)
- ใช้ 2D Difference Array

### 3.2 โครงสร้างทำงานอย่างไร
- Range update → 4 point updates
- Range query → สูตร 4 BIT

### 3.3 โครงสร้างการใช้งาน
| BIT | ใช้กับ |
|-----|--------|
| B1 | x*y*val |
| B2 | y*val |
| B3 | x*val |
| B4 | val |

### 3.4 สรุป
Fenwick 2D + Range Update = 4 BIT สำหรับ 2D range update

## 4. แนวทางการประยุกต์ใช้

- **2D Range Add + Sum**
- **Image Processing**
- **Grid DP**
- **Competitive**

### 💻 ตัวอย่างโค้ด

```python
class Fenwick2DRangeUpdate:
    def __init__(self, n, m):
        self.n = n
        self.m = m
        self.B1 = [[0] * (m + 2) for _ in range(n + 2)]
        self.B2 = [[0] * (m + 2) for _ in range(n + 2)]
        self.B3 = [[0] * (m + 2) for _ in range(n + 2)]
        self.B4 = [[0] * (m + 2) for _ in range(n + 2)]
    
    def _update(self, bit, x, y, val):
        i = x
        while i <= self.n:
            j = y
            while j <= self.m:
                bit[i][j] += val
                j += j & (-j)
            i += i & (-i)
    
    def _query(self, bit, x, y):
        s = 0
        i = x
        while i > 0:
            j = y
            while j > 0:
                s += bit[i][j]
                j -= j & (-j)
            i -= i & (-i)
        return s
    
    def range_update(self, x1, y1, x2, y2, val):
        """บวก val ให้ rectangle [x1,x2] × [y1,y2]"""
        self._update(self.B1, x1, y1, val)
        self._update(self.B1, x2+1, y1, -val)
        self._update(self.B1, x1, y2+1, -val)
        self._update(self.B1, x2+1, y2+1, val)
        
        self._update(self.B2, x1, y1, val * (x1 - 1))
        self._update(self.B2, x2+1, y1, -val * x2)
        self._update(self.B2, x1, y2+1, -val * (x1 - 1))
        self._update(self.B2, x2+1, y2+1, val * x2)
        
        self._update(self.B3, x1, y1, val * (y1 - 1))
        self._update(self.B3, x2+1, y1, -val * (y1 - 1))
        self._update(self.B3, x1, y2+1, -val * y2)
        self._update(self.B3, x2+1, y2+1, val * y2)
        
        self._update(self.B4, x1, y1, val * (x1 - 1) * (y1 - 1))
        self._update(self.B4, x2+1, y1, -val * x2 * (y1 - 1))
        self._update(self.B4, x1, y2+1, -val * (x1 - 1) * y2)
        self._update(self.B4, x2+1, y2+1, val * x2 * y2)
    
    def _prefix_sum(self, x, y):
        return (x * y * self._query(self.B1, x, y)
                + y * self._query(self.B2, x, y)
                + x * self._query(self.B3, x, y)
                + self._query(self.B4, x, y))
    
    def range_query(self, x1, y1, x2, y2):
        """ผลรวมใน rectangle [x1,x2] × [y1,y2]"""
        return (self._prefix_sum(x2, y2)
                - self._prefix_sum(x1 - 1, y2)
                - self._prefix_sum(x2, y1 - 1)
                + self._prefix_sum(x1 - 1, y1 - 1))

# ทดสอบ
ft = Fenwick2DRangeUpdate(4, 4)
ft.range_update(1, 1, 2, 2, 5)
ft.range_update(2, 2, 3, 3, 3)

print("Sum (1,1)-(2,2):", ft.range_query(1, 1, 2, 2))  # 4*5 = 20
print("Sum (2,2)-(3,3):", ft.range_query(2, 2, 3, 3))  # 4*5 + 4*3 = 32
print("Sum (1,1)-(4,4):", ft.range_query(1, 1, 4, 4))  # 20 + 12 = 32
```

---

# 7️⃣ Wavelet Tree 2D

## 1.1 คืออะไร

**Wavelet Tree 2D** คือส่วนขยายของ Wavelet Tree ที่ทำงานบน **2D grid** สำหรับ query เช่น
- นับจำนวนค่า ≤ x ใน rectangle
- หา k-th smallest ใน rectangle
- Range quantile 2D

## 1.2 ทำงานอย่างไร

### หลักการ

1. สร้าง Wavelet Tree บนค่าทั้งหมด (1D)
2. แต่ละ node เก็บ 2D BIT แทน bit vector
3. Query: traverse tree + 2D BIT

### Operations

| Operation | Time |
|-----------|------|
| Build | O(nm log σ) |
| Count ≤ x in rect | O(log σ · log n · log m) |
| k-th smallest in rect | O(log σ · log n · log m) |

## 1.3 การใช้งาน

- **2D Range Quantile**
- **2D Range Count**
- **Image Processing**
- **Data Mining**

## 1.4 ข้อดี

- Query เร็ว
- รองรับหลาย operation
- เหมาะกับ static grid

## 1.5 ข้อเสีย

- Memory สูงมาก
- สร้างซับซ้อน
- โค้ดยาว
- Static เท่านั้น

## 1.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

- **ต้อง** compress ค่า
- **ระวัง** memory
- **ห้าม** ใช้กับ dynamic
- **ข้อจำกัด:** static
- **ต้องระวัง** coordinate compression

## 1.7 Workflow

```
┌─────────────────────────────────────────┐
│       WAVELET TREE 2D WORKFLOW          │
└─────────────────────────────────────────┘

    [Build]
         │
         ▼
  ┌──────────────┐
  │ Compress ค่า │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ สร้าง Wavelet│
  │ Tree 1D      │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ แต่ละ node   │
  │ เก็บ 2D BIT  │
  └──────┬───────┘
         │
         ▼
    [Query]
         │
         ▼
  ┌──────────────┐
  │ traverse     │
  │ Wavelet Tree │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ query 2D BIT │
  │ ในแต่ละ node │
  └──────┬───────┘
         │
         ▼
  ┌──────────────┐
  │ รวมคำตอบ     │
  └──────────────┘
```

## 1.8 สรุป

Wavelet Tree 2D เป็นโครงสร้างที่ทรงพลังสำหรับ 2D range quantile แต่ใช้ memory สูง

---

## 2. Case Study: 2D Range k-th Smallest

**โจทย์:** Grid 100×100, queries ถาม k-th smallest ใน rectangle

**วิธีแก้:** Wavelet Tree 2D
- **Naive:** O(nm log(nm)) ต่อ query
- **Wavelet 2D:** O(log σ · log n · log m) ต่อ query

## 3. โครงสร้าง

### 3.1 โครงสร้างคืออะไร
- Wavelet Tree 1D
- 2D BIT ต่อ node

### 3.2 โครงสร้างทำงานอย่างไร
- แบ่งค่าตาม binary
- แต่ละ node เก็บ 2D BIT
- Query traverse + BIT query

### 3.3 โครงสร้างการใช้งาน
| Component | ใช้กับ |
|-----------|--------|
| Wavelet Tree | แบ่งค่า |
| 2D BIT | นับใน rectangle |

### 3.4 สรุป
Wavelet Tree 2D = Wavelet Tree + 2D BIT

## 4. แนวทางการประยุกต์ใช้

- **2D Range Quantile**
- **Image Processing**
- **Data Mining**
- **Competitive**

### 💻 ตัวอย่างโค้ด (แนวคิด)

```python
class WaveletTree2D:
    """
    แนวคิด: ใช้ Wavelet Tree 1D + 2D BIT
    หมายเหตุ: implementation จริงซับซ้อนมาก
    นี่เป็น conceptual code
    """
    def __init__(self, grid):
        self.rows = len(grid)
        self.cols = len(grid[0])
        
        # Flatten grid
        values = []
        for i in range(self.rows):
            for j in range(self.cols):
                values.append(grid[i][j])
        
        # Compress
        sorted_vals = sorted(set(values))
        self.val_to_idx = {v: i for i, v in enumerate(sorted_vals)}
        self.sorted_vals = sorted_vals
        
        # Build Wavelet Tree
        self.tree = self._build(values, 0, len(sorted_vals) - 1)
    
    def _build(self, values, lo, hi):
        if lo == hi or not values:
            return None
        
        mid = (lo + hi) // 2
        node = {
            'lo': lo,
            'hi': hi,
            'mid': mid,
            'left': [],
            'right': [],
            'bit': None,  # 2D BIT (conceptual)
        }
        
        for v in values:
            if v <= mid:
                node['left'].append(v)
            else:
                node['right'].append(v)
        
        node['left_tree'] = self._build(node['left'], lo, mid)
        node['right_tree'] = self._build(node['right'], mid + 1, hi)
        
        return node
    
    def count_leq(self, x, y1, y2, val):
        """
        นับจำนวนค่า ≤ val ใน rectangle [0, x] × [y1, y2]
        (conceptual)
        """
        # ใน implementation จริง จะใช้ 2D BIT ในแต่ละ node
        pass
    
    def kth_smallest(self, x1, y1, x2, y2, k):
        """
        หา k-th smallest ใน rectangle
        (conceptual)
        """
        pass

# หมายเหตุ: Implementation จริงต้องใช้ 2D BIT ต่อ node
# ซึ่งซับซ้อนและใช้ memory สูงมาก

print("Wavelet Tree 2D เป็นโครงสร้างขั้นสูงที่ใช้ใน Competitive Programming")
print("Implementation จริงต้องใช้ 2D BIT ต่อ node ใน Wavelet Tree")
```

---

# 📊 ตารางเปรียบเทียบสรุปทั้งหมด

| โครงสร้าง/อัลกอริทึม | ประเภท | Build | Query | Update | Space | ใช้กับ |
|----------------------|--------|-------|-------|--------|-------|--------|
| **SAM + Suffix Link Tree** | String | O(n) | O(m) | - | O(n) | Occurrence, LCS |
| **Palindromic Automaton** | String | O(n) | O(1) | - | O(n) | Palindrome |
| **Mo's with Update** | Offline | - | O(n^(5/3)) | - | O(n) | Dynamic range |
| **Centroid + Fenwick** | Tree | O(n log n) | O(log² n) | O(log² n) | O(n log n) | Distance |
| **HLD + Lazy SegTree** | Tree | O(n) | O(log² n) | O(log² n) | O(n) | Path update |
| **Fenwick 2D + Range Update** | 2D | O(nm) | O(log² n) | O(log² n) | O(nm) | 2D range |
| **Wavelet Tree 2D** | 2D | O(nm log σ) | O(log σ log n log m) | - | O(nm log σ) | 2D quantile |

---

# 🎯 Flow การเลือกใช้

```
┌──────────────────────────────────────────────────────────┐
│                ต้องการอะไร?                                │
├──────────────────────────────────────────────────────────┤
│ • Occurrence/LCS ของ substring → SAM + Suffix Link Tree  │
│ • Palindrome queries → Palindromic Automaton             │
│ • Dynamic range query (offline) → Mo's with Update       │
│ • Distance queries บน tree → Centroid + Fenwick          │
│ • Path update + query บน tree → HLD + Lazy Segment Tree  │
│ • 2D range update + query → Fenwick 2D + Range Update    │
│ • 2D range quantile → Wavelet Tree 2D                    │
├──────────────────────────────────────────────────────────┤
│ ⚡ Centroid vs HLD:                                      │
│   - Centroid: distance, path counting                    │
│   - HLD: path sum/min/max + update                       │
│                                                          │
│ ⚡ Mo's vs Fenwick 2D:                                   │
│   - Mo's: offline, ยืดหยุ่น                              │
│   - Fenwick 2D: online, เร็วกว่า                         │
│                                                          │
│ ⚡ SAM vs Palindromic Automaton:                         │
│   - SAM: substring ทั่วไป                                │
│   - PA: palindrome เท่านั้น                              │
└──────────────────────────────────────────────────────────┘
```

---

# 🏆 สรุปภาพรวม Advanced Vol.3

โครงสร้างข้อมูลและอัลกอริทึมขั้นสูงเหล่านี้เป็นเครื่องมือระดับสูงสุดสำหรับ:

- **Competitive Programming** — IOI, ICPC World Finals
- **Text Processing** — Search, Index, Analysis
- **Bioinformatics** — DNA/RNA analysis
- **Database** — Advanced indexing
- **Network** — Path queries, monitoring
- **Image Processing** — 2D queries

**การเรียนรู้ต้อง:**
1. เข้าใจพื้นฐานก่อน (SAM, Eertree, Mo's, Centroid, HLD, Fenwick)
2. ฝึก implement ทีละตัว
3. ฝึกใช้กับโจทย์จริง
4. เข้าใจ trade-offs

---
 # Advanced Data Structures Vol.4: Full Implementation

---

# 1️⃣ Suffix Automaton + Suffix Link Tree (Implementation เต็ม)

## 1.1 คืออะไร

**Suffix Automaton (SAM)** + **Suffix Link Tree** คือ combo ที่ทรงพลังที่สุดสำหรับ string processing ใช้ O(n) ทั้งเวลาและพื้นที่ รองรับ:
- Occurrence counting
- Longest Common Substring
- k-th Smallest Substring
- Number of Distinct Substrings
- First occurrence position

## 1.2 ทำงานอย่างไร

### โครงสร้าง SAM
- แต่ละ state แทนเซตของ endpos ที่เท่ากัน
- **len[v]**: ความยาวสูงสุดของ substring ใน state v
- **link[v]**: suffix link ไป state ที่สั้นกว่า
- **next[v][c]**: transition
- **first_pos[v]**: ตำแหน่งแรกที่ substring ปรากฏ
- **occurrence[v]**: จำนวนครั้งที่ปรากฏ

### Suffix Link Tree
- Root = state 0 (len=0)
- Parent = suffix link
- DFS post-order นับ occurrence

## 1.3 การใช้งาน

- **Occurrence Counting** — นับจำนวน substring
- **Longest Common Substring** — ระหว่าง 2+ strings
- **k-th Smallest Substring**
- **Distinct Substrings** — นับและ sum length
- **First Occurrence Position**

## 1.4 ข้อดี / 1.5 ข้อเสีย / 1.6 ข้อควรระวัง

| ข้อดี | ข้อเสีย |
|-------|---------|
| O(n) build | เข้าใจยาก |
| O(n) space | Static |
| รองรับหลาย query | Debug ยาก |

**ข้อควรระวัง:**
- Clone state ต้องคัดลอก next, link, len
- occurrence ของ clone = 0 (ไม่ใช่ prefix)
- ใช้ `dict` ถ้า alphabet ใหญ่

## 1.7 Workflow

```
Build SAM → Build Suffix Link Tree → DFS occurrence → Query
```

## 1.8 สรุป

SAM + Suffix Link Tree = toolkit ครบสำหรับ string

---

## 💻 Implementation เต็ม

```python
class SuffixAutomaton:
    def __init__(self):
        self.next = [{}]        # transitions
        self.link = [-1]        # suffix links
        self.len = [0]          # max length
        self.first_pos = [-1]   # first occurrence position
        self.occurrence = [0]   # occurrence count
        self.last = 0
        self.s = ""
    
    def extend(self, c, pos):
        """เพิ่มตัวอักษร c ที่ตำแหน่ง pos"""
        cur = len(self.next)
        self.next.append({})
        self.link.append(0)
        self.len.append(self.len[self.last] + 1)
        self.first_pos.append(pos)
        self.occurrence.append(1)  # เป็น prefix → occurrence = 1
        
        p = self.last
        while p != -1 and c not in self.next[p]:
            self.next[p][c] = cur
            p = self.link[p]
        
        if p == -1:
            self.link[cur] = 0
        else:
            q = self.next[p][c]
            if self.len[p] + 1 == self.len[q]:
                self.link[cur] = q
            else:
                clone = len(self.next)
                self.next.append(self.next[q].copy())
                self.link.append(self.link[q])
                self.len.append(self.len[p] + 1)
                self.first_pos.append(self.first_pos[q])
                self.occurrence.append(0)  # clone ไม่ใช่ prefix
                
                while p != -1 and self.next[p].get(c) == q:
                    self.next[p][c] = clone
                    p = self.link[p]
                
                self.link[q] = clone
                self.link[cur] = clone
        
        self.last = cur
    
    def build(self, s):
        self.s = s
        for i, c in enumerate(s):
            self.extend(c, i)
        self._build_suffix_tree()
    
    def _build_suffix_tree(self):
        """สร้าง Suffix Link Tree และนับ occurrence"""
        n = len(self.next)
        children = [[] for _ in range(n)]
        for i in range(1, n):
            children[self.link[i]].append(i)
        
        # DFS post-order
        order = []
        stack = [(0, False)]
        while stack:
            u, visited = stack.pop()
            if visited:
                order.append(u)
            else:
                stack.append((u, True))
                for v in children[u]:
                    stack.append((v, False))
        
        for u in order:
            for v in children[u]:
                self.occurrence[u] += self.occurrence[v]
    
    def count_occurrence(self, pattern):
        """นับ occurrence ของ pattern"""
        node = 0
        for c in pattern:
            if c not in self.next[node]:
                return 0
            node = self.next[node][c]
        return self.occurrence[node]
    
    def first_occurrence(self, pattern):
        """ตำแหน่งแรกที่ pattern ปรากฏ (-1 ถ้าไม่มี)"""
        node = 0
        for c in pattern:
            if c not in self.next[node]:
                return -1
            node = self.next[node][c]
        return self.first_pos[node] - len(pattern) + 1
    
    def longest_common_substring(self, other):
        """หา LCS กับ other → (length, string)"""
        node, l, best, best_end = 0, 0, 0, 0
        for i, c in enumerate(other):
            while node and c not in self.next[node]:
                node = self.link[node]
                l = self.len[node]
            if c in self.next[node]:
                node = self.next[node][c]
                l += 1
            if l > best:
                best = l
                best_end = i
        return best, other[best_end - best + 1:best_end + 1] if best > 0 else ""
    
    def distinct_substrings(self):
        """นับและ sum length ของ distinct substrings"""
        n = len(self.next)
        count = 0
        total_len = 0
        for i in range(1, n):
            count += self.len[i] - self.len[self.link[i]]
            total_len += (self.len[i] * (self.len[i] + 1) // 2
                          - self.len[self.link[i]] * (self.len[self.link[i]] + 1) // 2)
        return count, total_len
    
    def kth_smallest_substring(self, k):
        """หา k-th smallest substring (lexicographic)"""
        n = len(self.next)
        # DP: dp[v] = จำนวน path จาก v
        dp = [0] * n
        order = sorted(range(n), key=lambda x: -self.len[x])
        for u in order:
            dp[u] = 1  # ตัวเอง
            for v in self.next[u].values():
                dp[u] += dp[v]
        
        # Traverse
        result = []
        node = 0
        while k > 0:
            for c in sorted(self.next[node].keys()):
                v = self.next[node][c]
                if dp[v] >= k:
                    result.append(c)
                    node = v
                    k -= 1
                    break
                else:
                    k -= dp[v]
            else:
                break
        return "".join(result)


# ==================== ทดสอบ ====================
sam = SuffixAutomaton()
sam.build("ababab")

print("=== Suffix Automaton ===")
print(f"Number of states: {len(sam.next)}")
print(f"Occurrence 'ab': {sam.count_occurrence('ab')}")       # 3
print(f"Occurrence 'aba': {sam.count_occurrence('aba')}")     # 2
print(f"Occurrence 'b': {sam.count_occurrence('b')}")         # 3
print(f"First occurrence 'ba': {sam.first_occurrence('ba')}") # 1
print(f"Distinct substrings: {sam.distinct_substrings()}")    # (12, ...)

# LCS
sam2 = SuffixAutomaton()
sam2.build("xababy")
length, s = sam2.longest_common_substring("zzabazz")
print(f"LCS: '{s}' (length={length})")  # 'aba' (length=3)

# k-th smallest
print(f"5th smallest substring: '{sam.kth_smallest_substring(5)}'")
```

---

# 2️⃣ Wavelet Tree 2D (Implementation เต็ม)

## 1.1 คืออะไร

**Wavelet Tree 2D** คือโครงสร้างสำหรับ query บน 2D grid:
- นับจำนวนค่า ≤ x ใน rectangle
- หา k-th smallest ใน rectangle
- Range quantile 2D

## 1.2 ทำงานอย่างไร

ใช้ **Wavelet Tree บนค่า** + **2D BIT ต่อ node** เพื่อนับ element ใน rectangle

## 1.3 การใช้งาน / 1.4 ข้อดี / 1.5 ข้อเสีย

| หัวข้อ | รายละเอียด |
|--------|-----------|
| **ใช้** | 2D Range Quantile, Count |
| **ข้อดี** | เร็ว, ยืดหยุ่น |
| **ข้อเสีย** | Memory สูง O(nm log σ) |

## 1.6 ข้อควรระวัง

- ต้อง compress ค่า
- Memory สูงมาก
- Static เท่านั้น

## 1.7 Workflow

```
Compress → Build Wavelet Tree → 2D BIT ต่อ node → Query
```

## 1.8 สรุป

Wavelet Tree 2D = Wavelet Tree + 2D BIT

---

## 💻 Implementation เต็ม

```python
class BIT2D:
    """2D Fenwick Tree สำหรับนับ point"""
    def __init__(self, n, m):
        self.n = n
        self.m = m
        self.tree = [[0] * (m + 1) for _ in range(n + 1)]
    
    def update(self, x, y, val):
        i = x + 1
        while i <= self.n:
            j = y + 1
            while j <= self.m:
                self.tree[i][j] += val
                j += j & (-j)
            i += i & (-i)
    
    def query(self, x, y):
        """ผลรวม [0..x] × [0..y]"""
        if x < 0 or y < 0:
            return 0
        s = 0
        i = x + 1
        while i > 0:
            j = y + 1
            while j > 0:
                s += self.tree[i][j]
                j -= j & (-j)
            i -= i & (-i)
        return s
    
    def range_query(self, x1, y1, x2, y2):
        return (self.query(x2, y2)
                - self.query(x1 - 1, y2)
                - self.query(x2, y1 - 1)
                + self.query(x1 - 1, y1 - 1))


class WaveletTree2D:
    def __init__(self, grid):
        self.rows = len(grid)
        self.cols = len(grid[0])
        
        # Compress ค่า
        values = set()
        for row in grid:
            values.update(row)
        self.sorted_vals = sorted(values)
        self.val_to_idx = {v: i for i, v in enumerate(self.sorted_vals)}
        
        # สร้าง Wavelet Tree
        self.root = self._build(grid, 0, len(self.sorted_vals) - 1)
    
    def _build(self, grid, lo, hi):
        """สร้าง node (2D BIT) + children"""
        if lo == hi:
            return None
        
        mid = (lo + hi) // 2
        
        # 2D BIT นับ position ของ element ที่ ≤ mid
        bit = BIT2D(self.rows, self.cols)
        left_grid = []  # เก็บค่าที่ ≤ mid
        right_grid = []  # เก็บค่าที่ > mid
        
        for i in range(self.rows):
            lrow, rrow = [], []
            for j in range(self.cols):
                idx = self.val_to_idx[grid[i][j]]
                if idx <= mid:
                    bit.update(i, j, 1)
                    lrow.append(grid[i][j])
                else:
                    rrow.append(grid[i][j])
            left_grid.append(lrow)
            right_grid.append(rrow)
        
        node = {
            'bit': bit,
            'mid': mid,
            'left': self._build(left_grid, lo, mid) if left_grid[0] else None,
            'right': self._build(right_grid, mid + 1, hi) if right_grid[0] else None,
        }
        return node
    
    def count_leq(self, x1, y1, x2, y2, val):
        """นับจำนวนค่า ≤ val ใน rectangle"""
        return self._count_leq(self.root, x1, y1, x2, y2, self.val_to_idx.get(val, -1))
    
    def _count_leq(self, node, x1, y1, x2, y2, val_idx):
        if node is None or val_idx < 0:
            return 0
        if val_idx >= node['mid']:
            # นับทั้งหมดใน node + ไปขวา
            return (node['bit'].range_query(x1, y1, x2, y2)
                    + self._count_leq(node['right'], x1, y1, x2, y2, val_idx))
        else:
            # ไปซ้าย
            return self._count_leq(node['left'], x1, y1, x2, y2, val_idx)
    
    def kth_smallest(self, x1, y1, x2, y2, k):
        """หา k-th smallest ใน rectangle"""
        return self._kth_smallest(self.root, x1, y1, x2, y2, k)
    
    def _kth_smallest(self, node, x1, y1, x2, y2, k):
        if node is None:
            return None
        cnt_left = node['bit'].range_query(x1, y1, x2, y2)
        if k <= cnt_left:
            return self._kth_smallest(node['left'], x1, y1, x2, y2, k)
        else:
            return self._kth_smallest(node['right'], x1, y1, x2, y2, k - cnt_left)


# ==================== ทดสอบ ====================
grid = [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12],
    [13, 14, 15, 16]
]

wt = WaveletTree2D(grid)

print("=== Wavelet Tree 2D ===")
print(f"Count ≤ 5 in [0,0]-[2,2]: {wt.count_leq(0, 0, 2, 2, 5)}")   # 5 (1,2,3,5,6)
print(f"Count ≤ 10 in [0,0]-[3,3]: {wt.count_leq(0, 0, 3, 3, 10)}") # 10
print(f"3rd smallest in [0,0]-[2,2]: {wt.kth_smallest(0, 0, 2, 2, 3)}")  # 3
print(f"1st smallest in [1,1]-[3,3]: {wt.kth_smallest(1, 1, 3, 3, 1)}")  # 6
```

---

# 3️⃣ Centroid + Fenwick (Implementation เต็ม)

## 1.1 คืออะไร

**Centroid Decomposition + Fenwick** สำหรับ query:
- นับ node ที่ระยะ ≤ K จาก u
- Distance queries

## 1.2 ทำงานอย่างไร

สำหรับแต่ละ centroid เก็บ 2 Fenwick:
1. **sub[v]**: นับ node ใน subtree ของ centroid v
2. **par[v]**: นับ node ใน subtree ของ parent centroid

Query(u, k):
```
ans = 0
node = u
while node != -1:
    d = dist(u, node)
    if d <= k: ans += sub[node].query(k - d)
    if parent[node] != -1:
        d2 = dist(u, parent[node])
        if d2 <= k: ans -= par[node].query(k - d2)
    node = parent[node]
return ans
```

## 1.3 การใช้งาน / 1.4 ข้อดี / 1.5 ข้อเสีย

| หัวข้อ | รายละเอียด |
|--------|-----------|
| **ใช้** | Distance counting, Path counting |
| **ข้อดี** | O(log² n) query |
| **ข้อเสีย** | Memory O(n log n) |

## 1.6 ข้อควรระวัง

- ต้อง cache distance ระหว่าง node กับ centroid
- ต้องลบซ้ำด้วย parent Fenwick

## 1.7 Workflow

```
Find Centroid → Build Fenwick → Repeat → Query via ancestors
```

## 1.8 สรุป

Centroid + Fenwick = distance queries เร็ว

---

## 💻 Implementation เต็ม

```python
import sys
sys.setrecursionlimit(300000)

class Fenwick:
    def __init__(self, n):
        self.n = n
        self.tree = [0] * (n + 1)
    
    def update(self, i, delta):
        i += 1
        while i <= self.n:
            self.tree[i] += delta
            i += i & (-i)
    
    def query(self, i):
        """ผลรวม [0..i]"""
        if i < 0:
            return 0
        i = min(i, self.n - 1) + 1
        s = 0
        while i > 0:
            s += self.tree[i]
            i -= i & (-i)
        return s


class CentroidFenwick:
    def __init__(self, n):
        self.n = n
        self.adj = [[] for _ in range(n)]
        self.removed = [False] * n
        self.size = [0] * n
        self.centroid_parent = [-1] * n
        # Fenwick สำหรับแต่ละ centroid
        self.sub_fenwick = [None] * n   # node ใน subtree
        self.par_fenwick = [None] * n   # node ใน subtree ของ parent
        self.max_depth = [0] * n
        self.dist_cache = {}  # (node, centroid) -> distance
    
    def add_edge(self, u, v):
        self.adj[u].append(v)
        self.adj[v].append(u)
    
    def _dfs_size(self, u, p):
        self.size[u] = 1
        for v in self.adj[u]:
            if v != p and not self.removed[v]:
                self._dfs_size(v, u)
                self.size[u] += self.size[v]
    
    def _find_centroid(self, u, p, n):
        for v in self.adj[u]:
            if v != p and not self.removed[v] and self.size[v] > n // 2:
                return self._find_centroid(v, u, n)
        return u
    
    def _collect_dist(self, u, p, dist, centroid, depths):
        self.dist_cache[(u, centroid)] = dist
        depths.append(dist)
        for v in self.adj[u]:
            if v != p and not self.removed[v]:
                self._collect_dist(v, u, dist + 1, centroid, depths)
    
    def _decompose(self, entry, parent):
        self._dfs_size(entry, -1)
        c = self._find_centroid(entry, -1, self.size[entry])
        self.centroid_parent[c] = parent
        
        # เก็บ depth ทั้งหมดใน subtree ของ c
        depths = []
        self._collect_dist(c, -1, 0, c, depths)
        max_d = max(depths) if depths else 0
        self.max_depth[c] = max_d
        
        # สร้าง Fenwick
        self.sub_fenwick[c] = Fenwick(max_d + 1)
        # เพิ่ม node ทั้งหมด
        for d in depths:
            self.sub_fenwick[c].update(d, 1)
        
        if parent != -1:
            # par_fenwick: นับ node ที่อยู่ใน subtree ของ c แต่ในมุมมอง parent
            par_max = max(self.dist_cache.get((u, parent), 0) for u in self._subtree_nodes(c))
            self.par_fenwick[c] = Fenwick(max(par_max + 1, 1))
            for u in self._subtree_nodes(c):
                d = self.dist_cache.get((u, parent), 0)
                self.par_fenwick[c].update(d, 1)
        
        self.removed[c] = True
        for v in self.adj[c]:
            if not self.removed[v]:
                self._decompose(v, c)
        
        return c
    
    def _subtree_nodes(self, centroid):
        """หา node ทั้งหมดที่อยู่ใน subtree ของ centroid"""
        nodes = []
        stack = [centroid]
        visited = {centroid}
        while stack:
            u = stack.pop()
            nodes.append(u)
            for v in self.adj[u]:
                if not self.removed[v] and v not in visited:
                    # ต้องอยู่ subtree เดียวกัน
                    if self._is_in_subtree(v, centroid):
                        visited.add(v)
                        stack.append(v)
        return nodes
    
    def _is_in_subtree(self, u, centroid):
        """ตรวจว่า u อยู่ใน subtree ของ centroid (หลังลบ centroid ก่อนหน้า)"""
        return (u, centroid) in self.dist_cache
    
    def build(self, root=0):
        self._decompose(root, -1)
    
    def add_node(self, u):
        """เพิ่ม node u เข้าโครงสร้าง (offline)"""
        node = u
        while node != -1:
            d = self.dist_cache.get((u, node), 0)
            self.sub_fenwick[node].update(d, 1)
            if self.centroid_parent[node] != -1:
                d2 = self.dist_cache.get((u, self.centroid_parent[node]), 0)
                if self.par_fenwick[node]:
                    self.par_fenwick[node].update(d2, 1)
            node = self.centroid_parent[node]
    
    def count_within_distance(self, u, k):
        """นับ node ที่ระยะ ≤ k จาก u"""
        count = 0
        node = u
        while node != -1:
            d = self.dist_cache.get((u, node), 0)
            if d <= k:
                count += self.sub_fenwick[node].query(k - d)
            
            if self.centroid_parent[node] != -1:
                pd = self.centroid_parent[node]
                d2 = self.dist_cache.get((u, pd), 0)
                if d2 <= k and self.par_fenwick[node]:
                    count -= self.par_fenwick[node].query(k - d2)
            
            node = self.centroid_parent[node]
        
        return count


# ==================== ทดสอบ ====================
# Tree:
#       0
#      /|\
#     1 2 3
#    /|
#   4 5

cf = CentroidFenwick(6)
edges = [(0,1), (0,2), (0,3), (1,4), (1,5)]
for u, v in edges:
    cf.add_edge(u, v)

cf.build(0)

print("=== Centroid + Fenwick ===")
print(f"Centroid parents: {cf.centroid_parent}")
print(f"Distance from 4 to centroid ancestors:")
for node in range(6):
    if (4, node) in cf.dist_cache:
        print(f"  d(4, {node}) = {cf.dist_cache[(4, node)]}")

print(f"\nNodes within distance 1 from 0: {cf.count_within_distance(0, 1)}")  # 0,1,2,3 = 4
print(f"Nodes within distance 2 from 0: {cf.count_within_distance(0, 2)}")  # + 4,5 = 6
print(f"Nodes within distance 1 from 4: {cf.count_within_distance(4, 1)}")  # 4,1 = 2
```

---

# 4️⃣ Mo's with Update (Optimization)

## 1.1 คืออะไร

**Mo's Algorithm with Update** รองรับ update ระหว่าง query โดยใช้ 3D Mo's

## 1.2 ทำงานอย่างไร

### Optimization หลัก
1. **Block size = n^(2/3)** — optimal สำหรับ 3D
2. **Sort key** — (block(L), block(R), T) พร้อม parity
3. **History tracking** — เก็บ old value สำหรับ revert

### Complexity
```
O(n^(5/3)) สำหรับ n queries
```

## 1.3 การใช้งาน / 1.4 ข้อดี / 1.5 ข้อเสีย

| หัวข้อ | รายละเอียด |
|--------|-----------|
| **ใช้** | Dynamic range query |
| **ข้อดี** | รองรับ update, เร็ว |
| **ข้อเสีย** | Offline |

## 1.6 ข้อควรระวัง

- Block size = n^(2/3) (ไม่ใช่ √n)
- ต้องเก็บ history ของ update
- ต้อง apply/revert อย่างถูกต้อง

## 1.7 Workflow

```
Parse ops → Sort queries → Apply updates → Move L,R → Answer
```

## 1.8 สรุป

Mo's with Update = 3D Mo's + update tracking

---

## 💻 Implementation เต็ม (Optimized)

```python
import math

class MoWithUpdate:
    def __init__(self, arr):
        self.n = len(arr)
        self.original = arr[:]
        self.current = arr[:]
        self.freq = {}
        self.distinct = 0
        # Block size = n^(2/3)
        self.block = max(1, int(self.n ** (2/3)))
    
    def _add(self, idx):
        v = self.current[idx]
        self.freq[v] = self.freq.get(v, 0) + 1
        if self.freq[v] == 1:
            self.distinct += 1
    
    def _remove(self, idx):
        v = self.current[idx]
        self.freq[v] -= 1
        if self.freq[v] == 0:
            self.distinct -= 1
    
    def _apply(self, pos, new_val, l, r):
        """Apply update: current[pos] = new_val"""
        old_val = self.current[pos]
        if l <= pos <= r:
            # ลบ old
            self.freq[old_val] -= 1
            if self.freq[old_val] == 0:
                self.distinct -= 1
            # เพิ่ม new
            self.freq[new_val] = self.freq.get(new_val, 0) + 1
            if self.freq[new_val] == 1:
                self.distinct += 1
        self.current[pos] = new_val
        return old_val
    
    def _revert(self, pos, old_val, l, r):
        """Revert update: current[pos] = old_val"""
        new_val = self.current[pos]
        if l <= pos <= r:
            self.freq[new_val] -= 1
            if self.freq[new_val] == 0:
                self.distinct -= 1
            self.freq[old_val] = self.freq.get(old_val, 0) + 1
            if self.freq[old_val] == 1:
                self.distinct += 1
        self.current[pos] = old_val
    
    def solve(self, operations):
        """
        operations: list of ('Q', l, r) หรือ ('U', pos, val)
        คืน: list ของ answers
        """
        queries = []
        updates = []
        q_idx = 0
        
        for op in operations:
            if op[0] == 'Q':
                _, l, r = op
                queries.append((l, r, len(updates), q_idx))
                q_idx += 1
            else:
                _, pos, val = op
                updates.append((pos, val))
        
        if not queries:
            return []
        
        # Sort queries
        b = self.block
        def sort_key(q):
            l, r, t, _ = q
            bl, br = l // b, r // b
            parity = 1 if (bl + br) % 2 == 0 else -1
            return (bl, br * parity, t * parity)
        
        queries.sort(key=sort_key)
        
        answers = [0] * len(queries)
        cur_l, cur_r, cur_t = 0, -1, 0
        self.current = self.original[:]
        self.freq = {}
        self.distinct = 0
        
        for l, r, t, idx in queries:
            # Move T
            while cur_t < t:
                pos, val = updates[cur_t]
                self._apply(pos, val, cur_l, cur_r)
                cur_t += 1
            while cur_t > t:
                cur_t -= 1
                pos, _ = updates[cur_t]
                # ค่าเก่าคือ original[pos] ถ้าไม่มี update ก่อนหน้า
                # ต้องคำนวณย้อนกลับ
                old_val = self.original[pos]
                # หา update ก่อนหน้า
                for i in range(cur_t - 1, -1, -1):
                    if updates[i][0] == pos:
                        old_val = updates[i][1]
                        break
                self._revert(pos, old_val, cur_l, cur_r)
            
            # Move L, R
            while cur_r < r:
                cur_r += 1
                self._add(cur_r)
            while cur_r > r:
                self._remove(cur_r)
                cur_r -= 1
            while cur_l < l:
                self._remove(cur_l)
                cur_l += 1
            while cur_l > l:
                cur_l -= 1
                self._add(cur_l)
            
            answers[idx] = self.distinct
        
        return answers


# ==================== ทดสอบ ====================
arr = [1, 2, 3, 4, 5]
ops = [
    ('Q', 0, 2),      # [1,2,3] → 3
    ('U', 1, 100),    # [1,100,3,4,5]
    ('Q', 0, 2),      # [1,100,3] → 3
    ('Q', 1, 3),      # [100,3,4] → 3
    ('U', 3, 1),      # [1,100,3,1,5]
    ('Q', 0, 4),      # [1,100,3,1,5] → 4
]

mo = MoWithUpdate(arr)
print("=== Mo's with Update ===")
print(f"Answers: {mo.solve(ops)}")  # [3, 3, 3, 4]
```

---

# 5️⃣ HLD + Lazy Segment Tree (Subtree Query)

## 1.1 คืออะไร

**HLD + Lazy Segment Tree** รองรับ:
- Path update/query
- **Subtree update/query** (เพิ่มในเวอร์ชันนี้)

## 1.2 ทำงานอย่างไร

### Subtree Query
- Subtree ของ u = ช่วง [pos[u], pos[u] + size[u] - 1] ใน array
- เพราะ DFS 2 เรียง subtree ต่อเนื่องกัน

### Operations

| Operation | Time |
|-----------|------|
| Path Update | O(log² n) |
| Path Query | O(log² n) |
| Subtree Update | O(log n) |
| Subtree Query | O(log n) |

## 1.3 การใช้งาน / 1.4 ข้อดี / 1.5 ข้อเสีย

| หัวข้อ | รายละเอียด |
|--------|-----------|
| **ใช้** | Path + Subtree queries |
| **ข้อดี** | ครอบคลุมทุก query บน tree |
| **ข้อเสีย** | โค้ดยาว |

## 1.6 ข้อควรระวัง

- pos[u] + size[u] - 1 = จุดสุดท้ายของ subtree
- Lazy propagation ต้อง push ก่อน query

## 1.7 Workflow

```
DFS1 (size, heavy) → DFS2 (pos, head) → Lazy SegTree
                                          │
              Path Query/Update ──────────┤
              Subtree Query/Update ───────┤
```

## 1.8 สรุป

HLD + Lazy SegTree = toolkit ครบสำหรับ tree queries

---

## 💻 Implementation เต็ม (with Subtree)

```python
import sys
sys.setrecursionlimit(300000)

class LazySegmentTree:
    def __init__(self, arr):
        self.n = len(arr)
        self.tree = [0] * (4 * self.n)
        self.lazy = [0] * (4 * self.n)
        self._build(arr, 0, 0, self.n - 1)
    
    def _build(self, arr, node, start, end):
        if start == end:
            self.tree[node] = arr[start]
        else:
            mid = (start + end) // 2
            self._build(arr, 2*node+1, start, mid)
            self._build(arr, 2*node+2, mid+1, end)
            self.tree[node] = self.tree[2*node+1] + self.tree[2*node+2]
    
    def _push(self, node, start, end):
        if self.lazy[node] != 0:
            mid = (start + end) // 2
            l, r = 2*node+1, 2*node+2
            self.tree[l] += self.lazy[node] * (mid - start + 1)
            self.tree[r] += self.lazy[node] * (end - mid)
            self.lazy[l] += self.lazy[node]
            self.lazy[r] += self.lazy[node]
            self.lazy[node] = 0
    
    def update(self, l, r, val, node=0, start=0, end=None):
        if end is None:
            end = self.n - 1
        if r < start or end < l:
            return
        if l <= start and end <= r:
            self.tree[node] += val * (end - start + 1)
            self.lazy[node] += val
            return
        self._push(node, start, end)
        mid = (start + end) // 2
        self.update(l, r, val, 2*node+1, start, mid)
        self.update(l, r, val, 2*node+2, mid+1, end)
        self.tree[node] = self.tree[2*node+1] + self.tree[2*node+2]
    
    def query(self, l, r, node=0, start=0, end=None):
        if end is None:
            end = self.n - 1
        if r < start or end < l:
            return 0
        if l <= start and end <= r:
            return self.tree[node]
        self._push(node, start, end)
        mid = (start + end) // 2
        return (self.query(l, r, 2*node+1, start, mid) +
                self.query(l, r, 2*node+2, mid+1, end))


class HLD:
    def __init__(self, n):
        self.n = n
        self.adj = [[] for _ in range(n)]
        self.parent = [-1] * n
        self.depth = [0] * n
        self.size = [0] * n
        self.heavy = [-1] * n
        self.head = [0] * n
        self.pos = [0] * n
        self.cur_pos = 0
        self.values = [0] * n
    
    def add_edge(self, u, v):
        self.adj[u].append(v)
        self.adj[v].append(u)
    
    def _dfs1(self, u, p):
        self.parent[u] = p
        self.size[u] = 1
        max_size = 0
        for v in self.adj[u]:
            if v != p:
                self.depth[v] = self.depth[u] + 1
                self._dfs1(v, u)
                self.size[u] += self.size[v]
                if self.size[v] > max_size:
                    max_size = self.size[v]
                    self.heavy[u] = v
    
    def _dfs2(self, u, h):
        self.head[u] = h
        self.pos[u] = self.cur_pos
        self.cur_pos += 1
        if self.heavy[u] != -1:
            self._dfs2(self.heavy[u], h)
        for v in self.adj[u]:
            if v != self.parent[u] and v != self.heavy[u]:
                self._dfs2(v, v)
    
    def build(self, root=0):
        self._dfs1(root, -1)
        self._dfs2(root, root)
        arr = [0] * self.n
        for i in range(self.n):
            arr[self.pos[i]] = self.values[i]
        self.seg = LazySegmentTree(arr)
    
    # === Path Operations ===
    def path_update(self, u, v, val):
        while self.head[u] != self.head[v]:
            if self.depth[self.head[u]] < self.depth[self.head[v]]:
                u, v = v, u
            self.seg.update(self.pos[self.head[u]], self.pos[u], val)
            u = self.parent[self.head[u]]
        if self.depth[u] > self.depth[v]:
            u, v = v, u
        self.seg.update(self.pos[u], self.pos[v], val)
    
    def path_query(self, u, v):
        result = 0
        while self.head[u] != self.head[v]:
            if self.depth[self.head[u]] < self.depth[self.head[v]]:
                u, v = v, u
            result += self.seg.query(self.pos[self.head[u]], self.pos[u])
            u = self.parent[self.head[u]]
        if self.depth[u] > self.depth[v]:
            u, v = v, u
        result += self.seg.query(self.pos[u], self.pos[v])
        return result
    
    # === Subtree Operations (NEW) ===
    def subtree_update(self, u, val):
        """บวก val ให้ทุก node ใน subtree ของ u"""
        self.seg.update(self.pos[u], self.pos[u] + self.size[u] - 1, val)
    
    def subtree_query(self, u):
        """ผลรวมใน subtree ของ u"""
        return self.seg.query(self.pos[u], self.pos[u] + self.size[u] - 1)
    
    # === Node Operations ===
    def point_update(self, u, val):
        """อัปเดตค่า node u"""
        self.seg.update(self.pos[u], self.pos[u], val - self.values[u])
        self.values[u] = val
    
    def point_query(self, u):
        return self.seg.query(self.pos[u], self.pos[u])


# ==================== ทดสอบ ====================
# Tree:
#       0
#      /|\
#     1 2 3
#    /|
#   4 5

hld = HLD(6)
edges = [(0,1), (0,2), (0,3), (1,4), (1,5)]
for u, v in edges:
    hld.add_edge(u, v)

hld.values = [1, 2, 3, 4, 5, 6]
hld.build(0)

print("=== HLD + Lazy Segment Tree ===")
print(f"Path sum 4→3: {hld.path_query(4, 3)}")       # 5+2+1+4 = 12
print(f"Subtree sum of 1: {hld.subtree_query(1)}")   # 2+5+6 = 13
print(f"Subtree sum of 0: {hld.subtree_query(0)}")   # 21

hld.subtree_update(1, 10)  # บวก 10 ให้ 1, 4, 5
print(f"\nAfter subtree_update(1, +10):")
print(f"Subtree sum of 1: {hld.subtree_query(1)}")   # 13 + 30 = 43
print(f"Path sum 4→3: {hld.path_query(4, 3)}")       # 15+12+1+4 = 32

hld.path_update(4, 3, 5)  # บวก 5 ให้ path
print(f"\nAfter path_update(4, 3, +5):")
print(f"Path sum 4→3: {hld.path_query(4, 3)}")       # 32 + 4*5 = 52
```

---

# 6️⃣ Fenwick 2D + Range Update (Optimization)

## 1.1 คืออะไร

**Fenwick 2D + Range Update** รองรับ:
- Range update (บวก val ให้ rectangle)
- Range query (sum ใน rectangle)

ใช้ **4 BIT** ตามสูตร 2D Difference Array

## 1.2 ทำงานอย่างไร

### สูตร

```
Range Update [x1,x2] × [y1,y2] +val:
  update(B1, x1, y1, +val); update(B1, x2+1, y1, -val)
  update(B1, x1, y2+1, -val); update(B1, x2+1, y2+1, +val)
  update(B2, x1, y1, +val*(x1-1)); update(B2, x2+1, y1, -val*x2)
  update(B2, x1, y2+1, -val*(x1-1)); update(B2, x2+1, y2+1, +val*x2)
  update(B3, x1, y1, +val*(y1-1)); ...
  update(B4, x1, y1, +val*(x1-1)*(y1-1)); ...

Prefix Sum [1,x] × [1,y]:
  sum = x*y*B1 + y*B2 + x*B3 + B4
```

### Operations

| Operation | Time |
|-----------|------|
| Range Update | O(log² n) |
| Range Query | O(log² n) |

## 1.3 การใช้งาน / 1.4 ข้อดี / 1.5 ข้อเสีย

| หัวข้อ | รายละเอียด |
|--------|-----------|
| **ใช้** | 2D range update + query |
| **ข้อดี** | เร็ว O(log² n) |
| **ข้อเสีย** | 4 BIT, memory สูง |

## 1.6 ข้อควรระวัง

- ต้อง 1-indexed
- Memory = 4 × (n+1) × (m+1)
- ต้องใช้สูตร 4 BIT ให้ถูก

## 1.7 Workflow

```
4 BIT = 0 → Range Update (4 point updates per BIT) → Range Query (4 prefix sums)
```

## 1.8 สรุป

Fenwick 2D + Range Update = 4 BIT สำหรับ 2D range update

---

## 💻 Implementation เต็ม (Optimized)

```python
class Fenwick2DRangeUpdate:
    def __init__(self, n, m):
        self.n = n
        self.m = m
        # 4 BIT
        self.B1 = [[0] * (m + 2) for _ in range(n + 2)]
        self.B2 = [[0] * (m + 2) for _ in range(n + 2)]
        self.B3 = [[0] * (m + 2) for _ in range(n + 2)]
        self.B4 = [[0] * (m + 2) for _ in range(n + 2)]
    
    def _update(self, bit, x, y, val):
        i = x
        while i <= self.n:
            j = y
            while j <= self.m:
                bit[i][j] += val
                j += j & (-j)
            i += i & (-i)
    
    def _query(self, bit, x, y):
        if x <= 0 or y <= 0:
            return 0
        s = 0
        i = x
        while i > 0:
            j = y
            while j > 0:
                s += bit[i][j]
                j -= j & (-j)
            i -= i & (-i)
        return s
    
    def range_update(self, x1, y1, x2, y2, val):
        """บวก val ให้ rectangle [x1,x2] × [y1,y2] (1-indexed)"""
        # B1
        self._update(self.B1, x1, y1, val)
        self._update(self.B1, x2+1, y1, -val)
        self._update(self.B1, x1, y2+1, -val)
        self._update(self.B1, x2+1, y2+1, val)
        
        # B2: val * (x - 1)
        self._update(self.B2, x1, y1, val * (x1 - 1))
        self._update(self.B2, x2+1, y1, -val * x2)
        self._update(self.B2, x1, y2+1, -val * (x1 - 1))
        self._update(self.B2, x2+1, y2+1, val * x2)
        
        # B3: val * (y - 1)
        self._update(self.B3, x1, y1, val * (y1 - 1))
        self._update(self.B3, x2+1, y1, -val * (y1 - 1))
        self._update(self.B3, x1, y2+1, -val * y2)
        self._update(self.B3, x2+1, y2+1, val * y2)
        
        # B4: val * (x-1) * (y-1)
        self._update(self.B4, x1, y1, val * (x1 - 1) * (y1 - 1))
        self._update(self.B4, x2+1, y1, -val * x2 * (y1 - 1))
        self._update(self.B4, x1, y2+1, -val * (x1 - 1) * y2)
        self._update(self.B4, x2+1, y2+1, val * x2 * y2)
    
    def _prefix_sum(self, x, y):
        """ผลรวม [1,x] × [1,y]"""
        return (x * y * self._query(self.B1, x, y)
                + y * self._query(self.B2, x, y)
                + x * self._query(self.B3, x, y)
                + self._query(self.B4, x, y))
    
    def range_query(self, x1, y1, x2, y2):
        """ผลรวมใน rectangle [x1,x2] × [y1,y2]"""
        return (self._prefix_sum(x2, y2)
                - self._prefix_sum(x1 - 1, y2)
                - self._prefix_sum(x2, y1 - 1)
                + self._prefix_sum(x1 - 1, y1 - 1))


# ==================== ทดสอบ ====================
ft = Fenwick2DRangeUpdate(4, 4)

# Add 5 to [1,1]-[2,2]
ft.range_update(1, 1, 2, 2, 5)
# Add 3 to [2,2]-[3,3]
ft.range_update(2, 2, 3, 3, 3)

print("=== Fenwick 2D + Range Update ===")
print(f"Sum [1,1]-[2,2]: {ft.range_query(1, 1, 2, 2)}")  # 4*5 = 20
print(f"Sum [2,2]-[3,3]: {ft.range_query(2, 2, 3, 3)}")  # 20+12 = 32
print(f"Sum [1,1]-[4,4]: {ft.range_query(1, 1, 4, 4)}")  # 20+12 = 32
print(f"Sum [1,1]-[1,1]: {ft.range_query(1, 1, 1, 1)}")  # 5
print(f"Sum [3,3]-[4,4]: {ft.range_query(3, 3, 4, 4)}")  # 3

# เพิ่ม test: ตรวจสอบ cell เดียว
ft.range_update(1, 1, 4, 4, 1)  # ทุก cell +1
print(f"\nAfter add 1 to all:")
print(f"Sum [1,1]-[4,4]: {ft.range_query(1, 1, 4, 4)}")  # 32 + 16 = 48
```

---

# 7️⃣ Palindromic Automaton (Series Link)

## 1.1 คืออะไร

**Palindromic Automaton (Eertree + Series Link)** รองรับ:
- Palindromic factorization
- Count distinct palindromes
- Count palindromic substrings
- Longest palindromic suffix

## 1.2 ทำงานอย่างไร

### Series Link
- **diff[v] = len[v] - len[link[v]]**
- **series_link[v]** = link ที่มี diff ต่างจาก v
- ใช้ DP สำหรับ factorization ใน O(n log n)

### Operations

| Operation | Time |
|-----------|------|
| Build | O(n) |
| Distinct palindromes | O(1) |
| Palindromic substrings | O(n) |
| Factorization | O(n log n) |

## 1.3 การใช้งาน / 1.4 ข้อดี / 1.5 ข้อเสีย

| หัวข้อ | รายละเอียด |
|--------|-----------|
| **ใช้** | Palindrome queries |
| **ข้อดี** | O(n), ครอบคลุม |
| **ข้อเสีย** | Static, เข้าใจยาก |

## 1.6 ข้อควรระวัง

- ต้อง 2 root (-1, 0)
- Series link ต้องคำนวณ diff ให้ถูก
- occurrence ของ root = 0

## 1.7 Workflow

```
2 Roots → Process chars → Find suffix pal → Create node
                                              │
                                              ▼
                                       Compute series link
                                              │
                                              ▼
                                       DP factorization
```

## 1.8 สรุป

Palindromic Automaton + Series Link = toolkit ครบสำหรับ palindrome

---

## 💻 Implementation เต็ม (with Series Link + Factorization)

```python
class PalindromicAutomaton:
    def __init__(self, s=""):
        self.s = s
        self.n = len(s)
        # node 0: root -1, node 1: root 0
        self.len = [-1, 0]
        self.link = [0, 0]
        self.next = [{} for _ in range(2)]
        self.occurrence = [0, 0]
        self.diff = [0, 0]
        self.series_link = [0, 0]
        self.last = 1
        self.num_nodes = 2
        self.i = 0
        
        if s:
            self.build()
    
    def _get_link(self, v):
        """หา suffix link ที่ต่อ s[i] ได้"""
        while True:
            cur_len = self.len[v]
            if self.i - cur_len - 1 >= 0 and \
               self.s[self.i - cur_len - 1] == self.s[self.i]:
                return v
            v = self.link[v]
    
    def add_char(self, i):
        self.i = i
        c = self.s[i]
        cur = self._get_link(self.last)
        
        if c in self.next[cur]:
            self.last = self.next[cur][c]
            self.occurrence[self.last] += 1
            return False
        
        # สร้าง node ใหม่
        self.num_nodes += 1
        new_node = self.num_nodes - 1
        self.len.append(self.len[cur] + 2)
        self.next.append({})
        self.occurrence.append(1)
        self.next[cur][c] = new_node
        
        # หา suffix link
        if self.len[new_node] == 1:
            self.link.append(1)
        else:
            link_candidate = self._get_link(self.link[cur])
            if c in self.next[link_candidate]:
                self.link.append(self.next[link_candidate][c])
            else:
                self.link.append(1)
        
        # คำนวณ diff และ series link
        self.diff.append(self.len[new_node] - self.len[self.link[new_node]])
        if self.diff[new_node] == self.diff[self.link[new_node]]:
            self.series_link.append(self.series_link[self.link[new_node]])
        else:
            self.series_link.append(self.link[new_node])
        
        self.last = new_node
        return True
    
    def build(self):
        for i in range(self.n):
            self.add_char(i)
        # นับ occurrence จาก leaf ขึ้น root
        for i in range(self.num_nodes - 1, 1, -1):
            self.occurrence[self.link[i]] += self.occurrence[i]
    
    def count_distinct_palindromes(self):
        return self.num_nodes - 2
    
    def count_palindromic_substrings(self):
        return sum(self.occurrence[2:])
    
    def longest_palindrome(self):
        if self.num_nodes <= 2:
            return ""
        max_len = max(self.len[2:])
        # หา node ที่ยาวสุด
        for i in range(2, self.num_nodes):
            if self.len[i] == max_len:
                return self.s[self.i - max_len + 1:self.i + 1]
        return ""
    
    def palindromic_factorization(self):
        """
        หาจำนวน palindrome น้อยสุดที่แบ่งสตริงได้
        ใช้ Series Link + DP O(n log n)
        """
        n = self.n
        dp = [float('inf')] * (n + 1)
        dp[0] = 0
        
        # เก็บ series_ans[v] = min(dp[i - len[series_link ancestors]])
        series_ans = [float('inf')] * self.num_nodes
        
        # ต้อง traverse ใหม่
        self.last = 1
        for i in range(n):
            self.i = i
            c = self.s[i]
            cur = self._get_link(self.last)
            
            if c not in self.next[cur]:
                # สร้าง node
                self.num_nodes += 1
                new_node = self.num_nodes - 1
                self.len.append(self.len[cur] + 2)
                self.next.append({})
                self.occurrence.append(1)
                self.next[cur][c] = new_node
                
                if self.len[new_node] == 1:
                    self.link.append(1)
                else:
                    lc = self._get_link(self.link[cur])
                    if c in self.next[lc]:
                        self.link.append(self.next[lc][c])
                    else:
                        self.link.append(1)
                
                self.diff.append(self.len[new_node] - self.len[self.link[new_node]])
                if self.diff[new_node] == self.diff[self.link[new_node]]:
                    self.series_link.append(self.series_link[self.link[new_node]])
                else:
                    self.series_link.append(self.link[new_node])
                
                self.last = new_node
            else:
                self.last = self.next[cur][c]
            
            # DP
            v = self.last
            while v > 1:
                sl = self.series_link[v]
                # series_ans[v] = min(dp[i - len[sl] - diff[v] + 1 ...])
                series_ans[v] = dp[i - self.len[sl] - self.diff[v] + 1]
                if self.diff[v] == self.diff[self.link[v]]:
                    series_ans[v] = min(series_ans[v], series_ans[self.link[v]])
                dp[i + 1] = min(dp[i + 1], series_ans[v] + 1)
                v = sl
        
        return dp[n]


# ==================== ทดสอบ ====================
pa = PalindromicAutomaton("abacaba")

print("=== Palindromic Automaton ===")
print(f"Distinct palindromes: {pa.count_distinct_palindromes()}")  # 7
print(f"Palindromic substrings: {pa.count_palindromic_substrings()}")
print(f"Longest palindrome: '{pa.longest_palindrome()}'")  # 'abacaba'
print(f"Min palindromic factorization: {pa.palindromic_factorization()}")

print()
pa2 = PalindromicAutomaton("abba")
print(f"'abba': distinct={pa2.count_distinct_palindromes()}, "  # 4 (a,b,bb,abba)
      f"substrings={pa2.count_palindromic_substrings()}, "    # 6 (a,b,b,bb,bb,abba)
      f"min_fact={pa2.palindromic_factorization()}")          # 1 (abba เป็น palindrome)

pa3 = PalindromicAutomaton("abcba")
print(f"'abcba': min_fact={pa3.palindromic_factorization()}")  # 1
```

---

# 📊 ตารางเปรียบเทียบสรุป

| โครงสร้าง | Build | Query | Update | Space |
|-----------|-------|-------|--------|-------|
| **SAM + Suffix Link Tree** | O(n) | O(m) | - | O(n) |
| **Wavelet Tree 2D** | O(nm log σ) | O(log σ log n log m) | - | O(nm log σ) |
| **Centroid + Fenwick** | O(n log n) | O(log² n) | O(log² n) | O(n log n) |
| **Mo's with Update** | - | O(n^(5/3)) | - | O(n) |
| **HLD + Lazy SegTree** | O(n) | O(log² n) | O(log² n) | O(n) |
| **Fenwick 2D + Range Update** | O(nm) | O(log² n) | O(log² n) | O(nm) |
| **Palindromic Automaton** | O(n) | O(1) / O(n) | - | O(n) |

---

# 🎯 Flow การเลือกใช้

```
┌──────────────────────────────────────────────────────────┐
│                ต้องการอะไร?                                │
├──────────────────────────────────────────────────────────┤
│ • Occurrence/LCS/distinct substring → SAM + SLT          │
│ • 2D quantile/count → Wavelet Tree 2D                    │
│ • Distance query บน tree → Centroid + Fenwick            │
│ • Dynamic range query (offline) → Mo's with Update       │
│ • Path + Subtree query บน tree → HLD + Lazy SegTree     │
│ • 2D range update + query → Fenwick 2D + Range Update    │
│ • Palindrome queries → Palindromic Automaton             │
├──────────────────────────────────────────────────────────┤
│ ⚡ ข้อควรระวังหลัก:                                       │
│   - SAM: clone state ต้องคัดลอกให้ครบ                    │
│   - Wavelet 2D: memory สูงมาก                            │
│   - Centroid: ต้องลบซ้ำด้วย par_fenwick                  │
│   - Mo's Update: block = n^(2/3), ต้องเก็บ history       │
│   - HLD: subtree = [pos[u], pos[u]+size[u]-1]            │
│   - Fenwick 2D RU: ต้อง 4 BIT                            │
│   - Palindromic: series link ต้องคำนวณ diff ให้ถูก       │
└──────────────────────────────────────────────────────────┘
```

---

# 🏆 สรุปภาพรวม

โครงสร้างข้อมูลทั้ง 7 ตัวนี้เป็น **toolkit ระดับสูงสุด** สำหรับ:

- **Competitive Programming** — IOI, ICPC World Finals, Codeforces
- **Text Processing** — Search Engine, Plagiarism
- **Bioinformatics** — DNA/RNA analysis
- **Database** — Advanced indexing
- **Image Processing** — 2D queries

**การเรียนรู้ต้อง:**
1. เข้าใจพื้นฐาน (SAM, Eertree, Centroid, HLD, Fenwick, Mo's)
2. Implement ทีละส่วน (build → query → update)
3. ทดสอบกับกรณีเล็กก่อน
4. Debug ด้วยการ print state
5. optimize memory และเวลา

---
# หมายเหตุ
อธิบายเพิ่มเติมเกี่ยวกับ **Suffix Automaton (Optimization)**, **Wavelet Tree 2D (Memory Optimization)**, **Centroid + Fenwick (Online Update)**, **Mo's with Update (Rollback Version)**, **HLD + Lazy SegTree (Path + Subtree Combined)**, **Fenwick 2D + Range Update (Sparse Version)** หรือ **Palindromic Automaton (Palindromic Queries on Range)** พร้อมตัวอย่างโค้ดเพิ่มเติม    

# 📘 สรุปเล่มที่ 1

**สิ่งที่ได้เรียนรู้:**
1. **Data Structures** — เครื่องมือพื้นฐาน ต้องเลือกตาม Operations
2. **Algorithms** — วิธีแก้ปัญหา ต้องเลือกตาม Constraints
3. **Big O** — ภาษากลางวัดประสิทธิภาพ ต้องใช้ร่วมกับ Profiling

**คำแนะนำ:**
- ฝึก LeetCode Easy → Medium สัปดาห์ละ 5 ข้อ
- อ่าน CLRS (Introduction to Algorithms) บทที่เกี่ยวข้อง
- ลงมือ Implement ทุกโครงสร้างข้อมูลด้วยตัวเอง

**หนังสือแนะนำ:**
- "Introduction to Algorithms" (CLRS)
- "Grokking Algorithms" (Aditya Bhargava)
- "The Algorithm Design Manual" (Steven Skiena)

---

# 📘 เล่มถัดไป (โครงร่าง)

## เล่มที่ 2: กระบวนทัศน์การเขียนโปรแกรม
- บทที่ 1: OOP (SOLID, Design Patterns)
- บทที่ 2: Functional Programming (Pure Function, Monad, Immutability)
- บทที่ 3: Design Patterns (GoF, Enterprise Patterns)

## เล่มที่ 3: การออกแบบระบบ
- บทที่ 1: System Design Fundamentals (CAP, Load Balancing)
- บทที่ 2: Scalability (Horizontal, Vertical, Caching)
- บทที่ 3: Distributed Systems (Consensus, Consistency)

## เล่มที่ 4: สถาปัตยกรรมซอฟต์แวร์
- บทที่ 1: Software Architecture Principles
- บทที่ 2: Clean Architecture
- บทที่ 3: Hexagonal Architecture
- บทที่ 4: Event-Driven Architecture

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
