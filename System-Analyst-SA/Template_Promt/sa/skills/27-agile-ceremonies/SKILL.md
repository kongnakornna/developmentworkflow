---
name: agile-ceremonies
description: จัดการและสรุปการประชุมแบบ Agile (Sprint Planning, Daily Scrum, Sprint Review, Sprint Retrospective) — Use when user needs to plan, run, or document any Scrum ceremony in Thai or English.
---

# Agile Ceremonies (โมดูล 27)

## เมื่อไหร่ใช้
ใช้เมื่อผู้ใช้ต้องการ **วางแผน / รัน / สรุป** การประชุมแบบ Agile (Scrum)  
รองรับ 4 Ceremonies หลัก + รองรับ **ไทย / English**

---

## 🎯 4 รูปแบบการประชุมหลัก (Scrum Ceremonies)

| # | Ceremony | เป้าหมาย | ระยะเวลา | ผู้เข้าร่วม |
|---|---|---|---|---|
| 1 | **Sprint Planning** | กำหนดเป้าหมาย + เลือกงานใน Sprint | 2–4 ชม. (Sprint 2 สัปดาห์) | PO, SM, Dev Team |
| 2 | **Daily Scrum** | อัปเดตสถานะ + หาข้อติดขัด | 10–15 นาที | Dev Team (+SM) |
| 3 | **Sprint Review** | ตรวจสอบ + สาธิตผลงาน | 1–2 ชม. | ทีม + Stakeholders |
| 4 | **Sprint Retrospective** | พัฒนากระบวนการทำงาน | 45–90 นาที | ทีม + SM |

---

## 📋 Prompt Template

สร้าง **[แผน / สรุป]** สำหรับ **Agile Ceremony: [Sprint Planning / Daily Scrum / Sprint Review / Sprint Retrospective]**  
Sprint: [Sprint ##]  
ทีม: [ชื่อทีม / ขนาดทีม]  
ภาษา: **[ไทย / English / ไทย+อังกฤษ]**  
โทน: [ทางการ / เป็นกันเอง / กระชับ]

---

## 🧩 1) Sprint Planning

### 🎯 เป้าหมาย
กำหนด **Sprint Goal** + เลือกงานจาก Product Backlog ที่ทีมทำได้จริง

### 🗂️ โครงสร้างประชุม

| เวลา | หัวข้อ | ผลลัพธ์ |
|---|---|---|
| 0–15 นาที | ทบทวน Sprint Goal + Backlog | เข้าใจเป้าหมาย |
| 15–60 นาที | เลือกงาน (What) | Sprint Backlog |
| 60–120 นาที | วางแผนวิธีทำ (How) | Task breakdown |
| 120–150 นาที | ประเมิน + ยืนยัน | Commitment |

### 📌 Template

```
🎯 Sprint Goal: [ ]
📆 Sprint Duration: [วันที่เริ่ม – วันที่จบ]
👥 ทีม: [ ]

📋 Sprint Backlog:
| # | User Story | Story Point | Owner | สถานะ |
|---|---|---|---|---|
| 1 | [ ] | [ ] | [ ] | To Do |

📊 Velocity ที่คาดหวัง: [ ]
⚠️ ความเสี่ยง: [ ]
🚧 สมมติฐาน: [ ]
```

---

## 🧩 2) Daily Scrum (Daily Stand-up)

### 🎯 เป้าหมาย
อัปเดตสถานะ 10–15 นาที ทุกเช้า — 3 คำถามหลัก

### 📌 Template (ไทย)

```
📅 วันที่: [ ]
👥 ทีม: [ ]
⏱️ เวลา: 09:00 – 09:15

1️⃣ เมื่อวานทำอะไรเสร็จ?
   - [ ]
2️⃣ วันนี้จะทำอะไร?
   - [ ]
3️⃣ มีปัญหาติดขัดอะไร?
   - [ ]

🎯 Sprint Goal วันนี้: [ ]
🚧 Blockers ที่ต้องแก้: [ ]
```

### 📌 Template (English)

```
📅 Date: [ ]
👥 Team: [ ]
⏱️ Time: 09:00 – 09:15

1️⃣ What did I do yesterday?
2️⃣ What will I do today?
3️⃣ Any blockers?

🎯 Sprint Goal today: [ ]
🚧 Blockers: [ ]
```

### ✅ หลักการ 3 ข้อ (จำง่าย)
- **What done** — เมื่อวานเสร็จอะไร
- **What next** — วันนี้จะทำอะไร
- **What blocks** — ติดอะไรอยู่

---

## 🧩 3) Sprint Review

### 🎯 เป้าหมาย
สาธิต **Product Increment** ให้ Stakeholders + รับ feedback

### 📌 Template

```
📅 Sprint: [ ]
👥 ผู้เข้าร่วม: ทีม + Stakeholders
⏱️ เวลา: [ ]

✅ สิ่งที่ทำเสร็จ (Done):
1. [ ]
2. [ ]

🎬 Demo:
| # | ฟีเจอร์ | ผู้สาธิต | หมายเหตุ |
|---|---|---|---|
| 1 | [ ] | [ ] | [ ] |

💬 Feedback จาก Stakeholders:
- [ ]

🔄 ปรับ Backlog:
- [ ]

⏭️ Sprint ถัดไป: [ ]
```

---

## 🧩 4) Sprint Retrospective

### 🎯 เป้าหมาย
พัฒนากระบวนการทำงานของทีม — 3 คำถามหลัก

### 📌 Template (ไทย)

```
📅 Sprint: [ ]
👥 ทีม: [ ]
⏱️ เวลา: [ ]

😊 อะไรทำได้ดี (Keep):
- [ ]

😐 อะไรควรปรับปรุง (Problem):
- [ ]

🚀 จะแก้อะไร Sprint หน้า (Try):
- [ ]

📌 Action Items:
| # | Action | Owner | Due | สถานะ |
|---|---|---|---|---|
| 1 | [ ] | [ ] | [ ] | Open |

📊 Team Health Score: [ ]/5
```

### 📌 Template (English)

```
📅 Sprint: [ ]
😊 Keep: [ ]
😐 Problem: [ ]
🚀 Try: [ ]
📌 Action Items: Owner / Task / Due
📊 Team Health: [ ]/5
```

---

## 📏 หลักการสำคัญ (จำง่าย)

**"4C"** ของ Agile Ceremonies
- **C**adence — มีจังหวะสม่ำเสมอ
- **C**ollaboration — ทุกคนมีส่วนร่วม
- **C**ontinuous Improvement — Retro → Try
- **C**ustomer Focus — Review → Feedback

**"TIME"** ของแต่ละ Ceremony
- **T**imebox — จำกัดเวลา
- **I**nspect — ดูงาน/กระบวนการ
- **M**easure — วัดผล
- **E**xecute — ลงมือทำจริง

---

## 📊 KPI วัด Ceremonies

| Ceremony | KPI | เป้าหมาย |
|---|---|---|
| Sprint Planning | Sprint Goal ชัดเจน / Commitment | 100% |
| Daily Scrum | เข้าตรงเวลา / ใช้เวลา ≤ 15 นาที | ≥ 95% |
| Sprint Review | Feedback นำไปใช้จริง | ≥ 80% |
| Retrospective | Action Item ปิดครบ | ≥ 90% |
| ทั้งหมด | Team Health Score | ≥ 4/5 |

---

## 🔄 Workflow Agile Ceremonies (วงจร Sprint)

```
┌─────────────────────────────────────────────┐
│              SPRINT (1–4 สัปดาห์)           │
├─────────────────────────────────────────────┤
│                                             │
│  ┌──────────────┐       ┌────────────────┐ │
│  │ Sprint       │       │ Daily Scrum    │ │
│  │ Planning     │──────▶│ (ทุกวัน 15 นาที) │ │
│  └──────────────┘       └────────────────┘ │
│         │                      │           │
│         ▼                      ▼           │
│  ┌──────────────┐       ┌────────────────┐ │
│  │ Sprint       │◀──────│ Sprint         │ │
│  │ Review       │       │ Retrospective  │ │
│  └──────────────┘       └────────────────┘ │
│                                             │
└─────────────────────────────────────────────┘
              ▼
        Sprint ถัดไป
```

---

## 🗣️ ตัวอย่างการเรียกใช้

```bash
# Sprint Planning
ใช้ skill 27-agile-ceremonies
Ceremony: Sprint Planning
Sprint: Sprint 5
ทีม: Dev 6 คน + PO + SM
ภาษา: ไทย+อังกฤษ

# Daily Scrum
ใช้ skill 27-agile-ceremonies
Ceremony: Daily Scrum
วันที่: 15/10/2026
ภาษา: ไทย

# Sprint Review
ใช้ skill 27-agile-ceremonies
Ceremony: Sprint Review
Sprint: Sprint 5
ผู้เข้าร่วม: ทีม + ลูกค้า
ภาษา: English

# Retrospective
ใช้ skill 27-agile-ceremonies
Ceremony: Sprint Retrospective
Sprint: Sprint 5
ทีม: 8 คน
ภาษา: ไทย+อังกฤษ
```

---

## ✅ Checklist หลังจบทุก Ceremony

- [ ] มี Action Items + Owner + Due date
- [ ] อัปเดต Backlog / Board
- [ ] ส่ง Minutes ให้ผู้เข้าร่วมภายใน 24 ชม.
- [ ] ปิด Action Items เก่าก่อนเริ่มใหม่
- [ ] บันทึก Team Health Score

## ข้อกำหนด
- ใช้ Timebox ทุก Ceremony
- ภาษา: ไทย / English / ผสม
- ใช้ Markdown + ตาราง อ่านง่าย
- มีตัวอย่างทุก template
- สรุปท้าย 3–5 บรรทัด