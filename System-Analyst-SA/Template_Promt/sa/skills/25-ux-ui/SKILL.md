---
name: ux-ui
description: ออกแบบ UX/UI — Use when user needs UX research, user journey, wireframe, design system, accessibility, or UI component design.
---

# UX / UI Design (โมดูล 25)

## เมื่อไหร่ใช้
ใช้เมื่อผู้ใช้ต้องการออกแบบ **ประสบการณ์ผู้ใช้ (UX)** และ **ส่วนติดต่อผู้ใช้ (UI)**  
ครอบคลุมตั้งแต่ user research → journey → wireframe → design system → accessibility

## Prompt Template
ออกแบบ UX/UI สำหรับ **[ผลิตภัณฑ์/บริการ/ฟีเจอร์]**  
กลุ่มผู้ใช้: **[persona / กลุ่มเป้าหมาย]**  
แพลตฟอร์ม: **[Web / iOS / Android / Desktop / Kiosk]**

### ขอบเขตงาน
- UX: [research / journey / IA / wireframe / usability test]
- UI: [visual design / components / design system / motion]
- Accessibility: [WCAG ระดับ A / AA / AAA]
- Handoff: [Figma / Design tokens / Spec]

---

## 🧠 UX Framework (5 ขั้น)

| ขั้น | สิ่งที่ทำ | ผลลัพธ์ |
|---|---|---|
| 1. Empathize | สัมภาษณ์, สังเกต, survey | Persona, Empathy Map |
| 2. Define | ระบุปัญหา, Jobs-to-be-done | Problem Statement, POV |
| 3. Ideate | Sketch, Crazy 8, Card sort | Idea Board, User Flow |
| 4. Prototype | Wireframe → Hi-fi | Figma Prototype |
| 5. Test | Usability test 5–8 users | Insight, Iteration list |

## 🎨 UI Framework (หลักการสำคัญ)

1. **Hierarchy** — ผู้ใช้เห็นสิ่งที่สำคัญก่อน
2. **Consistency** — Design tokens, spacing scale, type scale
3. **Feedback** — ทุก action มี reaction (loading, success, error)
4. **Affordance** — ปุ่มดูเหมือนกดได้, ลิงก์ดูเหมือนลิงก์
5. **Accessibility** — contrast ≥ 4.5:1, focus ring, ARIA, keyboard nav
6. **Responsive** — mobile-first, breakpoints ชัดเจน
7. **Motion** — ใช้เพื่อสื่อความหมาย ไม่ใช่ตกแต่ง
8. **Error Prevention** — ป้องกันผิดพลาดดีกว่าแจ้งผิดพลาด

---

## 📐 Design System (ขั้นต่ำที่ควรมี)

| หมวด | รายการ |
|---|---|
| Color | Primary / Neutral / Semantic (success, warning, error, info) |
| Typography | Type scale 6–8 ระดับ, line-height, font-weight |
| Spacing | Scale 4 / 8 / 12 / 16 / 24 / 32 / 48 |
| Radius | sm / md / lg / full |
| Shadow | elevation 0–4 |
| Icon | ชุดเดียว, ขนาด 16 / 20 / 24 / 32 |
| Components | Button, Input, Card, Modal, Toast, Table, Nav |
| Tokens | JSON / CSS variables / Figma variables |

---

## 🔍 UX Metrics (KPI)

| KPI | ความหมาย | เป้าหมาย |
|---|---|---|
| Task Success Rate | % ทำงานสำเร็จ | ↑ |
| Time on Task | เวลาทำงานเสร็จ | ↓ |
| Error Rate | % ผิดพลาด | ↓ |
| SUS Score | System Usability Scale (0–100) | ≥ 68 |
| NPS | ความพึงพอใจสุทธิ | ↑ |
| Drop-off Rate | % ออกจาก flow | ↓ |
| Accessibility Score | Lighthouse / axe | ≥ 90 |
| Conversion Rate | % บรรลุเป้าหมายธุรกิจ | ↑ |

---

## 📦 ผลลัพธ์ที่ต้องส่งมอบ

1. **Persona** + **Empathy Map**
2. **Problem Statement** (POV)
3. **User Journey Map** (ก่อน/หลัง)
4. **Information Architecture** (sitemap)
5. **User Flow** + **Wireframe** (low-fi)
6. **Hi-fi Mockup** (key screens)
7. **Design System** (tokens + components)
8. **Prototype** (คลิกได้)
9. **Usability Test Plan** + ผลลัพธ์
10. **Handoff Spec** (สำหรับ dev)

---

## ♿ Accessibility Checklist (WCAG AA)

- [ ] Contrast ratio ≥ 4.5:1 (text), ≥ 3:1 (large text/UI)
- [ ] Keyboard navigable 100%
- [ ] Focus visible ทุก interactive element
- [ ] ARIA labels ครบ
- [ ] รองรับ screen reader
- [ ] Form errors อธิบายชัดเจน
- [ ] ไม่ใช้สีเป็นตัวสื่อความหมายเดียว
- [ ] รองรับ prefers-reduced-motion

---

## 🧭 หลักการจำง่าย (Heuristics)

**"CLEAR"**
- **C**onsistency — สม่ำเสมอ
- **L**ess is more — ลดสิ่งรบกวน
- **E**mpathy — เข้าใจผู้ใช้
- **A**ccessibility — เข้าถึงได้ทุกคน
- **R**esponsive — ปรับตามบริบท

## ข้อกำหนด
- ใช้ Design Thinking (โมดูล 14) เป็นฐาน
- ใช้ SMART ตั้งเป้า UX KPI
- ใช้ PSR อธิบาย ปัญหา → ดีไซน์ → ผลลัพธ์
- มีตัวอย่าง before/after
- สรุปท้าย 3–5 บรรทัด

## ตัวอย่างการเรียกใช้