## Promt-AI-Skill-Task-jobs

1.สร้างบทนำ
2.สร้างบทนิยาม
3.สร้างบทหัวข้อ
5.ออกแบบคู่มือ
6.ออกแบบ workflow
7.ออกแบบ Template
8.CHECKLIST Template

ออกแบบ 2 ภาษา
    1.Enhlish
    2.ภาษาไทย

 
-----------------------------------------------
ไฟล์นี้คือ คู่มือสรุป "AI Skills" จำนวน 6 ทักษะ ที่ใช้ใน workflow การทำงานและการแก้บั๊ก (Bug Fix) โดยมีรายละเอียดดังนี้:

brainstorming – ใช้ในขั้นตอน Normal Workflow 3.1
→ ทำความเข้าใจงาน, หา assumptions ที่ผิดพลาด, ตั้งคำถามกับตัวเองก่อนลงมือ

writing-plans – ใช้ใน Normal / Bug Fix Path A ขั้น 3.2
→ วางแผน implementation, แบ่งงานเป็น subtask ชัดเจน ก่อน execute ทุกครั้ง

executing-plans – ใช้ใน Normal / Bug Fix Path A ขั้น 3.3
→ ลงมือทำตาม plan ที่วางไว้ ไม่ข้ามหรือสลับขั้นตอน

investigate-error – ใช้ใน Bug Fix ขั้น 3.4
→ วิเคราะห์ root cause, จัดลำดับสาเหตุ, ออก report ก่อนวางแผนแก้ไข

test-driven-development – ใช้ใน Bug Fix Path B ขั้น 2
→ เตรียม test ก่อน แล้วเชื่อมให้ test ผ่าน แก้บั๊กทีละจุด

scrutinize – ใช้ใน Mandatory (KANDATORY) ขั้น 3.4 / 2.4
→ ตรวจสอบ logic และ side effects ก่อน merge – ต้องทำทุกครั้ง ไม่มีข้อยกเว้น

ทั้งหมดอยู่ภายใต้ SUPERPOWERS PLUGIN และมีลำดับขั้นตอนชัดเจนในแต่ละเส้นทาง workflow (Normal หรือ Bug Fix)
-----------------------------------------------
STEP 1: รับ Story Task จาก Product Owner - โปรดดู - จดให้ - ติดตามแล้ว - ล้างเข้าได้
STEP 2: แปลงเป็น Technical Task - กดเลือกขั้นตอน - ไม่ให้ตรวจสอบ - ใช้งาน
STEP 3: ทำความเข้าใจ - วางแผน - ลงมือทำ - วางแผนให้ - ตรวจสอบ - ตรวจสอบ
STEP 4: ตรวจสอบความถูกต้อง - ดูผลการทดลอง - ไม่มี checklist - ไม่มี safety net
STEP 5: Proof of Work - record - screenshot ทำเอง
STEP 6: QA ตรวจสอบ - "พบ bug - ยังคงปรับใหม่ - เสียเวลา - ส่งงานเข้า"
-----------------------------------------------
  
## Normal Workflow – Without AI (Beli)

### STEP 1 – รับ Story Task
- รับ Story Task จาก Product Owner
- โปรดดู → จดให้ → ติดตามแล้ว → ล้างเข้าได้  
*(อาจหมายถึง: อ่าน, จดบันทึก, ติดตามความคืบหน้า, เคลียร์งานที่รับมา)*

### STEP 2 – แปลงเป็น Technical Task
- แปลง Story Task ให้เป็น Technical Task
- กดเลือกขั้นตอน → ไม่ให้ตรวจสอบ → ใช้งาน  
*(ไม่มีกระบวนการตรวจสอบคุณภาพของการแปลง task)*

### STEP 3 – ทำความเข้าใจ – วางแผน – ลงมือทำ
- วางแผนให้ → ตรวจสอบ → ตรวจสอบ  
*(ซ้ำคำว่า “ตรวจสอบ” แต่ไม่มีระบบหรือ AI ช่วย)*

### STEP 4 – ตรวจสอบความถูกต้อง
- ดูผลการทดลอง  
- **ไม่มี checklist**  
- **ไม่มี safety net**  
*(เสี่ยงพลาดได้ง่าย)*

### STEP 5 – Proof of Work
- บันทึกผล (record)  
- จับ screenshot ด้วยตัวเอง

### STEP 6 – QA ตรวจสอบ
- พบ bug → ยังคงปรับใหม่ → เสียเวลา → ส่งงานเข้า  
*(กระบวนการที่เกิดการวนแก้ bug เสียเวลา ก่อนส่งงานให้ QA ท้ายสุด)*

---

## จุดสังเกตจาก workflow นี้
- ขาดการวางแผนเป็น subtask (ต่างจาก `writing-plans` และ `executing-plans` ใน AI workflow)
- ขาดการตรวจสอบ root cause ก่อนแก้ไข (ต่างจาก `investigate-error`)
- ขาดการเขียน test ก่อน (ต่างจาก `test-driven-development`)
- ขาดการตรวจสอบ logic และ side effects ก่อน merge (ต่างจาก `scrutinize`)
- ส่งงานให้ QA แล้วเจอ bug ทำให้เสียเวลาและแก้ซ้ำไปมา 
-----------------------------------------------
เข้าใจครับ คุณต้องการ **ปรับปรุง Normal Workflow (แบบไม่มี AI)** ให้ดีขึ้น โดยนำ **AI Skills ทั้ง 6 อย่าง** จากไฟล์แรกมาใช้整合ในกระบวนการทำงานของ Beli

ด้านล่างคือ **Workflow แบบปรับปรุงแล้ว (Improved Workflow with AI)** พร้อมระบุว่าแต่ละ AI Skill ถูกแทรกที่ขั้นตอนไหน และช่วยแก้ปัญหาจุดอ่อนของ workflow เดิมอย่างไร

---

## ✅ Improved Workflow – Beli (With AI Superpowers)

### STEP 1 – รับ Story Task จาก Product Owner
**เหมือนเดิม** – รับ story, จดให้, ติดตาม, ล้างเข้าได้

### STEP 2 – แปลงเป็น Technical Task
**เหมือนเดิม** – แปลง story → technical task  
*(แต่ในขั้นตอนนี้จะเริ่มใช้ AI ใน step 3)*

### STEP 3 – ทำความเข้าใจ + วางแผน + ลงมือทำ (ใช้ 3 AI Skills)

เดิม step 3 อ่อนแอมาก (แค่ "วางแผนให้ – ตรวจสอบ – ตรวจสอบ" ไม่มีโครงสร้าง)

**ปรับปรุงเป็น 3 ขั้นตอนย่อย:**

#### 3.1 🧠 **brainstorming** (AI Skill)
- ทำความเข้าใจ task อย่างลึกซึ้ง
- หา assumption ที่ผิดพลาดของตัวเอง
- ตั้งคำถามกับ requirement ก่อนลงมือ

#### 3.2 📝 **writing-plans** (AI Skill)
- วางแผน implementation
- แบ่งงานเป็น subtask ชัดเจน (เรียงลำดับ, ระบุ dependency)
- เขียน plan ลงไปก่อน execute ทุกครั้ง

#### 3.3 ⚙️ **executing-plans** (AI Skill)
- ลงมือ implement ตาม plan ทีละ subtask
- **ไม่ข้ามขั้นตอน** และไม่ทำนอก plan

✅ **ผลลัพธ์:** มีโครงสร้าง, ไม่มั่ว, ลดความผิดพลาดจากการรีบทำ

---

### STEP 4 – ตรวจสอบความถูกต้อง (ใช้ TDD + Investigate Error กรณีเจอ bug)

เดิม step 4 มีจุดอ่อน: "ดูผลการทดลอง – ไม่มี checklist – ไม่มี safety net"

**ปรับปรุงเป็น:**

#### ถ้า implement ไปแล้วเจอ error / bug → ใช้ 🐞 **investigate-error** (AI Skill)
- วิเคราะห์ root cause จริง ๆ
- จัดลำดับสาเหตุ
- ออกรายงานก่อนลงมือแก้ไข

#### หรือ ถ้าอยากป้องกัน bug ตั้งแต่ต้น → ใช้ ✅ **test-driven-development** (AI Skill)
- เตรียม test **ก่อน** เขียนโค้ดแก้ไข
- แล้วเขียนโค้ดให้ test ผ่าน
- แก้ไขทีละจุด ไม่ทำหลายสิ่งพร้อมกัน

🔁 **Safety net** เกิดขึ้นแล้ว เพราะมี test และ root cause analysis

---

### STEP 5 – Proof of Work
**เหมือนเดิม** – record + screenshot  
(แต่ตอนนี้ Proof of Work เชื่อถือได้มากขึ้น เพราะโค้ดผ่าน test และ plan)

---

### STEP 6 – QA ตรวจสอบ

เดิม step 6 มีปัญหา: เจอ bug → ยังคงปรับใหม่ → เสียเวลา → ส่งงานเข้า

**ปรับปรุงเป็น:**

#### ก่อนส่งให้ QA ใช้ 🔍 **scrutinize** (AI Skill) – **Mandatory** (KANDATORY)
- ตรวจสอบ logic และ side effects ทุกครั้ง
- ตรวจสอบว่า test ครอบคลุมหรือไม่
- **ห้าม merge / ส่งงาน** ถ้ายังไม่ผ่าน scrutinize

✅ **ผลลัพธ์:** QA พบ bug น้อยลงมาก ไม่เสียเวลาวนแก้ทีหลัง

---

## 📊 ตารางเปรียบเทียบสั้น ๆ

| ขั้นตอน | Workflow เดิม (Without AI) | Workflow ใหม่ (With AI) |
|--------|----------------------------|--------------------------|
| Step 3 | วางแผนลวก ๆ ตรวจสอบซ้ำซ้อน | brainstorming → writing-plans → executing-plans |
| Step 4 | ไม่มี safety net | investigate-error หรือ TDD |
| Step 6 | ส่ง QA → เจอ bug → เสียเวลา | scrutinize บังคับก่อนส่ง QA |

---

## 🧰 สรุป AI Skills ที่ใช้ใน workflow ใหม่

| AI Skill | ใช้ที่ขั้นตอน |
|----------|----------------|
| brainstorming | Step 3.1 |
| writing-plans | Step 3.2 |
| executing-plans | Step 3.3 |
| investigate-error | Step 4 (กรณีเจอ error) |
| test-driven-development | Step 4 (กรณีเขียน test ก่อน) |
| scrutinize | Step 6 (ก่อนส่ง QA – บังคับ) |

-----------------------------------------------
-----------------------------------------------
-----------------------------------------------
# 🧠 AI Superpowers Developer Guide  
## คู่มือนักพัฒนาพลัง AI (6 ทักษะ)

---

## 1. บทนำ (Introduction)

### English
This guide introduces **6 essential AI skills** that every developer should integrate into their daily workflow. These skills are not just tools – they are a disciplined way of thinking, planning, executing, and verifying work. By adopting these skills, you will reduce bugs, avoid rework, and deliver higher quality results with less stress. The skills are designed to work together seamlessly across both **normal feature development** and **bug fix workflows**.

### ภาษาไทย
คู่มือนี้แนะนำ **ทักษะ AI 6 ประการ** ที่นักพัฒนาทุกคนควรนำไปใช้ในเวิร์กโฟลว์ประจำวัน ทักษะเหล่านี้ไม่ใช่แค่เครื่องมือ แต่เป็นแนวคิดที่มีระเบียบวินัยในการคิด วางแผน ลงมือทำ และตรวจสอบงาน การนำทักษะเหล่านี้ไปใช้จะช่วยลดบั๊ก หลีกเลี่ยงการทำงานซ้ำ และส่งมอบงานที่มีคุณภาพสูงขึ้นโดยไม่เครียดเกินไป ทักษะทั้ง 6 ออกแบบมาให้ทำงานร่วมกันได้อย่างราบรื่นทั้งใน **เวิร์กโฟลว์พัฒนาฟีเจอร์ทั่วไป** และ **เวิร์กโฟลว์แก้บั๊ก**

---

## 2. บทนิยาม (Definitions of 6 AI Skills)

| # | Skill Name | English Definition | คำนิยามภาษาไทย |
|---|------------|--------------------|------------------|
| 1 | **brainstorming** | Understand the task deeply, identify faulty assumptions, and ask yourself critical questions before taking any action. | ทำความเข้าใจงานอย่างลึกซึ้ง ค้นหาสมมติฐานที่ผิดพลาด และตั้งคำถามสำคัญกับตัวเองก่อนลงมือทำทุกครั้ง |
| 2 | **writing-plans** | Create a clear implementation plan, break work into subtasks with order, and never execute without a plan. | เขียนแผนการ implement ที่ชัดเจน แบ่งงานเป็น subtask พร้อมลำดับขั้นตอน และจะไม่ลงมือทำโดยไม่มีแผน |
| 3 | **executing-plans** | Implement strictly according to the plan, step by step – no skipping, no reordering, no improvisation. | ลงมือ implement ตามแผนที่เขียนไว้ strictly ทีละขั้นตอน – ไม่ข้าม ไม่สลับลำดับ ไม่ทำนอกแผน |
| 4 | **investigate-error** | When an error occurs, analyze root cause, prioritize causes, and produce a report before any fix attempt. | เมื่อเกิด error ให้วิเคราะห์ root cause จัดลำดับสาเหตุ และออกรายงาน ก่อนเริ่มแก้ไขใดๆ |
| 5 | **test-driven-development** | Write tests first, then implement code to make tests pass – fix one bug at a time. | เขียน test ก่อน แล้วจึงเขียนโค้ดให้ test ผ่าน – แก้บั๊กทีละจุด |
| 6 | **scrutinize** | Mandatory final check: review logic and side effects before merging. No exceptions. | การตรวจสอบบังคับก่อน merge: ทบทวน logic และ side effects ทุกครั้ง ไม่มีข้อยกเว้น |

---

## 3. บทหัวข้อ (Main Chapter Headings)

คู่มือนี้ประกอบด้วย 8 หัวข้อหลัก (8 main sections):

| No. | English Heading | หัวข้อภาษาไทย |
|-----|----------------|----------------|
| 1 | Introduction | บทนำ |
| 2 | Definitions | บทนิยาม |
| 3 | Workflow Integration | การผสานเข้ากับเวิร์กโฟลว์ |
| 4 | Skill Deep Dive | รายละเอียดแต่ละทักษะ |
| 5 | Normal Workflow with AI | เวิร์กโฟลว์ปกติที่ใช้ AI |
| 6 | Bug Fix Workflow with AI | เวิร์กโฟลว์แก้บั๊กที่ใช้ AI |
| 7 | TASK LIST Template | แม่แบบรายการงาน |
| 8 | CHECKLIST Template | แม่แบบรายการตรวจสอบ |

> หมายเหตุ: เนื้อหาส่วนที่ 4 (Skill Deep Dive) สามารถขยายเพิ่มเติมได้ แต่ในเอกสารนี้จะเน้นการออกแบบคู่มือและ workflow พร้อม template

---

## 5. ออกแบบคู่มือ (Guide Design Principles)

### English
This guide is designed to be:
- **Actionable** – every skill has clear triggers and steps
- **Visual** – workflows are shown as step diagrams
- **Bilingual** – English and Thai side-by-side
- **Template-driven** – ready-to-use TASK LIST and CHECKLIST
- **Mandatory** – some steps (like scrutinize) are marked KANDATORY (no exceptions)

### ภาษาไทย
คู่มือนี้ถูกออกแบบให้:
- **นำไปปฏิบัติได้จริง** – ทุกทักษะมีเงื่อนไขเริ่มต้นและขั้นตอนชัดเจน
- **เป็นภาพ** – เวิร์กโฟลว์แสดงเป็นแผนภาพขั้นตอน
- **สองภาษา** – อังกฤษและไทยควบคู่กัน
- **ใช้แม่แบบได้** – มี TASK LIST และ CHECKLIST พร้อมใช้
- **บังคับปฏิบัติ** – บางขั้นตอน (เช่น scrutinize) ถูกกำกับว่า KANDATORY (ไม่มีข้อยกเว้น)

---

## 6. ออกแบบ Workflow (Workflow Design)

### 6.1 Normal Workflow (พัฒนาฟีเจอร์ทั่วไป)

```
STEP 1: รับ Story Task
        ↓
STEP 2: แปลงเป็น Technical Task
        ↓
STEP 3: [AI] brainstorming ──→ [AI] writing-plans ──→ [AI] executing-plans
        ↓
STEP 4: หากเกิด error → [AI] investigate-error (แล้วกลับไป executing-plans)
        หากไม่เกิด → ไป STEP 5
        ↓
STEP 5: Proof of Work (record + screenshot)
        ↓
STEP 6: [AI] scrutinize (KANDATORY - ผ่านเท่านั้นถึงส่ง QA)
        ↓
STEP 7: ส่งให้ QA
```

### 6.2 Bug Fix Workflow (แก้บั๊ก)

```
STEP 1: พบบั๊ก (จาก QA หรือ logging)
        ↓
STEP 2: [AI] investigate-error → เขียน root cause report
        ↓
STEP 3: [AI] writing-plans (แผนแก้บั๊ก + subtasks)
        ↓
STEP 4A (Path A): [AI] executing-plans (แก้ตามแผน)
STEP 4B (Path B): [AI] test-driven-development (เขียน test ก่อน แล้วค่อยแก้)
        ↓
STEP 5: [AI] scrutinize (KANDATORY)
        ↓
STEP 6: ส่งให้ QA / merge
```

> **หมายเหตุ**: ทุก workflow ต้องผ่าน scrutinize ก่อนส่งงานเสมอ

---

## 7. TASK LIST Template (แม่แบบรายการงาน)

ใช้สำหรับ `writing-plans` – ก่อน execute ทุกครั้ง

### English Template

```markdown
# TASK LIST – [Feature/Bug ID]

## Objective
[One sentence describing what success looks like]

## Subtasks (in order)
- [ ] 1. [Subtask description] – Est: [time]
- [ ] 2. [Subtask description] – Depends on: #1
- [ ] 3. [Subtask description] – Depends on: #2
- [ ] 4. ...

## Dependencies
- External: [list any APIs, services, or teams]
- Internal: [list previous tasks or files]

## Risk / Assumptions
- [Any assumption that might be wrong]
- [Risk and mitigation]

## Definition of Done
- [ ] All subtasks completed
- [ ] Tests pass (if TDD)
- [ ] scrutinize passed
```

### แม่แบบภาษาไทย

```markdown
# รายการงาน (TASK LIST) – [รหัสฟีเจอร์/บั๊ก]

## เป้าหมาย
[หนึ่งประโยคที่บอกว่าความสำเร็จหน้าตาเป็นอย่างไร]

## รายการงานย่อย (เรียงตามลำดับ)
- [ ] 1. [รายละเอียดงานย่อย] – เวลาที่คาด: [เวลา]
- [ ] 2. [รายละเอียดงานย่อย] – ขึ้นกับ: ข้อ 1
- [ ] 3. [รายละเอียดงานย่อย] – ขึ้นกับ: ข้อ 2
- [ ] 4. ...

## สิ่งที่ต้องพึ่งพา
- ภายนอก: [API, บริการ, หรือทีมอื่น]
- ภายใน: [งานก่อนหน้าหรือไฟล์ที่เกี่ยวข้อง]

## ความเสี่ยง / สมมติฐาน
- [สมมติฐานที่อาจผิดพลาด]
- [ความเสี่ยงและแนวทางลดความเสี่ยง]

## นิยามของความสำเร็จ (Definition of Done)
- [ ] งานย่อยทั้งหมดเสร็จ
- [ ] Test ผ่าน (ถ้าใช้ TDD)
- [ ] ผ่านการ scrutinize
```

---

## 8. CHECKLIST Template (แม่แบบรายการตรวจสอบ)

ใช้สำหรับ `scrutinize` (KANDATORY) – ก่อน merge หรือส่ง QA ทุกครั้ง

### English Template

```markdown
# SCRUTINIZE CHECKLIST – [Task ID]

## Logic & Correctness
- [ ] Does the code do exactly what the plan said?
- [ ] Are there any off-by-one, null, or edge-case errors?
- [ ] Have all assumptions been validated?

## Side Effects
- [ ] Does this change affect other parts of the system?
- [ ] Are there unintended performance impacts?
- [ ] Are logs, metrics, or monitoring affected?

## Test & Coverage
- [ ] Are new tests added for this change?
- [ ] Do all existing tests still pass?
- [ ] Is TDD followed (if bug fix)?

## Plan Adherence
- [ ] Was the TASK LIST followed without skipping steps?
- [ ] Were any steps reordered? If yes, is it justified?

## Final
- [ ] I have reviewed everything and confirm it is safe to merge.
```

### แม่แบบภาษาไทย

```markdown
# รายการตรวจสอบ SCRUTINIZE (บังคับ) – [รหัสงาน]

## ตรรกะและความถูกต้อง
- [ ] โค้ดทำตามที่แผนเขียนไว้เป๊ะหรือไม่?
- [ ] มี error แบบ off-by-one, null, หรือ edge-case ไหม?
- [ ] สมมติฐานทั้งหมดถูกตรวจสอบแล้วหรือยัง?

## ผลกระทบข้างเคียง (Side Effects)
- [ ] การเปลี่ยนแปลงนี้ส่งผลต่อส่วนอื่นของระบบหรือไม่?
- [ ] มีผลกระทบต่อประสิทธิภาพโดยไม่ตั้งใจหรือไม่?
- [ ] logs, metrics, หรือ monitoring ได้รับผลกระทบไหม?

## Test และความครอบคลุม
- [ ] มีการเพิ่ม test ใหม่สำหรับการเปลี่ยนแปลงนี้หรือไม่?
- [ ] test เดิมทั้งหมดผ่านไหม?
- [ ] ใช้ TDD ตามที่กำหนด (ถ้าเป็นการแก้บั๊ก) หรือไม่?

## การทำตามแผน
- [ ] TASK LIST ถูกลำดับตามโดยไม่ข้ามขั้นตอน?
- [ ] มีการสลับลำดับขั้นตอนหรือไม่? ถ้ามี มีเหตุผลสมควรหรือไม่?

## สรุป
- [ ] ผม/ฉัน ได้ตรวจสอบทุกอย่างแล้ว และยืนยันว่าปลอดภัยที่จะ merge
```

---
 
### 6.3 Bug Fix Workflow – Detailed Diagram Version  
(อ้างอิงจาก diagram ใน image.png)

#### 🔹 Diagram Steps (4 Main Steps)

| Step | English | ภาษาไทย |
|------|---------|----------|
| STEP 1 | **Initiate** – ใช้ `invalidate-error` (หรือ `investigate-error`) | เริ่มต้น – ใช้ทักษะตรวจสอบข้อผิดพลาด |
| STEP 2 | **writing-plans** + **executing-plans** | เขียนแผน + ลงมือตามแผน |
| STEP 3 | **test-driven-development** | เขียน test ก่อน แล้วค่อยแก้โค้ด |
| STEP 4 | **Debug** | ดีบัก (ปรับแต่งจน test ผ่าน) |

#### 🔹 Detailed Sub‑steps (inside STEP 1 – Initiate)

Diagram ระบุรหัสย่อยเพิ่มเติมในขั้นตอน `initiate` ซึ่งใช้ประกอบ `investigate-error`:

```text
initiate-injector-error
reading-video-trace
tracking-fail-path
hypothesis-message
root-cause-identified
report-event
```

**อธิบาย (Bilingual):**

| Step | English | ภาษาไทย |
|------|---------|----------|
| 1 | `initiate-injector-error` | เริ่มต้นการฉีดข้อผิดพลาด (หรือเริ่มต้นตรวจสอบ error) |
| 2 | `reading-video-trace` | อ่าน trace หรือ log ที่บันทึกไว้ (อาจเป็น session replay หรือ log) |
| 3 | `tracking-fail-path` | ติดตามเส้นทางที่ทำให้เกิดความล้มเหลว |
| 4 | `hypothesis-message` | ตั้งสมมติฐานถึงสาเหตุที่เป็นไปได้ |
| 5 | `root-cause-identified` | ระบุ root cause ที่แท้จริง |
| 6 | `report-event` | รายงานเหตุการณ์ (เพื่อใช้ในการวางแผนแก้ไข) |

> 💡 สิ่งนี้สอดคล้องกับทักษะ `investigate-error` จากคู่มือหลัก (STEP 1 ของ Bug Fix Workflow)

#### 🔹 Special Gate: NEXTORY GATE - 2.2 PATH

ใน diagram มีปุ่มหรือจุดตัดสินใจชื่อ **NEXTORY GATE - 2.2 PATH**  
ซึ่งมีความหมายว่า:

- **English:** Before moving to STEP 2 (writing-plans), the workflow must pass through this gate. It ensures that the investigation (STEP 1) is complete and a root cause report exists.
- **ภาษาไทย:** ก่อนเข้าสู่ STEP 2 (writing-plans) เวิร์กโฟลว์ต้องผ่านประตูนี้ เพื่อยืนยันว่าการสอบสวน (STEP 1) เสร็จสมบูรณ์และมีรายงาน root cause แล้ว

#### 🔹 Mandatory Scrutinize

แม้ diagram จะแสดง `scrutinize` อยู่ข้าง ๆ ปุ่ม NEXTORY GATE แต่ในคู่มือหลักเราใช้ `scrutinize` **ก่อนส่งงานหรือ merge** ดังนั้นให้ตีความว่า:

- หลังจาก STEP 4 (Debug) → ต้องทำ `scrutinize` (KANDATORY)
- หากมีการวนกลับไปแก้ไขที่ STEP 2‑3 ก็ต้องผ่าน scrutinize ทุกครั้งก่อนจบ workflow

#### 🔹 Sidebar Skills (จาก image.png)

Diagram มี sidebar แสดง 3 ทักษะเสริม:

| Sidebar Skill | ความสัมพันธ์กับคู่มือหลัก |
|---------------|--------------------------|
| `invalidate-error` | ชื่ออื่นของ `investigate-error` (ใช้ใน STEP 1) |
| `investigate` | ชื่อสั้นของ `investigate-error` |
| `investigate-problem` | อีกรูปแบบหนึ่งของ `investigate-error` |

> ✅ **สรุป:** ทักษะทั้งหมดใน sidebar เป็นส่วนหนึ่งของขั้นตอน **STEP 1 – Initiate** เท่านั้น

---

### 📌 ตัวอย่าง Flow แบบเต็ม (Bilingual)

#### English

```
BUG FIX FLOW (Detailed)

STEP 1 – Initiate
   ├─ initiate-injector-error
   ├─ reading-video-trace
   ├─ tracking-fail-path
   ├─ hypothesis-message
   ├─ root-cause-identified
   └─ report-event
   ↓
[ NEXTORY GATE - 2.2 PATH ] → scrutinize (partial check)
   ↓
STEP 2 – writing-plans + executing-plans
   ↓
STEP 3 – test-driven-development
   ↓
STEP 4 – Debug
   ↓
Final scrutinize (KANDATORY) → Merge / QA
```

#### ภาษาไทย

```
เวิร์กโฟลว์แก้บั๊ก (แบบละเอียด)

STEP 1 – เริ่มต้น
   ├─ initiate-injector-error
   ├─ อ่าน video trace / log
   ├─ ติดตามเส้นทางที่เกิดความล้มเหลว
   ├─ ตั้งสมมติฐาน
   ├─ ระบุ root cause
   └─ รายงานเหตุการณ์
   ↓
[ NEXTORY GATE - 2.2 PATH ] → scrutinize (ตรวจสอบบางส่วน)
   ↓
STEP 2 – writing-plans + executing-plans
   ↓
STEP 3 – test-driven-development
   ↓
STEP 4 – ดีบัก
   ↓
 scrutinize (บังคับสมบูรณ์) → ส่ง QA หรือ merge
```

---

## 🔄 การปรับปรุงคู่มือเดิม (สรุปตำแหน่งที่เพิ่ม)

| ในคู่มือเดิม | การเพิ่มเติม |
|-------------|--------------|
| ข้อ 6.2 Bug Fix Workflow with AI | ยังคงไว้ตามเดิม (เป็นแบบ) |
| **ใหม่:** ข้อ 6.3 Bug Fix Workflow – Detailed Diagram Version | เพิ่มทั้งหมดตามด้านบน |
| ข้อ 8 CHECKLIST Template | ไม่เปลี่ยนแปลง |
| ข้อ 7 TASK LIST Template | ไม่เปลี่ยนแปลง |

---
 




## สรุปการใช้งาน (Quick Usage Summary)

| ขั้นตอน | ทักษะ AI ที่ใช้ | แม่แบบที่เกี่ยวข้อง |
|---------|----------------|----------------------|
| ก่อนลงมือทำ | brainstorming + writing-plans | TASK LIST |
| ระหว่างลงมือทำ | executing-plans | (ยึดตาม TASK LIST) |
| เมื่อเจอ error | investigate-error | root cause report (ไม่บังคับtemplate) |
| ถ้าต้องการป้องกัน error | test-driven-development | test files |
| ก่อนส่งงาน | scrutinize (KANDATORY) | SCRUTINIZE CHECKLIST |

---

**End of Guide**  
**จบคู่มือ**