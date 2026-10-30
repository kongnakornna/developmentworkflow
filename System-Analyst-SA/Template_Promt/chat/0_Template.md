```md
# AI Prompt Template Pack
> ชุด Prompt สำหรับ GPTs / Claude Project / Gemini Gem  
> ใช้ร่วมกับไฟล์ CSV ในหัวข้อ 6 สำหรับอัปโหลดเป็น Knowledge

---

## 1. วิธีใช้

1. วาง **Master System Prompt** ในช่อง Instructions
2. อัปโหลดไฟล์ CSV หรือไฟล์ `.md` นี้เป็น Knowledge
3. เรียกใช้โมดูลด้วยรหัส เช่น `04`, `09`, `12`, `23`
4. หากไม่ระบุโมดูล ให้ AI ถามก่อนว่าจะใช้โมดูลใด

---

## 2. Master System Prompt

```text
คุณคือ Multi-Module AI Prompt Assistant
หน้าที่ของคุณคือสร้างเนื้อหาตามโมดูล 00-23 ที่แนบมาใน Knowledge

เมื่อผู้ใช้ระบุชื่อโมดูลหรือรหัส เช่น 04, 09, 12, 23
ให้โหลด Prompt Template จาก CSV แล้วปฏิบัติตามอย่างเคร่งครัด
ถ้าไม่ระบุ ให้ถามผู้ใช้เพื่อเลือกโมดูล

หลักการร่วม:
- เน้นหลักการสำคัญ
- ย่อคำ อธิบายสั้น จำง่าย
- มีตัวอย่างประกอบ
- ใช้ KPI / SMART / RCA / PSR / Workflow เมื่อเกี่ยวข้อง
- ใช้ภาษาเดียวกับผู้ใช้
- แสดงผลเป็น Markdown ที่อ่านง่าย
- ห้ามสมมติข้อมูลที่ไม่มี ให้ถามเพิ่มเมื่อจำเป็น
- จบด้วยสรุป 3-5 บรรทัด
```

---

## 3. Conversation Starters

```text
ใช้โมดูล 04 สร้างบทหัวข้อเรื่อง AI สำหรับผู้เริ่มต้น
ใช้โมดูล 09 ออกแบบ Workflow การอนุมัติซื้อ
ใช้โมดูล 12 ออกแบบ Software Architecture ระบบ E-commerce
ใช้โมดูล 23 สร้างสคริปต์ TikTok เรื่อง KPI
```

---

## 4. Quick Reference

| ID | Module | Category | Purpose |
|---|---|---|---|
| 00 | Template_Universal | General | สร้างเนื้อหาอาชีพแบบกำหนดโครงสร้างได้ |
| 01 | English_Thai_Pronunciation | Language | สร้างประโยคอังกฤษ-ไทยพร้อมคำอ่านไทย |
| 02 | บทนำ | Content | สร้างบทนำอย่างมีโครงสร้าง |
| 03 | บทนิยาม | Content | สร้างบทนิยามแบบ 3 หัวข้อ |
| 04 | บทหัวข้อ | Content | สร้างบทหัวข้อครบองค์ประกอบ |
| 05 | KPI | Management | อธิบาย KPI และประเภทระดับต่างๆ |
| 06 | SMART | Management | สร้างหรือตรวจสอบเป้าหมายด้วย SMART |
| 07 | RCA | Analysis | วิเคราะห์สาเหตุรากด้วย RCA |
| 08 | PSR | Analysis | อธิบายด้วยโครงสร้างปัญหา-วิธีแก้-ผลลัพธ์ |
| 09 | Workflow | Design | ออกแบบและอธิบาย Workflow |
| 10 | เขียนหนังสือ | Writing | ช่วยเขียนหนังสืออย่างมีโครงสร้าง |
| 11 | ออกแบบ | Design | ออกแบบด้วย Design Thinking |
| 12 | Software_Architecture | Software | ออกแบบสถาปัตยกรรมซอฟต์แวร์ |
| 13 | BMC | Business | สร้าง Business Model Canvas |
| 14 | Design_Thinking | Design | ใช้ Design Thinking แก้ปัญหา |
| 15 | Microservices | Software | ออกแบบ Microservices Architecture |
| 16 | DDD | Software | ทำ Domain-Driven Design |
| 17 | Clean_Architecture | Software | ออกแบบ Clean Architecture |
| 18 | Risk_Management | Management | บริหารความเสี่ยงโครงการ |
| 19 | POC | Management | วางแผน Proof of Concept |
| 20 | Project_Management | Management | บริหารโครงการครบวงจร |
| 21 | Cost_Management | Management | บริหารต้นทุนโครงการ |
| 22 | วาดรูป_2D_3D | Creative | สร้าง Prompt วาดรูป 2D/3D |
| 23 | คลิปวิดีโอ_YouTube_TikTok | Creative | สร้างสคริปต์คลิปวิดีโอ |

---

## 5. Prompt Templates รายโมดูล

### 00 — Template_Universal
**Category:** General  
**Purpose:** สร้างเนื้อหาอาชีพแบบกำหนดโครงสร้างได้

```text
คุณคือผู้ช่วยสร้างเนื้อหาอาชีพ
จงสร้างเนื้อหาเรื่อง [หัวข้อ] สำหรับ [กลุ่มเป้าหมาย]
รูปแบบผลลัพธ์: [บทความ/สคริปต์/แผนภาพ/ตาราง/ขั้นตอน]
ภาษา: [ไทย/อังกฤษ/ไทย+อังกฤษ]
ความยาว: [จำนวนคำ/จำนวนนาที]
โทน: [ทางการ/เป็นกันเอง/วิชาการ/ขายของ]
โครงสร้างที่ต้องใช้: [บทนำ/นิยาม/หัวข้อ/KPI/SMART/RCA/PSR/Workflow]
ข้อกำหนดเพิ่มเติม: เน้นหลักการสำคัญ ย่อคำ อธิบายสั้น จำง่าย มีตัวอย่าง และสรุปท้าย
```

### 01 — English_Thai_Pronunciation
**Category:** Language  
**Purpose:** สร้างประโยคอังกฤษ-ไทยพร้อมคำอ่านไทย

```text
จงจัดเรียงประโยคภาษาอังกฤษและไทยคนละบรรทัด ตามรูปแบบนี้:
- [ประโยคภาษาอังกฤษ] ([คำอ่านภาษาไทย])
- [ประโยคภาษาไทย]

หัวข้อ: [หัวข้อ]
จำนวนประโยค: [จำนวน]
ระดับภาษา: [ทั่วไป/ธุรกิจ/การท่องเที่ยว/การศึกษา]
ข้อกำหนด: คำอ่านไทยให้อ่านง่าย ไม่ใช้ IPA และเน้นคำที่ออกเสียงยาก
```

### 02 — บทนำ
**Category:** Content  
**Purpose:** สร้างบทนำอย่างมีโครงสร้าง

```text
สร้างบทนำเรื่อง [หัวข้อ] สำหรับ [กลุ่มเป้าหมาย]
ประกอบด้วย:
1. ภาพรวมว่าคืออะไร
2. คำนำ
3. วัตถุประสงค์
4. เป้าหมาย
5. ความรู้พื้นฐานที่จำเป็น
ภาษา: [ไทย/อังกฤษ]
ความยาว: [จำนวนคำ]
โทน: [ทางการ/เข้าใจง่าย/วิชาการ]
ปิดท้ายด้วยประโยคเชื่อมไปสู่เนื้อหาหลัก
```

### 03 — บทนิยาม
**Category:** Content  
**Purpose:** สร้างบทนิยามแบบ 3 หัวข้อ

```text
สร้างบทนิยามของ [คำ/แนวคิด] โดยตอบ 3 หัวข้อ:
1. คืออะไร (What is it?)
2. วัตถุประสงค์ (Purpose)
3. เป้าหมาย (Goal)

ข้อกำหนด:
- อธิบายสั้น กระชับ
- ใช้ภาษาง่าย
- มีตัวอย่าง 1 ตัวอย่าง
- สรุปเป็นคำจำง่าย 1 ประโยค
```

### 04 — บทหัวข้อ
**Category:** Content  
**Purpose:** สร้างบทหัวข้อครบองค์ประกอบ

```text
สร้างบทหัวข้อเรื่อง [เรื่อง] ประกอบด้วย:
- เรื่อง
- วัตถุประสงค์
- เป้าหมาย
- ข้อดี
- ข้อเสีย
- ข้อควรระวัง
- ตัวอย่าง
- ตัวชี้วัดเรื่องนี้ (KPI)
- การประยุกต์ใช้

ข้อกำหนด:
- ใช้หลัก SMART
- เน้นหลักการสำคัญ
- ย่อคำและอธิบายแบบย่อ
- จดจำง่าย
- มีสรุปท้ายบท 3-5 บรรทัด
```

### 05 — KPI
**Category:** Management  
**Purpose:** อธิบาย KPI และประเภทระดับต่างๆ

```text
อธิบาย KPI ของ [หัวข้อ/โครงการ/องค์กร]
โครงสร้าง:
1. KPI คืออะไร
2. วัตถุประสงค์
3. เป้าหมาย
4. ประเภท KPI: เชิงปริมาณ / เชิงคุณภาพ
5. ระดับ KPI: องค์กร / แผนก / บุคคล
6. ตัวอย่าง KPI ที่วัดได้
7. วิธีวัดและเกณฑ์ความสำเร็จ
8. ใช้หลัก SMART ในการกำหนด KPI
ภาษา: [ไทย/อังกฤษ]
รูปแบบ: ตาราง + คำอธิบายสั้น
```

### 06 — SMART
**Category:** Management  
**Purpose:** สร้างหรือตรวจสอบเป้าหมายด้วย SMART

```text
สร้างหรือตรวจสอบเป้าหมาย [เป้าหมาย] ด้วยหลัก SMART:
- S — Specific
- M — Measurable
- A — Achievable / Attainable
- R — Relevant / Realistic
- T — Time-bound

ผลลัพธ์ที่ต้องได้:
1. เป้าหมายเดิม
2. เป้าหมายที่เขียนใหม่ให้ SMART
3. KPI ที่วัดได้
4. กรอบเวลา
5. วิธีติดตามผล
```

### 07 — RCA
**Category:** Analysis  
**Purpose:** วิเคราะห์สาเหตุรากด้วย RCA

```text
วิเคราะห์ RCA สำหรับปัญหา [ปัญหา]
โครงสร้าง:
1. RCA คืออะไร
2. วัตถุประสงค์
3. เป้าหมาย
4. เครื่องมือที่ใช้: 5 Whys, Fishbone Diagram, Fault Tree Analysis
5. วิเคราะห์สาเหตุราก
6. แนวทางแก้ไข
7. วิธีป้องกันไม่ให้เกิดซ้ำ
8. ตัวชี้วัดผลสำเร็จ
ภาษา: [ไทย/อังกฤษ]
รูปแบบ: อธิบายสั้น + ตาราง + แผนภาพความคิด
```

### 08 — PSR
**Category:** Analysis  
**Purpose:** อธิบายด้วยโครงสร้างปัญหา-วิธีแก้-ผลลัพธ์

```text
อธิบาย [เรื่อง/กรณีศึกษา] ด้วยโครงสร้าง Problem-Solution-Result:
- Problem (ปัญหา): สถานการณ์ อุปสรรค ประเด็นที่ต้องแก้
- Solution (วิธีแก้): แนวทาง กระบวนการ เครื่องมือ
- Result (ผลลัพธ์): ผลที่เกิดขึ้นจริง วัดผลได้

ข้อกำหนด:
- เน้นหลักการสำคัญ
- ย่อคำ
- อธิบายสั้น จำง่าย
- มีการประยุกต์ใช้
- สรุปเป็น 3 บรรทัด
```

### 09 — Workflow
**Category:** Design  
**Purpose:** ออกแบบและอธิบาย Workflow

```text
ออกแบบ Workflow สำหรับ [กระบวนการ/งาน]
ประกอบด้วย:
4.1 ออกแบบ Workflow
4.2 อธิบาย Workflow

ข้อกำหนด:
- เน้นเป้าหมาย (Goal)
- เข้าใจง่าย
- ชัดเจนตรงไปตรงมา
- ง่ายต่อการจดจำ
- เชื่อมโยงกับ Problem-Solution-Result (PSR)
- ใช้รูปภาพและสัญลักษณ์
- ใช้ storytelling & emotion
- ใช้ association และ chunking
- แบ่งขั้นตอนเป็น 3-7 เฟส
ผลลัพธ์: แผนภาพ workflow + คำอธิบายแต่ละขั้น + KPI
```

### 10 — เขียนหนังสือ
**Category:** Writing  
**Purpose:** ช่วยเขียนหนังสืออย่างมีโครงสร้าง

```text
ช่วยเขียนหนังสือ [ชื่อเรื่อง/แนวเรื่อง] สำหรับ [กลุ่มเป้าหมาย]
โครงสร้าง:
1. บทนำ
2. บทนิยาม
3. บทหัวข้อ
4. Workflow
5. ตัวอย่าง
6. KPI / SMART / RCA / PSR
7. สรุป

จำนวนบท: [จำนวน]
ความยาวต่อบท: [จำนวนคำ]
โทน: [ทางการ/เป็นกันเอง/สร้างแรงบันดาลใจ]
ข้อกำหนด: เน้นหลักการสำคัญ ย่อคำ อธิบายสั้น จำง่าย และมีแบบฝึกหัดท้ายบท
```

### 11 — ออกแบบ
**Category:** Design  
**Purpose:** ออกแบบด้วย Design Thinking

```text
ออกแบบ [สิ่งของ/ระบบ/บริการ/ประสบการณ์] สำหรับ [ผู้ใช้]
ใช้กระบวนการ Design Thinking 5 ขั้น:
1. Empathize
2. Define
3. Ideate
4. Prototype
5. Test

ผลลัพธ์:
- Insight ผู้ใช้
- Problem Statement
- ไอเดีย 10 ข้อ
- Prototype อย่างง่าย
- แผนทดสอบ
- ตัวชี้วัดความสำเร็จ
```

### 12 — Software_Architecture
**Category:** Software  
**Purpose:** ออกแบบสถาปัตยกรรมซอฟต์แวร์

```text
ออกแบบ Software Architecture สำหรับ [ระบบ]
ข้อมูลนำเข้า:
- Requirements: [ ]
- Constraints: [ ]
- Quality Attributes: [ ]
- Tech Stack ที่สนใจ: [ ]

ให้พิจารณา:
- Microservices Architecture
- Domain-Driven Design (DDD)
- Clean Architecture
- Risk Management
- POC
- Project Management
- Cost Management

ผลลัพธ์:
1. ภาพรวมสถาปัตยกรรม
2. แผนภาพ Component
3. Data Flow
4. Trade-offs
5. ข้อดี/ข้อเสีย
6. แผนพัฒนาและทดสอบ
```

### 13 — BMC
**Category:** Business  
**Purpose:** สร้าง Business Model Canvas

```text
สร้าง Business Model Canvas (BMC) สำหรับ [ธุรกิจ/ไอเดีย]
9 ช่อง:
1. Customer Segments
2. Value Propositions
3. Channels
4. Customer Relationships
5. Revenue Streams
6. Key Resources
7. Key Activities
8. Key Partnerships
9. Cost Structure

วิเคราะห์เพิ่มเติม:
- จุดแข็ง
- ความเสี่ยง
- โอกาส
- KPI ที่ควรวัด
```

### 14 — Design_Thinking
**Category:** Design  
**Purpose:** ใช้ Design Thinking แก้ปัญหา

```text
ใช้ Design Thinking กับ [ปัญหา/ผลิตภัณฑ์/บริการ]
5 ขั้น:
1. Empathize — เข้าใจผู้ใช้
2. Define — ระบุปัญหา
3. Ideate — ระดมความคิด
4. Prototype — สร้างต้นแบบ
5. Test — ทดสอบ

ผลลัพธ์:
- Insight
- Problem Statement
- ไอเดีย 10 ข้อ
- Prototype
- แผนทดสอบ
- ข้อเสนอแนะในการปรับปรุง
```

### 15 — Microservices
**Category:** Software  
**Purpose:** ออกแบบ Microservices Architecture

```text
ออกแบบ Microservices Architecture สำหรับ [ระบบ]
ให้ระบุ:
- บริการย่อย (Services)
- ขอบเขตแต่ละบริการ
- API
- Data Ownership
- การสื่อสารระหว่างบริการ
- Deployment
- Scaling
- Monitoring
- ข้อดี/ข้อเสียเมื่อเทียบกับ Monolithic
- แนวทางลดความเสี่ยง
```

### 16 — DDD
**Category:** Software  
**Purpose:** ทำ Domain-Driven Design

```text
ทำ Domain-Driven Design (DDD) สำหรับ [โดเมน]
ให้ระบุ:
- Domain / Subdomains
- Bounded Contexts
- Ubiquitous Language
- Entities
- Value Objects
- Aggregates
- Repositories
- Domain Events
- Context Mapping
- โครงสร้างโค้ดที่สะท้อนโดเมน
```

### 17 — Clean_Architecture
**Category:** Software  
**Purpose:** ออกแบบ Clean Architecture

```text
ออกแบบ Clean Architecture สำหรับ [ระบบ]
แยกชั้น:
1. Entities
2. Use Cases
3. Interface Adapters
4. Frameworks & Drivers

ข้อกำหนด:
- Dependency Rule
- แยก Business Logic ออกจาก Database / Framework / UI
- วิธีทดสอบ
- วิธีเปลี่ยนเทคโนโลยีโดยกระทบน้อยที่สุด
- ข้อดี/ข้อเสีย
```

### 18 — Risk_Management
**Category:** Management  
**Purpose:** บริหารความเสี่ยงโครงการ

```text
บริหารความเสี่ยงโครงการ [โครงการ]
โครงสร้าง:
1. ระบุความเสี่ยง
2. ประเมินโอกาสเกิด
3. ประเมินผลกระทบ
4. จัดลำดับความเสี่ยง
5. มาตรการลด/ป้องกัน/โอน/ยอมรับ
6. ผู้รับผิดชอบ
7. KPI ติดตาม
8. แผนสำรอง
รูปแบบ: ตาราง Risk Register
```

### 19 — POC
**Category:** Management  
**Purpose:** วางแผน Proof of Concept

```text
วางแผน POC (Proof of Concept) สำหรับ [แนวคิด/เทคโนโลยี]
ประกอบด้วย:
1. คำถามที่ต้องพิสูจน์
2. สมมติฐาน
3. ขอบเขต
4. ทรัพยากร
5. ระยะเวลา
6. ตัวชี้วัดความสำเร็จ
7. เกณฑ์ Go / No-Go
8. สรุปผลและข้อเสนอแนะ
```

### 20 — Project_Management
**Category:** Management  
**Purpose:** บริหารโครงการครบวงจร

```text
บริหารโครงการ [โครงการ]
ประกอบด้วย:
- Scope
- Stakeholders
- WBS
- Timeline
- Budget
- Resources
- Risk
- Communication
- Quality
- KPI
- การปิดโครงการ
ใช้หลัก SMART และระบุบทเรียนที่ได้
```

### 21 — Cost_Management
**Category:** Management  
**Purpose:** บริหารต้นทุนโครงการ

```text
บริหารต้นทุน [โครงการ/องค์กร]
ประกอบด้วย:
1. ประมาณการต้นทุน
2. งบประมาณ
3. ประเภทต้นทุน
4. การควบคุมต้นทุน
5. การติดตาม
6. วิเคราะห์ Variance
7. แนวทางลดต้นทุน
8. KPI ด้านต้นทุน
รูปแบบ: ตาราง + คำอธิบายสั้น
```

### 22 — วาดรูป_2D_3D
**Category:** Creative  
**Purpose:** สร้าง Prompt วาดรูป 2D/3D

```text
สร้าง Prompt วาดรูป [2D/3D] หัวข้อ [หัวข้อ]
ระบุ:
- สไตล์: [realistic/cartoon/anime/low-poly/isometric]
- องค์ประกอบ: [ ]
- มุมกล้อง: [ ]
- แสง: [ ]
- สี: [ ]
- พื้นหลัง: [ ]
- รายละเอียด: [ ]
- ขนาดภาพ: [ ]
- ระดับความสมจริง: [ ]

ให้ 3 Variations และอธิบายความแตกต่าง
```

### 23 — คลิปวิดีโอ_YouTube_TikTok
**Category:** Creative  
**Purpose:** สร้างสคริปต์คลิปวิดีโอ

```text
สร้างสคริปต์คลิป [YouTube/TikTok] เรื่อง [หัวข้อ]
ความยาว: [วินาที/นาที]
โครงสร้าง:
1. Hook 3 วินาที
2. ปัญหา
3. วิธีแก้
4. ผลลัพธ์
5. CTA

ระบุ:
- ภาพที่ต้องถ่าย
- เสียง / เพลง
- ข้อความบนจอ
- แฮชแท็ก
- ชื่อคลิป
- คำอธิบายคลิป
โทน: [สนุก/จริงจัง/ให้ความรู้/ขายของ]
```

---

## 6. CSV สำหรับอัปโหลด

```csv
"ID","Module","Category","Purpose","Prompt_Template","Output_Format","Tags"
"00","Template_Universal","General","สร้างเนื้อหาอาชีพแบบกำหนดโครงสร้างได้","คุณคือผู้ช่วยสร้างเนื้อหาอาชีพ | จงสร้างเนื้อหาเรื่อง [หัวข้อ] สำหรับ [กลุ่มเป้าหมาย] | รูปแบบผลลัพธ์: [บทความ/สคริปต์/แผนภาพ/ตาราง/ขั้นตอน] | ภาษา: [ไทย/อังกฤษ/ไทย+อังกฤษ] | ความยาว: [จำนวนคำ/จำนวนนาที] | โทน: [ทางการ/เป็นกันเอง/วิชาการ/ขายของ] | โครงสร้างที่ต้องใช้: [บทนำ/นิยาม/หัวข้อ/KPI/SMART/RCA/PSR/Workflow] | ข้อกำหนดเพิ่มเติม: เน้นหลักการสำคัญ ย่อคำ อธิบายสั้น จำง่าย มีตัวอย่าง และสรุปท้าย","Markdown / ตาราง / แผนภาพ","general,content,template"
"01","English_Thai_Pronunciation","Language","สร้างประโยคอังกฤษ-ไทยพร้อมคำอ่านไทย","จงจัดเรียงประโยคภาษาอังกฤษและไทยคนละบรรทัด ตามรูปแบบนี้: | - [ประโยคภาษาอังกฤษ] ([คำอ่านภาษาไทย]) | - [ประโยคภาษาไทย] | หัวข้อ: [หัวข้อ] | จำนวนประโยค: [จำนวน] | ระดับภาษา: [ทั่วไป/ธุรกิจ/การท่องเที่ยว/การศึกษา] | ข้อกำหนด: คำอ่านไทยให้อ่านง่าย ไม่ใช้ IPA และเน้นคำที่ออกเสียงยาก","ข้อความสองภาษา","language,pronunciation,thai,english"
"02","บทนำ","Content","สร้างบทนำอย่างมีโครงสร้าง","สร้างบทนำเรื่อง [หัวข้อ] สำหรับ [กลุ่มเป้าหมาย] | ประกอบด้วย: 1. ภาพรวมว่าคืออะไร 2. คำนำ 3. วัตถุประสงค์ 4. เป้าหมาย 5. ความรู้พื้นฐานที่จำเป็น | ภาษา: [ไทย/อังกฤษ] | ความยาว: [จำนวนคำ] | โทน: [ทางการ/เข้าใจง่าย/วิชาการ] | ปิดท้ายด้วยประโยคเชื่อมไปสู่เนื้อหาหลัก","Markdown","content,introduction"
"03","บทนิยาม","Content","สร้างบทนิยามแบบ 3 หัวข้อ","สร้างบทนิยามของ [คำ/แนวคิด] โดยตอบ 3 หัวข้อ: | 1. คืออะไร (What is it?) | 2. วัตถุประสงค์ (Purpose) | 3. เป้าหมาย (Goal) | ข้อกำหนด: อธิบายสั้น กระชับ ใช้ภาษาง่าย มีตัวอย่าง 1 ตัวอย่าง สรุปเป็นคำจำง่าย 1 ประโยค","Markdown","definition,content"
"04","บทหัวข้อ","Content","สร้างบทหัวข้อครบองค์ประกอบ","สร้างบทหัวข้อเรื่อง [เรื่อง] ประกอบด้วย: เรื่อง วัตถุประสงค์ เป้าหมาย ข้อดี ข้อเสีย ข้อควรระวัง ตัวอย่าง ตัวชี้วัดเรื่องนี้ (KPI) การประยุกต์ใช้ | ข้อกำหนด: ใช้หลัก SMART เน้นหลักการสำคัญ ย่อคำและอธิบายแบบย่อ จดจำง่าย มีสรุปท้ายบท 3-5 บรรทัด","Markdown","topic,content,kpi,smart"
"05","KPI","Management","อธิบาย KPI และประเภทระดับต่างๆ","อธิบาย KPI ของ [หัวข้อ/โครงการ/องค์กร] | โครงสร้าง: 1. KPI คืออะไร 2. วัตถุประสงค์ 3. เป้าหมาย 4. ประเภท KPI: เชิงปริมาณ / เชิงคุณภาพ 5. ระดับ KPI: องค์กร / แผนก / บุคคล 6. ตัวอย่าง KPI ที่วัดได้ 7. วิธีวัดและเกณฑ์ความสำเร็จ 8. ใช้หลัก SMART ในการกำหนด KPI | ภาษา: [ไทย/อังกฤษ] | รูปแบบ: ตาราง + คำอธิบายสั้น","ตาราง + Markdown","kpi,management,smart"
"06","SMART","Management","สร้างหรือตรวจสอบเป้าหมายด้วย SMART","สร้างหรือตรวจสอบเป้าหมาย [เป้าหมาย] ด้วยหลัก SMART: | S — Specific | M — Measurable | A — Achievable / Attainable | R — Relevant / Realistic | T — Time-bound | ผลลัพธ์: 1. เป้าหมายเดิม 2. เป้าหมายที่เขียนใหม่ให้ SMART 3. KPI ที่วัดได้ 4. กรอบเวลา 5. วิธีติดตามผล","Markdown","smart,goal,kpi"
"07","RCA","Analysis","วิเคราะห์สาเหตุรากด้วย RCA","วิเคราะห์ RCA สำหรับปัญหา [ปัญหา] | โครงสร้าง: 1. RCA คืออะไร 2. วัตถุประสงค์ 3. เป้าหมาย 4. เครื่องมือ: 5 Whys, Fishbone Diagram, Fault Tree Analysis 5. วิเคราะห์สาเหตุราก 6. แนวทางแก้ไข 7. วิธีป้องกันไม่ให้เกิดซ้ำ 8. ตัวชี้วัดผลสำเร็จ | ภาษา: [ไทย/อังกฤษ] | รูปแบบ: อธิบายสั้น + ตาราง + แผนภาพความคิด","ตาราง + แผนภาพ","rca,analysis,problem"
"08","PSR","Analysis","อธิบายด้วยโครงสร้างปัญหา-วิธีแก้-ผลลัพธ์","อธิบาย [เรื่อง/กรณีศึกษา] ด้วยโครงสร้าง Problem-Solution-Result: | Problem (ปัญหา): สถานการณ์ อุปสรรค ประเด็นที่ต้องแก้ | Solution (วิธีแก้): แนวทาง กระบวนการ เครื่องมือ | Result (ผลลัพธ์): ผลที่เกิดขึ้นจริง วัดผลได้ | ข้อกำหนด: เน้นหลักการสำคัญ ย่อคำ อธิบายสั้น จำง่าย มีการประยุกต์ใช้ สรุปเป็น 3 บรรทัด","Markdown","psr,problem,solution,result"
"09","Workflow","Design","ออกแบบและอธิบาย Workflow","ออกแบบ Workflow สำหรับ [กระบวนการ/งาน] | ประกอบด้วย: 4.1 ออกแบบ Workflow 4.2 อธิบาย Workflow | ข้อกำหนด: เน้นเป้าหมาย (Goal) เข้าใจง่าย ชัดเจนตรงไปตรงมา ง่ายต่อการจดจำ เชื่อมโยงกับ Problem-Solution-Result (PSR) ใช้รูปภาพและสัญลักษณ์ ใช้ storytelling & emotion ใช้ association และ chunking แบ่งขั้นตอนเป็น 3-7 เฟส | ผลลัพธ์: แผนภาพ workflow + คำอธิบายแต่ละขั้น + KPI","แผนภาพ + Markdown","workflow,design,psr"
"10","เขียนหนังสือ","Writing","ช่วยเขียนหนังสืออย่างมีโครงสร้าง","ช่วยเขียนหนังสือ [ชื่อเรื่อง/แนวเรื่อง] สำหรับ [กลุ่มเป้าหมาย] | โครงสร้าง: 1. บทนำ 2. บทนิยาม 3. บทหัวข้อ 4. Workflow 5. ตัวอย่าง 6. KPI / SMART / RCA / PSR 7. สรุป | จำนวนบท: [จำนวน] | ความยาวต่อบท: [จำนวนคำ] | โทน: [ทางการ/เป็นกันเอง/สร้างแรงบันดาลใจ] | ข้อกำหนด: เน้นหลักการสำคัญ ย่อคำ อธิบายสั้น จำง่าย และมีแบบฝึกหัดท้ายบท","Markdown","book,writing,content"
"11","ออกแบบ","Design","ออกแบบด้วย Design Thinking","ออกแบบ [สิ่งของ/ระบบ/บริการ/ประสบการณ์] สำหรับ [ผู้ใช้] | ใช้กระบวนการ Design Thinking 5 ขั้น: 1. Empathize 2. Define 3. Ideate 4. Prototype 5. Test | ผลลัพธ์: Insight ผู้ใช้, Problem Statement, ไอเดีย 10 ข้อ, Prototype อย่างง่าย, แผนทดสอบ, ตัวชี้วัดความสำเร็จ","Markdown","design,design-thinking,innovation"
"12","Software_Architecture","Software","ออกแบบสถาปัตยกรรมซอฟต์แวร์","ออกแบบ Software Architecture สำหรับ [ระบบ] | ข้อมูลนำเข้า: Requirements, Constraints, Quality Attributes, Tech Stack | ให้พิจารณา: Microservices, DDD, Clean Architecture, Risk Management, POC, Project Management, Cost Management | ผลลัพธ์: 1. ภาพรวมสถาปัตยกรรม 2. แผนภาพ Component 3. Data Flow 4. Trade-offs 5. ข้อดี/ข้อเสีย 6. แผนพัฒนาและทดสอบ","แผนภาพ + Markdown","software,architecture,design"
"13","BMC","Business","สร้าง Business Model Canvas","สร้าง Business Model Canvas (BMC) สำหรับ [ธุรกิจ/ไอเดีย] | 9 ช่อง: 1. Customer Segments 2. Value Propositions 3. Channels 4. Customer Relationships 5. Revenue Streams 6. Key Resources 7. Key Activities 8. Key Partnerships 9. Cost Structure | วิเคราะห์เพิ่มเติม: จุดแข็ง ความเสี่ยง โอกาส KPI ที่ควรวัด","ตาราง + Markdown","bmc,business,model"
"14","Design_Thinking","Design","ใช้ Design Thinking แก้ปัญหา","ใช้ Design Thinking กับ [ปัญหา/ผลิตภัณฑ์/บริการ] | 5 ขั้น: 1. Empathize 2. Define 3. Ideate 4. Prototype 5. Test | ผลลัพธ์: Insight, Problem Statement, ไอเดีย 10 ข้อ, Prototype, แผนทดสอบ, ข้อเสนอแนะในการปรับปรุง","Markdown","design-thinking,innovation,problem"
"15","Microservices","Software","ออกแบบ Microservices Architecture","ออกแบบ Microservices Architecture สำหรับ [ระบบ] | ให้ระบุ: บริการย่อย (Services), ขอบเขตแต่ละบริการ, API, Data Ownership, การสื่อสารระหว่างบริการ, Deployment, Scaling, Monitoring, ข้อดี/ข้อเสียเมื่อเทียบกับ Monolithic, แนวทางลดความเสี่ยง","แผนภาพ + Markdown","microservices,software,architecture"
"16","DDD","Software","ทำ Domain-Driven Design","ทำ Domain-Driven Design (DDD) สำหรับ [โดเมน] | ให้ระบุ: Domain / Subdomains, Bounded Contexts, Ubiquitous Language, Entities, Value Objects, Aggregates, Repositories, Domain Events, Context Mapping, โครงสร้างโค้ดที่สะท้อนโดเมน","แผนภาพ + Markdown","ddd,domain,software"
"17","Clean_Architecture","Software","ออกแบบ Clean Architecture","ออกแบบ Clean Architecture สำหรับ [ระบบ] | แยกชั้น: 1. Entities 2. Use Cases 3. Interface Adapters 4. Frameworks & Drivers | ข้อกำหนด: Dependency Rule, แยก Business Logic ออกจาก Database / Framework / UI, วิธีทดสอบ, วิธีเปลี่ยนเทคโนโลยีโดยกระทบน้อยที่สุด, ข้อดี/ข้อเสีย","แผนภาพ + Markdown","clean-architecture,software,design"
"18","Risk_Management","Management","บริหารความเสี่ยงโครงการ","บริหารความเสี่ยงโครงการ [โครงการ] | โครงสร้าง: 1. ระบุความเสี่ยง 2. ประเมินโอกาสเกิด 3. ประเมินผลกระทบ 4. จัดลำดับความเสี่ยง 5. มาตรการลด/ป้องกัน/โอน/ยอมรับ 6. ผู้รับผิดชอบ 7. KPI ติดตาม 8. แผนสำรอง | รูปแบบ: ตาราง Risk Register","ตาราง","risk,management,project"
"19","POC","Management","วางแผน Proof of Concept","วางแผน POC (Proof of Concept) สำหรับ [แนวคิด/เทคโนโลยี] | ประกอบด้วย: 1. คำถามที่ต้องพิสูจน์ 2. สมมติฐาน 3. ขอบเขต 4. ทรัพยากร 5. ระยะเวลา 6. ตัวชี้วัดความสำเร็จ 7. เกณฑ์ Go / No-Go 8. สรุปผลและข้อเสนอแนะ","Markdown","poc,proof-of-concept,management"
"20","Project_Management","Management","บริหารโครงการครบวงจร","บริหารโครงการ [โครงการ] | ประกอบด้วย: Scope, Stakeholders, WBS, Timeline, Budget, Resources, Risk, Communication, Quality, KPI, การปิดโครงการ | ใช้หลัก SMART และระบุบทเรียนที่ได้","ตาราง + Markdown","project,management,smart"
"21","Cost_Management","Management","บริหารต้นทุนโครงการ","บริหารต้นทุน [โครงการ/องค์กร] | ประกอบด้วย: 1. ประมาณการต้นทุน 2. งบประมาณ 3. ประเภทต้นทุน 4. การควบคุมต้นทุน 5. การติดตาม 6. วิเคราะห์ Variance 7. แนวทางลดต้นทุน 8. KPI ด้านต้นทุน | รูปแบบ: ตาราง + คำอธิบายสั้น","ตาราง + Markdown","cost,management,budget"
"22","วาดรูป_2D_3D","Creative","สร้าง Prompt วาดรูป 2D/3D","สร้าง Prompt วาดรูป [2D/3D] หัวข้อ [หัวข้อ] | ระบุ: สไตล์, องค์ประกอบ, มุมกล้อง, แสง, สี, พื้นหลัง, รายละเอียด, ขนาดภาพ, ระดับความสมจริง | ให้ 3 Variations และอธิบายความแตกต่าง","Prompt + Markdown","image,2d,3d,art"
"23","คลิปวิดีโอ_YouTube_TikTok","Creative","สร้างสคริปต์คลิปวิดีโอ","สร้างสคริปต์คลิป [YouTube/TikTok] เรื่อง [หัวข้อ] | ความยาว: [วินาที/นาที] | โครงสร้าง: 1. Hook 3 วินาที 2. ปัญหา 3. วิธีแก้ 4. ผลลัพธ์ 5. CTA | ระบุ: ภาพที่ต้องถ่าย, เสียง / เพลง, ข้อความบนจอ, แฮชแท็ก, ชื่อคลิป, คำอธิบายคลิป | โทน: [สนุก/จริงจัง/ให้ความรู้/ขายของ]","Script + Markdown","video,youtube,tiktok,script"
```