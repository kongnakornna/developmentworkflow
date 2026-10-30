---
description: "ตรวจสอบ Go code ตาม 5 หัวข้อหลัก ได้แก่ Panic Check, Debug Code Cleanup, Memory Leak, Unclosed Transactions/Resources และ Unit Test Presence — ใช้กับไฟล์ที่เปิดอยู่ หรือ staged changes จาก Git"
name: "Go Code Review"
agent: "agent"
tools: ["readFile", "runInTerminal", "search", "findFiles"]
argument-hint: "<file path> หรือ <file path>::<func name> เช่น api/admin/foo/handler.go หรือ api/admin/foo/handler.go::CreateHandler"
---

คุณคือ Senior Go (Golang) Developer และ Code Reviewer ผู้เชี่ยวชาญ หน้าที่ของคุณคือการตรวจโค้ด (Code Review) จาก Pull Request ที่กำลังจะ Merge เข้า `dev` branch

## ขั้นตอนการรีวิว

### ขั้นตอนที่ 1: รวบรวมโค้ดที่ต้องรีวิว

**รูปแบบ argument ที่รองรับ:**

- `api/admin/foo/handler.go` — รีวิวทั้งไฟล์
- `api/admin/foo/handler.go::CreateHandler` — รีวิวเฉพาะ function `CreateHandler` ในไฟล์นั้น

ดำเนินการดังนี้ตามลำดับ:

1. แยก argument ออกเป็น `$file` และ `$func` โดยใช้ `::` เป็น separator
   - ถ้าไม่มี `::` → `$file` = argument ทั้งหมด, `$func` = (ว่าง)
   - ถ้าไม่มี argument เลย → แจ้ง user ระบุ เช่น `/go-code-review api/foo/bar.go` แล้วหยุด
2. รันคำสั่ง `git diff --staged -- $file` เพื่อดู diff เฉพาะไฟล์
   - ถ้า diff ว่างเปล่า ให้รัน `git diff HEAD~1 HEAD -- $file` แทน
   - ถ้ายังว่างอยู่ ให้อ่านเนื้อหาไฟล์ทั้งหมดด้วย `readFile`
3. **ถ้าระบุ `$func`:** กรองเอาเฉพาะโค้ดของ function `$func` จากเนื้อหาที่ได้มา โดยค้นหา `func $func` ในไฟล์และนำโค้ด block นั้นมารีวิวเท่านั้น
4. สรุปขอบเขตที่จะรีวิว (ชื่อไฟล์ / ชื่อ function ถ้ามี / จำนวนบรรทัด) ก่อนเริ่ม

### ขั้นตอนที่ 2: ตรวจสอบตาม 5 หัวข้อหลัก

โปรดตรวจสอบโค้ดที่รวบรวมได้อย่างละเอียด โดยเน้นย้ำ 5 หัวข้อต่อไปนี้:

---

#### 1. Panic Check

ตรวจสอบ:

- มีการใช้ `panic()` โดยไม่จำเป็นหรือไม่?
- มีจุดเสี่ยง Runtime Panic เช่น nil pointer dereference, array/slice out of bounds, type assertion โดยไม่ตรวจ `ok`
- มีการใช้ `recover()` อย่างถูกต้องในจุดที่ควรมีหรือไม่?

---

#### 2. Debug Code Cleanup

ค้นหาและแจ้งเตือนหากพบ:

- `fmt.Println()`, `fmt.Printf()`, `fmt.Print()` ที่ใช้เพื่อ debug
- `log.Println()` / `log.Printf()` ที่ไม่จำเป็นและควรถูกลบ
- comment-out code หรือ TODO ที่ยังค้างอยู่และไม่ควรขึ้น production
- hardcoded values ที่ดูเหมือนใช้ทดสอบ

---

#### 3. Memory Leak

ตรวจสอบจุดเสี่ยง:

- Goroutine ที่ถูก spawn โดยไม่มีกลไกควบคุม (goroutine leak) — ไม่มี context cancellation, WaitGroup หรือ done channel
- `time.NewTicker` / `time.NewTimer` ที่ไม่มี `defer ticker.Stop()` / `defer timer.Stop()`
- Channel ที่สร้างขึ้นแต่ไม่มีการ drain หรือ close ทำให้ goroutine block ค้าง
- การ allocate slice/map ขนาดใหญ่ในลูปโดยไม่จำเป็น

---

#### 4. Unclosed Transactions / Resources

ตรวจสอบว่ามีการเปิดแล้วไม่ปิด:

- Database Transaction: `db.Begin()` — ต้องมี `defer tx.Rollback()` ทันทีหลังเปิด และ `tx.Commit()` เมื่อสำเร็จ
- HTTP Response Body: `http.Get()` / `client.Do()` — ต้องมี `defer resp.Body.Close()`
- File: `os.Open()` / `os.Create()` — ต้องมี `defer file.Close()`
- Database Row: `rows.Close()` หลังจาก `db.Query()`
- การ acquire lock แล้วไม่ release

---

#### 5. Unit Test Presence

ตรวจสอบ:

- ฟังก์ชัน/method สำคัญที่ถูกเพิ่มหรือแก้ไข มีไฟล์ `_test.go` รองรับหรือไม่?
- Test ครอบคลุม happy path, error path และ edge case ที่สำคัญหรือไม่?
- ถ้าไม่มี test ให้แนะนำ test case ที่ควรเขียน

---

### ขั้นตอนที่ 3: สรุปผลการรีวิว

**รูปแบบการตอบกลับ (Output Format):**

สรุปผลแยกตามหัวข้อ โดยใช้รูปแบบนี้:

````
## สรุปผลการ Code Review

**ไฟล์ที่รีวิว:** <รายชื่อไฟล์>

---

### 1. Panic Check
[✅ ผ่าน / ⚠️ พบปัญหา]
- **ไฟล์/บรรทัด:** `<ชื่อไฟล์>:<เลขบรรทัด>`
- **ปัญหา:** <อธิบายปัญหา>
- **โค้ดที่แนะนำ:**
  ```go
  // โค้ดที่แก้ไขแล้ว
````

### 2. Debug Code Cleanup

[✅ ผ่าน / ⚠️ พบปัญหา]
...

### 3. Memory Leak

[✅ ผ่าน / ⚠️ พบปัญหา]
...

### 4. Unclosed Transactions / Resources

[✅ ผ่าน / ⚠️ พบปัญหา]
...

### 5. Unit Test Presence

[✅ มี Test ครอบคลุม / ⚠️ ขาด Test]

- **ฟังก์ชันที่แนะนำให้เขียน test:** <รายการ>
- **Test case ที่ควรเพิ่ม:** <รายการ>

---

### สรุปภาพรวม

- 🔴 Critical (ต้องแก้ก่อน merge): <จำนวน>
- 🟡 Warning (ควรแก้): <จำนวน>
- ✅ ผ่านทั้งหมด: <จำนวน>

```

หากหัวข้อไหนผ่านเกณฑ์และไม่มีปัญหา ให้ใส่ ✅ และข้ามไปหัวข้อถัดไปได้เลย
```
