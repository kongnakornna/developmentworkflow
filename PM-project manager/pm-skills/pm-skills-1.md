# เอกสารวิเคราะห์และสังเคราะห์: PM AI Shipping Kit และระบบนิเวศทักษะ PM ที่เกี่ยวข้อง

---

## 1. บทนำ

ในยุคที่ AI agents สามารถเขียนโค้ดได้อย่างรวดเร็ว ปัญหาที่ตามมาคือ **"โค้ดถูกเขียนขึ้นโดยไม่มีบันทึกเจตนา"** (intent) — ไม่มีใครรู้ว่าระบบควรทำอะไร ใครมีสิทธิ์ทำอะไร ความลับอยู่ที่ไหน และกฎข้อใดได้รับการตรวจสอบแล้ว

ชุดเครื่องมือ **pm-ai-shipping** (AI Shipping Kit) ถูกออกแบบมาเพื่อแก้ปัญหานี้โดยเฉพาะ สำหรับ PM และ founder ที่ต้องรับผิดชอบโค้ดที่สร้างโดย AI โดยมีปรัชญาหลักคือ:

> **"AI เขียนโค้ดเร็ว แต่ไม่ทิ้งร่องรอยของเจตนา"**

ชุดเครื่องมือนี้ไม่ใช่แค่ linter หรือ scanner ทั่วไป แต่เป็นระบบที่ **สร้างเอกสารเจตนา (documentation of intent)** แล้ว **ตรวจสอบช่องว่างระหว่างสิ่งที่เอกสารบอกกับสิ่งที่โค้ดทำจริง** — ซึ่งเป็นชั้นของบั๊กที่เครื่องมือทั่วไปมองไม่เห็น เพราะไม่มีโมเดลของเจตนา

นอกจากนี้ยังมีระบบนิเวศที่เกี่ยวข้องอีกสองชุด ได้แก่:
- **pm-data-analytics** — ทักษะด้านข้อมูลสำหรับ PM (SQL, cohort analysis, A/B testing)
- **pm-execution** — ทักษะด้านการดำเนินงานผลิตภัณฑ์ (PRD, OKR, roadmap, sprint, user stories ฯลฯ)

เอกสารฉบับนี้จะวิเคราะห์และสังเคราะห์ชุดเครื่องมือทั้งหมดตามโครงสร้างที่กำหนด

---

## 2. บทนิยาม

| คำศัพท์ | ความหมาย |
|---|---|
| **Shipping Artifacts** | ชุดเอกสารที่ทำให้แอปที่สร้างโดย AI สามารถตรวจสอบได้ (reviewable) ประกอบด้วยเอกสารหลัก 5 ฉบับ และเอกสารตามเงื่อนไข 4 ฉบับ |
| **Code Review Skill** | ทักษะการตรวจสอบโค้ดที่เน้นความถูกต้อง (correctness) เป็นแกนหลัก โดยมีประสิทธิภาพและความปลอดภัยเป็นกรณีย่อย |
| **Intended vs Implemented** | วิธีการค้นหาช่องว่างระหว่างสิ่งที่ระบบถูกออกแบบให้ทำกับสิ่งที่โค้ดทำจริง |
| **Agreement (ข้อตกลง)** | ความสัมพันธ์ระหว่างสองฝ่ายที่ข้ามขอบเขต (boundary) เช่น ผู้เรียกกับผู้ถูกเรียก, producer กับ consumer |
| **Boundary (ขอบเขต)** | ขอบเขตเชิงความหมาย ไม่ใช่การแบ่งไฟล์ — แยกผู้เรียกกับผู้ถูกเรียก, callback สองอัน, การทำงานสองรอบของฟังก์ชันเดียวกัน |
| **Forced Probe (การทดสอบบังคับ)** | การสร้าง execution ที่ละเมิดข้อตกลงเพื่อพิสูจน์ว่าเป็นข้อบกพร่องจริง |
| **Refutation (การหักล้าง)** | กระบวนการพยายามพิสูจน์ว่าข้อบกพร่องที่สงสัยไม่ใช่ข้อบกพร่องจริง |
| **Authority Reconciliation** | การติดตามค่าที่เสนอ (requested) ผ่านการตรวจสอบ, normalization, การเจรจา หรือการ commit |
| **Identity & Correlation** | การติดตามว่าผลลัพธ์ของการดำเนินการค้นหา entity ต้นทางได้อย่างไร |
| **Trust Boundary** | จุดที่ข้อมูลข้ามจากแหล่งที่น่าเชื่อถือน้อยกว่าไปยังบริบทที่น่าเชื่อถือมากกว่า |
| **Sink** | จุดที่ค่ากลายเป็นคำสั่งแทนที่จะเป็นข้อมูล (เช่น process execution, SQL, eval) |
| **OWASP Top 10** | มาตรฐานความปลอดภัยของแอปพลิเคชันเว็บ 10 อันดับความเสี่ยงสูงสุด |
| **N+1 Query** | ปัญหาประสิทธิภาพที่เกิดจากการ query หนึ่งครั้งสำหรับรายการ แล้ว query อีกหนึ่งครั้งต่อรายการ |
| **Cohort Analysis** | การวิเคราะห์ข้อมูลผู้ใช้โดยแบ่งกลุ่มตามช่วงเวลา เพื่อดู retention และ engagement |
| **RICE / ICE** | กรอบการจัดลำดับความสำคัญของงาน |

---

## 3. บทหัวข้อ

### 3.1 คืออะไร

**pm-ai-shipping** คือชุดทักษะ (skills) และคำสั่ง (commands) สำหรับ PM และ founder ที่ต้องรับผิดชอบโค้ดที่สร้างโดย AI ประกอบด้วย 3 skills หลัก และ 5 commands:

#### Skills (3)

1. **shipping-artifacts** — ชุดเอกสารที่ทำให้แอปที่สร้างโดย AI สามารถตรวจสอบได้ ประกอบด้วย:
   - **Core docs (ต้องมีทุกแอป):**
     - `architecture.md` — ภาพรวมระบบ, stack, auth flow, trust boundaries
     - `flows.md` — เส้นทางของผู้ใช้ที่เกี่ยวข้องกับสิทธิ์และผลข้างเคียง
     - `permissions.md` — ใครทำอะไรได้บ้าง (roles, claims, matrix)
     - `variables.md` — config และ secrets แมปกับความเสี่ยง
     - `tests.md` — แผนที่การตรวจสอบ (verification map) — ผลิตโดย `/derive-tests`
   - **Conditional docs (เพิ่มเมื่อมีความสามารถนั้น):**
     - `emails.md` — การแจ้งเตือนทุกประเภท
     - `cron.md` — งานตามกำหนดเวลา
     - `seo.md` — SPA และ social previews
     - `automation.md` — embedded agents และ automation paths

2. **code-review** — ทักษะการตรวจสอบโค้ดระดับสูง โดยมี **correctness เป็นแกนหลัก** และ **performance กับ security เป็นกรณีย่อย** ที่ใช้ engine เดียวกัน ปรัชญาหลักคือ:
   > **"ข้อบกพร่องที่ reviewers พลาดมักไม่ปรากฏในไฟล์เดียว"** — มันคือความขัดแย้งระหว่างสองฝ่ายที่แต่ละฝ่ายดูสมเหตุสมผลเมื่ออยู่ลำพัง

3. **intended-vs-implemented** — วิธีการค้นหาช่องว่างระหว่างสิ่งที่ระบบถูกบันทึกไว้ว่าควรทำกับสิ่งที่โค้ดทำจริง โดยมีหลักฐานอ้างอิงทั้งสองด้าน

#### Commands (5)

1. `/pm-ai-shipping:ship-check` — เปลี่ยน repo ที่สร้างโดย AI ให้เป็น shipping packet ที่พร้อมสำหรับ reviewer
2. `/pm-ai-shipping:document-app` — reverse-engineer codebase เป็นเอกสารระบบ
3. `/pm-ai-shipping:derive-tests` — เปลี่ยนเจตนาที่บันทึกไว้เป็นแผนที่การทดสอบ
4. `/pm-ai-shipping:security-audit-static` — ตรวจสอบความปลอดภัยแบบ static
5. `/pm-ai-shipping:performance-audit-static` — ตรวจสอบประสิทธิภาพแบบ static

#### ระบบนิเวศที่เกี่ยวข้อง

- **pm-data-analytics** — 3 skills: `ab-test-analysis`, `cohort-analysis`, `sql-queries` และ 3 commands
- **pm-execution** — 16 skills: PRD, OKR, roadmap, sprint, pre-mortem, stakeholder map, user stories ฯลฯ และ 11 commands

---

### 3.2 ทำงานอย่างไร

#### หลักการทำงานหลักของ code-review

Code review ใช้ **engine เดียวกับสาม anchors**:

| Sub-case | Anchor | ไฟล์กฎ |
|---|---|---|
| **Correctness** (แกนหลัก) | ข้อตกลงระหว่างผู้เข้าร่วมข้ามขอบเขต | `correctness-taxonomy.md` |
| **Performance** | Workload → resource demand → growth/contention → consequence | `performance-review.md` |
| **Security** | Source → trust boundary → sink, with attacker | `security-review.md` |

**Shared Engine:**
```
Map a flow → Identify an obligation → Inspect every participant
→ Construct a violating execution → Trace the consequence
→ Attempt refutation → Report
```

#### 13 เลนส์วินิจฉัยความถูกต้อง (Correctness Taxonomy)

1. **Authority Reconciliation** — ค่าที่ร้องขอไม่ใช่ค่าที่นำไปใช้จริง
2. **Identity and Correlation** — ผลลัพธ์ค้นหา entity ต้นทางด้วย key ที่ไม่เสถียร
3. **Freshness and Generations** — ค่าที่จับก่อน yield/await อาจล้าสมัย
4. **Lifecycle and Derived State** — derived state ที่ถูกต้องบนเส้นทางหนึ่งแต่ผิดบนอีกเส้นทาง
5. **Atomicity and Partial Failure** — ผลข้างเคียงหลายอย่างที่ล้มเหลวกลางคัน
6. **Replay and Effect Cardinality** — retry และ duplicate delivery
7. **Composition and Precedence** — merge, reduction, ordering
8. **Bounds, Units and Accounting** — counts, lengths, offsets, totals
9. **Framing and Incremental Processing** — ขอบเขต logical vs. actual
10. **Representation and Information Loss** — คลาสที่พบบ่อยที่สุด (nullish family, projection drift, unresolved values)
11. **Ownership, Completion and Progress** — ใคร mutate, release, cancel, complete
12. **Decisions and Dispatch** — branches, defaults, reachability
13. **Verification and Observability** — checks ที่ไม่สามารถ fail, oracles ที่วัดผิดสิ่ง

#### กระบวนการ Refutation (5 ข้อ)

ข้อสงสัยจะกลายเป็น finding ต่อเมื่อมีครบทั้ง 5:

1. **A supported obligation** — สิ่งที่ต้องคงอยู่ และหลักฐาน
2. **A feasible execution** — inputs, state, ordering ที่ระบบจริงอนุญาต
3. **A concrete contradiction** — จุดที่ obligation ล้มเหลว
4. **An observable consequence** — ผลลัพธ์ที่สังเกตได้
5. **An examined counterargument** — กลไกที่แข็งแกร่งที่สุดที่อาจป้องกันได้

| ผลลัพธ์ | กฎ |
|---|---|
| **Keep** | หลักฐานยืนยันข้อบกพร่อง |
| **Drop** | หลักฐานที่อ้างอิงหักล้าง execution, obligation หรือ consequence |
| **Unresolved** | contract หรือ runtime fact ที่จำเป็นยังไม่ทราบ |

#### การทำงานของ ship-check (8 ขั้นตอน)

```
Step 1: Document the system (รัน /document-app)
Step 2: Wire the agent operating context (CLAUDE.md / AGENTS.md)
Step 3: Correctness review (รัน code-review dimensions=correctness)
Step 4+5: Security + Performance audits (ขนานกัน)
Step 6: Independent unsteered review (โมเดลที่สอง)
Step 7: Derive the test-coverage map (รัน /derive-tests)
Step 8: Compile the shipping packet
```

#### การทำงานของ security audit

- **Map entry points to trust boundaries and sinks** — HTTP/RPC handlers, webhooks, queue consumers, upload handlers
- **Inspect the four high-value paths** — authorization, data access, session/identity, input→output encoding
- **Cross-reference intended vs implemented** — เทียบกับ `documentation/*.md`
- **Self-refute every candidate** — พยายามหักล้างแต่ละ finding
- **Verify citations** — เปิดไฟล์ที่อ้างอิงทุกครั้ง
- **Report with OWASP Top 10 backstop** — map ทุก finding กับ OWASP category

#### การทำงานของ performance audit

- **N+1 queries and request waterfalls** — query ต่อรายการใน loop
- **Over-fetch in view payloads** — `SELECT *`, fields ที่ไม่ใช้, missing pagination
- **Missing or inefficient indexes** — ตาม sort, filter, join conditions
- **Caching opportunities** — พร้อม invalidation rule

---

### 3.3 การใช้งาน

#### การติดตั้ง

```bash
# ติดตั้งจาก pm-skills marketplace
# เปิดใช้งาน pm-ai-shipping plugin
# แต่ละคำสั่งเรียกใช้ได้ด้วย /pm-ai-shipping:<command> หรือ /<command>
```

#### รูปแบบการเรียกใช้

```bash
# Code review
/pm-ai-shipping:code-review
/pm-ai-shipping:code-review dimensions=correctness scope=changes
/pm-ai-shipping:code-review dimensions=performance,security
/pm-ai-shipping:code-review dimensions=all

# Document
/document-app
/document-app supabase/functions
/document-app the backend

# Derive tests
/derive-tests
/derive-tests the checkout flow
/derive-tests supabase/functions

# Ship check
/ship-check
/ship-check the payments service
/ship-check supabase/functions

# Security audit
/security-audit-static
/security-audit-static supabase/functions

# Performance audit
/performance-audit-static
/performance-audit-static src/views
```

#### ตัวอย่างการใช้งาน pm-data-analytics

```bash
# A/B test analysis
/analyze-test Control: 4.2% conversion (n=5000), Variant: 4.8% conversion (n=5100)

# Cohort analysis
/analyze-cohorts Monthly retention for users who signed up in Jan-Jun

# SQL query
/write-query Show me daily active users for the last 30 days, broken down by plan tier
```

#### ตัวอย่างการใช้งาน pm-execution

```bash
# PRD
/write-prd SSO support for enterprise customers

# OKR
/plan-okrs Growth team Q2 — company goal is 50% ARR increase

# Pre-mortem
/pre-mortem [paste or upload a PRD]

# Red-team
/red-team-prd [paste or upload a PRD, roadmap, or strategy]

# User stories
/write-stories user Allow users to export reports as PDF and CSV

# Sprint
/sprint plan 2-week sprint, 4 engineers, focus on checkout improvements
/sprint retro [paste team feedback]
/sprint release-notes [paste tickets]
```

---

### 3.4 ข้อดี

#### ข้อดีของ pm-ai-shipping

1. **มองเห็นข้อบกพร่องที่เครื่องมือทั่วไปมองไม่เห็น** — เพราะโฟกัสที่ agreement ระหว่างสองฝ่าย ไม่ใช่การสแกนไฟล์ทีละไฟล์
2. **บังคับให้สร้าง violating execution** — ข้อสงสัยไม่ใช่ finding จนกว่าจะพิสูจน์ได้ว่า reachable
3. **มีวินัยในการ refutation** — ลด noise อย่างมีนัยสำคัญ
4. **จัดการปัญหา "AI เขียนโค้ดเร็วแต่ไม่มีเจตนา"** — สร้างเอกสารเจตนาก่อน แล้วตรวจสอบช่องว่าง
5. **Sub-cases ที่ยืดหยุ่น** — correctness เป็นค่าเริ่มต้น, performance และ security เป็นทางเลือก
6. **Parallelism ที่ออกแบบมาอย่างดี** — fan out ตาม flows ไม่ใช่ตามไฟล์
7. **มีขั้นตอน independent unsteered review** — ใช้โมเดลที่สองเพื่อเป็น backstop
8. **จัดการกับ "silent failure"** — ซึ่งหายากใน planted corpora แต่พบบ่อยใน real fix histories
9. **มี OWASP Top 10 backstop** — ครอบคลุม A02, A06, A09 ที่มักถูกมองข้าม
10. **มีมาตรฐานการรายงานที่ชัดเจน** — severity แยกจาก evidential strength

#### ข้อดีของ pm-data-analytics

1. **Statistical rigor** — คำนวณ p-value, confidence interval, sample size validation
2. **Guardrail metrics** — ตรวจสอบว่า winning primary metric ไม่ทำลาย guardrails
3. **Cohort analysis ที่ลึก** — retention curves, feature adoption, segment insights
4. **SQL หลาย dialect** — BigQuery, PostgreSQL, MySQL, Snowflake, SQL Server
5. **Research recommendations** — แนะนำ qualitative follow-ups

#### ข้อดีของ pm-execution

1. **ครอบคลุมวงจรชีวิตผลิตภัณฑ์** — ตั้งแต่ PRD ถึง release notes
2. **มี frameworks ที่หลากหลาย** — RICE, ICE, Kano, MoSCoW, Opportunity Score
3. **Pre-mortem และ Red-team** — จัดการความเสี่ยงก่อน launch
4. **Stakeholder mapping** — Power × Interest grid พร้อม communication plan
5. **Test scenarios** — ครอบคลุม happy path, edge cases, error handling

---

### 3.5 ข้อเสีย

#### ข้อเสียของ pm-ai-shipping

1. **ต้องการเอกสารเจตนาก่อน** — ถ้าไม่มี `documentation/*.md` การ audit จะไม่สมบูรณ์
2. **ใช้ทรัพยากรสูง** — ต้องใช้โมเดลที่แข็งแกร่งที่สุด, fan out หลาย subagents
3. **เวลาในการรันนาน** — โดยเฉพาะ ship-check ที่มี 8 ขั้นตอน
4. **ผลลัพธ์เป็น code-review findings ไม่ใช่ confirmed exploits** — ยังต้องให้มนุษย์ sign off
5. **ความเสี่ยงจาก model rerouting** — Fable อาจ reroute ไป Opus 4.8 ทำให้ผลลัพธ์ไม่สม่ำเสมอ
6. **ไม่สามารถทดแทนการทดสอบจริง** — เป็น static review เท่านั้น
7. **ต้องการความเข้าใจสูง** — ผู้ใช้ต้องเข้าใจ concepts เช่น agreement, boundary, refutation
8. **Zero findings ไม่ได้หมายความว่า bug-free** — เป็นเพียง "no supported findings in the examined scope"

#### ข้อเสียของ pm-data-analytics

1. **ต้องการข้อมูลที่มีคุณภาพ** — cohort analysis ต้องการอย่างน้อย 3-4 cohorts
2. **Statistical significance ≠ practical significance** — ต้องตีความอย่างระมัดระวัง
3. **Novelty effects** — ผลลัพธ์ระยะสั้นอาจไม่ยั่งยืน
4. **ไม่สามารถทดแทนการวิจัยเชิงคุณภาพ** — เป็นเพียง quantitative analysis

#### ข้อเสียของ pm-execution

1. **บาง frameworks ต้องการข้อมูลจำนวนมาก** — เช่น RICE ต้องการ Reach, Impact, Confidence, Effort
2. **OKRs อาจกลายเป็น output-focused** — ถ้าไม่ระวัง
3. **Pre-mortem อาจกลายเป็น generic risk list** — ถ้าไม่เจาะจง
4. **Stakeholder map อาจล้าสมัย** — ต้องอัปเดตตามโครงการ

---

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

#### ข้อควรระวัง

1. **ห้ามนำ attacker/victim test ของ security ไปใช้กับ correctness** — correctness defect สามารถทำร้ายเฉพาะผู้ที่ trigger ได้และยังคงร้ายแรง
2. **Absorption ไม่ใช่ prevention** — การพบว่ามีบางสิ่ง downstream ที่ซ่อนข้อบกพร่องไว้ ไม่ใช่การหักล้าง
3. **"It works nearly always" อธิบาย race ไม่ใช่ refutation** — timing window ที่มัก resolve ถูกต้องคือ finding
4. **Passing tests, unfamiliar code, suspicious names ไม่ใช่หลักฐาน** — ต้อง investigate
5. **Deduplicate by violated agreement and root cause** — ไม่ใช่ by file
6. **Zero findings เป็นผลลัพธ์ที่ถูกต้อง** — อย่าประดิษฐ์ finding เพื่อเติมตาราง
7. **ห้ามใช้โมเดลอื่นโดยไม่ได้รับอนุญาต** — ยกเว้น `/ship-check` Step 6

#### ข้อห้าม

1. **ห้ามแก้ไขโค้ดระหว่าง review** — reviewer ต้องอ่าน, ค้นหา, นำทางเท่านั้น
2. **ห้ามรายงาน finding ที่ไม่มี cited evidence** — โดยเฉพาะ security audit
3. **ห้ามรายงาน generic hardening** — ต้องมี concrete impact
4. **ห้าม fabricate intent** — ถ้าเอกสารเงียบ ให้บอกว่าเงียบ
5. **ห้ามติดตั้ง CI gate โดยไม่ได้รับอนุมัติ** — `/derive-tests` แนะนำ ไม่ได้ติดตั้ง
6. **ห้ามรวมโมเดลในการ review** — ทำให้ผลลัพธ์ไม่สามารถ attribute ได้
7. **ห้ามใช้ "updated date" line ในเอกสาร** — ประวัติไฟล์เป็นแหล่งความจริง

#### ข้อจำกัด

1. **Static review เท่านั้น** — ไม่ใช่ load test หรือ penetration test
2. **ต้องการเอกสารเจตนา** — ถ้าไม่มี ต้องรัน `/document-app` ก่อน
3. **Scope ที่จำกัด** — ควร fan out เมื่อเกิน ~30 ไฟล์ หรือ 5,000 บรรทัด
4. **ผลลัพธ์เป็น findings ไม่ใช่ exploits** — ต้องให้มนุษย์ตรวจสอบ
5. **ไม่ครอบคลุม doc-vs-code axis** — ใช้ `intended-vs-implemented` skill แยก
6. **ขึ้นอยู่กับคุณภาพของโมเดล** — ควรใช้โมเดลที่แข็งแกร่งที่สุด

---

### 3.7 วาด Workflow

#### Workflow ของ ship-check (แบบละเอียด)

```
┌─────────────────────────────────────────────────────────────────┐
│                    /ship-check WORKFLOW                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ Step 1: Document the System                              │   │
│  │ • รัน /document-app (ถ้าเอกสารหายหรือเก่า)                │   │
│  │ • สร้าง: architecture, flows, permissions, variables     │   │
│  │ • เพิ่ม conditional: emails, cron, seo, automation       │   │
│  └──────────────────────────────────────────────────────────┘   │
│                            │                                     │
│                            ▼                                     │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ Step 2: Wire Agent Operating Context                     │   │
│  │ • สร้าง/รีเฟรช CLAUDE.md (และ AGENTS.md)                  │   │
│  │ • Derived from system docs                               │   │
│  └──────────────────────────────────────────────────────────┘   │
│                            │                                     │
│                            ▼                                     │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ Step 3: Correctness Review                               │   │
│  │ • รัน code-review dimensions=correctness                 │   │
│  │ • Forced probes: authority reconciliation, identity      │   │
│  │ • Fan out over flows, never over files                   │   │
│  └──────────────────────────────────────────────────────────┘   │
│                            │                                     │
│              ┌─────────────┴─────────────┐                       │
│              ▼                           ▼                       │
│  ┌───────────────────────┐   ┌───────────────────────┐          │
│  │ Step 4: Security      │   │ Step 5: Performance   │          │
│  │ Audit (static)        │   │ Audit (static)        │          │
│  │ • /security-audit-    │   │ • /performance-audit- │          │
│  │   static              │   │   static              │          │
│  │ • Intended-vs-        │   │ • N+1, over-fetch,    │          │
│  │   implemented         │   │   indexes, caching    │          │
│  └───────────────────────┘   └───────────────────────┘          │
│              │                           │                       │
│              └─────────────┬─────────────┘                       │
│                            ▼                                     │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ Step 6: Independent Unsteered Review                     │   │
│  │ • Fresh session of different model (Codex)               │   │
│  │ • No checklist, no pointer to prior findings             │   │
│  │ • Mechanical subject: git diff + working tree            │   │
│  │ • Verify every finding by hand                           │   │
│  └──────────────────────────────────────────────────────────┘   │
│                            │                                     │
│                            ▼                                     │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ Step 7: Derive Test-Coverage Map                         │   │
│  │ • รัน /derive-tests                                      │   │
│  │ • Existing coverage / Proposed / Gaps                    │   │
│  │ • Recommended CI gate                                    │   │
│  └──────────────────────────────────────────────────────────┘   │
│                            │                                     │
│                            ▼                                     │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ Step 8: Compile Shipping Packet                          │   │
│  │ • Documentation Inventory                                │   │
│  │ • Agent Context                                          │   │
│  │ • Test Coverage                                          │   │
│  │ • Correctness Summary                                    │   │
│  │ • Security Summary                                       │   │
│  │ • Performance Summary                                    │   │
│  │ • Independent Review                                     │   │
│  │ • Audit Provenance                                       │   │
│  │ • Launch Blockers                                        │   │
│  │ • Recommended Next Actions                               │   │
│  └──────────────────────────────────────────────────────────┘   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### Workflow ของ code-review engine

```
┌─────────────────────────────────────────────────────────────────┐
│                   CODE-REVIEW ENGINE                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌──────────────┐                                               │
│  │  MAP A FLOW  │                                               │
│  │  • Inputs    │                                               │
│  │  • Flows     │                                               │
│  │  • Owners    │                                               │
│  │  • External  │                                               │
│  │  • Effects   │                                               │
│  └──────┬───────┘                                               │
│         │                                                        │
│         ▼                                                        │
│  ┌──────────────────────┐                                       │
│  │ IDENTIFY OBLIGATION  │                                       │
│  │ • Participants       │                                       │
│  │ • Value exchanged    │                                       │
│  │ • Authority          │                                       │
│  │ • Identity/lifetime  │                                       │
│  │ • Required relation  │                                       │
│  │ • Evidence           │                                       │
│  │ • Transitions        │                                       │
│  │ • Observable         │                                       │
│  └──────┬───────────────┘                                       │
│         │                                                        │
│         ▼                                                        │
│  ┌──────────────────────┐                                       │
│  │ INSPECT PARTICIPANTS │                                       │
│  │ • Both sides         │                                       │
│  │ • Follow deps        │                                       │
│  └──────┬───────────────┘                                       │
│         │                                                        │
│         ▼                                                        │
│  ┌──────────────────────────┐                                   │
│  │ CONSTRUCT VIOLATING      │                                   │
│  │ EXECUTION                │                                   │
│  │ • Requested ≠ Effective  │                                   │
│  │ • Two ops live at once   │                                   │
│  │ • Change identity/gen    │                                   │
│  │ • Compare transitions    │                                   │
│  │ • Inject failure         │                                   │
│  │ • Empty/boundary inputs  │                                   │
│  └──────┬───────────────────┘                                   │
│         │                                                        │
│         ▼                                                        │
│  ┌──────────────────────┐                                       │
│  │ TRACE CONSEQUENCE    │                                       │
│  │ • Wrong output       │                                       │
│  │ • Wrong state        │                                       │
│  │ • Wrong effect       │                                       │
│  └──────┬───────────────┘                                       │
│         │                                                        │
│         ▼                                                        │
│  ┌──────────────────────┐                                       │
│  │ ATTEMPT REFUTATION   │                                       │
│  │ • Enclosing guarantee│                                       │
│  │ • Synchronization    │                                       │
│  │ • Reconciliation     │                                       │
│  │ • Intentional        │                                       │
│  │ • Precondition       │                                       │
│  │ • Different owner    │                                       │
│  └──────┬───────────────┘                                       │
│         │                                                        │
│         ▼                                                        │
│  ┌──────────────────────┐                                       │
│  │ REPORT               │                                       │
│  │ [Severity] [Dim]     │                                       │
│  │   Concrete consequence│                                      │
│  │   Expectation        │                                       │
│  │   Trigger            │                                       │
│  │   Defect             │                                       │
│  │   Evidence           │                                       │
│  │   Impact             │                                       │
│  │   Refutation         │                                       │
│  │   Remedy             │                                       │
│  │   Verification       │                                       │
│  └──────────────────────┘                                       │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

### 3.8 สรุป

**pm-ai-shipping** เป็นชุดเครื่องมือที่ออกแบบมาเพื่อแก้ปัญหาเฉพาะของโค้ดที่สร้างโดย AI — การขาดบันทึกเจตนา ปรัชญาหลักคือ **"agreement ระหว่างสองฝ่ายที่ข้ามขอบเขต"** ไม่ใช่การสแกนไฟล์ทีละไฟล์ ทำให้สามารถค้นหาข้อบกพร่องที่เครื่องมือทั่วไปมองไม่เห็น

**จุดแข็งหลัก:**
- มีวินัยในการ refutation ที่เข้มงวด
- มี forced probes สำหรับสองเลนส์ที่ reviewers พลาดบ่อยที่สุด
- มี independent unsteered review เป็น backstop
- มี OWASP Top 10 backstop สำหรับ security
- มี shipping packet ที่พร้อมสำหรับ human sign-off

**ข้อจำกัดหลัก:**
- ต้องการเอกสารเจตนาก่อน
- ใช้ทรัพยากรสูง
- เป็น static review เท่านั้น
- ผลลัพธ์เป็น findings ไม่ใช่ exploits

---

## 4. ออกแบบ Workflow

### 4.1 Workflow สำหรับทีมขนาดเล็ก (2-5 คน)

```
┌─────────────────────────────────────────────────────────────────┐
│              WORKFLOW: SMALL TEAM (2-5 PEOPLE)                   │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Sprint Start                                                    │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ 1. /document-app (ถ้าเอกสารหาย)                          │   │
│  │    → สร้าง architecture, flows, permissions, variables   │   │
│  └──────────────────────────────────────────────────────────┘   │
│                            │                                     │
│                            ▼                                     │
│  Development Phase                                               │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ 2. เขียนโค้ด (AI-assisted)                               │   │
│  │ 3. รัน /pm-ai-shipping:code-review dimensions=correctness│   │
│  │    scope=changes                                         │   │
│  └──────────────────────────────────────────────────────────┘   │
│                            │                                     │
│                            ▼                                     │
│  Pre-Release                                                     │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ 4. /ship-check the feature                               │   │
│  │    → รัน 8 ขั้นตอน (document → correctness → security   │   │
│  │      + performance → independent review → tests →       │   │
│  │      shipping packet)                                    │   │
│  └──────────────────────────────────────────────────────────┘   │
│                            │                                     │
│                            ▼                                     │
│  Release                                                         │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ 5. Human sign-off จาก shipping packet                    │   │
│  │ 6. Deploy                                                │   │
│  │ 7. /derive-tests → อัปเดต tests.md                       │   │
│  └──────────────────────────────────────────────────────────┘   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 4.2 Workflow สำหรับทีมขนาดกลาง-ใหญ่ (5-20 คน)

```
┌─────────────────────────────────────────────────────────────────┐
│           WORKFLOW: MEDIUM-LARGE TEAM (5-20 PEOPLE)              │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ PHASE 1: DOCUMENTATION (Sprint 0)                        │   │
│  │ • Fan out /document-app ด้วย parallel subagents          │   │
│  │ • 1 subagent ต่อ 1 core document                         │   │
│  │ • Reconcile cross-references                             │   │
│  │ • สร้าง tests.md ด้วย /derive-tests                       │   │
│  └──────────────────────────────────────────────────────────┘   │
│                            │                                     │
│                            ▼                                     │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ PHASE 2: DEVELOPMENT (Sprint 1-N)                        │   │
│  │ • เขียนโค้ด (AI-assisted)                                │   │
│  │ • รัน code-review dimensions=correctness ทุก PR          │   │
│  │ • Fan out over flows, never over files                   │   │
│  │ • 1 worker ต่อ 1 bounded flow                            │   │
│  │ • Workers return candidates + evidence + refutations     │   │
│  └──────────────────────────────────────────────────────────┘   │
│                            │                                     │
│                            ▼                                     │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ PHASE 3: PRE-RELEASE (Release candidate)                 │   │
│  │ • รัน /ship-check แบบเต็ม                                │   │
│  │ • Security audit + Performance audit ขนานกัน             │   │
│  │ • Independent unsteered review (Codex)                   │   │
│  │ • Verify every finding by hand                           │   │
│  │ • Compile shipping packet                                │   │
│  └──────────────────────────────────────────────────────────┘   │
│                            │                                     │
│                            ▼                                     │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ PHASE 4: RELEASE & MONITORING                            │   │
│  │ • Human sign-off                                         │   │
│  │ • Deploy                                                 │   │
│  │ • Monitor with observability                             │   │
│  │ • Update tests.md with regression tests                  │   │
│  │ • Feed findings back to next sprint                      │   │
│  └──────────────────────────────────────────────────────────┘   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 4.3 Workflow สำหรับ Continuous Deployment

```
┌─────────────────────────────────────────────────────────────────┐
│              WORKFLOW: CONTINUOUS DEPLOYMENT                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ทุก PR                                                         │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ 1. Deterministic tests (unit + integration)              │   │
│  │ 2. /pm-ai-shipping:code-review dimensions=correctness    │   │
│  │    scope=changes                                         │   │
│  │ 3. Green-before-merge gate                               │   │
│  └──────────────────────────────────────────────────────────┘   │
│                            │                                     │
│                            ▼                                     │
│  ทุกสัปดาห์                                                      │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ 4. /performance-audit-static (specific areas)            │   │
│  │ 5. /security-audit-static (specific areas)               │   │
│  │ 6. Review findings และ prioritize                        │   │
│  └──────────────────────────────────────────────────────────┘   │
│                            │                                     │
│                            ▼                                     │
│  ทุก Release                                                     │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ 7. /ship-check แบบเต็ม                                   │   │
│  │ 8. Independent unsteered review                          │   │
│  │ 9. Shipping packet → human sign-off                      │   │
│  │ 10. Deploy                                               │   │
│  └──────────────────────────────────────────────────────────┘   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 5. Case Study

### Case Study 1: SaaS Startup — การใช้ ship-check ก่อน Series A

**บริบท:**
- Startup ขนาด 8 คน
- ผลิตภัณฑ์: B2B SaaS สำหรับการจัดการโครงการ
- โค้ดสร้างโดย AI เป็นส่วนใหญ่ (vibe-coded)
- กำลังเตรียมระดมทุน Series A
- นักลงทุนขอ technical due diligence

**ปัญหา:**
- ไม่มีเอกสารระบบ
- ไม่มีใครรู้ว่าใครมีสิทธิ์ทำอะไร
- มี bug ที่หาไม่เจอ
- Performance ช้าเมื่อข้อมูลเยอะ

**การแก้ไข:**

1. **รัน `/document-app`** — ใช้เวลา 2 วัน
   - พบว่า `permissions.md` ไม่มีอยู่จริง → ต้อง reverse-engineer จากโค้ด
   - พบว่า RLS ถูกปิดในบางตาราง แต่โค้ดไม่ได้ enforce authorization
   - พบว่า secrets บางตัวถูก bundle ไปฝั่ง client

2. **รัน `/ship-check`** — ใช้เวลา 5 วัน
   - **Correctness:** พบ 12 findings รวมถึง:
     - Authority reconciliation: ค่า requested ยังคง drive UI หลังจาก authority return ค่าที่ต่างออกไป
     - Identity correlation: ใช้ array index เป็น key ในการ join ผลลัพธ์
     - Representation loss: `null` กับ `undefined` ถูก treat เหมือนกัน
   - **Security:** พบ 8 findings รวมถึง:
     - Service-role key ถูกใช้ในที่ที่ไม่ควร
     - Endpoint ที่ gate ด้วย `?source=cron` โดยไม่มี auth
     - Prompt injection ใน AI feature
   - **Performance:** พบ 5 findings รวมถึง:
     - N+1 query ใน dashboard
     - Missing index บน hot table
     - ไม่มี pagination ใน list view

3. **Independent review (Codex)** — พบ 3 findings เพิ่มเติมที่ audits ไม่พบ

4. **`/derive-tests`** — สร้าง tests.md
   - Existing coverage: 15 rules
   - Proposed tests: 42 cases
   - Gaps: 8 documented rules ที่ไม่มี verification

**ผลลัพธ์:**
- ผ่าน technical due diligence
- ระดมทุน Series A ได้สำเร็จ
- ลด production incidents ลง 70%
- เวลาในการ onboard developer ใหม่ลดลง 50%

**บทเรียน:**
- การลงทุนในเอกสารเจตนาตั้งแต่ต้นคุ้มค่ามาก
- Independent unsteered review เป็นขั้นตอนที่มี yield สูงที่สุด
- Security audit แบบ static สามารถพบปัญหาที่ penetration test มองไม่เห็น

---

### Case Study 2: Enterprise — การใช้ pm-data-analytics ในการตัดสินใจ

**บริบท:**
- บริษัท enterprise ขนาด 500+ คน
- ผลิตภัณฑ์: E-commerce platform
- กำลังตัดสินใจว่าจะเปลี่ยน checkout flow หรือไม่
- มี A/B test running อยู่

**ปัญหา:**
- A/B test แสดงผลลัพธ์ที่ขัดแย้ง
- PM ไม่แน่ใจว่าจะ ship หรือไม่
- ไม่มีใครเข้าใจ statistical significance

**การแก้ไข:**

1. **รัน `/analyze-test`**
   - Control: 4.2% conversion (n=5000)
   - Variant: 4.8% conversion (n=5100)
   - **ผลลัพธ์:**
     - Relative lift: +14.3%
     - P-value: 0.03
     - Statistically significant: Yes (p < 0.05)
     - **แต่:** Sample size check พบว่า underpowered สำหรับ MDE ที่ต้องการ
     - **และ:** Guardrail metrics (revenue per user) ลดลง 8%
     - **คำแนะนำ:** INVESTIGATE ไม่ใช่ SHIP

2. **รัน `/analyze-cohorts`**
   - แบ่ง cohort ตาม acquisition channel
   - พบว่า variant ดีกว่าสำหรับ organic traffic แต่แย่กว่าสำหรับ paid traffic
   - พบว่า novelty effect กำลังหมดไป

3. **ตัดสินใจ:** ไม่ ship variant, ทำการทดสอบใหม่กับ segment ที่เฉพาะเจาะจง

**ผลลัพธ์:**
- หลีกเลี่ยงการ ship variant ที่จะทำรายได้ลดลง 8%
- เข้าใจว่า variant ดีเฉพาะบาง segment
- ออกแบบ test ใหม่ที่เฉพาะเจาะจงมากขึ้น

**บทเรียน:**
- Statistical significance ≠ practical significance
- ต้องตรวจสอบ guardrail metrics เสมอ
- Cohort analysis สามารถเปิดเผย insights ที่ aggregate data ซ่อนไว้

---

### Case Study 3: PM Execution — การใช้ pre-mortem และ red-team

**บริบท:**
- ทีมผลิตภัณฑ์ขนาด 6 คน
- กำลังจะ launch feature ใหม่ (AI-powered recommendations)
- Timeline: 6 สัปดาห์
- ความเสี่ยงสูงเพราะเป็น feature แรกที่ใช้ AI

**การแก้ไข:**

1. **รัน `/write-prd`** — สร้าง PRD 8 sections
   - ระบุ objectives, success metrics, non-goals
   - ระบุ target users และ segments
   - ระบุ user stories และ acceptance criteria

2. **รัน `/pre-mortem`** — วิเคราะห์ความเสี่ยง
   - **Tigers (7):**
     - AI model ให้คำแนะนำที่ไม่relevant
     - Latency สูงเกินไป
     - ไม่มี fallback เมื่อ AI ล่ม
     - Privacy concerns
     - Regulatory issues
     - Cost per recommendation สูงเกินไป
     - ไม่มี kill switch
   - **Paper Tigers (3):**
     - User จะไม่เข้าใจ recommendations
     - จะต้อง retrain model บ่อยเกินไป
     - จะต้องใช้ GPU มากเกินไป
   - **Elephants (2):**
     - ทีมไม่แน่ใจว่า AI model มี bias หรือไม่
     - ไม่มีใครรู้ว่าจะ handle edge cases อย่างไร

3. **รัน `/red-team-prd`** — โจมตี load-bearing assumptions
   - **Top Kill-Assumptions (5):**
     1. **Claim:** Users want AI recommendations
        - **Fails if:** Users ต้องการ manual control มากกว่า
        - **Cheapest test:** Survey 50 users
        - **Kill criterion:** <60% สนใจ
     2. **Claim:** AI model มีคุณภาพเพียงพอ
        - **Fails if:** Precision <70%
        - **Cheapest test:** Offline evaluation
        - **Kill criterion:** Precision <70%
     3. **Claim:** Latency ยอมรับได้
        - **Fails if:** >500ms
        - **Cheapest test:** Load test
        - **Kill criterion:** p95 >500ms
     4. **Claim:** Cost per recommendation <$0.01
        - **Fails if:** >$0.01
        - **Cheapest test:** Cost analysis
        - **Kill criterion:** >$0.01
     5. **Claim:** ไม่มี regulatory issues
        - **Fails if:** ต้อง disclose AI usage
        - **Cheapest test:** Legal review
        - **Kill criterion:** ต้อง disclosure ที่กระทบ UX

4. **ตัดสินใจ:**
   - Delay launch 2 สัปดาห์
   - ทำ offline evaluation ก่อน
   - สร้าง fallback mechanism
   - เพิ่ม kill switch
   - ทำ legal review

**ผลลัพธ์:**
- Launch สำเร็จหลัง 8 สัปดาห์
- Precision 82% (สูงกว่า target 70%)
- Latency p95: 320ms
- Cost per recommendation: $0.003
- ไม่มี regulatory issues
- User satisfaction: 4.2/5

**บทเรียน:**
- Pre-mortem และ red-team สามารถป้องกันความล้มเหลวก่อน launch
- การลงทุนในความเสี่ยงตั้งแต่ต้นคุ้มค่ามาก
- Elephants เป็น output ที่มีค่าที่สุด

---

## 6. โครงสร้าง

### 6.1 โครงสร้างคืออะไร

**โครงสร้างของ pm-ai-shipping** ประกอบด้วย 3 ชั้น:

#### ชั้นที่ 1: Skills (ทักษะ)

```
pm-ai-shipping/
├── skills/
│   ├── shipping-artifacts/     # เอกสารที่ทำให้แอป reviewable
│   │   └── SKILL.md
│   ├── code-review/             # การตรวจสอบโค้ด
│   │   ├── SKILL.md
│   │   └── references/
│   │       ├── correctness-taxonomy.md
│   │       ├── performance-review.md
│   │       └── security-review.md
│   └── intended-vs-implemented/ # ช่องว่างระหว่างเจตนากับการ implement
│       └── SKILL.md
```

#### ชั้นที่ 2: Commands (คำสั่ง)

```
pm-ai-shipping/
├── commands/
│   ├── ship-check.md            # ลำดับการ shipping ทั้งหมด
│   ├── document-app.md          # สร้างเอกสารระบบ
│   ├── derive-tests.md          # สร้างแผนที่การทดสอบ
│   ├── security-audit-static.md # ตรวจสอบความปลอดภัย
│   └── performance-audit-static.md # ตรวจสอบประสิทธิภาพ
```

#### ชั้นที่ 3: Documentation (เอกสารที่ผลิต)

```
documentation/
├── architecture.md      # ภาพรวมระบบ
├── flows.md             # เส้นทางของผู้ใช้
├── permissions.md       # สิทธิ์การเข้าถึง
├── variables.md         # config และ secrets
├── tests.md             # แผนที่การทดสอบ
├── emails.md            # (conditional)
├── cron.md              # (conditional)
├── seo.md               # (conditional)
└── automation.md        # (conditional)
```

#### ชั้นที่ 4: Reports (รายงานที่ผลิต)

```
reports/
├── security_audit_{timestamp}.md
├── performance_audit_{timestamp}.md
└── test_plan_{timestamp}.md
```

### 6.2 โครงสร้างทำงานอย่างไร

#### การไหลของข้อมูล

```
┌─────────────────────────────────────────────────────────────────┐
│                    DATA FLOW                                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Codebase                                                        │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ Source code, tests, migrations, config                   │   │
│  └──────────────────────┬───────────────────────────────────┘   │
│                         │                                        │
│                         ▼                                        │
│  /document-app                                                   │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ Reverse-engineer → documentation/*.md                    │   │
│  │ • architecture.md                                        │   │
│  │ • flows.md                                               │   │
│  │ • permissions.md                                         │   │
│  │ • variables.md                                           │   │
│  │ • (conditional docs)                                     │   │
│  └──────────────────────┬───────────────────────────────────┘   │
│                         │                                        │
│                         ▼                                        │
│  /derive-tests                                                   │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ Derive → documentation/tests.md                          │   │
│  │ • Existing coverage                                      │   │
│  │ • Proposed tests                                         │   │
│  │ • Gaps                                                   │   │
│  └──────────────────────┬───────────────────────────────────┘   │
│                         │                                        │
│                         ▼                                        │
│  /ship-check                                                     │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ Orchestrate:                                             │   │
│  │ • code-review (correctness)                              │   │
│  │ • security-audit-static                                  │   │
│  │ • performance-audit-static                               │   │
│  │ • independent unsteered review                           │   │
│  └──────────────────────┬───────────────────────────────────┘   │
│                         │                                        │
│                         ▼                                        │
│  Shipping Packet                                                 │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ • Documentation Inventory                                │   │
│  │ • Agent Context                                          │   │
│  │ • Test Coverage                                          │   │
│  │ • Correctness Summary                                    │   │
│  │ • Security Summary                                       │   │
│  │ • Performance Summary                                    │   │
│  │ • Independent Review                                     │   │
│  │ • Audit Provenance                                       │   │
│  │ • Launch Blockers                                        │   │
│  │ • Recommended Next Actions                               │   │
│  └──────────────────────────────────────────────────────────┘   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### ความสัมพันธ์ระหว่าง Components

```
┌─────────────────────────────────────────────────────────────────┐
│              COMPONENT RELATIONSHIPS                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  shipping-artifacts ◄─────── ผลิตเอกสาร ───────► documentation/ │
│         │                                              │         │
│         │                                              │         │
│         ▼                                              ▼         │
│  intended-vs-implemented ◄── เปรียบเทียบ ────► code-review     │
│         │                                              │         │
│         │                                              │         │
│         ▼                                              ▼         │
│  security-audit-static ◄── ใช้ ────► correctness-taxonomy       │
│         │                                              │         │
│         │                                              │         │
│         ▼                                              ▼         │
│  performance-audit-static ◄── ใช้ ────► performance-review      │
│         │                                              │         │
│         │                                              │         │
│         ▼                                              ▼         │
│  derive-tests ◄── ใช้ ────► documentation/tests.md              │
│         │                                              │         │
│         │                                              │         │
│         ▼                                              ▼         │
│  ship-check ◄── ประสาน ────► shipping packet                    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 6.3 โครงสร้างการใช้งาน

#### การใช้งานตามลำดับ

```
1. /document-app
   ↓
2. /derive-tests
   ↓
3. /pm-ai-shipping:code-review dimensions=correctness
   ↓
4. /security-audit-static
   ↓
5. /performance-audit-static
   ↓
6. Independent unsteered review (Codex)
   ↓
7. /ship-check (รวมทุกอย่าง)
```

#### การใช้งานแบบ Modular

| ต้องการ | ใช้ |
|---|---|
| เอกสารระบบ | `/document-app` |
| แผนที่การทดสอบ | `/derive-tests` |
| ตรวจสอบความถูกต้อง | `/pm-ai-shipping:code-review dimensions=correctness` |
| ตรวจสอบความปลอดภัย | `/security-audit-static` |
| ตรวจสอบประสิทธิภาพ | `/performance-audit-static` |
| ตรวจสอบทั้งหมด | `/ship-check` |
| วิเคราะห์ A/B test | `/analyze-test` |
| วิเคราะห์ cohort | `/analyze-cohorts` |
| สร้าง SQL | `/write-query` |
| สร้าง PRD | `/write-prd` |
| วางแผน OKR | `/plan-okrs` |
| Pre-mortem | `/pre-mortem` |
| Red-team | `/red-team-prd` |
| Stakeholder map | `/stakeholder-map` |
| Sprint planning | `/sprint plan` |
| Retro | `/sprint retro` |
| Release notes | `/sprint release-notes` |

#### การใช้งานร่วมกับ PM Execution

```
Product Discovery
  ├── /write-prd
  ├── /red-team-prd
  └── /pre-mortem
       │
       ▼
Sprint Planning
  ├── /plan-okrs
  ├── /write-stories
  └── /sprint plan
       │
       ▼
Development
  ├── /generate-data
  ├── /test-scenarios
  └── /pm-ai-shipping:code-review
       │
       ▼
Pre-Release
  ├── /ship-check
  └── /security-audit-static
       │
       ▼
Release
  ├── /sprint release-notes
  └── /analyze-test
       │
       ▼
Retro
  ├── /sprint retro
  └── /analyze-cohorts
```

### 6.4 สรุป

โครงสร้างของ pm-ai-shipping ประกอบด้วย 4 ชั้น:
1. **Skills** — ทักษะหลัก 3 อย่าง
2. **Commands** — คำสั่ง 5 อย่าง
3. **Documentation** — เอกสารที่ผลิต (core + conditional)
4. **Reports** — รายงานที่ผลิต

การไหลของข้อมูลเริ่มจาก codebase → documentation → audits → shipping packet

ความสัมพันธ์ระหว่าง components เป็นแบบพึ่งพาซึ่งกันและกัน โดย `shipping-artifacts` เป็นรากฐาน, `code-review` เป็นแกนหลัก, และ `ship-check` เป็นตัวประสาน

---

## 7. แนวทางการประยุกต์ใช้

### 7.1 สำหรับ PM / Founder

#### การใช้ในแต่ละระยะของผลิตภัณฑ์

| ระยะ | กิจกรรม | เครื่องมือ |
|---|---|---|
| **Idea** | ระบุปัญหา, ตั้งสมมติฐาน | `/write-prd`, `/red-team-prd` |
| **Discovery** | วิจัยผู้ใช้, กำหนด scope | `/write-prd`, `/pre-mortem` |
| **Planning** | วางแผน sprint, OKR | `/plan-okrs`, `/sprint plan` |
| **Development** | ตรวจสอบโค้ดระหว่างพัฒนา | `/pm-ai-shipping:code-review` |
| **Pre-Release** | ตรวจสอบทั้งหมด | `/ship-check` |
| **Release** | สื่อสาร, วัดผล | `/sprint release-notes`, `/analyze-test` |
| **Post-Release** | วิเคราะห์, ปรับปรุง | `/analyze-cohorts`, `/sprint retro` |

#### หลักการสำคัญ

1. **Document first, audit later** — สร้างเอกสารเจตนาก่อนเสมอ
2. **Correctness is the core** — เริ่มจากความถูกต้องก่อน
3. **Force a violating execution** — อย่าหยุดที่ข้อสงสัย
4. **Refute before reporting** — ลด noise
5. **Independent review เป็น backstop** — ใช้โมเดลที่สอง
6. **Tests are the operational form of intent** — ทำให้เจตนาเป็นรูปธรรม

### 7.2 สำหรับ Engineering Team

#### การ integrate เข้ากับ CI/CD

```yaml
# .github/workflows/ship-check.yml
name: Ship Check

on:
  pull_request:
    branches: [main]

jobs:
  correctness:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run correctness review
        run: |
          # รัน code-review dimensions=correctness
          # scope=changes
          # ผ่าน Claude Code plugin

  security:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run security audit
        run: |
          # รัน security-audit-static

  performance:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run performance audit
        run: |
          # รัน performance-audit-static

  tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run deterministic tests
        run: |
          npm test
          # หรือ pytest, go test, etc.

  gate:
    needs: [correctness, security, performance, tests]
    runs-on: ubuntu-latest
    steps:
      - name: Green-before-merge gate
        run: echo "All checks passed"
```

#### หลักการสำคัญ

1. **Fan out over flows, never over files** — แบ่งงานตาม flows
2. **One model, name it on every worker** — ใช้โมเดลเดียวกัน
3. **Tell workers they are reading, not editing** — ห้ามแก้โค้ด
4. **Verify citations** — เปิดไฟล์ที่อ้างอิงทุกครั้ง
5. **Deduplicate by violated agreement** — ไม่ใช่ by file

### 7.3 สำหรับ Data Team

#### การ integrate pm-data-analytics

```python
# ตัวอย่าง: การใช้ cohort analysis
import pandas as pd

# โหลดข้อมูล
df = pd.read_csv('user_activity.csv')

# สร้าง cohort table
cohort_table = df.pivot_table(
    index='cohort_month',
    columns='period_number',
    values='user_id',
    aggfunc='nunique'
)

# คำนวณ retention rate
retention = cohort_table.div(cohort_table[0], axis=0)

# สร้าง heatmap
import seaborn as sns
sns.heatmap(retention, annot=True, fmt='.0%')
```

#### หลักการสำคัญ

1. **Retention event must be meaningful** — ไม่ใช่แค่ "logged in"
2. **Check guardrail metrics** — ไม่ใช่แค่ primary metric
3. **Statistical significance ≠ practical significance**
4. **Cohort analysis only as good as cohort definition**
5. **Novelty effects can inflate short-term results**

### 7.4 สำหรับทีมที่ใช้ AI Agents

#### การใช้ automation.md

```
automation.md ต้อง capture:
├── Per automation/agent:
│   ├── Trigger + owner
│   ├── Automatic หรือ approval-only
│   ├── Inputs ที่อ่านได้
│   ├── Tools/APIs ที่เรียกได้ (tool surface)
│   ├── Steering (prompt) vs. hard guardrails
│   ├── Output contract (schema, validation)
│   ├── App-owned side effects vs. agent-owned suggestions
│   └── Controls: approval gates, audit logging, rate limits,
│       retries, kill switch
```

#### หลักการสำคัญ

1. **Model เป็นทั้ง sink และ source** — ระวัง prompt injection
2. **Untrusted content reaching LLM prompt** — เป็นความเสี่ยง
3. **Attacker text driving privileged tool call** — confused deputy
4. **Unvalidated LLM output flowing to downstream sink** — SQL, shell, HTML
5. **Tool surface เป็น hard guardrail** — จำกัดสิ่งที่ agent เรียกได้

---

## 8. กรณีตัวอย่างจากประสบการณ์

### 8.1 ประสบการณ์ที่ 1: การค้นพบ Authority Reconciliation Bug

**สถานการณ์:**
ทีมพัฒนาระบบ payment processing ที่มี API endpoint สำหรับอัปเดตจำนวนเงิน

**โค้ด:**
```python
@app.post("/update-amount")
def update_amount(request):
    # รับค่าที่ร้องขอ
    requested_amount = request.json["amount"]
    
    # ตรวจสอบกับ payment provider
    result = payment_provider.update(requested_amount)
    
    # ❌ BUG: ใช้ requested_amount แทน result.applied_amount
    db.save_transaction(
        user_id=request.user_id,
        amount=requested_amount,  # ← ควรเป็น result.applied_amount
        status="completed"
    )
    
    # ❌ BUG: ส่งค่าที่ร้องอกลับไป
    return {"amount": requested_amount}  # ← ควรเป็น result.applied_amount
```

**การค้นพบ:**
- ใช้ **Lens 1: Authority Reconciliation**
- **Probe:** สร้าง execution ที่ effective answer ต่างจาก requested
- พบว่า payment provider สามารถปรับ amount ได้ (เช่น currency conversion, rounding)
- แต่ DB และ UI ยังคงแสดง requested_amount

**ผลกระทบ:**
- ยอดเงินใน DB ไม่ตรงกับยอดจริง
- ลูกค้าเห็นยอดที่ไม่ถูกต้อง
- การกระทบยอดบัญชีล้มเหลว

**การแก้ไข:**
```python
@app.post("/update-amount")
def update_amount(request):
    requested_amount = request.json["amount"]
    result = payment_provider.update(requested_amount)
    
    # ✅ ใช้ค่าที่ authority return
    db.save_transaction(
        user_id=request.user_id,
        amount=result.applied_amount,  # ✅
        status="completed"
    )
    
    return {"amount": result.applied_amount}  # ✅
```

**บทเรียน:**
- "A requested value is not an applied value"
- ต้อง reconcile ก่อน consequential use แรก
- Lens 1 เป็นหนึ่งในสองเลนส์ที่ reviewers พลาดบ่อยที่สุด

---

### 8.2 ประสบการณ์ที่ 2: การค้นพบ Identity Correlation Bug

**สถานการณ์:**
ทีมพัฒนาระบบ notification ที่มี queue สำหรับส่ง email

**โค้ด:**
```typescript
async function processNotifications() {
  const notifications = await db.getPendingNotifications();
  
  // ❌ BUG: ใช้ array index เป็น correlation key
  const results = await Promise.all(
    notifications.map((n, index) => 
      sendEmail(n.email, n.template)
        .then(() => ({ index, status: 'sent' }))
        .catch(() => ({ index, status: 'failed' }))
    )
  );
  
  // ❌ BUG: ใช้ index ในการ update
  for (const result of results) {
    await db.updateNotification(
      notifications[result.index].id,  // ← index อาจเปลี่ยน
      result.status
    );
  }
}
```

**การค้นพบ:**
- ใช้ **Lens 2: Identity and Correlation**
- **Probe:** รันสอง operations พร้อมกันและ complete out of order
- พบว่า `Promise.all` ไม่รับประกันลำดับ
- พบว่า index อาจไม่ตรงกับ notification ที่แท้จริง
- พบว่าถ้ามีการลบ notification ระหว่างทาง index จะเปลี่ยน

**ผลกระทบ:**
- Notification ถูก update ผิดอัน
- Email ถูกส่งซ้ำ
- ลูกค้าได้รับ email ที่ไม่ถูกต้อง

**การแก้ไข:**
```typescript
async function processNotifications() {
  const notifications = await db.getPendingNotifications();
  
  // ✅ ใช้ ID เป็น correlation key
  const results = await Promise.all(
    notifications.map(async (n) => {
      try {
        await sendEmail(n.email, n.template);
        return { id: n.id, status: 'sent' };  // ✅ ใช้ id
      } catch {
        return { id: n.id, status: 'failed' };  // ✅ ใช้ id
      }
    })
  );
  
  // ✅ ใช้ id ในการ update
  for (const result of results) {
    await db.updateNotification(result.id, result.status);
  }
}
```

**บทเรียน:**
- Label, index, position, arrival order เป็น correlation key ที่ไม่เสถียร
- ต้องใช้ key ที่ unique, stable, และ live นานพอ
- Lens 2 เป็นอีกหนึ่งเลนส์ที่ reviewers พลาดบ่อยที่สุด

---

### 8.3 ประสบการณ์ที่ 3: การค้นพบ Silent Failure

**สถานการณ์:**
ทีมพัฒนาระบบ backup ที่รันทุกคืน

**โค้ด:**
```python
def backup_database():
    try:
        db.backup()
        logger.info("Backup completed")
        return True
    except Exception as e:
        logger.error(f"Backup failed: {e}")
        return False

# Scheduler
def run_backup():
    result = backup_database()
    # ❌ BUG: ไม่มีใครตรวจสอบ result
    # ❌ BUG: ไม่มี alert
    # ❌ BUG: ไม่มี monitoring
```

**การค้นพบ:**
- ใช้ **Lens 13: Verification and Observability**
- **Probe:** สำหรับแต่ละ guarantee ที่ระบบอ้าง ให้ระบุ observation ที่จะพังถ้าหยุด
- พบว่าไม่มี observation ใด ๆ ที่จะตรวจจับ backup failure
- พบว่า backup ล้มเหลวมา 3 สัปดาห์โดยไม่มีใครรู้

**ผลกระทบ:**
- ไม่มี backup ที่ใช้ได้
- ถ้า database ล่ม จะกู้คืนไม่ได้
- ความเสียหายมหาศาล

**การแก้ไข:**
```python
def backup_database():
    try:
        db.backup()
        logger.info("Backup completed")
        # ✅ อัปเดต metric
        metrics.increment("backup.success")
        # ✅ ส่ง heartbeat
        heartbeat.send("backup")
        return True
    except Exception as e:
        logger.error(f"Backup failed: {e}")
        # ✅ อัปเดต metric
        metrics.increment("backup.failure")
        # ✅ ส่ง alert
        alert.send("Backup failed", str(e))
        return False

# Scheduler
def run_backup():
    result = backup_database()
    if not result:
        # ✅ Escalate
        escalate_to_oncall()
```

**บทเรียน:**
- "A step that always passes is not a passing step"
- ต้องมี observation ที่จะ break ถ้า guarantee หยุด
- Silent failure หายากใน planted corpora แต่พบบ่อยใน real fix histories
- Lens 13 มีอยู่เพราะช่องว่างในหลักฐาน

---

### 8.4 ประสบการณ์ที่ 4: การใช้ Pre-mortem ป้องกันความล้มเหลว

**สถานการณ์:**
ทีมกำลังจะ launch feature AI-powered search

**การใช้ /pre-mortem:**

**Tigers (Real Risks):**
1. **AI model ให้ผลลัพธ์ที่ไม่ relevant** — Likelihood: High, Impact: High
   - Mitigation: Offline evaluation ก่อน launch
   - Owner: ML Engineer
   - Deadline: 1 สัปดาห์ก่อน launch

2. **Latency สูงเกินไป** — Likelihood: Medium, Impact: High
   - Mitigation: Load test, caching
   - Owner: Backend Engineer
   - Deadline: 2 สัปดาห์ก่อน launch

3. **ไม่มี fallback เมื่อ AI ล่ม** — Likelihood: Medium, Impact: Critical
   - Mitigation: สร้าง fallback เป็น keyword search
   - Owner: Backend Engineer
   - Deadline: 1 สัปดาห์ก่อน launch

4. **Privacy concerns** — Likelihood: Medium, Impact: High
   - Mitigation: Legal review, data anonymization
   - Owner: Legal + PM
   - Deadline: 3 สัปดาห์ก่อน launch

5. **Regulatory issues** — Likelihood: Low, Impact: Critical
   - Mitigation: Legal review
   - Owner: Legal
   - Deadline: 4 สัปดาห์ก่อน launch

6. **Cost per search สูงเกินไป** — Likelihood: Medium, Impact: Medium
   - Mitigation: Cost analysis, optimization
   - Owner: ML Engineer
   - Deadline: 2 สัปดาห์ก่อน launch

7. **ไม่มี kill switch** — Likelihood: Low, Impact: Critical
   - Mitigation: สร้าง kill switch
   - Owner: Backend Engineer
   - Deadline: 1 สัปดาห์ก่อน launch

**Elephants (Unspoken Worries):**
1. **ทีมไม่แน่ใจว่า AI model มี bias หรือไม่**
   - Investigation: Bias audit
   - Owner: ML Engineer + PM

2. **ไม่มีใครรู้ว่าจะ handle edge cases อย่างไร**
   - Investigation: Edge case analysis
   - Owner: PM + Engineering

**ผลลัพธ์:**
- Delay launch 2 สัปดาห์
- ทำ offline evaluation → precision 82%
- สร้าง fallback → ลดความเสี่ยง
- Legal review → ไม่มี regulatory issues
- สร้าง kill switch → พร้อมสำหรับ incident

**บทเรียน:**
- Pre-mortem สามารถป้องกันความล้มเหลวก่อน launch
- Elephants เป็น output ที่มีค่าที่สุด
- ควรทำ pre-mortem เมื่อแผนเสร็จ 80% — เร็วพอที่จะเปลี่ยน, ช้าพอที่จะมี substance

---

## 9. การนำไปใช้งานจริง

### 9.1 แผนการนำไปใช้สำหรับองค์กร

#### ระยะที่ 1: Preparation (สัปดาห์ที่ 1-2)

```
□ ติดตั้ง pm-ai-shipping plugin
□ ฝึกอบรมทีมเกี่ยวกับ concepts:
  □ Agreement, boundary, refutation
  □ Correctness taxonomy (13 lenses)
  □ Security audit (trust boundaries, sinks)
  □ Performance audit (N+1, over-fetch, indexes)
□ เตรียม environment:
  □ Claude Code
  □ Codex (สำหรับ independent review)
  □ CI/CD pipeline
```

#### ระยะที่ 2: Documentation (สัปดาห์ที่ 3-4)

```
□ รัน /document-app สำหรับ repo หลัก
□ สร้าง core docs:
  □ architecture.md
  □ flows.md
  □ permissions.md
  □ variables.md
□ สร้าง conditional docs (ตามความเหมาะสม)
□ รัน /derive-tests
□ สร้าง tests.md
□ Review และ approve เอกสาร
```

#### ระยะที่ 3: Pilot (สัปดาห์ที่ 5-8)

```
□ เลือก 1-2 features สำหรับ pilot
□ รัน /ship-check แบบเต็ม
□ เก็บผลลัพธ์และ feedback
□ ปรับปรุงกระบวนการ
□ สร้าง playbook สำหรับทีม
```

#### ระยะที่ 4: Rollout (สัปดาห์ที่ 9-12)

```
□ ขยายไปยังทีมอื่น
□ Integrate เข้ากับ CI/CD
□ สร้าง monitoring dashboard
□ กำหนด SLA สำหรับ audits
□ สร้าง on-call rotation สำหรับ findings
```

#### ระยะที่ 5: Continuous Improvement (หลังจากนั้น)

```
□ Review findings ทุก sprint
□ อัปเดตเอกสารทุก release
□ ปรับปรุง tests ตาม findings
□ ฝึกอบรมทีมใหม่
□ วัดผลและปรับปรุง
```

### 9.2 KPIs สำหรับวัดความสำเร็จ

| KPI | Target | Measurement |
|---|---|---|
| **Documentation coverage** | 100% ของ core docs | ตรวจสอบ `documentation/` |
| **Test coverage** | >80% ของ documented rules | ตรวจสอบ `tests.md` |
| **Findings per release** | <5 High/Critical | Shipping packet |
| **Time to document** | <1 sprint | วัดจาก `/document-app` |
| **Time to ship-check** | <1 สัปดาห์ | วัดจาก `/ship-check` |
| **Production incidents** | ลดลง 50% | Monitoring |
| **Onboarding time** | ลดลง 50% | วัดจาก developer ใหม่ |
| **Reviewer confidence** | >4/5 | Survey |

### 9.3 บทบาทและความรับผิดชอบ

| บทบาท | ความรับผิดชอบ |
|---|---|
| **PM / Founder** | กำหนด scope, approve findings, sign off shipping packet |
| **Tech Lead** | รัน audits, verify findings, remediate |
| **Engineer** | แก้ไข findings, เขียน tests, อัปเดตเอกสาร |
| **QA** | รัน test scenarios, verify fixes |
| **Security Engineer** | Review security findings, remediate |
| **Data Analyst** | วิเคราะห์ A/B tests, cohort analysis |

### 9.4 ตัวอย่าง Playbook

```
SHIP-CHECK PLAYBOOK
====================

ก่อน Release:
1. □ รัน /document-app (ถ้าเอกสารเก่า)
2. □ รัน /derive-tests
3. □ รัน /ship-check
4. □ Review shipping packet
5. □ Address launch blockers
6. □ Human sign-off

ระหว่าง Development:
1. □ รัน code-review ทุก PR
2. □ Fix findings ทันที
3. □ อัปเดต tests

หลัง Release:
1. □ Monitor production
2. □ รัน /analyze-test (ถ้ามี A/B test)
3. □ รัน /analyze-cohorts (ถ้ามี user data)
4. □ อัปเดตเอกสาร
5. □ Sprint retro

Emergency:
1. □ รัน security-audit-static (ถ้าสงสัย)
2. □ รัน performance-audit-static (ถ้าช้า)
3. □ Escalate to on-call
```

---

## 10. ปัญหาและแนวทางแก้ไข

### 10.1 ปัญหาที่พบบ่อย

#### ปัญหาที่ 1: เอกสารหายหรือเก่า

**อาการ:**
- `documentation/` ไม่มี
- เอกสารไม่ตรงกับโค้ด
- ไม่มีใครรู้ว่าใครมีสิทธิ์ทำอะไร

**สาเหตุ:**
- ไม่ได้ document ตั้งแต่ต้น
- โค้ดเปลี่ยนแปลงแต่เอกสารไม่ update
- ไม่มี ownership

**แนวทางแก้ไข:**
1. รัน `/document-app` ทันที
2. สร้าง ownership สำหรับแต่ละเอกสาร
3. Integrate การอัปเดตเอกสารเข้ากับ PR process
4. กำหนด "definition of done" ให้รวมถึงการอัปเดตเอกสาร
5. รัน `/derive-tests` เพื่อตรวจสอบว่าเอกสารตรงกับ tests

---

#### ปัญหาที่ 2: Findings เยอะเกินไป

**อาการ:**
- รัน ship-check แล้วได้ 50+ findings
- ทีม overwhelmed
- ไม่รู้ว่าจะเริ่มจากไหน

**สาเหตุ:**
- Scope กว้างเกินไป
- ขาด refutation discipline
- ไม่ได้ prioritize

**แนวทางแก้ไข:**
1. จำกัด scope — ทำทีละ flow
2. ใช้ refutation อย่างเข้มงวด — drop findings ที่ไม่มีหลักฐาน
3. จัดลำดับตาม severity และ impact
4. จำกัด findings ต่อรอบ — "ถ้ามากกว่า 12 findings ให้ consolidate by root-cause theme"
5. ทำความสะอาด findings ทีละ batch

---

#### ปัญหาที่ 3: False Positives

**อาการ:**
- Findings ที่ไม่ใช่ปัญหาจริง
- เสียเวลา investigate
- ทีมเริ่มไม่เชื่อถือ audits

**สาเหตุ:**
- ขาด refutation
- ไม่ได้ verify citations
- ไม่เข้าใจ context

**แนวทางแก้ไข:**
1. ใช้ refutation discipline อย่างเข้มงวด
2. Verify citations ทุกครั้ง — เปิดไฟล์ที่อ้างอิง
3. ใช้ absorption rule: "Absorption is not prevention"
4. ใช้ "it works nearly always" rule: "describes a race, not a refutation"
5. สร้าง feedback loop — รายงาน false positives กลับ

---

#### ปัญหาที่ 4: ไม่มี Independent Review

**อาการ:**
- ไม่มีโมเดลที่สอง
- ไม่มีเวลา
- ไม่เห็นคุณค่า

**สาเหตุ:**
- ขาดเครื่องมือ
- ขาดงบประมาณ
- ไม่เข้าใจคุณค่า

**แนวทางแก้ไข:**
1. ใช้ Codex (`codex exec`) — เป็นตัวเลือกที่แนะนำ
2. ถ้าไม่มีโมเดลที่สอง ให้ระบุใน packet ว่า "not run" ไม่ใช่ "run clean"
3. สร้างความเข้าใจว่าทำไม independent review ถึงสำคัญ
4. วัดผล — เทียบ findings จาก steered vs. unsteered

---

#### ปัญหาที่ 5: Performance Audit ไม่พบอะไร

**อาการ:**
- รัน performance audit แล้วได้ 0 findings
- แต่ระบบยังช้า

**สาเหตุ:**
- Audit เป็น static ไม่ใช่ load test
- ปัญหาอยู่ที่ runtime
- ปัญหาอยู่ที่ infrastructure

**แนวทางแก้ไข:**
1. ใช้ runtime profiling
2. ตรวจสอบ infrastructure (CPU, memory, network)
3. ตรวจสอบ database (slow query log)
4. ใช้ APM tools
5. ระบุในรายงานว่า "what needs runtime profiling to confirm"

---

#### ปัญหาที่ 6: Security Findings ที่ไม่ Actionable

**อาการ:**
- Findings ที่แก้ยาก
- Findings ที่ไม่ชัดเจน
- Findings ที่ไม่ตรงกับ threat model

**สาเหตุ:**
- ขาด attacker/victim test
- ขาด concrete impact
- ขาด concrete fix

**แนวทางแก้ไข:**
1. ใช้ attacker/victim test — ระบุ attacker และ victim
2. ใช้ inverted refutation rule — drop ถ้า victim เป็น attacker เอง
3. ระบุ concrete fix
4. ใช้ OWASP Top 10 backstop
5. จำกัด findings — "ถ้ามากกว่า 12 findings ให้ consolidate"

---

#### ปัญหาที่ 7: Model Rerouting

**อาการ:**
- Fable reroute ไป Opus 4.8
- ผลลัพธ์ไม่สม่ำเสมอ
- ไม่รู้ว่า cluster ไหนใช้โมเดลอะไร

**สาเหตุ:**
- Safety classifiers ของ Fable
- Security audit เป็น content ที่ trigger

**แนวทางแก้ไข:**
1. ระบุใน report ว่า cluster ไหนใช้ fallback
2. ใช้ "Audit Provenance" section ใน shipping packet
3. ยอมรับว่าการ reroute เป็นเรื่องปกติสำหรับ security audit
4. ใช้ Opus 4.8 เป็น fallback ที่ยอมรับได้

---

#### ปัญหาที่ 8: ทีมไม่เข้าใจ Concepts

**อาการ:**
- ไม่เข้าใจว่า agreement คืออะไร
- ไม่เข้าใจว่า boundary คืออะไร
- ไม่เข้าใจว่า refutation คืออะไร

**สาเหตุ:**
- ขาดการฝึกอบรม
- Concepts ซับซ้อน
- ไม่มีตัวอย่าง

**แนวทางแก้ไข:**
1. จัด training session
2. ใช้ตัวอย่างจาก case studies
3. สร้าง playbook
4. ใช้ pair review
5. เริ่มจาก scope เล็ก

---

#### ปัญหาที่ 9: เวลาไม่พอ

**อาการ:**
- ไม่มีเวลารัน ship-check
- Deadline ใกล้
- ทีมเร่ง

**สาเหตุ:**
- Planning ไม่ดี
- Scope กว้าง
- Resource ไม่พอ

**แนวทางแก้ไข:**
1. วางแผนล่วงหน้า — อย่างน้อย 1 สัปดาห์ก่อน release
2. ใช้ scope=changes แทน full repo
3. รันเฉพาะ dimensions ที่จำเป็น
4. ใช้ parallel subagents
5. เตรียม buffer 20%

---

#### ปัญหาที่ 10: Findings ไม่ถูกแก้

**อาการ:**
- Findings ค้างอยู่ใน backlog
- ไม่มีใครรับผิดชอบ
- ไม่มี deadline

**สาเหตุ:**
- ขาด ownership
- ขาด prioritization
- ขาด accountability

**แนวทางแก้ไข:**
1. กำหนด owner สำหรับแต่ละ finding
2. กำหนด deadline
3. Integrate เข้ากับ sprint planning
4. Track ใน issue tracker
5. Review ใน sprint retro

---

### 10.2 แนวทางแก้ไขเชิงระบบ

#### Framework: PLAN-DO-CHECK-ACT

```
┌─────────────────────────────────────────────────────────────────┐
│                    PLAN-DO-CHECK-ACT                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  PLAN                                                            │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ • กำหนด scope                                            │   │
│  │ • เลือก dimensions                                       │   │
│  │ • จัดสรร resources                                       │   │
│  │ • กำหนด timeline                                         │   │
│  └──────────────────────────────────────────────────────────┘   │
│                            │                                     │
│                            ▼                                     │
│  DO                                                              │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ • รัน /document-app                                      │   │
│  │ • รัน /derive-tests                                      │   │
│  │ • รัน /ship-check                                        │   │
│  │ • เก็บผลลัพธ์                                            │   │
│  └──────────────────────────────────────────────────────────┘   │
│                            │                                     │
│                            ▼                                     │
│  CHECK                                                           │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ • Review findings                                        │   │
│  │ • Verify citations                                       │   │
│  │ • Prioritize                                             │   │
│  │ • วัดผล                                                  │   │
│  └──────────────────────────────────────────────────────────┘   │
│                            │                                     │
│                            ▼                                     │
│  ACT                                                             │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ • แก้ไข findings                                         │   │
│  │ • อัปเดตเอกสาร                                           │   │
│  │ • ปรับปรุงกระบวนการ                                      │   │
│  │ • ฝึกอบรมทีม                                             │   │
│  └──────────────────────────────────────────────────────────┘   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### Framework: CONTINUOUS IMPROVEMENT

```
┌─────────────────────────────────────────────────────────────────┐
│              CONTINUOUS IMPROVEMENT CYCLE                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ 1. MEASURE                                               │   │
│  │ • Findings per release                                   │   │
│  │ • Time to ship-check                                     │   │
│  │ • Production incidents                                   │   │
│  │ • Team satisfaction                                      │   │
│  └──────────────────────┬───────────────────────────────────┘   │
│                         │                                        │
│                         ▼                                        │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ 2. ANALYZE                                               │   │
│  │ • Root cause analysis                                    │   │
│  │ • Pattern identification                                 │   │
│  │ • Feedback จากทีม                                        │   │
│  └──────────────────────┬───────────────────────────────────┘   │
│                         │                                        │
│                         ▼                                        │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ 3. IMPROVE                                               │   │
│  │ • ปรับปรุงกระบวนการ                                      │   │
│  │ • เพิ่ม training                                         │   │
│  │ • อัปเดต tools                                           │   │
│  └──────────────────────┬───────────────────────────────────┘   │
│                         │                                        │
│                         ▼                                        │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │ 4. STANDARDIZE                                           │   │
│  │ • สร้าง playbook                                         │   │
│  │ • อัปเดต documentation                                   │   │
│  │ • แชร์ best practices                                    │   │
│  └──────────────────────┬───────────────────────────────────┘   │
│                         │                                        │
│                         └──────────► กลับไป 1. MEASURE          │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## สรุปภาพรวม

**pm-ai-shipping** เป็นชุดเครื่องมือที่ออกแบบมาเพื่อแก้ปัญหาเฉพาะของโค้ดที่สร้างโดย AI — การขาดบันทึกเจตนา ปรัชญาหลักคือ **"agreement ระหว่างสองฝ่ายที่ข้ามขอบเขต"** ไม่ใช่การสแกนไฟล์ทีละไฟล์

**จุดแข็ง:**
- วินัยในการ refutation ที่เข้มงวด
- Forced probes สำหรับสองเลนส์ที่ reviewers พลาดบ่อยที่สุด (Authority Reconciliation, Identity Correlation)
- Independent unsteered review เป็น backstop
- OWASP Top 10 backstop สำหรับ security
- Shipping packet ที่พร้อมสำหรับ human sign-off
- ระบบนิเวศที่สมบูรณ์ (pm-data-analytics, pm-execution)

**ข้อจำกัด:**
- ต้องการเอกสารเจตนาก่อน
- ใช้ทรัพยากรสูง
- เป็น static review เท่านั้น
- ผลลัพธ์เป็น findings ไม่ใช่ exploits

**การนำไปใช้:**
- เริ่มจาก `/document-app` และ `/derive-tests`
- ใช้ `/ship-check` สำหรับ release
- ใช้ `/security-audit-static` และ `/performance-audit-static` สำหรับ specific areas
- ใช้ independent review เป็น backstop
- ปรับปรุงอย่างต่อเนื่องด้วย PLAN-DO-CHECK-ACT

**บทเรียนสำคัญ:**
1. "A requested value is not an applied value" — Authority Reconciliation
2. "Label, index, position, arrival order is suspicious" — Identity Correlation
3. "Absorption is not prevention" — Refutation discipline
4. "It works nearly always describes a race" — Timing windows
5. "A step that always passes is not a passing step" — Observability
6. "Silent failure is systematically absent from planted corpora" — Verification