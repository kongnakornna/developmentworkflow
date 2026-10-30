---
name: modular
description: ออกแบบระบบแบบ Modular — Use when user needs modular design (loose coupling, high cohesion, interchangeable modules, plugin architecture, component boundaries).
---

# Modular Design (โมดูล 24)

## เมื่อไหร่ใช้
ใช้เมื่อผู้ใช้ต้องการออกแบบ **ระบบ/ซอฟต์แวร์/องค์กร/กระบวนการ** ให้แยกเป็นโมดูลอิสระ  
ต่อยอด/สลับ/ทดสอบ/สเกลได้โดยไม่กระทบส่วนอื่น

## Prompt Template
ออกแบบระบบแบบ Modular สำหรับ **[ระบบ/ผลิตภัณฑ์/องค์กร]**

### ข้อมูลนำเข้า
- ขอบเขตระบบ: [ ]
- ข้อจำกัด: [ ]
- จุดที่ต้องขยายในอนาคต: [ ]
- Tech Stack / บริบท: [ ]

### หลักการสำคัญ (ต้องยึด)
1. **Loose Coupling** — โมดูลพึ่งพากันน้อยที่สุด
2. **High Cohesion** — งานที่เกี่ยวกันอยู่ด้วยกัน
3. **Single Responsibility** — 1 โมดูล = 1 หน้าที่ชัดเจน
4. **Well-defined Interface** — สื่อสารผ่าน contract/API
5. **Replaceable** — สลับ/อัปเกรดได้โดยไม่พังระบบ
6. **Independently Testable** — ทดสอบแยกได้
7. **Independently Deployable** (ถ้าเป็นซอฟต์แวร์)

### ผลลัพธ์ที่ต้องได้
1. แผนภาพ Module Map
2. รายชื่อโมดูล + หน้าที่ + ขอบเขต
3. Interface / Contract ระหว่างโมดูล
4. Data Ownership ของแต่ละโมดูล
5. Dependency Graph (ห้ามมี cycle)
6. กลยุทธ์การทดสอบรายโมดูล
7. KPI วัดความเป็น Modular
8. ข้อดี / ข้อเสีย / ข้อควรระวัง

### KPI ตัวอย่าง
| KPI | คำอธิบาย | เป้าหมาย |
|---|---|---|
| Coupling Score | จำนวน dependency ข้ามโมดูล | ↓ |
| Cohesion Score | ความเกี่ยวเนื่องภายในโมดูล | ↑ |
| Cycle Count | จำนวน dependency cycle | 0 |
| Change Impact Radius | ไฟล์ที่กระทบเมื่อแก้ 1 โมดูล | น้อย |
| Module Reuse Rate | % โมดูลที่ถูกใช้ซ้ำ | ↑ |
| Independent Deploy Rate | % โมดูล deploy แยกได้ | ↑ |

### ข้อกำหนด
- ใช้หลัก SMART ในการตั้งเป้า
- ใช้ PSR อธิบายปัญหา → วิธี modularize → ผลลัพธ์
- มีตัวอย่างก่อน/หลัง (Monolith → Modular)
- สรุปท้าย 3–5 บรรทัด

## ตัวอย่างการเรียกใช้