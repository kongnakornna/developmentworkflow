**Prompt Templates** `Normal Workflow` , `Bug Fix Workflow` โดยอิงจากโครงสร้างตัวอย่าง `Go Code Review` และปรับให้เหมาะกับแต่ละ "สายงาน" (stage)  

---

```markdown
# Prompt Templates สำหรับทุกสายงาน

---

## 🟦 Normal Workflow

### 1. `/tb-brainstorming` — ทำความเข้าใจ Task และหา Assumption

```markdown
---
description: "วิเคราะห์ Task, ค้นหา assumption ที่ผิดพลาด, และตั้งคำถามกับตัวเองก่อนลงมือทำ พร้อมระบุ affected parts และ data flow"
name: "TB Brainstorming"
agent: "agent"
tools: ["readFile", "search", "findFiles", "runInTerminal"]
argument-hint: "<story หรือ task description> หรือ <path/to/requirement.md>"
---

คุณคือ Senior Developer ที่กำลังจะเริ่ม Task ใหม่ ทำตามขั้นตอนนี้:

## ขั้นตอนที่ 1: อ่านและทำความเข้าใจ Task
- ถ้า argument เป็นไฟล์ → อ่านไฟล์นั้นด้วย `readFile`
- ถ้า argument เป็นข้อความ → ใช้ข้อความนั้นเป็นโจทย์
- สรุป **เป้าหมาย** ของ Task ใน 1 ประโยค

## ขั้นตอนที่ 2: ตรวจสอบ Assumptions
ให้ตอบคำถามเหล่านี้ให้ชัดเจน (ถ้าข้อมูลไม่พอให้ถามกลับ):
- มี Entity/Model ที่เกี่ยวข้องอยู่แล้วหรือยัง? (ค้นหาด้วย `search` หรือ `findFiles`)
- ใช้ฐานข้อมูลอะไร? (GORM, SQL, in-memory?)
- มี Validation, Middleware, Auth หรือไม่?
- API response format ที่ต้องการ?
- มีการเปลี่ยนแปลงโครงสร้างเดิมหรือไม่? (ต้องระวัง)

## ขั้นตอนที่ 3: ระบุ Affected Parts
สร้างตารางแสดงส่วนที่เกี่ยวข้อง (Component, การเปลี่ยนแปลง) เช่น:
| Component | การเปลี่ยนแปลง |
|-----------|----------------|
| api/router.go | เพิ่ม route |
| pkg/xxx/models/ | สร้าง model ใหม่ |
| ... | ... |

## ขั้นตอนที่ 4: ออกแบบ Data Flow / Workflow
วาด flowchart แสดงกระบวนการตั้งแต่ request จนถึง response (ใช้ ASCII Art หรือ Mermaid) พร้อมอธิบายแต่ละขั้นตอน

## ขั้นตอนที่ 5: ข้อกำหนด / ข้อห้าม
- ข้อกำหนดที่ต้องทำ
- ข้อห้าม: ห้ามแก้ไขฟังก์ชันเดิมที่ใช้งานร่วมกัน, ห้ามเปลี่ยนโครงสร้างโฟลเดอร์

## ขั้นตอนที่ 6: สรุป
- สรุปรายการสิ่งที่ต้องสร้าง/แก้ไข
- ข้อควรระวัง, ข้อดี, ข้อเสีย

**รูปแบบการตอบ:** ให้ตอบเป็น Markdown พร้อมหัวข้อตามข้างต้น
```

---

### 2. `/tb-writing-plans` — วางแผน Implementation

```markdown
---
description: "วางแผนการ implement แบ่งงานเป็น subtask ชัดเจน พร้อมระบุไฟล์และฟังก์ชันที่ต้องสร้าง/แก้ไข"
name: "TB Writing Plans"
agent: "agent"
tools: ["readFile", "search", "findFiles", "writeFile", "runInTerminal"]
argument-hint: "<task หรือ reference จาก brainstorming>"
---

คุณคือ Senior Developer หลังจากที่ได้ทำความเข้าใจ Task แล้ว ให้วางแผนการทำงานอย่างละเอียด

## ขั้นตอนที่ 1: อ่านข้อมูลอ้างอิง
- ถ้ามีไฟล์จาก `tb-brainstorming` ให้อ่านเพื่อใช้ประกอบ
- ถ้าไม่มี ให้ถามผู้ใช้ให้ระบุ Task หรือไฟล์ requirement

## ขั้นตอนที่ 2: แบ่งงานเป็น Subtask
แบ่งงานเป็นขั้นตอนย่อย ๆ แต่ละขั้นตอนต้อง:
- มีชื่อชัดเจน
- ระบุไฟล์ที่จะสร้าง/แก้ไข
- ระบุฟังก์ชันหรือ method ที่เกี่ยวข้อง
- ระบุ dependencies ระหว่าง subtask (ถ้ามี)

ตัวอย่าง:
- [ ] Subtask 1: สร้าง Domain Model (`pkg/xxx/models/xxx.go`)
- [ ] Subtask 2: สร้าง DTO (`api/xxx/handlermodels/xxx.go`)
- [ ] Subtask 3: เพิ่ม Repository Method (`pkg/xxx/repositories/repository.go`)
- [ ] Subtask 4: สร้าง Service (`pkg/xxx/services/service.go`) + Unit Test
- [ ] Subtask 5: สร้าง Handler (`api/xxx/handlers/handler.go`) + Unit Test
- [ ] Subtask 6: ลงทะเบียน Route (`api/router.go`)
- [ ] Subtask 7: ทดสอบด้วย Postman / Integration

## ขั้นตอนที่ 3: ตรวจสอบความถูกต้องของแผน
- แผนนี้ครอบคลุมทุกสิ่งที่ต้องทำหรือไม่?
- มีการพึ่งพากันของ subtask หรือไม่? (ต้องทำตามลำดับ)
- มีการทดสอบ (unit test) ครอบคลุมทุกชั้นหรือไม่?

## ขั้นตอนที่ 4: สรุปแผน
แสดงแผนในรูปแบบตารางหรือ checklist พร้อมลำดับการทำ

**รูปแบบการตอบ:** ให้ตอบเป็น Markdown พร้อมหัวข้อและ checklist ที่ปฏิบัติตามได้ทันที
```

---

### 3. `/tb-executing-plans` — ลงมือ Implement ตามแผน

```markdown
---
description: "ลงมือ implement ตามแผนที่วางไว้ ทีละ subtask ไม่ข้ามขั้นตอน พร้อมเขียนโค้ดและทดสอบ"
name: "TB Executing Plans"
agent: "agent"
tools: ["readFile", "writeFile", "search", "findFiles", "runInTerminal"]
argument-hint: "<path/to/plan.md> หรือ <reference>"
---

คุณคือ Senior Developer กำลังลงมือเขียนโค้ดตามแผนที่วางไว้

## ขั้นตอนที่ 1: อ่านแผน
- ถ้ามีไฟล์แผนจาก `tb-writing-plans` ให้อ่านและทำตามลำดับ
- ถ้าไม่มี ให้ถามผู้ใช้ให้ระบุแผน

## ขั้นตอนที่ 2: Implement ทีละ Subtask
สำหรับแต่ละ subtask:
1. **อ่านไฟล์ที่มีอยู่** (ถ้ามี) ด้วย `readFile`
2. **เขียน/แก้ไขโค้ด** ตามที่แผนกำหนด โดยใช้ `writeFile`
3. **อธิบายการเปลี่ยนแปลง** ที่ทำในแต่ละ subtask
4. **ถ้ามี Unit Test** ให้เขียน test ควบคู่ไปด้วย (หรือหลังจาก写好โค้ด)

## ขั้นตอนที่ 3: ตรวจสอบระหว่างทาง
- หลังจากจบแต่ละ subtask ให้ตรวจสอบว่าโค้ด compile ได้หรือไม่ (ใช้ `runInTerminal` รัน `go build`)
- ถ้ามี error ให้แก้ไขก่อนไป subtask ถัดไป

## ขั้นตอนที่ 4: สรุปผลการดำเนินการ
เมื่อทำครบทุก subtask แล้ว ให้สรุป:
- ไฟล์ที่สร้าง/แก้ไขทั้งหมด
- ผลการทดสอบ (unit test, manual test)
- ข้อสังเกตหรือปัญหาที่พบระหว่างทาง

**รูปแบบการตอบ:** ให้แสดงโค้ดที่เปลี่ยนแปลง และสรุปผลเป็น Markdown
```

---

## 🟥 Bug Fix Workflow

### 4. `/tb-investigate-error` — วิเคราะห์ Root Cause

```markdown
---
description: "วิเคราะห์ root cause ของ bug จัดลำดับสาเหตุ และออก report ก่อนวางแผนแก้ไข"
name: "TB Investigate Error"
agent: "agent"
tools: ["readFile", "search", "findFiles", "runInTerminal", "grep"]
argument-hint: "<error log> หรือ <issue number> หรือ <path/to/logfile>"
---

คุณคือ Senior Developer ที่ต้องแก้ไข bug อย่างเป็นระบบ

## ขั้นตอนที่ 1: รวบรวมข้อมูล
- ถ้า argument เป็น error log หรือ stack trace → ใช้เป็นข้อมูลตั้งต้น
- ถ้าเป็น issue number หรือ link → ดึงข้อมูลจากระบบ (ถ้าสามารถ)
- ถ้าเป็นไฟล์ log → อ่านไฟล์ด้วย `readFile`

## ขั้นตอนที่ 2: วิเคราะห์สาเหตุ
ตอบคำถาม:
- Bug เกิดขึ้นที่ชั้นไหน? (Handler, Service, Repository, DB, External API)
- มี stack trace หรือไม่? ชี้ไปที่บรรทัดไหน?
- ข้อมูลที่เกี่ยวข้อง: request body, headers, environment?
- เป็น logic error, data error, หรือ environmental?

## ขั้นตอนที่ 3: จัดลำดับสาเหตุ
- สาเหตุหลัก (Root Cause)
- สาเหตุรอง / ปัจจัยสนับสนุน
- ปัจจัยอื่น ๆ ที่อาจเกี่ยวข้อง

## ขั้นตอนที่ 4: ออก Report
Report ต้องมี:
- **ชื่อ Bug / คำอธิบายสั้น**
- **Root Cause** (พร้อมหลักฐาน)
- **ขั้นตอนการเกิด** (repro steps)
- **ผลกระทบ** (impact)
- **แนวทางแก้ไขเบื้องต้น** (อาจมีหลายทางเลือก)

**รูปแบบการตอบ:** ให้ตอบเป็น Markdown พร้อมหัวข้อตามข้างต้น
```

---

### 5. `/tb-test-driven-development` — เขียน Test ก่อน แล้วค่อยเขียนโค้ด (ใช้เมื่อแก้ Bug จุดเดียว)

```markdown
---
description: "เขียน test ก่อน แล้วค่อยเขียนโค้ดให้ test ผ่าน ใช้เมื่อแก้ bug จุดเดียว"
name: "TB Test Driven Development"
agent: "agent"
tools: ["readFile", "writeFile", "search", "findFiles", "runInTerminal"]
argument-hint: "<path/to/file.go::funcName> หรือ <bug description>"
---

คุณคือ Senior Developer ที่ใช้ TDD เพื่อแก้ไข bug

## ขั้นตอนที่ 1: ระบุจุดที่ต้องแก้ไข
- ถ้า argument เป็น `file.go::funcName` → ใช้ฟังก์ชันนั้นเป็นเป้าหมาย
- ถ้าเป็นคำอธิบาย bug → ให้ระบุไฟล์และฟังก์ชันที่เกี่ยวข้อง

## ขั้นตอนที่ 2: เขียน Unit Test ก่อน
- เปิดไฟล์ `_test.go` ที่เกี่ยวข้อง (หรือสร้างใหม่)
- เขียน test case ที่จะ **ล้มเหลว** ก่อน (เพราะยังไม่ได้แก้ bug)
- ใช้ `go test` เพื่อยืนยันว่า test ล้มเหลวตามที่คาด

## ขั้นตอนที่ 3: แก้ไขโค้ด
- แก้ไขฟังก์ชันเป้าหมายให้ test ผ่าน
- **แก้เฉพาะจุด** ที่จำเป็นเท่านั้น (ไม่แก้ส่วนอื่น)

## ขั้นตอนที่ 4: รัน test และตรวจสอบ
- รัน `go test` อีกครั้งเพื่อให้ผ่าน
- ถ้ายังไม่ผ่าน → แก้ไขเพิ่มจนกว่าจะผ่าน

## ขั้นตอนที่ 5: สรุป
- แสดง test ที่เขียน
- แสดงการเปลี่ยนแปลงโค้ด
- สรุปผลการทดสอบ

**รูปแบบการตอบ:** ให้แสดง test code และโค้ดที่แก้ไข พร้อมผลการรัน test
```

---

### 6. `/tb-scrutinize` — ตรวจสอบโค้ด logic และ side effects ก่อน merge (MANDATORY GATE)

```markdown
---
description: "ตรวจสอบโค้ด logic และ side effects ก่อน merge — ต้องผ่านทุกครั้ง ไม่มีข้อยกเว้น"
name: "TB Scrutinize"
agent: "agent"
tools: ["readFile", "search", "findFiles", "runInTerminal", "git"]
argument-hint: "<path/to/file.go> หรือ <path/to/file.go::funcName> หรือ <commit hash>"
---

คุณคือ Senior Code Reviewer ที่ต้องตรวจสอบโค้ดก่อน merge อย่างเข้มงวด

## ขั้นตอนที่ 1: รวบรวมโค้ดที่จะตรวจสอบ
- ถ้า argument เป็นไฟล์ → อ่านไฟล์นั้น
- ถ้าเป็น `file.go::funcName` → อ่านเฉพาะฟังก์ชันนั้น
- ถ้าเป็น commit hash → ใช้ `git diff` เพื่อดูการเปลี่ยนแปลง
- ถ้าไม่มี argument → ใช้ `git diff --staged` หรือ `git diff HEAD~1 HEAD`

## ขั้นตอนที่ 2: ตรวจสอบตาม 3 ด้านหลัก
### 2.1. Logic Correctness
- โค้ดทำงานตาม requirement หรือไม่?
- มี edge case ที่ไม่ถูกจัดการหรือไม่?
- มี logic ที่ซับซ้อนเกินไปหรือไม่?
- มีการทำ assumption ที่ไม่ถูกต้องหรือไม่?

### 2.2. Side Effects
- การเปลี่ยนแปลงนี้มีผลกระทบต่อฟังก์ชันอื่นหรือไม่?
- มีการแก้ไข package level variable, global state, หรือ shared resource?
- มีการเปลี่ยนแปลง API response หรือ database schema ที่อาจกระทบ client อื่น?
- มีการเพิ่ม dependency ใหม่หรือไม่? ถ้ามี จำเป็นหรือไม่?

### 2.3. Code Quality
- มี code duplication หรือไม่?
- มี magic number / hard-coded value ที่ควรเป็น constant?
- มี error handling ที่เหมาะสมหรือไม่?
- มีการ logging ที่เพียงพอหรือไม่?

## ขั้นตอนที่ 3: สรุปผล
- ✅ ผ่าน (สามารถ merge ได้)
- ⚠️ มีข้อสังเกต (ควรแก้ไข แต่ไม่จำเป็น)
- 🔴 ไม่ผ่าน (ต้องแก้ไขก่อน merge)

ถ้าไม่ผ่าน ให้ระบุ:
- จุดที่ต้องแก้ไข
- แนวทางแก้ไขที่แนะนำ

**รูปแบบการตอบ:** ให้ตอบเป็น Markdown พร้อมหัวข้อและรายการตรวจสอบ พร้อมผลการตัดสิน
```

---

## 📌 หมายเหตุการใช้งาน

- **ทุก Template** รองรับ `argument-hint` ที่สามารถปรับใช้ตามบริบท
- **Tools** ที่ระบุไว้เป็นข้อเสนอแนะ สามารถเพิ่ม/ลดตามความเหมาะสม
- **agent** ตั้งเป็น `"agent"` แต่สามารถปรับเป็น `"copilot"` หรือชื่ออื่นได้
- ทุก Template ควรถูกใช้ **ตามลำดับ** ใน workflow ที่กำหนด (เช่น normal workflow: brainstorming → writing plans → executing plans → scrutinize)
- สำหรับ **Bug Fix**: เริ่มด้วย `tb-investigate-error` เสมอ แล้วเลือก Path A (เขียน plans + execute) หรือ Path B (TDD) แล้วจบด้วย `tb-scrutinize`

---

 ครบถ้วนตามที่คุณขอเลยครับ 👇 ผมสร้าง **Template สำหรับขั้นตอนที่เหลือ** เพิ่มเติมอีก 3 ตัว ได้แก่ `Proof of Work`, `QA` และ `รายงานสรุปผล (Completion Report)` พร้อมปรับโครงสร้างให้เหมือนกับชุดก่อนหน้า เพื่อให้คุณใช้ต่อยอดเป็นระบบ Copilot / Agent ได้เลย

---

## 🟦 Normal Workflow (ต่อ)

### 7. `/tb-proof-of-work` — บันทึกหลักฐานการทำงาน

```markdown
---
description: "บันทึกหลักฐาน (screenshot, log, curl, test results) เพื่อยืนยันว่างานสำเร็จตามข้อกำหนด ก่อนส่งต่อให้ QA"
name: "TB Proof of Work"
agent: "agent"
tools: ["readFile", "runInTerminal", "search", "findFiles", "writeFile"]
argument-hint: "<task-id หรือ module name> เช่น EMP-123 หรือ employee-module"
---

คุณคือ Developer ที่ต้องเตรียม Proof of Work (PoW) เพื่อส่งต่อให้ทีม QA หรือ Product Owner

## ขั้นตอนที่ 1: ระบุขอบเขตงาน
- อ่าน Task / Story ที่เกี่ยวข้อง (ถ้ามีไฟล์ requirements หรือ Jira ID ให้ระบุ)
- สรุปรายการ Acceptance Criteria (AC) ที่ต้องพิสูจน์

## ขั้นตอนที่ 2: รวบรวมหลักฐาน (Evidence)
สำหรับแต่ละ AC ให้ดำเนินการ:
1. **รันเทสด้วยตนเอง** (ใช้ `runInTerminal` เพื่อรัน `curl`, `go test`, หรือ `http` command)
2. **บันทึกผลลัพธ์** ที่ได้จาก terminal (success response, error response, log)
3. **ตรวจสอบฐานข้อมูล** (ถ้าเกี่ยวข้อง) ด้วยคำสั่ง query หรือดูจาก GUI
4. **บันทึก Git Diff / ไฟล์ที่เปลี่ยนแปลง** (ใช้ `git diff --stat` หรือ `git log --oneline -n 1`)

## ขั้นตอนที่ 3: สร้าง PoW Report
จัดทำรายงานตามรูปแบบนี้:

````markdown
### Proof of Work — <Task ID หรือ ชื่อเรื่อง>

**ผู้พัฒนา:** <ชื่อ>
**วันที่:** <วันที่>
**Commit SHA:** <hash>

#### Acceptance Criteria ที่ตรวจสอบแล้ว
- [x] AC 1: <คำอธิบาย> — ผ่าน ✅
- [x] AC 2: <คำอธิบาย> — ผ่าน ✅

#### หลักฐานการทดสอบ (Test Evidence)
**1. กรณีสำเร็จ (Happy Path)**
- คำสั่งที่ใช้: `curl -X POST http://localhost:8080/api/v1/employee -d '{"full_name":"John","email":"john@test.com"}'`
- ผลลัพธ์:
  ```json
  {
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "full_name": "John",
    "email": "john@test.com",
    "created_at": "2026-07-02T10:00:00Z",
    "updated_at": "2026-07-02T10:00:00Z"
  }
  ```
- Status: `201 Created`

**2. กรณี Error (Duplicate)**
- คำสั่ง: (เรียกซ้ำ)
- ผลลัพธ์: `409 Conflict` พร้อม `{"error":"email already exists"}`

**3. Unit Test Report**
- คำสั่ง: `go test ./pkg/employee/... -v`
- ผลลัพธ์:
  ```
  PASS: TestServiceCreateSuccess
  PASS: TestServiceCreateDuplicate
  PASS: TestHandlerCreateEmployee
  ```
- Coverage: 85.6%

#### สรุป
✅ งานผ่านเกณฑ์ทั้งหมด พร้อมส่งต่อ QA
````

## ขั้นตอนที่ 4: บันทึกไฟล์ PoW
- ถ้ามีระบบจัดเก็บเอกสาร → บันทึกเป็น Markdown หรือ PDF
- ถ้าไม่มี → แสดงผลในแชทเพื่อให้ผู้ใช้คัดลอกไปใช้งาน
```

---

### 8. `/tb-qa` — ตรวจสอบคุณภาพ (Quality Assurance)

```markdown
---
description: "ดำเนินการตรวจสอบระบบด้วยมุมมองของ QA ทดสอบทั้ง Functional, Regression, Edge Cases และ Security เบื้องต้น ก่อนรับงาน"
name: "TB QA"
agent: "agent"
tools: ["readFile", "runInTerminal", "search", "findFiles", "grep"]
argument-hint: "<task-id หรือ PoW file> หรือ <base-url> เช่น EMP-123 หรือ https://dev-api.example.com"
---

คุณคือ QA Engineer ที่ต้องตรวจสอบ Feature หรือ Bug Fix ที่ส่งมา ก่อนอนุญาตให้ Merge เข้า Main Branch

## ขั้นตอนที่ 1: ดึงข้อมูลงาน
- อ่าน Requirement / Story / PoW (ถ้ามีไฟล์แนบ)
- ทำความเข้าใจ Acceptance Criteria (AC) และขอบเขตการเปลี่ยนแปลง

## ขั้นตอนที่ 2: เตรียมสภาพแวดล้อมทดสอบ
- ตรวจสอบว่า Environment (Dev/Staging) พร้อมใช้งาน
- ถ้าทดสอบ Local ให้รันแอปพลิเคชันด้วย `go run` หรือ `docker-compose up`
- ตั้งค่าตัวแปรแวดล้อมที่จำเป็น

## ขั้นตอนที่ 3: ดำเนินการทดสอบตามชุดคำสั่ง (Test Suite)

**3.1 Functional Test (ตรงตาม AC)**
- ทดสอบทุก AC ทีละข้อ
- บันทึกผลว่า PASS หรือ FAIL

**3.2 Regression Test (ผลกระทบต่อฟีเจอร์อื่น)**
- ทดสอบ API / ฟังก์ชันใกล้เคียงที่อาจได้รับผลกระทบ
- เช่น ถ้าแก้ไข `/employee` ให้ทดสอบ `/employees` (GET ทั้งหมด) ด้วย

**3.3 Edge Cases & Negative Testing**
- ทดสอบ input ที่ผิดปกติ: ค่าว่าง, อักขระพิเศษ, email ไม่ถูกต้อง, payload ขนาดใหญ่
- ทดสอบ concurrency (ถ้ามี): ส่ง request พร้อมกันหลาย ๆ ครั้ง

**3.4 Security & Performance (เบื้องต้น)**
- ตรวจสอบ SQL Injection (เช่น email = `' OR '1'='1`)
- ตรวจสอบ Rate Limiting หรือ Timeout (ถ้ามี)
- วัด Response Time ว่าไม่เกินเกณฑ์ (เช่น < 500ms)

## ขั้นตอนที่ 4: สรุปผลการทดสอบ (QA Report)
ใช้รูปแบบนี้:

````markdown
### รายงานผล QA — <Task ID>

**ผู้ทดสอบ:** <ชื่อ>
**วันที่ทดสอบ:** <วันที่>
**สภาพแวดล้อม:** <Dev/Staging/Production-like>

---

#### ผลการทดสอบตาม AC
| AC # | คำอธิบาย | ผลลัพธ์ | หมายเหตุ |
|------|----------|---------|----------|
| 1 | สร้างพนักงานสำเร็จ | ✅ PASS | - |
| 2 | ห้าม email ซ้ำ | ✅ PASS | - |
| 3 | Validate field ห้ามว่าง | ✅ PASS | - |

#### Regression Test
- `/employees` GET: ✅ PASS
- `/employee/:id` GET: ✅ PASS (ไม่เกี่ยวข้อง)

#### Edge Cases
- ค่า empty string: ✅ รับ 400 ตามคาด
- email ขนาด 256 ตัวอักษร: ✅ PASS
- JSON malformed: ✅ รับ 400

#### Performance
- Response Time เฉลี่ย: 45ms (เกณฑ์ < 500ms) ✅

---

#### สรุปภาพรวม
- **ผ่านทั้งหมด (Ready to Merge)** 🟢
- **มีข้อสังเกตเล็กน้อย (ไม่จำเป็นต้องแก้)** 🟡
  - เช่น log level ควรปรับเป็น Debug ใน environment นั้น ๆ
- **พบ Bug (ต้องแก้ไขก่อน Merge)** 🔴
  - [Bug-01] อธิบาย...
````

## ขั้นตอนที่ 5: แจ้งผลกลับไปยัง Developer
- ถ้า PASS → แจ้งว่าสามารถ Merge ได้
- ถ้า FAIL → ส่ง Report กลับไปให้ Developer แก้ไข พร้อมแนบขั้นตอนการ reproduce
```

---

## 🟥 หมวดรายงานและสรุปผล (Report / Completion)

### 9. `/tb-summary-report` — รายงานสรุปผลการดำเนินงาน (Completion Report)

```markdown
---
description: "จัดทำรายงานสรุปผลการดำเนินงานตลอดทั้ง Task หรือ Sprint สำหรับส่งให้ Product Owner หรือทีมบริหาร ครอบคลุมสิ่งที่ทำ, ปัญหาที่เจอ, และบทเรียนที่ได้"
name: "TB Summary Report"
agent: "agent"
tools: ["readFile", "search", "findFiles", "runInTerminal", "git"]
argument-hint: "<task-id> หรือ <start-date>..<end-date> เช่น EMP-123 หรือ 2026-07-01..2026-07-02"
---

คุณคือ Technical Lead หรือ Developer ที่ต้องจัดทำรายงานสรุปผล (Completion Report) สำหรับ Stakeholder

## ขั้นตอนที่ 1: รวบรวมข้อมูลทั้งหมด
- ใช้ `git log` เพื่อดู commits ที่เกี่ยวข้อง
- อ่านไฟล์ Requirement, PoW, QA Report (ถ้ามี)
- สรุปเวลาที่ใช้ (ถ้ามีการบันทึก)

## ขั้นตอนที่ 2: วิเคราะห์และเรียบเรียงเนื้อหา
รายงานควรประกอบด้วย 5 หัวข้อหลัก:

### 2.1. ภาพรวมของงาน
- **ชื่อ Task / Epic**
- **วัตถุประสงค์** (ทำไปเพื่ออะไร)
- **ขอบเขต** (Scope) — อะไรที่ทำ อะไรที่ไม่ได้ทำ

### 2.2. สิ่งที่ดำเนินการไปแล้ว (Deliverables)
- รายการไฟล์ที่สร้าง/แก้ไข (พร้อมสถิติ: +X lines / -Y lines)
- รายการฟังก์ชัน/API ที่เพิ่มขึ้น
- รายการฐานข้อมูลที่เปลี่ยนแปลง (Migration)

### 2.3. สรุปผลการทดสอบ
- ผล Unit Test (ผ่าน/ไม่ผ่าน, Coverage %)
- ผล Integration / Manual Test (จาก QA)
- ข้อบกพร่องที่พบและวิธีการแก้ไข

### 2.4. ปัญหาและอุปสรรค (Challenges & Lessons Learned)
- ปัญหาทางเทคนิคที่เจอ (เช่น Concurrent Issue, Environment Setup)
- สิ่งที่ได้เรียนรู้หรือปรับปรุงกระบวนการ
- สิ่งที่ควรทำ differently ในครั้งต่อไป

### 2.5. การ Deploy และการดำเนินการต่อไป
- ขั้นตอนการ Deploy (ถ้ามี)
- Rollback Plan (ถ้าเกิดเหตุฉุกเฉิน)
- สิ่งที่ต้องจับตาหลัง Deploy (Monitoring / Alert)

## ขั้นตอนที่ 3: จัดรูปแบบรายงาน
ใช้รูปแบบที่เป็นทางการ พร้อมตารางและหัวข้อชัดเจน

````markdown
# รายงานสรุปผลการดำเนินงาน — <Task ID หรือ Sprint Name>

## 1. ภาพรวม
- **ผู้รับผิดชอบ:** <ชื่อ>
- **ระยะเวลา:** <วันที่เริ่ม> - <วันที่สิ้นสุด>
- **สถานะ:** ✅ เสร็จสมบูรณ์ / ⏳ รอดำเนินการ

## 2. สิ่งที่ดำเนินการ (Deliverables)
### ไฟล์ที่เปลี่ยนแปลง
| ไฟล์ | การเปลี่ยนแปลง | จำนวนบรรทัด |
|------|---------------|-------------|
| api/router.go | เพิ่ม Route | +3 |
| pkg/employee/service.go | สร้างใหม่ | +120 |

### API Endpoint ที่เพิ่ม
- `POST /api/v1/employee` — สร้างพนักงาน

### Migration
- `20260702_create_employees_table.sql`

## 3. ผลการทดสอบ
- **Unit Test:** ✅ PASS (Coverage 87%)
- **QA Manual:** ✅ PASS (AC ทั้งหมดผ่าน)
- **Regression:** ✅ ไม่พบผลกระทบต่อระบบเดิม

## 4. ปัญหาที่พบและบทเรียน
- **ปัญหา:** การเช็ค email duplicate ด้วย FindAll อาจมี performance ตกเมื่อข้อมูลมาก
- **แนวทางแก้ไข:** เพิ่ม Index และใช้ FindByEmail แทน
- **บทเรียน:** ควรออกแบบ Repository ให้มี Method เฉพาะตั้งแต่แรก

## 5. แผนการ Deploy
1. รัน Migration บน Staging
2. Deploy Binary
3. สังเกต Log และ Metric เป็นเวลา 30 นาที
4. ถ้าเกิด Error → Rollback ด้วยคำสั่ง `./rollback.sh`

---

**ลงชื่อ:** <Developer/Lead>
**วันที่:** <ปัจจุบัน>
````

## ขั้นตอนที่ 4: ส่งรายงาน
- แสดงรายงานในแชท เพื่อให้ผู้ใช้คัดลอกไปวางในระบบเอกสาร (Confluence, Notion, หรือ Jira)
```

---

## 🗂️ สรุปรายการ Prompt Templates ทั้งหมด (ครบทุกขั้นตอน)

| ลำดับ | ชื่อ Template | สายงาน | ใช้ตอน |
|-------|---------------|--------|--------|
| 1 | `/tb-brainstorming` | Normal | ทำความเข้าใจ Task |
| 2 | `/tb-writing-plans` | Normal | วางแผน Implementation |
| 3 | `/tb-executing-plans` | Normal | ลงมือเขียนโค้ด |
| 4 | `/tb-investigate-error` | Bug Fix | วิเคราะห์ Root Cause (เริ่มเสมอ) |
| 5 | `/tb-test-driven-development` | Bug Fix Path B | เขียน Test ก่อนแก้ Bug จุดเดียว |
| 6 | `/tb-scrutinize` | **ทุกสายงาน (MANDATORY)** | ตรวจสอบก่อน Merge |
| 7 | `/tb-proof-of-work` | Normal / Bug Fix | บันทึกหลักฐานการทำงาน |
| 8 | `/tb-qa` | Normal / Bug Fix | ทดสอบโดย QA |
| 9 | `/tb-summary-report` | **ทุกสายงาน (ส่งท้าย)** | รายงานสรุปผลส่งผู้บริหาร/PO |

---

พร้อมใช้งานได้ทันทีครับ เพียงคัดลอกแต่ละ `---` block ไปวางในระบบ Copilot / Custom Instructions หรือไฟล์ `.cursorrules` / `.github/prompts` ของทีมคุณได้เลย 🚀