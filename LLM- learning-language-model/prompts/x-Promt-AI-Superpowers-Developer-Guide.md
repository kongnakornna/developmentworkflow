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
| 3 | Main Chapter Headings | บทหัวข้อ |
| 4 | *(reserved for future)* | *(สงวนไว้)* |
| 5 | Guide Design Principles | การออกแบบคู่มือ |
| 6 | Workflow Design | การออกแบบ Workflow |
| 7 | TASK LIST Template | แม่แบบ TASK LIST |
| 8 | CHECKLIST Template | แม่แบบ CHECKLIST |

> หมายเหตุ: เนื้อหาส่วนที่ 4 ยังไม่ได้กำหนดในเอกสารนี้

---

## 5. ออกแบบคู่มือ (Guide Design Principles)

### English  
This guide is designed to be:
- **Actionable** – every skill has clear triggers and steps
- **Visual** – workflows are shown as step diagrams
- **Bilingual** – English and Thai side-by-side
- **Template-driven** – ready-to-use TASK LIST and CHECKLIST
- **Mandatory** – some steps (like scrutinize) are marked **KANDATORY** (no exceptions)

### ภาษาไทย  
คู่มือนี้ถูกออกแบบให้:
- **นำไปปฏิบัติได้จริง** – ทุกทักษะมีเงื่อนไขเริ่มต้นและขั้นตอนชัดเจน
- **เป็นภาพ** – เวิร์กโฟลว์แสดงเป็นแผนภาพขั้นตอน
- **สองภาษา** – อังกฤษและไทยควบคู่กัน
- **ใช้แม่แบบได้** – มี TASK LIST และ CHECKLIST พร้อมใช้
- **บังคับปฏิบัติ** – บางขั้นตอน (เช่น scrutinize) ถูกกำกับว่า **KANDATORY** (ไม่มีข้อยกเว้น)

---

## 6. ออกแบบ Workflow (Workflow Design)

### 6.1 Normal Workflow (พัฒนาฟีเจอร์ทั่วไป)

```text
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

### 6.2 Bug Fix Workflow (แก้บั๊ก) – แบบสรุป

```text
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

### 6.3 Bug Fix Workflow – แบบละเอียด (Detailed Diagram Version)

#### ขั้นตอนหลัก (4 Steps)

| Step | English | ภาษาไทย |
|------|---------|----------|
| STEP 1 | **Initiate** – ใช้ `investigate-error` | เริ่มต้น – ใช้ทักษะตรวจสอบข้อผิดพลาด |
| STEP 2 | **writing-plans** + **executing-plans** | เขียนแผน + ลงมือตามแผน |
| STEP 3 | **test-driven-development** | เขียน test ก่อน แล้วค่อยแก้โค้ด |
| STEP 4 | **Debug** | ดีบัก (ปรับแต่งจน test ผ่าน) |

#### รายละเอียดย่อยใน STEP 1 (Initiate)

```text
initiate-injector-error
reading-video-trace
tracking-fail-path
hypothesis-message
root-cause-identified
report-event
```

| Step | English | ภาษาไทย |
|------|---------|----------|
| 1 | `initiate-injector-error` | เริ่มต้นการตรวจสอบ error |
| 2 | `reading-video-trace` | อ่าน trace หรือ log ที่บันทึกไว้ |
| 3 | `tracking-fail-path` | ติดตามเส้นทางที่ทำให้เกิดความล้มเหลว |
| 4 | `hypothesis-message` | ตั้งสมมติฐานถึงสาเหตุที่เป็นไปได้ |
| 5 | `root-cause-identified` | ระบุ root cause ที่แท้จริง |
| 6 | `report-event` | รายงานเหตุการณ์ (เพื่อใช้ในการวางแผนแก้ไข) |

#### NEXTORY GATE - 2.2 PATH

- **English:** Before moving to STEP 2 (writing-plans), the workflow must pass through this gate. It ensures that the investigation (STEP 1) is complete and a root cause report exists.
- **ภาษาไทย:** ก่อนเข้าสู่ STEP 2 (writing-plans) เวิร์กโฟลว์ต้องผ่านประตูนี้ เพื่อยืนยันว่าการสอบสวน (STEP 1) เสร็จสมบูรณ์และมีรายงาน root cause แล้ว

#### Flow แบบเต็ม (Bilingual)

**English**
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

**ภาษาไทย**
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

## ภาคผนวก: Normal Workflow แบบไม่มี AI (สำหรับเปรียบเทียบ)

### English – Original Workflow (Without AI)

| Step | Description |
|------|-------------|
| STEP 1 | Receive Story Task from Product Owner |
| STEP 2 | Convert to Technical Task (no validation) |
| STEP 3 | Understand – Plan – Execute (no structure) |
| STEP 4 | Verify correctness (no checklist, no safety net) |
| STEP 5 | Proof of Work (manual record + screenshot) |
| STEP 6 | QA finds bugs → rework → waste time → deliver |

### ภาษาไทย – เวิร์กโฟลว์เดิม (ไม่มี AI)

| ขั้นตอน | คำอธิบาย |
|---------|-----------|
| STEP 1 | รับ Story Task จาก Product Owner |
| STEP 2 | แปลงเป็น Technical Task (ไม่มีการตรวจสอบคุณภาพ) |
| STEP 3 | ทำความเข้าใจ – วางแผน – ลงมือทำ (ไม่มีโครงสร้าง) |
| STEP 4 | ตรวจสอบความถูกต้อง (ไม่มี checklist, ไม่มี safety net) |
| STEP 5 | Proof of Work (บันทึกเอง + จับ screenshot) |
| STEP 6 | QA พบ bug → แก้ซ้ำ → เสียเวลา → ส่งงาน |

---

## สรุปการใช้งาน (Quick Usage Summary)

| ขั้นตอน | ทักษะ AI ที่ใช้ | แม่แบบที่เกี่ยวข้อง |
|---------|----------------|----------------------|
| ก่อนลงมือทำ | brainstorming + writing-plans | TASK LIST |
| ระหว่างลงมือทำ | executing-plans | (ยึดตาม TASK LIST) |
| เมื่อเจอ error | investigate-error | root cause report |
| ถ้าต้องการป้องกัน error | test-driven-development | test files |
| ก่อนส่งงาน | scrutinize (KANDATORY) | SCRUTINIZE CHECKLIST |

---

**END OF DOCUMENT**