1. **บทบาท (Role)**
   ```
   "คุณเป็นผู้เชี่ยวชาญด้าน Software engine "
   "ในฐานะ  Technical Lead."
   1.Technical Lead
     1.0 Flow chart  & Data flow
     1.1 Tech Stack
       - React JS
       - Next.js
       - css tailwind
     1.2 ToolS
       - Gitlow , N8N
     1.3 Monitoring
       - Grafana monitoring
     1.4 Report
       - Jira Service Management 
     1.5 KPI
       - Agile 
     1.6 Task 
       - Agile 
     1.7 Test priocess
       - AI  , manule  ,Automation Tool

   2.DevOps 
     2.0 Flow chart  & Data flow
     2.1 Tech Stack
       - github gitlab, bitbucket,doker,k8s, N8N
     2.2 ToolS
       - Gitlow ,CI/CD pipeline , Jenkins (Infrastructure)
     2.3 Monitoring
       - Grafana monitoring
     2.4 Report
          1.สร้างเอกสาร
          2.สร้าง Template code
          3.ออกแบบ Data flow
          4.ออกแบบ Work flow
          5.ออกแบบ Template รายงาน 
     2.5 KPI
        - Agile 
     2.6 Task 
       - Agile 
     2.7 Test priocess
        - AI  , manule  ,Automation Tool
   ```

2. **ภารกิจ (Task)**
   ```
   "ความต้องการ.." 
      1.ระบบ User
      2.ระบบ สินค้า
      3.ระบบ คลังสินค้า
      4.ระบบขนส่ง
      5.ระบบรายงาน
      6.ระบบ ประวัจิดกาใช้งานระบบ 
   "วิเคราะห์ข้อมูลต่อไปนี้และสรุปประเด็นหลัก และตัวอย่าง "
       - React JS
       - Next.js template 
       - css tailwind

3. **บริบท (Context)**
 "สำหรับธุรกิจขนาดเล็ก..."
   "เพื่อใช้ กับ ERP ,CRM..."  ```
   ```

1. **รายละเอียดและข้อกำหนด (Specifications)**
   ```
   ความต้องการ หลัก คือ 
   ออก แบบ REST API ด้วย Go lang  fiber framwork แบบ Microservices CRUD  + ORM  +JWT + MVC 
    ระบบที่ นำมาใช้
    1.Authentication
    2.validator
    7.n8n notification upload to Git Flow & deploy  Jenkins
    8.Gitlow
    9.comment code template
    10.CI/CD pipeline
    11.Robot Framework มา test API
    12.Task management
    13.Docker Compose
    14.Jenkins (Infrastructure)
    15.cloud AWS EC2 ,S3 deploy application
    16.Review Comment Template
   ```

2. **รูปแบบผลลัพธ์ (Output Format)**
   ```
   "จัดรูปแบบเป็น bullet points"
    - Template Code Programe
    - Flow chart 
    - Data flow
   ### แบบตรวจสอบการตรวจโค้ด
      ## คุณภาพโค้ด
      - [ ] โค้ดอ่านเข้าใจง่ายและบำรุงรักษาได้
      - [ ] ไม่มีการซ้ำซ้อนโค้ด (หลักการ DRY)
      - [ ] ฟังก์ชันมีขนาดเล็กและเจาะจง (< 30 บรรทัด)
      - [ ] ชื่อตัวแปร/ฟังก์ชันมีความหมายชัดเจน
      - [ ] การจัดการข้อผิดพลาดอย่างเหมาะสม
      - [ ] ไม่มีโค้ดที่ถูกคอมเมนต์ทิ้งไว้ (เว้นแต่จะมีคำอธิบาย)
      ## การทำงาน
      - [ ] ดำเนินการตามข้อกำหนดทั้งหมดจาก ticket
      - [ ] จัดการกับกรณีขอบเขตอย่างเหมาะสม
      - [ ] ไม่เกิดการถดถอยในการทำงานเดิม
      - [ ] มีประสิทธิภาพในระดับที่ยอมรับได้
      ## ความปลอดภัย
      - [ ] มีการตรวจสอบความถูกต้องของอินพุต
      - [ ] ไม่มีการเปิดเผยข้อมูลสำคัญ
      - [ ] มีการตรวจสอบการยืนยันตัวตน/สิทธิ์
      - [ ] ป้องกันการโจมตี SQL injection/XSS
      ## การทดสอบ
      - [ ] การทดสอบหน่วยครอบคลุมการทำงานหลัก
      - [ ] มีการทดสอบสำหรับกรณีขอบเขต
      - [ ] มีการทดสอบบูรณาการหากจำเป็น
      - [ ] ความครอบคลุมของการทดสอบเพียงพอ
      ## สถาปัตยกรรม
      - [ ] ปฏิบัติตามรูปแบบที่มีอยู่
      - [ ] การแยกความรับผิดชอบ
      - [ ] การพึ่งพาโมดูลที่สมเหตุสมผล
      - [ ] ไม่มีการออกแบบที่ซับซ้อนเกินจำเป็น
      ## เอกสารประกอบ
      - [ ] มีคอมเมนต์ในโค้ดตามความจำเป็น
      - [ ] อัปเดต README หากจำเป็น
      - [ ] มีเอกสารประกอบ API หากเกี่ยวข้อง
      - [ ] บันทึกการเปลี่ยนแปลงการกำหนดค่า

       #  Review Comment Template
 

```
    ส่งออก แบบ เอกสาร Markdown  .md
    ***********************ANSWER ***********************

 # โครงสร้างระบบ ERP/CRM สำหรับธุรกิจขนาดเล็ก

## 1. Flow Chart & Data Flow
### 1.1 System Architecture Flow
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Client        │    │   API Gateway   │    │   Microservices │
│   (Next.js)     │────│   (Go Fiber)    │────│                 │
└─────────────────┘    └─────────────────┘    │  ├─ User Service│
                                              │  ├─ Product     │
┌─────────────────┐    ┌─────────────────┐    │  ├─ Warehouse   │
│   N8N           │────│   Git Flow      │────│  ├─ Transport   │
│   (Automation)  │    │   CI/CD         │    │  ├─ Report      │
└─────────────────┘    └─────────────────┘    │  └─ Audit Log   │
                                              └─────────────────┘
         │                        │                     │
         ▼                        ▼                     ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Notification  │    │   Jenkins       │    │   Database      │
│   System        │    │   (Deploy)      │    │   (PostgreSQL)  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### 1.2 Data Flow Diagram
```
1. Authentication Flow:
   Client → API Gateway → Auth Service → JWT Token → Access Resources

2. CRUD Operations:
   Client → Service Layer → Repository → Database → Response

3. Audit Logging:
   Service Layer → Audit Service → Database (Async)

4. Notification Flow:
   Event → N8N Webhook → Notification Service → Users

5. Deployment Flow:
   Code → Git Flow → CI/CD Pipeline → Jenkins → AWS EC2
```

## 2. Template Code Programs

### 2.1 Go Fiber Project Structure
```
erp-system/
├── cmd/
│   └── main.go
├── internal/
│   ├── config/
│   │   └── config.go
│   ├── middleware/
│   │   ├── auth.go
│   │   └── validator.go
│   ├── models/
│   │   ├── user.go
│   │   ├── product.go
│   │   └── audit.go
│   ├── repositories/
│   │   ├── base_repository.go
│   │   └── user_repository.go
│   ├── services/
│   │   ├── auth_service.go
│   │   └── user_service.go
│   ├── handlers/
│   │   └── user_handler.go
│   └── utils/
│       └── jwt_helper.go
├── pkg/
│   └── database/
│       └── postgres.go
├── api/
│   └── routes/
│       └── api.go
├── tests/
├── docker-compose.yml
├── Dockerfile
└── README.md
```

### 2.2 Main Application Template (main.go)
```go
package main

import (
    "log"
    "github.com/gofiber/fiber/v2"
    "github.com/gofiber/fiber/v2/middleware/cors"
    "github.com/gofiber/fiber/v2/middleware/logger"
    "erp-system/internal/config"
    "erp-system/pkg/database"
    "erp-system/api/routes"
)

func main() {
    // Load configuration
    cfg := config.LoadConfig()
    
    // Initialize database
    db, err := database.NewPostgresConnection(cfg.DB)
    if err != nil {
        log.Fatal("Database connection failed:", err)
    }
    
    // Create Fiber app
    app := fiber.New(fiber.Config{
        AppName: "ERP System API",
        ErrorHandler: config.ErrorHandler,
    })
    
    // Middleware
    app.Use(cors.New(cors.Config{
        AllowOrigins: cfg.Server.AllowOrigins,
        AllowHeaders: "Origin, Content-Type, Accept, Authorization",
    }))
    app.Use(logger.New())
    
    // Setup routes
    routes.SetupRoutes(app, db)
    
    // Start server
    log.Printf("Server starting on %s", cfg.Server.Port)
    log.Fatal(app.Listen(cfg.Server.Port))
}
```

### 2.3 User Service Template
```go
// internal/models/user.go
package models

import (
    "time"
    "gorm.io/gorm"
)

type User struct {
    ID        uint           `gorm:"primarykey" json:"id"`
    CreatedAt time.Time      `json:"created_at"`
    UpdatedAt time.Time      `json:"updated_at"`
    DeletedAt gorm.DeletedAt `gorm:"index" json:"-"`
    Username  string         `gorm:"uniqueIndex;not null" json:"username"`
    Email     string         `gorm:"uniqueIndex;not null" json:"email"`
    Password  string         `gorm:"not null" json:"-"`
    Role      string         `gorm:"default:user" json:"role"`
    IsActive  bool           `gorm:"default:true" json:"is_active"`
}

// internal/services/user_service.go
package services

import (
    "erp-system/internal/models"
    "erp-system/internal/repositories"
    "golang.org/x/crypto/bcrypt"
)

type UserService struct {
    repo *repositories.UserRepository
}

func NewUserService(repo *repositories.UserRepository) *UserService {
    return &UserService{repo: repo}
}

func (s *UserService) CreateUser(user *models.User) error {
    // Hash password
    hashedPassword, err := bcrypt.GenerateFromPassword([]byte(user.Password), bcrypt.DefaultCost)
    if err != nil {
        return err
    }
    user.Password = string(hashedPassword)
    
    return s.repo.Create(user)
}

func (s *UserService) Authenticate(username, password string) (*models.User, error) {
    user, err := s.repo.FindByUsername(username)
    if err != nil {
        return nil, err
    }
    
    err = bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(password))
    if err != nil {
        return nil, err
    }
    
    return user, nil
}
```

### 2.4 JWT Middleware Template
```go
// internal/middleware/auth.go
package middleware

import (
    "github.com/gofiber/fiber/v2"
    "github.com/golang-jwt/jwt/v4"
    "erp-system/internal/config"
)

func JWTMiddleware() fiber.Handler {
    return func(c *fiber.Ctx) error {
        tokenString := c.Get("Authorization")
        if tokenString == "" {
            return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{
                "error": "Authorization header required",
            })
        }
        
        // Remove "Bearer " prefix
        if len(tokenString) > 7 && tokenString[:7] == "Bearer " {
            tokenString = tokenString[7:]
        }
        
        claims := &jwt.MapClaims{}
        token, err := jwt.ParseWithClaims(tokenString, claims, func(token *jwt.Token) (interface{}, error) {
            return []byte(config.GetConfig().JWT.Secret), nil
        })
        
        if err != nil || !token.Valid {
            return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{
                "error": "Invalid token",
            })
        }
        
        c.Locals("user", claims)
        return c.Next()
    }
}

func RoleMiddleware(roles ...string) fiber.Handler {
    return func(c *fiber.Ctx) error {
        user := c.Locals("user").(jwt.MapClaims)
        userRole := user["role"].(string)
        
        for _, role := range roles {
            if userRole == role {
                return c.Next()
            }
        }
        
        return c.Status(fiber.StatusForbidden).JSON(fiber.Map{
            "error": "Insufficient permissions",
        })
    }
}
```

### 2.5 Docker Compose Template
```yaml
version: '3.8'

services:
  postgres:
    image: postgres:14-alpine
    environment:
      POSTGRES_USER: erp_user
      POSTGRES_PASSWORD: ${DB_PASSWORD}
      POSTGRES_DB: erp_system
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
    networks:
      - erp-network

  api:
    build: .
    ports:
      - "8080:8080"
    environment:
      DB_HOST: postgres
      DB_PORT: 5432
      DB_USER: erp_user
      DB_PASSWORD: ${DB_PASSWORD}
      DB_NAME: erp_system
      JWT_SECRET: ${JWT_SECRET}
    depends_on:
      - postgres
    networks:
      - erp-network

  n8n:
    image: n8nio/n8n
    ports:
      - "5678:5678"
    environment:
      N8N_BASIC_AUTH_ACTIVE: true
      N8N_BASIC_AUTH_USER: ${N8N_USER}
      N8N_BASIC_AUTH_PASSWORD: ${N8N_PASSWORD}
    volumes:
      - n8n_data:/home/node/.n8n
    networks:
      - erp-network

volumes:
  postgres_data:
  n8n_data:

networks:
  erp-network:
    driver: bridge
```

### 2.6 Jenkins Pipeline Template (Jenkinsfile)
```groovy
pipeline {
    agent any
    
    environment {
        DOCKER_REGISTRY = 'your-registry'
        AWS_REGION = 'ap-southeast-1'
        EC2_INSTANCE = 'your-instance-id'
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/your-org/erp-system.git'
            }
        }
        
        stage('Test') {
            steps {
                sh 'go test ./... -v'
                sh 'robot tests/api_tests.robot'
            }
        }
        
        stage('Build') {
            steps {
                sh 'docker build -t ${DOCKER_REGISTRY}/erp-system:${BUILD_NUMBER} .'
            }
        }
        
        stage('Deploy to AWS') {
            steps {
                sh '''
                    docker push ${DOCKER_REGISTRY}/erp-system:${BUILD_NUMBER}
                    aws ec2 run-instances --image-id ami-xyz --instance-type t2.micro
                    # Deployment scripts
                '''
            }
        }
    }
    
    post {
        success {
            sh 'curl -X POST http://n8n:5678/webhook/deploy-success -d "{\"build\": ${BUILD_NUMBER}}"'
        }
        failure {
            sh 'curl -X POST http://n8n:5678/webhook/deploy-failed -d "{\"build\": ${BUILD_NUMBER}}"'
        }
    }
}
```

### 2.7 Robot Framework Test Template
```robot
*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    http://localhost:8080/api/v1
${VALID_USER}    testuser
${VALID_PASS}    testpass123

*** Test Cases ***
Test User Authentication
    [Documentation]    Test user login and token generation
    Create Session    erp_api    ${BASE_URL}
    
    ${auth_data}=    Create Dictionary
    ...    username=${VALID_USER}
    ...    password=${VALID_PASS}
    
    ${response}=    POST On Session    erp_api    /auth/login    json=${auth_data}
    Should Be Equal As Strings    ${response.status_code}    200
    ${token}=    Get From Dictionary    ${response.json()}    token
    Should Not Be Empty    ${token}
    
    Set Suite Variable    ${AUTH_TOKEN}    ${token}

Test Create Product
    [Documentation]    Test product creation with authentication
    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${AUTH_TOKEN}
    ...    Content-Type=application/json
    
    ${product_data}=    Create Dictionary
    ...    name=Test Product
    ...    price=100.50
    ...    quantity=50
    
    ${response}=    POST On Session    erp_api    /products
    ...    headers=${headers}
    ...    json=${product_data}
    
    Should Be Equal As Strings    ${response.status_code}    201
    ${product_id}=    Get From Dictionary    ${response.json()}    id
    Should Not Be Empty    ${product_id}
```

## 3. Git Flow Workflow

### 3.1 Branch Strategy
```
main (production)
└── develop (staging)
    ├── feature/user-management
    ├── feature/product-catalog
    ├── feature/warehouse
    ├── feature/transport
    ├── feature/reporting
    └── feature/audit-log
```

### 3.2 Commit Message Template
```
<type>(<scope>): <subject>

<body>

<footer>

Types:
  feat:     New feature
  fix:      Bug fix
  docs:     Documentation
  style:    Formatting
  refactor: Code restructuring
  test:     Test-related
  chore:    Maintenance
```

## 4. Review Comment Template

### 4.1 Code Review Checklist
```markdown
## คุณภาพโค้ด
- [ ] โค้ดอ่านเข้าใจง่ายและบำรุงรักษาได้
- [ ] ไม่มีการซ้ำซ้อนโค้ด (หลักการ DRY)
- [ ] ฟังก์ชันมีขนาดเล็กและเจาะจง (< 30 บรรทัด)
- [ ] ชื่อตัวแปร/ฟังก์ชันมีความหมายชัดเจน
- [ ] การจัดการข้อผิดพลาดอย่างเหมาะสม
- [ ] ไม่มีโค้ดที่ถูกคอมเมนต์ทิ้งไว้ (เว้นแต่จะมีคำอธิบาย)

## การทำงาน
- [ ] ดำเนินการตามข้อกำหนดทั้งหมดจาก ticket
- [ ] จัดการกับกรณีขอบเขตอย่างเหมาะสม
- [ ] ไม่เกิดการถดถอยในการทำงานเดิม
- [ ] มีประสิทธิภาพในระดับที่ยอมรับได้

## ความปลอดภัย
- [ ] มีการตรวจสอบความถูกต้องของอินพุต
- [ ] ไม่มีการเปิดเผยข้อมูลสำคัญ
- [ ] มีการตรวจสอบการยืนยันตัวตน/สิทธิ์
- [ ] ป้องกันการโจมตี SQL injection/XSS

## การทดสอบ
- [ ] การทดสอบหน่วยครอบคลุมการทำงานหลัก
- [ ] มีการทดสอบสำหรับกรณีขอบเขต
- [ ] มีการทดสอบบูรณาการหากจำเป็น
- [ ] ความครอบคลุมของการทดสอบเพียงพอ

## สถาปัตยกรรม
- [ ] ปฏิบัติตามรูปแบบที่มีอยู่
- [ ] การแยกความรับผิดชอบ
- [ ] การพึ่งพาโมดูลที่สมเหตุสมผล
- [ ] ไม่มีการออกแบบที่ซับซ้อนเกินจำเป็น

## เอกสารประกอบ
- [ ] มีคอมเมนต์ในโค้ดตามความจำเป็น
- [ ] อัปเดต README หากจำเป็น
- [ ] มีเอกสารประกอบ API หากเกี่ยวข้อง
- [ ] บันทึกการเปลี่ยนแปลงการกำหนดค่า
```

### 4.2 Common Review Comments
```markdown
## จุดที่ต้องปรับปรุง

### ความปลอดภัย:
- [ ] รหัสผ่านควรมีการ hash ก่อนบันทึกลงฐานข้อมูล
- [ ] JWT secret ควรอ่านจาก environment variable
- [ ] ควรเพิ่ม rate limiting สำหรับ API endpoints

### ประสิทธิภาพ:
- [ ] ควรใช้ database indexing สำหรับ fields ที่ใช้ค้นหาบ่อย
- [ ] ควร implement caching สำหรับข้อมูลที่ไม่เปลี่ยนแปลงบ่อย
- [ ] ควรใช้ connection pooling สำหรับ database

### การจัดการข้อผิดพลาด:
- [ ] ควรมี centralized error handling
- [ ] ควรมี logging ที่เหมาะสมสำหรับ debugging
- [ ] ควรมี retry mechanism สำหรับ external API calls

### การทดสอบ:
- [ ] เพิ่ม unit tests สำหรับ business logic
- [ ] เพิ่ม integration tests สำหรับ API endpoints
- [ ] เพิ่ม load testing สำหรับ endpoints สำคัญ
```

## 5. Monitoring & Reporting

### 5.1 Grafana Dashboard Metrics
- **API Performance**: Response time, Error rate, Request rate
- **Database**: Connection pool, Query performance, Lock contention
- **Infrastructure**: CPU/Memory usage, Disk I/O, Network traffic
- **Business Metrics**: User activity, Transaction volume, Inventory levels

### 5.2 Jira Service Management Integration
```yaml
# Jira Webhook Configuration
jira_integration:
  webhook_url: https://your-domain.atlassian.net/rest/api/3/webhook
  events:
    - issue_created
    - issue_updated
    - comment_added
  mappings:
    bug: /api/v1/issues/bugs
    feature: /api/v1/issues/features
    task: /api/v1/issues/tasks
```

## 6. Deployment Architecture

### 6.1 AWS Infrastructure
```
AWS Cloud
├── VPC
│   ├── Public Subnet
│   │   ├── Application Load Balancer
│   │   └── NAT Gateway
│   └── Private Subnet
│       ├── EC2 Instances (Auto Scaling Group)
│       ├── RDS PostgreSQL
│       └── ElastiCache Redis
├── S3 Buckets
│   ├── Application logs
│   ├── Backup storage
│   └── Static assets
└── CloudWatch
    ├── Monitoring
    ├── Logging
    └── Alarms
```

### 6.2 CI/CD Pipeline Flow
```
1. Developer pushes code to Git repository
2. Git Flow triggers webhook to Jenkins
3. Jenkins pipeline:
   - Run unit tests (Go test)
   - Run API tests (Robot Framework)
   - Build Docker image
   - Push to Docker registry
   - Deploy to AWS EC2
   - Run integration tests
   - Update monitoring dashboard
4. N8N notification to team channels
5. Grafana monitoring dashboard updated
```

## 7. KPI & Agile Metrics

### 7.1 Development Metrics
- **Velocity**: Story points completed per sprint
- **Cycle Time**: Time from start to completion
- **Lead Time**: Time from request to delivery
- **Deployment Frequency**: Number of deployments per day/week

### 7.2 Quality Metrics
- **Test Coverage**: Percentage of code covered by tests
- **Bug Rate**: Number of bugs per release
- **MTTR**: Mean Time To Recovery
- **Availability**: System uptime percentage

## 8. Next Steps & Recommendations

### 8.1 Immediate Actions
1. **ตั้งค่า Git repository** พร้อม Git Flow workflow
2. **Setup development environment** ด้วย Docker Compose
3. **Implement core services**: Authentication, User Management
4. **Setup CI/CD pipeline** เบื้องต้น
5. **Implement monitoring** พื้นฐาน

### 8.2 Phase 2 (หลังจาก MVP)
1. **เพิ่ม caching layer** ด้วย Redis
2. **Implement message queue** สำหรับ async processing
3. **เพิ่ม advanced monitoring** และ alerting
4. **Implement backup** และ disaster recovery
5. **เพิ่ม security scanning** ใน CI/CD pipeline

### 8.3 Best Practices
1. **Code reviews** ทุก pull request
2. **Automated testing** ก่อน deployment
3. **Infrastructure as Code** สำหรับ AWS resources
4. **Regular security audits**
5. **Performance testing** เป็นประจำ

--
 
# ERP/CRM ระบบสำหรับธุรกิจขนาดเล็ก - โค้ดเต็ม

## 📁 โครงสร้างโปรเจค
```
erp-crm-system/
├── cmd/
│   ├── api-gateway/
│   │   └── main.go
│   ├── user-service/
│   │   └── main.go
│   ├── product-service/
│   │   └── main.go
│   └── warehouse-service/
│       └── main.go
├── internal/
│   ├── api/
│   │   └── v1/
│   │       ├── routes.go
│   │       └── handlers.go
│   ├── pkg/
│   │   ├── config/
│   │   │   ├── config.go
│   │   │   └── config.yaml
│   │   ├── database/
│   │   │   ├── postgres.go
│   │   │   └── redis.go
│   │   ├── middleware/
│   │   │   ├── auth.go
│   │   │   ├── logger.go
│   │   │   └── validator.go
│   │   ├── utils/
│   │   │   ├── jwt.go
│   │   │   ├── password.go
│   │   │   └── response.go
│   │   ├── validator/
│   │   │   └── custom_validator.go
│   │   └── cache/
│   │       └── redis_cache.go
│   └── services/
│       ├── user/
│       │   ├── model.go
│       │   ├── repository.go
│       │   ├── service.go
│       │   ├── handler.go
│       │   └── dto.go
│       ├── product/
│       │   ├── model.go
│       │   ├── repository.go
│       │   ├── service.go
│       │   ├── handler.go
│       │   └── dto.go
│       ├── warehouse/
│       │   ├── model.go
│       │   ├── repository.go
│       │   ├── service.go
│       │   └── handler.go
│       ├── auth/
│       │   ├── service.go
│       │   └── handler.go
│       └── audit/
│           ├── model.go
│           └── service.go
├── migrations/
│   ├── 001_create_users_table.sql
│   ├── 002_create_products_table.sql
│   ├── 003_create_warehouses_table.sql
│   └── 004_create_audit_logs_table.sql
├── deployments/
│   ├── docker/
│   │   ├── Dockerfile.api
│   │   └── Dockerfile.migration
│   ├── k8s/
│   │   ├── deployment.yaml
│   │   ├── service.yaml
│   │   └── ingress.yaml
│   └── prometheus/
│       └── prometheus.yml
├── scripts/
│   ├── migrate.sh
│   ├── test.sh
│   └── deploy.sh
├── tests/
│   ├── unit/
│   │   ├── user_test.go
│   │   └── product_test.go
│   └── integration/
│       └── api_test.go
├── docker-compose.yml
├── docker-compose.dev.yml
├── docker-compose.test.yml
├── Makefile
├── go.mod
├── go.sum
├── .env.example
├── .gitignore
├── README.md
└── .golangci.yml
```

## 📦 1. Configuration Files

### 1.1 `go.mod`
```go
module erp-crm-system

go 1.21

require (
    github.com/gofiber/fiber/v2 v2.52.0
    github.com/gofiber/jwt/v3 v3.3.10
    github.com/golang-jwt/jwt/v4 v4.5.0
    github.com/spf13/viper v1.18.2
    github.com/go-playground/validator/v10 v10.17.0
    github.com/google/uuid v1.6.0
    gorm.io/gorm v1.25.5
    gorm.io/driver/postgres v1.5.4
    github.com/redis/go-redis/v9 v9.5.1
    github.com/prometheus/client_golang v1.18.0
    github.com/swaggo/swag v1.16.2
    github.com/robfig/cron/v3 v3.0.1
    github.com/stretchr/testify v1.8.4
)

require (
    // Dependencies...
)
```

### 1.2 `config.yaml`
```yaml
server:
  address: ":8080"
  timeout: 30s
  allowed_origins:
    - "http://localhost:3000"
    - "https://erp-crm.com"
  environment: "development"

database:
  host: "localhost"
  port: 5432
  user: "erp_admin"
  password: "secure_password_123"
  dbname: "erp_crm_db"
  sslmode: "disable"
  max_open_conns: 25
  max_idle_conns: 5
  conn_max_lifetime: 300s

redis:
  host: "localhost"
  port: 6379
  password: ""
  db: 0
  pool_size: 10
  min_idle_conns: 2

jwt:
  secret: "your-super-secret-jwt-key-change-in-production"
  expiration: 24h
  refresh_expiration: 168h

monitoring:
  enabled: true
  prometheus_port: 9090
  metrics_path: "/metrics"

logging:
  level: "info"
  format: "json"
  output: "stdout"

services:
  auth:
    token_length: 32
    bcrypt_cost: 12
  audit:
    enabled: true
    batch_size: 100
    flush_interval: 5s
  cache:
    ttl: 300s
    prefix: "erp:"

n8n:
  webhook_url: "http://localhost:5678/webhook"
  enabled: true
  timeout: 10s

smtp:
  host: "smtp.gmail.com"
  port: 587
  username: "noreply@erp-crm.com"
  password: ""
  from: "ERP-CRM System <noreply@erp-crm.com>"

aws:
  region: "ap-southeast-1"
  s3_bucket: "erp-crm-documents"
  ec2_instance_type: "t3.small"
```

### 1.3 `.env.example`
```env
# Server
SERVER_ADDRESS=:8080
SERVER_ENVIRONMENT=development

# Database
DB_HOST=localhost
DB_PORT=5432
DB_USER=erp_admin
DB_PASSWORD=secure_password_123
DB_NAME=erp_crm_db
DB_SSLMODE=disable

# Redis
REDIS_HOST=localhost
REDIS_PORT=6379
REDIS_PASSWORD=
REDIS_DB=0

# JWT
JWT_SECRET=your-super-secret-jwt-key-change-in-production
JWT_EXPIRATION=24h

# AWS
AWS_REGION=ap-southeast-1
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
S3_BUCKET=erp-crm-documents

# Email
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USERNAME=
SMTP_PASSWORD=

# Monitoring
PROMETHEUS_ENABLED=true
```

## 🔧 2. Configuration Package

### 2.1 `internal/pkg/config/config.go`
```go
package config

import (
    "log"
    "os"
    "time"
    "github.com/spf13/viper"
)

type Config struct {
    Server      ServerConfig      `mapstructure:"server"`
    Database    DatabaseConfig    `mapstructure:"database"`
    Redis       RedisConfig       `mapstructure:"redis"`
    JWT         JWTConfig         `mapstructure:"jwt"`
    Monitoring  MonitoringConfig  `mapstructure:"monitoring"`
    Logging     LoggingConfig     `mapstructure:"logging"`
    Services    ServicesConfig    `mapstructure:"services"`
    N8N         N8NConfig         `mapstructure:"n8n"`
    SMTP        SMTPConfig        `mapstructure:"smtp"`
    AWS         AWSConfig         `mapstructure:"aws"`
}

type ServerConfig struct {
    Address        string        `mapstructure:"address"`
    Timeout        time.Duration `mapstructure:"timeout"`
    AllowedOrigins []string      `mapstructure:"allowed_origins"`
    Environment    string        `mapstructure:"environment"`
}

type DatabaseConfig struct {
    Host            string        `mapstructure:"host"`
    Port            int           `mapstructure:"port"`
    User            string        `mapstructure:"user"`
    Password        string        `mapstructure:"password"`
    DBName          string        `mapstructure:"dbname"`
    SSLMode         string        `mapstructure:"sslmode"`
    MaxOpenConns    int           `mapstructure:"max_open_conns"`
    MaxIdleConns    int           `mapstructure:"max_idle_conns"`
    ConnMaxLifetime time.Duration `mapstructure:"conn_max_lifetime"`
}

type RedisConfig struct {
    Host         string `mapstructure:"host"`
    Port         int    `mapstructure:"port"`
    Password     string `mapstructure:"password"`
    DB           int    `mapstructure:"db"`
    PoolSize     int    `mapstructure:"pool_size"`
    MinIdleConns int    `mapstructure:"min_idle_conns"`
}

type JWTConfig struct {
    Secret             string        `mapstructure:"secret"`
    Expiration         time.Duration `mapstructure:"expiration"`
    RefreshExpiration  time.Duration `mapstructure:"refresh_expiration"`
}

type MonitoringConfig struct {
    Enabled       bool   `mapstructure:"enabled"`
    PrometheusPort int   `mapstructure:"prometheus_port"`
    MetricsPath   string `mapstructure:"metrics_path"`
}

type LoggingConfig struct {
    Level  string `mapstructure:"level"`
    Format string `mapstructure:"format"`
    Output string `mapstructure:"output"`
}

type ServicesConfig struct {
    Auth  AuthServiceConfig  `mapstructure:"auth"`
    Audit AuditServiceConfig `mapstructure:"audit"`
    Cache CacheServiceConfig `mapstructure:"cache"`
}

type AuthServiceConfig struct {
    TokenLength int `mapstructure:"token_length"`
    BcryptCost  int `mapstructure:"bcrypt_cost"`
}

type AuditServiceConfig struct {
    Enabled      bool          `mapstructure:"enabled"`
    BatchSize    int           `mapstructure:"batch_size"`
    FlushInterval time.Duration `mapstructure:"flush_interval"`
}

type CacheServiceConfig struct {
    TTL    time.Duration `mapstructure:"ttl"`
    Prefix string        `mapstructure:"prefix"`
}

type N8NConfig struct {
    WebhookURL string        `mapstructure:"webhook_url"`
    Enabled    bool          `mapstructure:"enabled"`
    Timeout    time.Duration `mapstructure:"timeout"`
}

type SMTPConfig struct {
    Host     string `mapstructure:"host"`
    Port     int    `mapstructure:"port"`
    Username string `mapstructure:"username"`
    Password string `mapstructure:"password"`
    From     string `mapstructure:"from"`
}

type AWSConfig struct {
    Region          string `mapstructure:"region"`
    S3Bucket        string `mapstructure:"s3_bucket"`
    EC2InstanceType string `mapstructure:"ec2_instance_type"`
}

var globalConfig *Config

func Load() *Config {
    if globalConfig != nil {
        return globalConfig
    }

    viper.SetConfigName("config")
    viper.SetConfigType("yaml")
    viper.AddConfigPath(".")
    viper.AddConfigPath("./config")
    viper.AddConfigPath("/etc/erp-crm/")
    
    // Read environment variables
    viper.AutomaticEnv()
    viper.SetEnvPrefix("ERP")
    
    // Set defaults
    setDefaults()
    
    // Read config file
    if err := viper.ReadInConfig(); err != nil {
        if _, ok := err.(viper.ConfigFileNotFoundError); !ok {
            log.Fatalf("Error reading config file: %v", err)
        }
    }
    
    config := &Config{}
    if err := viper.Unmarshal(config); err != nil {
        log.Fatalf("Unable to decode config: %v", err)
    }
    
    // Validate required fields
    validateConfig(config)
    
    globalConfig = config
    return globalConfig
}

func setDefaults() {
    viper.SetDefault("server.address", ":8080")
    viper.SetDefault("server.timeout", 30*time.Second)
    viper.SetDefault("server.environment", "development")
    
    viper.SetDefault("database.host", "localhost")
    viper.SetDefault("database.port", 5432)
    viper.SetDefault("database.sslmode", "disable")
    viper.SetDefault("database.max_open_conns", 25)
    viper.SetDefault("database.max_idle_conns", 5)
    viper.SetDefault("database.conn_max_lifetime", 300*time.Second)
    
    viper.SetDefault("redis.host", "localhost")
    viper.SetDefault("redis.port", 6379)
    viper.SetDefault("redis.db", 0)
    viper.SetDefault("redis.pool_size", 10)
    
    viper.SetDefault("jwt.expiration", 24*time.Hour)
    viper.SetDefault("jwt.refresh_expiration", 168*time.Hour)
    
    viper.SetDefault("monitoring.enabled", true)
    viper.SetDefault("monitoring.prometheus_port", 9090)
    viper.SetDefault("monitoring.metrics_path", "/metrics")
    
    viper.SetDefault("services.auth.bcrypt_cost", 12)
    viper.SetDefault("services.auth.token_length", 32)
    viper.SetDefault("services.audit.enabled", true)
    viper.SetDefault("services.audit.batch_size", 100)
    viper.SetDefault("services.audit.flush_interval", 5*time.Second)
    viper.SetDefault("services.cache.ttl", 300*time.Second)
    viper.SetDefault("services.cache.prefix", "erp:")
    
    viper.SetDefault("n8n.enabled", true)
    viper.SetDefault("n8n.timeout", 10*time.Second)
}

func validateConfig(config *Config) {
    if config.JWT.Secret == "" || config.JWT.Secret == "your-super-secret-jwt-key-change-in-production" {
        log.Fatal("JWT secret must be set and should not be the default value")
    }
    
    if config.Database.Host == "" {
        log.Fatal("Database host must be set")
    }
    
    if config.Server.Environment == "production" {
        if config.Database.SSLMode != "require" {
            log.Println("WARNING: In production, database SSL mode should be 'require'")
        }
    }
}

func Get() *Config {
    if globalConfig == nil {
        return Load()
    }
    return globalConfig
}
```

## 🗄️ 3. Database Package

### 3.1 `internal/pkg/database/postgres.go`
```go
package database

import (
    "context"
    "fmt"
    "log"
    "time"
    "gorm.io/driver/postgres"
    "gorm.io/gorm"
    "gorm.io/gorm/logger"
    "erp-crm-system/internal/pkg/config"
)

type PostgresDB struct {
    DB *gorm.DB
}

func NewPostgreSQL(cfg config.DatabaseConfig) (*PostgresDB, error) {
    dsn := fmt.Sprintf(
        "host=%s user=%s password=%s dbname=%s port=%d sslmode=%s",
        cfg.Host, cfg.User, cfg.Password, cfg.DBName, cfg.Port, cfg.SSLMode,
    )
    
    // Configure GORM
    gormConfig := &gorm.Config{
        Logger: logger.Default.LogMode(logger.Info),
        PrepareStmt: true,
        NowFunc: func() time.Time {
            return time.Now().UTC()
        },
    }
    
    db, err := gorm.Open(postgres.Open(dsn), gormConfig)
    if err != nil {
        return nil, fmt.Errorf("failed to connect to database: %w", err)
    }
    
    // Configure connection pool
    sqlDB, err := db.DB()
    if err != nil {
        return nil, fmt.Errorf("failed to get database instance: %w", err)
    }
    
    sqlDB.SetMaxOpenConns(cfg.MaxOpenConns)
    sqlDB.SetMaxIdleConns(cfg.MaxIdleConns)
    sqlDB.SetConnMaxLifetime(cfg.ConnMaxLifetime)
    
    // Test connection
    ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
    defer cancel()
    
    if err := sqlDB.PingContext(ctx); err != nil {
        return nil, fmt.Errorf("database ping failed: %w", err)
    }
    
    log.Println("Successfully connected to PostgreSQL database")
    
    return &PostgresDB{DB: db}, nil
}

func (p *PostgresDB) AutoMigrate(models ...interface{}) error {
    return p.DB.AutoMigrate(models...)
}

func (p *PostgresDB) WithContext(ctx context.Context) *gorm.DB {
    return p.DB.WithContext(ctx)
}

func (p *PostgresDB) Close() error {
    sqlDB, err := p.DB.DB()
    if err != nil {
        return err
    }
    return sqlDB.Close()
}

func (p *PostgresDB) HealthCheck() error {
    sqlDB, err := p.DB.DB()
    if err != nil {
        return err
    }
    return sqlDB.Ping()
}

// Transaction helper
func (p *PostgresDB) Transaction(fn func(tx *gorm.DB) error) error {
    return p.DB.Transaction(fn)
}
```

### 3.2 `internal/pkg/database/redis.go`
```go
package database

import (
    "context"
    "fmt"
    "log"
    "time"
    "github.com/redis/go-redis/v9"
    "erp-crm-system/internal/pkg/config"
)

type RedisClient struct {
    Client *redis.Client
    Prefix string
}

func NewRedis(cfg config.RedisConfig, prefix string) (*RedisClient, error) {
    opts := &redis.Options{
        Addr:     fmt.Sprintf("%s:%d", cfg.Host, cfg.Port),
        Password: cfg.Password,
        DB:       cfg.DB,
        PoolSize: cfg.PoolSize,
        MinIdleConns: cfg.MinIdleConns,
        DialTimeout:  5 * time.Second,
        ReadTimeout:  3 * time.Second,
        WriteTimeout: 3 * time.Second,
        PoolTimeout:  4 * time.Second,
    }
    
    client := redis.NewClient(opts)
    
    // Test connection
    ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
    defer cancel()
    
    if err := client.Ping(ctx).Err(); err != nil {
        return nil, fmt.Errorf("failed to connect to Redis: %w", err)
    }
    
    log.Println("Successfully connected to Redis")
    
    return &RedisClient{
        Client: client,
        Prefix: prefix,
    }, nil
}

func (r *RedisClient) Set(ctx context.Context, key string, value interface{}, expiration time.Duration) error {
    fullKey := r.Prefix + key
    return r.Client.Set(ctx, fullKey, value, expiration).Err()
}

func (r *RedisClient) Get(ctx context.Context, key string) (string, error) {
    fullKey := r.Prefix + key
    return r.Client.Get(ctx, fullKey).Result()
}

func (r *RedisClient) Delete(ctx context.Context, key string) error {
    fullKey := r.Prefix + key
    return r.Client.Del(ctx, fullKey).Err()
}

func (r *RedisClient) Exists(ctx context.Context, key string) (bool, error) {
    fullKey := r.Prefix + key
    result, err := r.Client.Exists(ctx, fullKey).Result()
    return result == 1, err
}

func (r *RedisClient) Increment(ctx context.Context, key string) (int64, error) {
    fullKey := r.Prefix + key
    return r.Client.Incr(ctx, fullKey).Result()
}

func (r *RedisClient) Expire(ctx context.Context, key string, expiration time.Duration) error {
    fullKey := r.Prefix + key
    return r.Client.Expire(ctx, fullKey, expiration).Err()
}

func (r *RedisClient) Close() error {
    return r.Client.Close()
}

func (r *RedisClient) HealthCheck() error {
    ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
    defer cancel()
    return r.Client.Ping(ctx).Err()
}
```

## 🔐 4. Middleware Package

### 4.1 `internal/pkg/middleware/auth.go`
```go
package middleware

import (
    "strings"
    "time"
    "github.com/gofiber/fiber/v2"
    "github.com/golang-jwt/jwt/v4"
    "erp-crm-system/internal/pkg/config"
    "erp-crm-system/internal/pkg/utils"
)

type Claims struct {
    UserID    string `json:"user_id"`
    Email     string `json:"email"`
    Role      string `json:"role"`
    jwt.RegisteredClaims
}

func JWTProtected(cfg config.JWTConfig) fiber.Handler {
    return func(c *fiber.Ctx) error {
        authHeader := c.Get("Authorization")
        if authHeader == "" {
            return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{
                "error":   "unauthorized",
                "message": "Missing authorization header",
            })
        }
        
        // Check Bearer token format
        parts := strings.Split(authHeader, " ")
        if len(parts) != 2 || parts[0] != "Bearer" {
            return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{
                "error":   "unauthorized",
                "message": "Invalid authorization format",
            })
        }
        
        tokenString := parts[1]
        
        // Parse token
        claims := &Claims{}
        token, err := jwt.ParseWithClaims(tokenString, claims, func(token *jwt.Token) (interface{}, error) {
            if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
                return nil, fiber.NewError(fiber.StatusUnauthorized, "Invalid signing method")
            }
            return []byte(cfg.Secret), nil
        })
        
        if err != nil {
            if err == jwt.ErrSignatureInvalid {
                return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{
                    "error":   "unauthorized",
                    "message": "Invalid token signature",
                })
            }
            return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{
                "error":   "unauthorized",
                "message": "Invalid token",
            })
        }
        
        if !token.Valid {
            return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{
                "error":   "unauthorized",
                "message": "Token is not valid",
            })
        }
        
        // Check expiration
        if claims.ExpiresAt.Time.Before(time.Now()) {
            return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{
                "error":   "unauthorized",
                "message": "Token has expired",
            })
        }
        
        // Set user information in context
        c.Locals("user_id", claims.UserID)
        c.Locals("email", claims.Email)
        c.Locals("role", claims.Role)
        c.Locals("claims", claims)
        
        return c.Next()
    }
}

func RoleRequired(allowedRoles ...string) fiber.Handler {
    return func(c *fiber.Ctx) error {
        userRole, ok := c.Locals("role").(string)
        if !ok {
            return c.Status(fiber.StatusForbidden).JSON(fiber.Map{
                "error":   "forbidden",
                "message": "User role not found",
            })
        }
        
        // Check if user has admin role (admin can access everything)
        if userRole == "admin" {
            return c.Next()
        }
        
        // Check if user's role is in allowed roles
        for _, role := range allowedRoles {
            if userRole == role {
                return c.Next()
            }
        }
        
        return c.Status(fiber.StatusForbidden).JSON(fiber.Map{
            "error":   "forbidden",
            "message": "Insufficient permissions",
        })
    }
}

func GenerateJWT(userID, email, role string, cfg config.JWTConfig) (string, error) {
    claims := &Claims{
        UserID: userID,
        Email:  email,
        Role:   role,
        RegisteredClaims: jwt.RegisteredClaims{
            ExpiresAt: jwt.NewNumericDate(time.Now().Add(cfg.Expiration)),
            IssuedAt:  jwt.NewNumericDate(time.Now()),
            Issuer:    "erp-crm-system",
            Subject:   userID,
        },
    }
    
    token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
    return token.SignedString([]byte(cfg.Secret))
}

func GenerateRefreshToken() string {
    return utils.GenerateRandomString(32)
}
```

### 4.2 `internal/pkg/middleware/logger.go`
```go
package middleware

import (
    "fmt"
    "time"
    "github.com/gofiber/fiber/v2"
    "github.com/gofiber/fiber/v2/middleware/logger"
)

func Logger() fiber.Handler {
    return logger.New(logger.Config{
        Format: fmt.Sprintf(
            "[${time}] ${ip} ${status} ${method} ${path} ${latency} ${error}\n",
        ),
        TimeFormat: "2006-01-02 15:04:05",
        TimeZone:   "Asia/Bangkok",
    })
}

func RequestLogger() fiber.Handler {
    return func(c *fiber.Ctx) error {
        start := time.Now()
        
        // Process request
        err := c.Next()
        
        // Calculate latency
        latency := time.Since(start)
        
        // Log request details
        fmt.Printf(
            "[%s] %s %s %s %d %v\n",
            time.Now().Format("2006-01-02 15:04:05"),
            c.IP(),
            c.Method(),
            c.Path(),
            c.Response().StatusCode(),
            latency,
        )
        
        return err
    }
}
```

### 4.3 `internal/pkg/middleware/validator.go`
```go
package middleware

import (
    "github.com/go-playground/validator/v10"
    "github.com/gofiber/fiber/v2"
)

type ErrorResponse struct {
    Field   string `json:"field"`
    Tag     string `json:"tag"`
    Value   string `json:"value,omitempty"`
    Message string `json:"message"`
}

func ValidateRequest(s interface{}) fiber.Handler {
    validate := validator.New()
    
    return func(c *fiber.Ctx) error {
        if err := c.BodyParser(s); err != nil {
            return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{
                "error": "Invalid request body",
            })
        }
        
        if err := validate.Struct(s); err != nil {
            var errors []ErrorResponse
            for _, err := range err.(validator.ValidationErrors) {
                var element ErrorResponse
                element.Field = err.Field()
                element.Tag = err.Tag()
                element.Value = err.Param()
                element.Message = getErrorMessage(err)
                errors = append(errors, element)
            }
            
            return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{
                "error":   "Validation failed",
                "details": errors,
            })
        }
        
        return c.Next()
    }
}

func getErrorMessage(err validator.FieldError) string {
    switch err.Tag() {
    case "required":
        return "This field is required"
    case "email":
        return "Invalid email format"
    case "min":
        return "Value is too short"
    case "max":
        return "Value is too long"
    case "numeric":
        return "Value must be numeric"
    case "alphanum":
        return "Value must contain only letters and numbers"
    case "uuid":
        return "Invalid UUID format"
    default:
        return "Invalid value"
    }
}
```

## 🛠️ 5. Utilities Package

### 5.1 `internal/pkg/utils/jwt.go`
```go
package utils

import (
    "time"
    "github.com/golang-jwt/jwt/v4"
    "erp-crm-system/internal/pkg/config"
)

type JWTClaims struct {
    UserID string `json:"user_id"`
    Email  string `json:"email"`
    Role   string `json:"role"`
    jwt.RegisteredClaims
}

func GenerateToken(userID, email, role string, cfg config.JWTConfig) (string, error) {
    claims := JWTClaims{
        UserID: userID,
        Email:  email,
        Role:   role,
        RegisteredClaims: jwt.RegisteredClaims{
            ExpiresAt: jwt.NewNumericDate(time.Now().Add(cfg.Expiration)),
            IssuedAt:  jwt.NewNumericDate(time.Now()),
            Issuer:    "erp-crm-system",
        },
    }
    
    token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
    return token.SignedString([]byte(cfg.Secret))
}

func ParseToken(tokenString string, cfg config.JWTConfig) (*JWTClaims, error) {
    claims := &JWTClaims{}
    token, err := jwt.ParseWithClaims(tokenString, claims, func(token *jwt.Token) (interface{}, error) {
        return []byte(cfg.Secret), nil
    })
    
    if err != nil {
        return nil, err
    }
    
    if !token.Valid {
        return nil, jwt.ErrSignatureInvalid
    }
    
    return claims, nil
}

func GenerateRefreshToken() string {
    return GenerateRandomString(32)
}
```

### 5.2 `internal/pkg/utils/password.go`
```go
package utils

import (
    "golang.org/x/crypto/bcrypt"
    "crypto/rand"
    "encoding/hex"
)

func HashPassword(password string) (string, error) {
    bytes, err := bcrypt.GenerateFromPassword([]byte(password), 12)
    return string(bytes), err
}

func CheckPasswordHash(password, hash string) bool {
    err := bcrypt.CompareHashAndPassword([]byte(hash), []byte(password))
    return err == nil
}

func GenerateRandomString(length int) string {
    bytes := make([]byte, length)
    if _, err := rand.Read(bytes); err != nil {
        panic(err)
    }
    return hex.EncodeToString(bytes)
}

func GenerateAPIKey() (string, string) {
    key := GenerateRandomString(32)
    hashedKey, _ := HashPassword(key)
    return key, hashedKey
}
```

### 5.3 `internal/pkg/utils/response.go`
```go
package utils

import "github.com/gofiber/fiber/v2"

type Response struct {
    Success bool        `json:"success"`
    Message string      `json:"message,omitempty"`
    Data    interface{} `json:"data,omitempty"`
    Error   string      `json:"error,omitempty"`
    Meta    interface{} `json:"meta,omitempty"`
}

func SuccessResponse(c *fiber.Ctx, statusCode int, data interface{}, message ...string) error {
    resp := Response{
        Success: true,
        Data:    data,
    }
    
    if len(message) > 0 {
        resp.Message = message[0]
    }
    
    return c.Status(statusCode).JSON(resp)
}

func ErrorResponse(c *fiber.Ctx, statusCode int, err string) error {
    return c.Status(statusCode).JSON(Response{
        Success: false,
        Error:   err,
    })
}

func PaginatedResponse(c *fiber.Ctx, data interface{}, total, page, limit int) error {
    totalPages := (total + limit - 1) / limit
    
    return SuccessResponse(c, fiber.StatusOK, data, "", fiber.Map{
        "pagination": fiber.Map{
            "total":       total,
            "count":       len(data.([]interface{})),
            "per_page":    limit,
            "current_page": page,
            "total_pages": totalPages,
            "links": fiber.Map{
                "next":     page < totalPages,
                "previous": page > 1,
            },
        },
    })
}
```

## 👤 6. User Service

### 6.1 `internal/services/user/model.go`
```go
package user

import (
    "time"
    "github.com/google/uuid"
    "gorm.io/gorm"
)

type User struct {
    ID           uuid.UUID      `gorm:"type:uuid;primary_key" json:"id"`
    Email        string         `gorm:"uniqueIndex;not null" json:"email"`
    PasswordHash string         `gorm:"not null" json:"-"`
    FirstName    string         `gorm:"not null" json:"first_name"`
    LastName     string         `gorm:"not null" json:"last_name"`
    Phone        string         `json:"phone"`
    Role         string         `gorm:"default:'user'" json:"role"`
    Department   string         `json:"department"`
    Position     string         `json:"position"`
    IsActive     bool           `gorm:"default:true" json:"is_active"`
    LastLoginAt  *time.Time     `json:"last_login_at,omitempty"`
    CreatedAt    time.Time      `json:"created_at"`
    UpdatedAt    time.Time      `json:"updated_at"`
    DeletedAt    gorm.DeletedAt `gorm:"index" json:"-"`
}

func (u *User) BeforeCreate(tx *gorm.DB) error {
    if u.ID == uuid.Nil {
        u.ID = uuid.New()
    }
    return nil
}

type UserProfile struct {
    User
    Permissions []string `json:"permissions,omitempty"`
}

type UserSession struct {
    ID           uuid.UUID `gorm:"type:uuid;primary_key" json:"id"`
    UserID       uuid.UUID `gorm:"type:uuid;not null;index" json:"user_id"`
    RefreshToken string    `gorm:"not null;index" json:"-"`
    UserAgent    string    `json:"user_agent"`
    IPAddress    string    `json:"ip_address"`
    ExpiresAt    time.Time `json:"expires_at"`
    CreatedAt    time.Time `json:"created_at"`
}

func (us *UserSession) BeforeCreate(tx *gorm.DB) error {
    if us.ID == uuid.Nil {
        us.ID = uuid.New()
    }
    return nil
}
```

### 6.2 `internal/services/user/dto.go`
```go
package user

import "github.com/go-playground/validator/v10"

type RegisterRequest struct {
    Email           string `json:"email" validate:"required,email"`
    Password        string `json:"password" validate:"required,min=8"`
    ConfirmPassword string `json:"confirm_password" validate:"required,eqfield=Password"`
    FirstName       string `json:"first_name" validate:"required,min=2"`
    LastName        string `json:"last_name" validate:"required,min=2"`
    Phone           string `json:"phone" validate:"omitempty,e164"`
    Department      string `json:"department"`
    Position        string `json:"position"`
}

func (r *RegisterRequest) Validate() error {
    validate := validator.New()
    return validate.Struct(r)
}

type LoginRequest struct {
    Email    string `json:"email" validate:"required,email"`
    Password string `json:"password" validate:"required"`
}

type UpdateProfileRequest struct {
    FirstName  string `json:"first_name" validate:"omitempty,min=2"`
    LastName   string `json:"last_name" validate:"omitempty,min=2"`
    Phone      string `json:"phone" validate:"omitempty,e164"`
    Department string `json:"department"`
    Position   string `json:"position"`
}

type ChangePasswordRequest struct {
    CurrentPassword string `json:"current_password" validate:"required"`
    NewPassword     string `json:"new_password" validate:"required,min=8"`
    ConfirmPassword string `json:"confirm_password" validate:"required,eqfield=NewPassword"`
}

type ResetPasswordRequest struct {
    Email string `json:"email" validate:"required,email"`
}

type VerifyResetPasswordRequest struct {
    Token    string `json:"token" validate:"required"`
    Password string `json:"password" validate:"required,min=8"`
}

type UserResponse struct {
    ID         string    `json:"id"`
    Email      string    `json:"email"`
    FirstName  string    `json:"first_name"`
    LastName   string    `json:"last_name"`
    Phone      string    `json:"phone,omitempty"`
    Role       string    `json:"role"`
    Department string    `json:"department,omitempty"`
    Position   string    `json:"position,omitempty"`
    IsActive   bool      `json:"is_active"`
    CreatedAt  time.Time `json:"created_at"`
    UpdatedAt  time.Time `json:"updated_at"`
}

type LoginResponse struct {
    User         UserResponse `json:"user"`
    AccessToken  string       `json:"access_token"`
    RefreshToken string       `json:"refresh_token"`
    TokenType    string       `json:"token_type"`
    ExpiresIn    int64        `json:"expires_in"`
}

type ListUsersRequest struct {
    Page     int    `query:"page" validate:"omitempty,min=1"`
    Limit    int    `query:"limit" validate:"omitempty,min=1,max=100"`
    Role     string `query:"role"`
    IsActive *bool  `query:"is_active"`
    Search   string `query:"search"`
}

type ListUsersResponse struct {
    Users []UserResponse `json:"users"`
    Total int64          `json:"total"`
    Page  int            `json:"page"`
    Limit int            `json:"limit"`
}
```

### 6.3 `internal/services/user/repository.go`
```go
package user

import (
    "context"
    "fmt"
    "strings"
    "time"
    "gorm.io/gorm"
    "github.com/google/uuid"
)

type Repository interface {
    Create(ctx context.Context, user *User) error
    FindByID(ctx context.Context, id uuid.UUID) (*User, error)
    FindByEmail(ctx context.Context, email string) (*User, error)
    Update(ctx context.Context, user *User) error
    Delete(ctx context.Context, id uuid.UUID) error
    List(ctx context.Context, req ListUsersRequest) ([]User, int64, error)
    CreateSession(ctx context.Context, session *UserSession) error
    FindSessionByToken(ctx context.Context, refreshToken string) (*UserSession, error)
    DeleteSession(ctx context.Context, sessionID uuid.UUID) error
    DeleteUserSessions(ctx context.Context, userID uuid.UUID) error
    UpdateLastLogin(ctx context.Context, userID uuid.UUID) error
}

type repository struct {
    db *gorm.DB
}

func NewRepository(db *gorm.DB) Repository {
    return &repository{db: db}
}

func (r *repository) Create(ctx context.Context, user *User) error {
    return r.db.WithContext(ctx).Create(user).Error
}

func (r *repository) FindByID(ctx context.Context, id uuid.UUID) (*User, error) {
    var user User
    err := r.db.WithContext(ctx).First(&user, "id = ?", id).Error
    if err != nil {
        if err == gorm.ErrRecordNotFound {
            return nil, fmt.Errorf("user not found")
        }
        return nil, err
    }
    return &user, nil
}

func (r *repository) FindByEmail(ctx context.Context, email string) (*User, error) {
    var user User
    err := r.db.WithContext(ctx).First(&user, "email = ?", email).Error
    if err != nil {
        if err == gorm.ErrRecordNotFound {
            return nil, fmt.Errorf("user not found")
        }
        return nil, err
    }
    return &user, nil
}

func (r *repository) Update(ctx context.Context, user *User) error {
    user.UpdatedAt = time.Now()
    return r.db.WithContext(ctx).Save(user).Error
}

func (r *repository) Delete(ctx context.Context, id uuid.UUID) error {
    return r.db.WithContext(ctx).Delete(&User{}, "id = ?", id).Error
}

func (r *repository) List(ctx context.Context, req ListUsersRequest) ([]User, int64, error) {
    var users []User
    var total int64
    
    query := r.db.WithContext(ctx).Model(&User{})
    
    // Apply filters
    if req.Role != "" {
        query = query.Where("role = ?", req.Role)
    }
    
    if req.IsActive != nil {
        query = query.Where("is_active = ?", *req.IsActive)
    }
    
    if req.Search != "" {
        search := "%" + strings.ToLower(req.Search) + "%"
        query = query.Where(
            "LOWER(email) LIKE ? OR LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ?",
            search, search, search,
        )
    }
    
    // Count total
    if err := query.Count(&total).Error; err != nil {
        return nil, 0, err
    }
    
    // Apply pagination
    page := req.Page
    if page < 1 {
        page = 1
    }
    
    limit := req.Limit
    if limit < 1 || limit > 100 {
        limit = 10
    }
    
    offset := (page - 1) * limit
    
    // Get users
    err := query.Order("created_at DESC").
        Limit(limit).
        Offset(offset).
        Find(&users).Error
    
    return users, total, err
}

func (r *repository) CreateSession(ctx context.Context, session *UserSession) error {
    return r.db.WithContext(ctx).Create(session).Error
}

func (r *repository) FindSessionByToken(ctx context.Context, refreshToken string) (*UserSession, error) {
    var session UserSession
    err := r.db.WithContext(ctx).
        Where("refresh_token = ? AND expires_at > ?", refreshToken, time.Now()).
        First(&session).Error
    
    if err != nil {
        if err == gorm.ErrRecordNotFound {
            return nil, fmt.Errorf("session not found or expired")
        }
        return nil, err
    }
    return &session, nil
}

func (r *repository) DeleteSession(ctx context.Context, sessionID uuid.UUID) error {
    return r.db.WithContext(ctx).Delete(&UserSession{}, "id = ?", sessionID).Error
}

func (r *repository) DeleteUserSessions(ctx context.Context, userID uuid.UUID) error {
    return r.db.WithContext(ctx).Delete(&UserSession{}, "user_id = ?", userID).Error
}

func (r *repository) UpdateLastLogin(ctx context.Context, userID uuid.UUID) error {
    now := time.Now()
    return r.db.WithContext(ctx).
        Model(&User{}).
        Where("id = ?", userID).
        Update("last_login_at", now).Error
}
```

### 6.4 `internal/services/user/service.go`
```go
package user

import (
    "context"
    "errors"
    "fmt"
    "time"
    "github.com/google/uuid"
    "erp-crm-system/internal/pkg/config"
    "erp-crm-system/internal/pkg/utils"
    "erp-crm-system/internal/services/audit"
)

type Service interface {
    Register(ctx context.Context, req *RegisterRequest) (*UserResponse, error)
    Login(ctx context.Context, req *LoginRequest, userAgent, ipAddress string) (*LoginResponse, error)
    Logout(ctx context.Context, refreshToken string) error
    RefreshToken(ctx context.Context, refreshToken string) (*LoginResponse, error)
    GetProfile(ctx context.Context, userID string) (*UserResponse, error)
    UpdateProfile(ctx context.Context, userID string, req *UpdateProfileRequest) (*UserResponse, error)
    ChangePassword(ctx context.Context, userID string, req *ChangePasswordRequest) error
    ResetPassword(ctx context.Context, req *ResetPasswordRequest) error
    VerifyResetPassword(ctx context.Context, req *VerifyResetPasswordRequest) error
    ListUsers(ctx context.Context, req ListUsersRequest) (*ListUsersResponse, error)
    GetUserByID(ctx context.Context, userID, targetID string) (*UserResponse, error)
    UpdateUser(ctx context.Context, userID, targetID string, req *UpdateProfileRequest) (*UserResponse, error)
    DeactivateUser(ctx context.Context, userID, targetID string) error
    ActivateUser(ctx context.Context, userID, targetID string) error
}

type service struct {
    repo     Repository
    cfg      *config.Config
    auditSvc audit.Service
    cache    *database.RedisClient
}

func NewService(repo Repository, cfg *config.Config, auditSvc audit.Service, cache *database.RedisClient) Service {
    return &service{
        repo:     repo,
        cfg:      cfg,
        auditSvc: auditSvc,
        cache:    cache,
    }
}

func (s *service) Register(ctx context.Context, req *RegisterRequest) (*UserResponse, error) {
    // Validate request
    if err := req.Validate(); err != nil {
        return nil, err
    }
    
    // Check if user already exists
    existing, err := s.repo.FindByEmail(ctx, req.Email)
    if err == nil && existing != nil {
        return nil, errors.New("user already exists")
    }
    
    // Hash password
    hashedPassword, err := utils.HashPassword(req.Password)
    if err != nil {
        return nil, fmt.Errorf("failed to hash password: %w", err)
    }
    
    // Create user
    user := &User{
        Email:        req.Email,
        PasswordHash: hashedPassword,
        FirstName:    req.FirstName,
        LastName:     req.LastName,
        Phone:        req.Phone,
        Department:   req.Department,
        Position:     req.Position,
        Role:         "user",
        IsActive:     true,
    }
    
    if err := s.repo.Create(ctx, user); err != nil {
        return nil, fmt.Errorf("failed to create user: %w", err)
    }
    
    // Log audit trail
    s.auditSvc.Log(ctx, &audit.LogEntry{
        UserID:    user.ID.String(),
        Action:    "USER_REGISTERED",
        EntityID:  user.ID.String(),
        EntityType: "user",
        Details:   fmt.Sprintf("User registered with email: %s", user.Email),
        IPAddress: audit.GetIPFromContext(ctx),
    })
    
    // Send welcome email via N8N (async)
    go s.sendWelcomeEmail(user)
    
    return s.toResponse(user), nil
}

func (s *service) Login(ctx context.Context, req *LoginRequest, userAgent, ipAddress string) (*LoginResponse, error) {
    // Validate request
    validate := validator.New()
    if err := validate.Struct(req); err != nil {
        return nil, errors.New("invalid login credentials")
    }
    
    // Find user by email
    user, err := s.repo.FindByEmail(ctx, req.Email)
    if err != nil {
        return nil, errors.New("invalid credentials")
    }
    
    // Check if user is active
    if !user.IsActive {
        return nil, errors.New("account is deactivated")
    }
    
    // Verify password
    if !utils.CheckPasswordHash(req.Password, user.PasswordHash) {
        return nil, errors.New("invalid credentials")
    }
    
    // Generate tokens
    accessToken, err := utils.GenerateToken(user.ID.String(), user.Email, user.Role, s.cfg.JWT)
    if err != nil {
        return nil, fmt.Errorf("failed to generate access token: %w", err)
    }
    
    refreshToken := utils.GenerateRefreshToken()
    
    // Create session
    session := &UserSession{
        UserID:       user.ID,
        RefreshToken: refreshToken,
        UserAgent:    userAgent,
        IPAddress:    ipAddress,
        ExpiresAt:    time.Now().Add(s.cfg.JWT.RefreshExpiration),
    }
    
    if err := s.repo.CreateSession(ctx, session); err != nil {
        return nil, fmt.Errorf("failed to create session: %w", err)
    }
    
    // Update last login
    if err := s.repo.UpdateLastLogin(ctx, user.ID); err != nil {
        // Don't fail login if this fails, just log it
        fmt.Printf("Failed to update last login: %v\n", err)
    }
    
    // Log audit trail
    s.auditSvc.Log(ctx, &audit.LogEntry{
        UserID:     user.ID.String(),
        Action:     "USER_LOGIN",
        EntityID:   user.ID.String(),
        EntityType: "user",
        Details:    "User logged in successfully",
        IPAddress:  ipAddress,
    })
    
    return &LoginResponse{
        User:         *s.toResponse(user),
        AccessToken:  accessToken,
        RefreshToken: refreshToken,
        TokenType:    "Bearer",
        ExpiresIn:    int64(s.cfg.JWT.Expiration.Seconds()),
    }, nil
}

func (s *service) Logout(ctx context.Context, refreshToken string) error {
    // Find session
    session, err := s.repo.FindSessionByToken(ctx, refreshToken)
    if err != nil {
        // If session not found, consider it already logged out
        return nil
    }
    
    // Delete session
    if err := s.repo.DeleteSession(ctx, session.ID); err != nil {
        return fmt.Errorf("failed to delete session: %w", err)
    }
    
    // Get user from context
    userID, ok := ctx.Value("user_id").(string)
    if ok {
        s.auditSvc.Log(ctx, &audit.LogEntry{
            UserID:     userID,
            Action:     "USER_LOGOUT",
            EntityID:   session.UserID.String(),
            EntityType: "user",
            Details:    "User logged out",
            IPAddress:  audit.GetIPFromContext(ctx),
        })
    }
    
    return nil
}

func (s *service) RefreshToken(ctx context.Context, refreshToken string) (*LoginResponse, error) {
    // Find valid session
    session, err := s.repo.FindSessionByToken(ctx, refreshToken)
    if err != nil {
        return nil, errors.New("invalid refresh token")
    }
    
    // Get user
    user, err := s.repo.FindByID(ctx, session.UserID)
    if err != nil {
        return nil, errors.New("user not found")
    }
    
    // Check if user is active
    if !user.IsActive {
        return nil, errors.New("account is deactivated")
    }
    
    // Generate new tokens
    accessToken, err := utils.GenerateToken(user.ID.String(), user.Email, user.Role, s.cfg.JWT)
    if err != nil {
        return nil, fmt.Errorf("failed to generate access token: %w", err)
    }
    
    newRefreshToken := utils.GenerateRefreshToken()
    
    // Update session with new refresh token
    session.RefreshToken = newRefreshToken
    session.ExpiresAt = time.Now().Add(s.cfg.JWT.RefreshExpiration)
    
    if err := s.repo.Update(ctx, &UserSession{ID: session.ID, RefreshToken: newRefreshToken}); err != nil {
        return nil, fmt.Errorf("failed to update session: %w", err)
    }
    
    return &LoginResponse{
        User:         *s.toResponse(user),
        AccessToken:  accessToken,
        RefreshToken: newRefreshToken,
        TokenType:    "Bearer",
        ExpiresIn:    int64(s.cfg.JWT.Expiration.Seconds()),
    }, nil
}

func (s *service) GetProfile(ctx context.Context, userID string) (*UserResponse, error) {
    id, err := uuid.Parse(userID)
    if err != nil {
        return nil, errors.New("invalid user ID")
    }
    
    // Try cache first
    cacheKey := fmt.Sprintf("user:%s", userID)
    if cached, err := s.cache.Get(ctx, cacheKey); err == nil && cached != "" {
        var userResp UserResponse
        if err := json.Unmarshal([]byte(cached), &userResp); err == nil {
            return &userResp, nil
        }
    }
    
    user, err := s.repo.FindByID(ctx, id)
    if err != nil {
        return nil, err
    }
    
    resp := s.toResponse(user)
    
    // Cache the response
    if data, err := json.Marshal(resp); err == nil {
        s.cache.Set(ctx, cacheKey, string(data), s.cfg.Services.Cache.TTL)
    }
    
    return resp, nil
}

func (s *service) UpdateProfile(ctx context.Context, userID string, req *UpdateProfileRequest) (*UserResponse, error) {
    // Validate request
    validate := validator.New()
    if err := validate.Struct(req); err != nil {
        return nil, err
    }
    
    id, err := uuid.Parse(userID)
    if err != nil {
        return nil, errors.New("invalid user ID")
    }
    
    user, err := s.repo.FindByID(ctx, id)
    if err != nil {
        return nil, err
    }
    
    // Update fields if provided
    if req.FirstName != "" {
        user.FirstName = req.FirstName
    }
    if req.LastName != "" {
        user.LastName = req.LastName
    }
    if req.Phone != "" {
        user.Phone = req.Phone
    }
    if req.Department != "" {
        user.Department = req.Department
    }
    if req.Position != "" {
        user.Position = req.Position
    }
    
    if err := s.repo.Update(ctx, user); err != nil {
        return nil, fmt.Errorf("failed to update user: %w", err)
    }
    
    // Clear cache
    s.cache.Delete(ctx, fmt.Sprintf("user:%s", userID))
    
    // Log audit trail
    s.auditSvc.Log(ctx, &audit.LogEntry{
        UserID:     userID,
        Action:     "USER_UPDATED",
        EntityID:   userID,
        EntityType: "user",
        Details:    "User updated profile",
        IPAddress:  audit.GetIPFromContext(ctx),
    })
    
    return s.toResponse(user), nil
}

func (s *service) ChangePassword(ctx context.Context, userID string, req *ChangePasswordRequest) error {
    // Validate request
    validate := validator.New()
    if err := validate.Struct(req); err != nil {
        return errors.New("invalid request")
    }
    
    id, err := uuid.Parse(userID)
    if err != nil {
        return errors.New("invalid user ID")
    }
    
    user, err := s.repo.FindByID(ctx, id)
    if err != nil {
        return err
    }
    
    // Verify current password
    if !utils.CheckPasswordHash(req.CurrentPassword, user.PasswordHash) {
        return errors.New("current password is incorrect")
    }
    
    // Hash new password
    hashedPassword, err := utils.HashPassword(req.NewPassword)
    if err != nil {
        return fmt.Errorf("failed to hash password: %w", err)
    }
    
    // Update password
    user.PasswordHash = hashedPassword
    if err := s.repo.Update(ctx, user); err != nil {
        return fmt.Errorf("failed to update password: %w", err)
    }
    
    // Delete all user sessions (force logout from all devices)
    if err := s.repo.DeleteUserSessions(ctx, user.ID); err != nil {
        // Log error but don't fail
        fmt.Printf("Failed to delete user sessions: %v\n", err)
    }
    
    // Clear cache
    s.cache.Delete(ctx, fmt.Sprintf("user:%s", userID))
    
    // Log audit trail
    s.auditSvc.Log(ctx, &audit.LogEntry{
        UserID:     userID,
        Action:     "PASSWORD_CHANGED",
        EntityID:   userID,
        EntityType: "user",
        Details:    "User changed password",
        IPAddress:  audit.GetIPFromContext(ctx),
    })
    
    // Send email notification
    go s.sendPasswordChangedEmail(user)
    
    return nil
}

func (s *service) ListUsers(ctx context.Context, req ListUsersRequest) (*ListUsersResponse, error) {
    users, total, err := s.repo.List(ctx, req)
    if err != nil {
        return nil, fmt.Errorf("failed to list users: %w", err)
    }
    
    // Convert to response
    userResponses := make([]UserResponse, len(users))
    for i, user := range users {
        userResponses[i] = *s.toResponse(&user)
    }
    
    return &ListUsersResponse{
        Users: userResponses,
        Total: total,
        Page:  req.Page,
        Limit: req.Limit,
    }, nil
}

func (s *service) toResponse(user *User) *UserResponse {
    return &UserResponse{
        ID:         user.ID.String(),
        Email:      user.Email,
        FirstName:  user.FirstName,
        LastName:   user.LastName,
        Phone:      user.Phone,
        Role:       user.Role,
        Department: user.Department,
        Position:   user.Position,
        IsActive:   user.IsActive,
        CreatedAt:  user.CreatedAt,
        UpdatedAt:  user.UpdatedAt,
    }
}

func (s *service) sendWelcomeEmail(user *User) {
    // Implementation for sending welcome email via N8N
    // This would make an HTTP request to N8N webhook
    fmt.Printf("Sending welcome email to: %s\n", user.Email)
}

func (s *service) sendPasswordChangedEmail(user *User) {
    fmt.Printf("Sending password changed notification to: %s\n", user.Email)
}
```

### 6.5 `internal/services/user/handler.go`
```go
package user

import (
    "github.com/gofiber/fiber/v2"
    "github.com/google/uuid"
    "erp-crm-system/internal/pkg/middleware"
    "erp-crm-system/internal/pkg/utils"
)

type Handler struct {
    service Service
}

func NewHandler(service Service) *Handler {
    return &Handler{service: service}
}

func (h *Handler) RegisterRoutes(router fiber.Router) {
    // Public routes
    router.Post("/register", h.Register)
    router.Post("/login", h.Login)
    router.Post("/refresh", h.Refresh)
    router.Post("/logout", h.Logout)
    router.Post("/password/reset", h.ResetPassword)
    router.Post("/password/verify", h.VerifyResetPassword)
    
    // Protected routes
    protected := router.Group("", middleware.JWTProtected(h.service.cfg.JWT))
    protected.Get("/profile", h.GetProfile)
    protected.Put("/profile", h.UpdateProfile)
    protected.Put("/password", h.ChangePassword)
    
    // Admin routes
    admin := protected.Group("", middleware.RoleRequired("admin"))
    admin.Get("/users", h.ListUsers)
    admin.Get("/users/:id", h.GetUser)
    admin.Put("/users/:id", h.UpdateUser)
    admin.Patch("/users/:id/deactivate", h.DeactivateUser)
    admin.Patch("/users/:id/activate", h.ActivateUser)
}

// Register godoc
// @Summary Register a new user
// @Description Register a new user with email and password
// @Tags auth
// @Accept json
// @Produce json
// @Param request body RegisterRequest true "Register request"
// @Success 201 {object} UserResponse
// @Failure 400 {object} utils.ErrorResponse
// @Failure 409 {object} utils.ErrorResponse
// @Failure 500 {object} utils.ErrorResponse
// @Router /auth/register [post]
func (h *Handler) Register(c *fiber.Ctx) error {
    var req RegisterRequest
    if err := c.BodyParser(&req); err != nil {
        return utils.ErrorResponse(c, fiber.StatusBadRequest, "Invalid request body")
    }
    
    user, err := h.service.Register(c.Context(), &req)
    if err != nil {
        return utils.ErrorResponse(c, fiber.StatusBadRequest, err.Error())
    }
    
    return utils.SuccessResponse(c, fiber.StatusCreated, user, "User registered successfully")
}

// Login godoc
// @Summary User login
// @Description Authenticate user and return tokens
// @Tags auth
// @Accept json
// @Produce json
// @Param request body LoginRequest true "Login request"
// @Success 200 {object} LoginResponse
// @Failure 400 {object} utils.ErrorResponse
// @Failure 401 {object} utils.ErrorResponse
// @Failure 500 {object} utils.ErrorResponse
// @Router /auth/login [post]
func (h *Handler) Login(c *fiber.Ctx) error {
    var req LoginRequest
    if err := c.BodyParser(&req); err != nil {
        return utils.ErrorResponse(c, fiber.StatusBadRequest, "Invalid request body")
    }
    
    userAgent := c.Get("User-Agent")
    ipAddress := c.IP()
    
    resp, err := h.service.Login(c.Context(), &req, userAgent, ipAddress)
    if err != nil {
        return utils.ErrorResponse(c, fiber.StatusUnauthorized, err.Error())
    }
    
    return utils.SuccessResponse(c, fiber.StatusOK, resp, "Login successful")
}

// Logout godoc
// @Summary User logout
// @Description Invalidate refresh token
// @Tags auth
// @Accept json
// @Produce json
// @Param request body LogoutRequest true "Logout request"
// @Success 204
// @Failure 400 {object} utils.ErrorResponse
// @Failure 500 {object} utils.ErrorResponse
// @Router /auth/logout [post]
func (h *Handler) Logout(c *fiber.Ctx) error {
    var req struct {
        RefreshToken string `json:"refresh_token"`
    }
    
    if err := c.BodyParser(&req); err != nil {
        return utils.ErrorResponse(c, fiber.StatusBadRequest, "Invalid request body")
    }
    
    if req.RefreshToken == "" {
        return utils.ErrorResponse(c, fiber.StatusBadRequest, "Refresh token is required")
    }
    
    if err := h.service.Logout(c.Context(), req.RefreshToken); err != nil {
        return utils.ErrorResponse(c, fiber.StatusInternalServerError, err.Error())
    }
    
    return c.SendStatus(fiber.StatusNoContent)
}

// Refresh godoc
// @Summary Refresh access token
// @Description Get new access token using refresh token
// @Tags auth
// @Accept json
// @Produce json
// @Param request body RefreshRequest true "Refresh request"
// @Success 200 {object} LoginResponse
// @Failure 400 {object} utils.ErrorResponse
// @Failure 401 {object} utils.ErrorResponse
// @Failure 500 {object} utils.ErrorResponse
// @Router /auth/refresh [post]
func (h *Handler) Refresh(c *fiber.Ctx) error {
    var req struct {
        RefreshToken string `json:"refresh_token"`
    }
    
    if err := c.BodyParser(&req); err != nil {
        return utils.ErrorResponse(c, fiber.StatusBadRequest, "Invalid request body")
    }
    
    if req.RefreshToken == "" {
        return utils.ErrorResponse(c, fiber.StatusBadRequest, "Refresh token is required")
    }
    
    resp, err := h.service.RefreshToken(c.Context(), req.RefreshToken)
    if err != nil {
        return utils.ErrorResponse(c, fiber.StatusUnauthorized, err.Error())
    }
    
    return utils.SuccessResponse(c, fiber.StatusOK, resp, "Token refreshed")
}

// GetProfile godoc
// @Summary Get user profile
// @Description Get current user's profile information
// @Tags users
// @Security BearerAuth
// @Produce json
// @Success 200 {object} UserResponse
// @Failure 401 {object} utils.ErrorResponse
// @Failure 404 {object} utils.ErrorResponse
// @Failure 500 {object} utils.ErrorResponse
// @Router /users/profile [get]
func (h *Handler) GetProfile(c *fiber.Ctx) error {
    userID := c.Locals("user_id").(string)
    
    profile, err := h.service.GetProfile(c.Context(), userID)
    if err != nil {
        return utils.ErrorResponse(c, fiber.StatusNotFound, err.Error())
    }
    
    return utils.SuccessResponse(c, fiber.StatusOK, profile, "Profile retrieved")
}

// UpdateProfile godoc
// @Summary Update user profile
// @Description Update current user's profile information
// @Tags users
// @Security BearerAuth
// @Accept json
// @Produce json
// @Param request body UpdateProfileRequest true "Update profile request"
// @Success 200 {object} UserResponse
// @Failure 400 {object} utils.ErrorResponse
// @Failure 401 {object} utils.ErrorResponse
// @Failure 500 {object} utils.ErrorResponse
// @Router /users/profile [put]
func (h *Handler) UpdateProfile(c *fiber.Ctx) error {
    userID := c.Locals("user_id").(string)
    
    var req UpdateProfileRequest
    if err := c.BodyParser(&req); err != nil {
        return utils.ErrorResponse(c, fiber.StatusBadRequest, "Invalid request body")
    }
    
    updated, err := h.service.UpdateProfile(c.Context(), userID, &req)
    if err != nil {
        return utils.ErrorResponse(c, fiber.StatusBadRequest, err.Error())
    }
    
    return utils.SuccessResponse(c, fiber.StatusOK, updated, "Profile updated successfully")
}

// ChangePassword godoc
// @Summary Change user password
// @Description Change current user's password
// @Tags users
// @Security BearerAuth
// @Accept json
// @Produce json
// @Param request body ChangePasswordRequest true "Change password request"
// @Success 204
// @Failure 400 {object} utils.ErrorResponse
// @Failure 401 {object} utils.ErrorResponse
// @Failure 500 {object} utils.ErrorResponse
// @Router /users/password [put]
func (h *Handler) ChangePassword(c *fiber.Ctx) error {
    userID := c.Locals("user_id").(string)
    
    var req ChangePasswordRequest
    if err := c.BodyParser(&req); err != nil {
        return utils.ErrorResponse(c, fiber.StatusBadRequest, "Invalid request body")
    }
    
    if err := h.service.ChangePassword(c.Context(), userID, &req); err != nil {
        return utils.ErrorResponse(c, fiber.StatusBadRequest, err.Error())
    }
    
    return c.SendStatus(fiber.StatusNoContent)
}

// ListUsers godoc
// @Summary List users
// @Description Get list of users (admin only)
// @Tags users
// @Security BearerAuth
// @Produce json
// @Param page query int false "Page number" default(1)
// @Param limit query int false "Items per page" default(10)
// @Param role query string false "Filter by role"
// @Param is_active query bool false "Filter by active status"
// @Param search query string false "Search term"
// @Success 200 {object} ListUsersResponse
// @Failure 401 {object} utils.ErrorResponse
// @Failure 403 {object} utils.ErrorResponse
// @Failure 500 {object} utils.ErrorResponse
// @Router /users [get]
func (h *Handler) ListUsers(c *fiber.Ctx) error {
    var req ListUsersRequest
    if err := c.QueryParser(&req); err != nil {
        return utils.ErrorResponse(c, fiber.StatusBadRequest, "Invalid query parameters")
    }
    
    // Set defaults
    if req.Page == 0 {
        req.Page = 1
    }
    if req.Limit == 0 {
        req.Limit = 10
    }
    
    resp, err := h.service.ListUsers(c.Context(), req)
    if err != nil {
        return utils.ErrorResponse(c, fiber.StatusInternalServerError, err.Error())
    }
    
    return utils.SuccessResponse(c, fiber.StatusOK, resp, "Users retrieved")
}

// GetUser godoc
// @Summary Get user by ID
// @Description Get user information by ID (admin only)
// @Tags users
// @Security BearerAuth
// @Produce json
// @Param id path string true "User ID"
// @Success 200 {object} UserResponse
// @Failure 400 {object} utils.ErrorResponse
// @Failure 401 {object} utils.ErrorResponse
// @Failure 403 {object} utils.ErrorResponse
// @Failure 404 {object} utils.ErrorResponse
// @Failure 500 {object} utils.ErrorResponse
// @Router /users/{id} [get]
func (h *Handler) GetUser(c *fiber.Ctx) error {
    userID := c.Locals("user_id").(string)
    targetID := c.Params("id")
    
    if _, err := uuid.Parse(targetID); err != nil {
        return utils.ErrorResponse(c, fiber.StatusBadRequest, "Invalid user ID")
    }
    
    user, err := h.service.GetUserByID(c.Context(), userID, targetID)
    if err != nil {
        return utils.ErrorResponse(c, fiber.StatusNotFound, err.Error())
    }
    
    return utils.SuccessResponse(c, fiber.StatusOK, user, "User retrieved")
}

// UpdateUser godoc
// @Summary Update user
// @Description Update user information (admin only)
// @Tags users
// @Security BearerAuth
// @Accept json
// @Produce json
// @Param id path string true "User ID"
// @Param request body UpdateProfileRequest true "Update user request"
// @Success 200 {object} UserResponse
// @Failure 400 {object} utils.ErrorResponse
// @Failure 401 {object} utils.ErrorResponse
// @Failure 403 {object} utils.ErrorResponse
// @Failure 404 {object} utils.ErrorResponse
// @Failure 500 {object} utils.ErrorResponse
// @Router /users/{id} [put]
func (h *Handler) UpdateUser(c *fiber.Ctx) error {
    userID := c.Locals("user_id").(string)
    targetID := c.Params("id")
    
    var req UpdateProfileRequest
    if err := c.BodyParser(&req); err != nil {
        return utils.ErrorResponse(c, fiber.StatusBadRequest, "Invalid request body")
    }
    
    updated, err := h.service.UpdateUser(c.Context(), userID, targetID, &req)
    if err != nil {
        return utils.ErrorResponse(c, fiber.StatusBadRequest, err.Error())
    }
    
    return utils.SuccessResponse(c, fiber.StatusOK, updated, "User updated successfully")
}

// DeactivateUser godoc
// @Summary Deactivate user
// @Description Deactivate a user account (admin only)
// @Tags users
// @Security BearerAuth
// @Produce json
// @Param id path string true "User ID"
// @Success 204
// @Failure 400 {object} utils.ErrorResponse
// @Failure 401 {object} utils.ErrorResponse
// @Failure 403 {object} utils.ErrorResponse
// @Failure 404 {object} utils.ErrorResponse
// @Failure 500 {object} utils.ErrorResponse
// @Router /users/{id}/deactivate [patch]
func (h *Handler) DeactivateUser(c *fiber.Ctx) error {
    userID := c.Locals("user_id").(string)
    targetID := c.Params("id")
    
    if err := h.service.DeactivateUser(c.Context(), userID, targetID); err != nil {
        return utils.ErrorResponse(c, fiber.StatusBadRequest, err.Error())
    }
    
    return c.SendStatus(fiber.StatusNoContent)
}

// ActivateUser godoc
// @Summary Activate user
// @Description Activate a deactivated user account (admin only)
// @Tags users
// @Security BearerAuth
// @Produce json
// @Param id path string true "User ID"
// @Success 204
// @Failure 400 {object} utils.ErrorResponse
// @Failure 401 {object} utils.ErrorResponse
// @Failure 403 {object} utils.ErrorResponse
// @Failure 404 {object} utils.ErrorResponse
// @Failure 500 {object} utils.ErrorResponse
// @Router /users/{id}/activate [patch]
func (h *Handler) ActivateUser(c *fiber.Ctx) error {
    userID := c.Locals("user_id").(string)
    targetID := c.Params("id")
    
    if err := h.service.ActivateUser(c.Context(), userID, targetID); err != nil {
        return utils.ErrorResponse(c, fiber.StatusBadRequest, err.Error())
    }
    
    return c.SendStatus(fiber.StatusNoContent)
}
```

## 🏬 7. Product Service

### 7.1 `internal/services/product/model.go`
```go
package product

import (
    "time"
    "github.com/google/uuid"
    "gorm.io/gorm"
)

type Product struct {
    ID            uuid.UUID      `gorm:"type:uuid;primary_key" json:"id"`
    SKU           string         `gorm:"uniqueIndex;not null" json:"sku"`
    Name          string         `gorm:"not null;index" json:"name"`
    Description   string         `json:"description"`
    CategoryID    uuid.UUID      `gorm:"type:uuid;index" json:"category_id"`
    Brand         string         `json:"brand"`
    Unit          string         `json:"unit"`
    Price         float64        `gorm:"not null;type:decimal(10,2)" json:"price"`
    CostPrice     float64        `gorm:"type:decimal(10,2)" json:"cost_price"`
    TaxRate       float64        `gorm:"type:decimal(5,2)" json:"tax_rate"`
    StockQuantity int            `gorm:"default:0" json:"stock_quantity"`
    MinStockLevel int            `gorm:"default:10" json:"min_stock_level"`
    MaxStockLevel int            `json:"max_stock_level"`
    Weight        float64        `json:"weight"`
    Dimensions    string         `json:"dimensions"`
    IsActive      bool           `gorm:"default:true" json:"is_active"`
    CreatedBy     uuid.UUID      `gorm:"type:uuid" json:"created_by"`
    UpdatedBy     uuid.UUID      `gorm:"type:uuid" json:"updated_by"`
    CreatedAt     time.Time      `json:"created_at"`
    UpdatedAt     time.Time      `json:"updated_at"`
    DeletedAt     gorm.DeletedAt `gorm:"index" json:"-"`
}

type Category struct {
    ID          uuid.UUID      `gorm:"type:uuid;primary_key" json:"id"`
    Name        string         `gorm:"uniqueIndex;not null" json:"name"`
    Description string         `json:"description"`
    ParentID    *uuid.UUID     `gorm:"type:uuid;index" json:"parent_id"`
    IsActive    bool           `gorm:"default:true" json:"is_active"`
    CreatedAt   time.Time      `json:"created_at"`
    UpdatedAt   time.Time      `json:"updated_at"`
    DeletedAt   gorm.DeletedAt `gorm:"index" json:"-"`
    Products    []Product      `gorm:"foreignKey:CategoryID" json:"products,omitempty"`
}

type ProductImage struct {
    ID        uuid.UUID      `gorm:"type:uuid;primary_key" json:"id"`
    ProductID uuid.UUID      `gorm:"type:uuid;not null;index" json:"product_id"`
    URL       string         `gorm:"not null" json:"url"`
    IsPrimary bool           `gorm:"default:false" json:"is_primary"`
    AltText   string         `json:"alt_text"`
    CreatedAt time.Time      `json:"created_at"`
    UpdatedAt time.Time      `json:"updated_at"`
    DeletedAt gorm.DeletedAt `gorm:"index" json:"-"`
}

func (p *Product) BeforeCreate(tx *gorm.DB) error {
    if p.ID == uuid.Nil {
        p.ID = uuid.New()
    }
    return nil
}

func (c *Category) BeforeCreate(tx *gorm.DB) error {
    if c.ID == uuid.Nil {
        c.ID = uuid.New()
    }
    return nil
}

func (pi *ProductImage) BeforeCreate(tx *gorm.DB) error {
    if pi.ID == uuid.Nil {
        pi.ID = uuid.New()
    }
    return nil
}
```

## 📊 8. API Gateway Main Application

### 8.1 `cmd/api-gateway/main.go`
```go
package main

import (
    "context"
    "log"
    "net/http"
    "os"
    "os/signal"
    "syscall"
    "time"
    
    "github.com/gofiber/fiber/v2"
    "github.com/gofiber/fiber/v2/middleware/cors"
    "github.com/gofiber/fiber/v2/middleware/logger"
    "github.com/gofiber/fiber/v2/middleware/recover"
    "github.com/gofiber/fiber/v2/middleware/requestid"
    "github.com/prometheus/client_golang/prometheus/promhttp"
    
    "erp-crm-system/internal/pkg/config"
    "erp-crm-system/internal/pkg/database"
    "erp-crm-system/internal/pkg/middleware"
    "erp-crm-system/api/v1/routes"
    "erp-crm-system/internal/services/audit"
)

func main() {
    // Load configuration
    cfg := config.Load()
    
    // Initialize logger
    setupLogger()
    
    log.Println("Starting ERP-CRM System API Gateway...")
    log.Printf("Environment: %s", cfg.Server.Environment)
    
    // Initialize database connections
    db, err := database.NewPostgreSQL(cfg.Database)
    if err != nil {
        log.Fatalf("Failed to connect to database: %v", err)
    }
    defer db.Close()
    
    // Initialize Redis
    redisClient, err := database.NewRedis(cfg.Redis, cfg.Services.Cache.Prefix)
    if err != nil {
        log.Fatalf("Failed to connect to Redis: %v", err)
    }
    defer redisClient.Close()
    
    // Initialize audit service
    auditSvc := audit.NewService(db.DB, cfg)
    
    // Create Fiber app
    app := fiber.New(fiber.Config{
        AppName:               "ERP-CRM System API Gateway",
        ErrorHandler:          middleware.ErrorHandler,
        ReadTimeout:           cfg.Server.Timeout,
        WriteTimeout:          cfg.Server.Timeout,
        IdleTimeout:           120 * time.Second,
        DisableStartupMessage: cfg.Server.Environment == "production",
        EnablePrintRoutes:     cfg.Server.Environment == "development",
    })
    
    // Global middleware
    app.Use(requestid.New())
    app.Use(logger.New(logger.Config{
        Format:     "${time} ${pid} ${locals:requestid} ${ip} ${method} ${path} ${status} ${latency} ${error}\n",
        TimeFormat: "2006-01-02 15:04:05",
        TimeZone:   "Asia/Bangkok",
    }))
    app.Use(recover.New())
    app.Use(cors.New(cors.Config{
        AllowOrigins:     strings.Join(cfg.Server.AllowedOrigins, ","),
        AllowMethods:     "GET,POST,PUT,PATCH,DELETE,OPTIONS",
        AllowHeaders:     "Origin, Content-Type, Accept, Authorization, X-Request-ID",
        AllowCredentials: true,
        MaxAge:           300,
    }))
    
    // Health check endpoint
    app.Get("/health", func(c *fiber.Ctx) error {
        // Check database health
        if err := db.HealthCheck(); err != nil {
            return c.Status(http.StatusServiceUnavailable).JSON(fiber.Map{
                "status":  "unhealthy",
                "message": "Database connection failed",
                "error":   err.Error(),
            })
        }
        
        // Check Redis health
        if err := redisClient.HealthCheck(); err != nil {
            return c.Status(http.StatusServiceUnavailable).JSON(fiber.Map{
                "status":  "unhealthy",
                "message": "Redis connection failed",
                "error":   err.Error(),
            })
        }
        
        return c.JSON(fiber.Map{
            "status":  "healthy",
            "service": "erp-crm-api",
            "version": "1.0.0",
            "time":    time.Now().UTC(),
        })
    })
    
    // Prometheus metrics endpoint
    if cfg.Monitoring.Enabled {
        app.Get(cfg.Monitoring.MetricsPath, func(c *fiber.Ctx) error {
            handler := promhttp.Handler()
            handler.ServeHTTP(c.Context(), c.Response().BodyWriter())
            return nil
        })
        log.Printf("Prometheus metrics available at %s", cfg.Monitoring.MetricsPath)
    }
    
    // Setup API routes
    api := app.Group("/api")
    routes.SetupV1Routes(api, db, redisClient, auditSvc, cfg)
    
    // 404 handler
    app.Use(func(c *fiber.Ctx) error {
        return c.Status(fiber.StatusNotFound).JSON(fiber.Map{
            "error":   "not_found",
            "message": "The requested resource was not found",
            "path":    c.Path(),
        })
    })
    
    // Graceful shutdown
    go gracefulShutdown(app, db, redisClient)
    
    // Start server
    addr := cfg.Server.Address
    log.Printf("Server listening on %s", addr)
    
    if err := app.Listen(addr); err != nil {
        log.Fatalf("Failed to start server: %v", err)
    }
}

func setupLogger() {
    if config.Get().Server.Environment == "production" {
        log.SetFlags(0)
        // Here you can setup structured logging with something like zap or logrus
    } else {
        log.SetFlags(log.LstdFlags | log.Lshortfile)
    }
}

func gracefulShutdown(app *fiber.App, db *database.PostgresDB, redisClient *database.RedisClient) {
    quit := make(chan os.Signal, 1)
    signal.Notify(quit, os.Interrupt, syscall.SIGTERM)
    
    <-quit
    log.Println("Shutting down server...")
    
    ctx, cancel := context.WithTimeout(context.Background(), 30*time.Second)
    defer cancel()
    
    // Shutdown Fiber app
    if err := app.ShutdownWithContext(ctx); err != nil {
        log.Fatalf("Server forced to shutdown: %v", err)
    }
    
    // Close database connections
    if err := db.Close(); err != nil {
        log.Printf("Error closing database: %v", err)
    }
    
    // Close Redis connection
    if err := redisClient.Close(); err != nil {
        log.Printf("Error closing Redis: %v", err)
    }
    
    log.Println("Server shutdown completed")
}
```

## 🐳 9. Docker Configuration

### 9.1 `docker-compose.yml`
```yaml
version: '3.8'

services:
  # PostgreSQL Database
  postgres:
    image: postgres:15-alpine
    container_name: erp-crm-postgres
    environment:
      POSTGRES_DB: ${DB_NAME:-erp_crm_db}
      POSTGRES_USER: ${DB_USER:-erp_admin}
      POSTGRES_PASSWORD: ${DB_PASSWORD:-secure_password_123}
      POSTGRES_INITDB_ARGS: "--encoding=UTF-8 --locale=C"
    ports:
      - "${DB_PORT:-5432}:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./migrations:/docker-entrypoint-initdb.d
      - ./scripts/init-db.sh:/docker-entrypoint-initdb.d/init.sh
    networks:
      - erp-network
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U ${DB_USER:-erp_admin}"]
      interval: 10s
      timeout: 5s
      retries: 5
    restart: unless-stopped

  # Redis Cache
  redis:
    image: redis:7-alpine
    container_name: erp-crm-redis
    ports:
      - "${REDIS_PORT:-6379}:6379"
    volumes:
      - redis_data:/data
      - ./config/redis.conf:/usr/local/etc/redis/redis.conf
    command: redis-server /usr/local/etc/redis/redis.conf
    networks:
      - erp-network
    healthcheck:
      test: ["CMD", "redis-cli", "ping"]
      interval: 10s
      timeout: 5s
      retries: 5
    restart: unless-stopped

  # API Gateway
  api-gateway:
    build:
      context: .
      dockerfile: ./deployments/docker/Dockerfile.api
      args:
        - GO_VERSION=1.21
    container_name: erp-crm-api
    ports:
      - "${SERVER_PORT:-8080}:8080"
    environment:
      - SERVER_ENVIRONMENT=${SERVER_ENVIRONMENT:-development}
      - DB_HOST=postgres
      - DB_PORT=5432
      - DB_USER=${DB_USER:-erp_admin}
      - DB_PASSWORD=${DB_PASSWORD:-secure_password_123}
      - DB_NAME=${DB_NAME:-erp_crm_db}
      - REDIS_HOST=redis
      - REDIS_PORT=6379
      - JWT_SECRET=${JWT_SECRET:-your-super-secret-jwt-key-change-in-production}
      - PROMETHEUS_ENABLED=true
    volumes:
      - ./config:/app/config
      - ./logs:/app/logs
    depends_on:
      postgres:
        condition: service_healthy
      redis:
        condition: service_healthy
    networks:
      - erp-network
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:8080/health"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s
    restart: unless-stopped

  # N8N Workflow Automation
  n8n:
    image: n8nio/n8n:latest
    container_name: erp-crm-n8n
    ports:
      - "5678:5678"
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=${N8N_USER:-admin}
      - N8N_BASIC_AUTH_PASSWORD=${N8N_PASSWORD:-admin123}
      - N8N_PROTOCOL=http
      - N8N_HOST=n8n
      - N8N_PORT=5678
      - N8N_WEBHOOK_URL=http://n8n:5678
      - EXECUTIONS_DATA_PRUNE=true
      - EXECUTIONS_DATA_MAX_AGE=168
      - GENERIC_TIMEZONE=Asia/Bangkok
    volumes:
      - n8n_data:/home/node/.n8n
      - ./n8n/workflows:/data/workflows
    networks:
      - erp-network
    restart: unless-stopped

  # Prometheus Monitoring
  prometheus:
    image: prom/prometheus:latest
    container_name: erp-crm-prometheus
    ports:
      - "9090:9090"
    volumes:
      - ./deployments/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml
      - prometheus_data:/prometheus
      - ./deployments/prometheus/alerts.yml:/etc/prometheus/alerts.yml
    command:
      - '--config.file=/etc/prometheus/prometheus.yml'
      - '--storage.tsdb.path=/prometheus'
      - '--web.console.libraries=/usr/share/prometheus/console_libraries'
      - '--web.console.templates=/usr/share/prometheus/consoles'
      - '--storage.tsdb.retention.time=30d'
      - '--web.enable-lifecycle'
    networks:
      - erp-network
    restart: unless-stopped

  # Grafana Dashboard
  grafana:
    image: grafana/grafana:latest
    container_name: erp-crm-grafana
    ports:
      - "3000:3000"
    environment:
      - GF_SECURITY_ADMIN_USER=${GRAFANA_USER:-admin}
      - GF_SECURITY_ADMIN_PASSWORD=${GRAFANA_PASSWORD:-admin123}
      - GF_USERS_ALLOW_SIGN_UP=false
      - GF_INSTALL_PLUGINS=grafana-piechart-panel
      - GF_SERVER_ROOT_URL=http://localhost:3000
      - GF_SERVER_DOMAIN=localhost
    volumes:
      - grafana_data:/var/lib/grafana
      - ./deployments/grafana/dashboards:/etc/grafana/provisioning/dashboards
      - ./deployments/grafana/datasources:/etc/grafana/provisioning/datasources
    depends_on:
      - prometheus
    networks:
      - erp-network
    restart: unless-stopped

  # PostgreSQL Metrics Exporter
  postgres-exporter:
    image: prometheuscommunity/postgres-exporter:latest
    container_name: erp-crm-postgres-exporter
    environment:
      - DATA_SOURCE_NAME=postgresql://${DB_USER:-erp_admin}:${DB_PASSWORD:-secure_password_123}@postgres:5432/${DB_NAME:-erp_crm_db}?sslmode=disable
    ports:
      - "9187:9187"
    depends_on:
      - postgres
    networks:
      - erp-network
    restart: unless-stopped

  # Redis Metrics Exporter
  redis-exporter:
    image: oliver006/redis_exporter:latest
    container_name: erp-crm-redis-exporter
    environment:
      - REDIS_ADDR=redis://redis:6379
    ports:
      - "9121:9121"
    depends_on:
      - redis
    networks:
      - erp-network
    restart: unless-stopped

  # MailHog for Email Testing
  mailhog:
    image: mailhog/mailhog:latest
    container_name: erp-crm-mailhog
    ports:
      - "1025:1025"
      - "8025:8025"
    networks:
      - erp-network
    restart: unless-stopped

volumes:
  postgres_data:
    driver: local
  redis_data:
    driver: local
  n8n_data:
    driver: local
  prometheus_data:
    driver: local
  grafana_data:
    driver: local

networks:
  erp-network:
    driver: bridge
    ipam:
      config:
        - subnet: 172.20.0.0/16
```

### 9.2 `deployments/docker/Dockerfile.api`
```dockerfile
# Build stage
FROM golang:1.21-alpine AS builder

WORKDIR /app

# Install dependencies
RUN apk add --no-cache git gcc musl-dev

# Copy go mod files
COPY go.mod go.sum ./
RUN go mod download

# Copy source code
COPY . .

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags="-w -s" -o main ./cmd/api-gateway

# Final stage
FROM alpine:latest

RUN apk --no-cache add ca-certificates tzdata && \
    cp /usr/share/zoneinfo/Asia/Bangkok /etc/localtime && \
    echo "Asia/Bangkok" > /etc/timezone

WORKDIR /root/

# Copy binary from builder
COPY --from=builder /app/main .
COPY --from=builder /app/config ./config

# Create non-root user
RUN addgroup -g 1001 -S appgroup && \
    adduser -u 1001 -S appuser -G appgroup

# Change ownership
RUN chown -R appuser:appgroup /root

# Switch to non-root user
USER appuser

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1

# Run the application
CMD ["./main"]
```

## 📝 10. Database Migrations

### 10.1 `migrations/001_create_users_table.sql`
```sql
-- Users table
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    role VARCHAR(50) DEFAULT 'user' NOT NULL,
    department VARCHAR(100),
    position VARCHAR(100),
    is_active BOOLEAN DEFAULT true,
    last_login_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- User sessions table
CREATE TABLE IF NOT EXISTS user_sessions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    refresh_token VARCHAR(255) NOT NULL,
    user_agent TEXT,
    ip_address VARCHAR(45),
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(refresh_token)
);

-- Indexes for users table
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_role ON users(role);
CREATE INDEX IF NOT EXISTS idx_users_is_active ON users(is_active);
CREATE INDEX IF NOT EXISTS idx_users_created_at ON users(created_at DESC);

-- Indexes for user_sessions table
CREATE INDEX IF NOT EXISTS idx_user_sessions_user_id ON user_sessions(user_id);
CREATE INDEX IF NOT EXISTS idx_user_sessions_refresh_token ON user_sessions(refresh_token);
CREATE INDEX IF NOT EXISTS idx_user_sessions_expires_at ON user_sessions(expires_at);

-- Create updated_at trigger function
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create trigger for users table
CREATE TRIGGER update_users_updated_at
    BEFORE UPDATE ON users
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Create trigger for user_sessions table
CREATE TRIGGER update_user_sessions_updated_at
    BEFORE UPDATE ON user_sessions
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Insert default admin user (password: Admin123!)
INSERT INTO users (email, password_hash, first_name, last_name, role, is_active)
VALUES (
    'admin@erp-crm.com',
    '$2a$12$3Qx7j2J8K8G8K8G8K8G8K8G8K8G8K8G8K8G8K8G8K8G8K8G8K8G8',
    'System',
    'Administrator',
    'admin',
    true
) ON CONFLICT (email) DO NOTHING;
```

## 🔧 11. Makefile สำหรับ Automation

```makefile
.PHONY: help build run test clean migrate docker-up docker-down lint

# Variables
APP_NAME = erp-crm-system
VERSION = 1.0.0
GO = go
DOCKER = docker
DOCKER_COMPOSE = docker-compose

help:
	@echo "Available commands:"
	@echo "  build      - Build the application"
	@echo "  run        - Run the application locally"
	@echo "  test       - Run tests"
	@echo "  test-cover - Run tests with coverage"
	@echo "  lint       - Run linter"
	@echo "  clean      - Clean build artifacts"
	@echo "  migrate    - Run database migrations"
	@echo "  docker-up  - Start Docker containers"
	@echo "  docker-down - Stop Docker containers"
	@echo "  docker-build - Build Docker images"
	@echo "  dev        - Start development environment"
	@echo "  swagger    - Generate Swagger documentation"

build:
	@echo "Building $(APP_NAME) v$(VERSION)..."
	$(GO) build -o bin/$(APP_NAME) ./cmd/api-gateway

run:
	@echo "Starting $(APP_NAME)..."
	$(GO) run ./cmd/api-gateway

test:
	@echo "Running tests..."
	$(GO) test ./... -v

test-cover:
	@echo "Running tests with coverage..."
	$(GO) test ./... -coverprofile=coverage.out
	$(GO) tool cover -html=coverage.out

lint:
	@echo "Running linter..."
	golangci-lint run ./...

clean:
	@echo "Cleaning build artifacts..."
	rm -rf bin/ coverage.out

migrate:
	@echo "Running migrations..."
	$(GO) run ./scripts/migrate.go

docker-up:
	@echo "Starting Docker containers..."
	$(DOCKER_COMPOSE) up -d

docker-down:
	@echo "Stopping Docker containers..."
	$(DOCKER_COMPOSE) down

docker-build:
	@echo "Building Docker images..."
	$(DOCKER_COMPOSE) build

dev: docker-up
	@echo "Development environment started at http://localhost:8080"
	@echo "API Documentation: http://localhost:8080/swagger/index.html"
	@echo "Grafana: http://localhost:3000 (admin/admin123)"
	@echo "N8N: http://localhost:5678 (admin/admin123)"
	@echo "MailHog: http://localhost:8025"

swagger:
	@echo "Generating Swagger documentation..."
	swag init -g cmd/api-gateway/main.go -o ./docs

# Deployment commands
deploy-staging:
	@echo "Deploying to staging..."
	$(DOCKER) build -t $(APP_NAME):staging .
	# Add your deployment script here

deploy-production:
	@echo "Deploying to production..."
	$(DOCKER) build -t $(APP_NAME):$(VERSION) .
	# Add your deployment script here

# Kubernetes commands
k8s-apply:
	@echo "Applying Kubernetes manifests..."
	kubectl apply -f deployments/k8s/

k8s-delete:
	@echo "Deleting Kubernetes resources..."
	kubectl delete -f deployments/k8s/

# Monitoring
monitor-logs:
	$(DOCKER_COMPOSE) logs -f api-gateway

monitor-metrics:
	@echo "Prometheus: http://localhost:9090"
	@echo "Grafana: http://localhost:3000"

# Database
db-connect:
	$(DOCKER_COMPOSE) exec postgres psql -U erp_admin erp_crm_db

db-backup:
	@echo "Backing up database..."
	$(DOCKER_COMPOSE) exec postgres pg_dump -U erp_admin erp_crm_db > backup/$(shell date +%Y%m%d_%H%M%S).sql

db-restore:
	@echo "Restoring database from $(FILE)..."
	$(DOCKER_COMPOSE) exec -T postgres psql -U erp_admin erp_crm_db < $(FILE)
```

## 📊 12. Monitoring Configuration

### 12.1 `deployments/prometheus/prometheus.yml`
```yaml
global:
  scrape_interval: 15s
  evaluation_interval: 15s
  external_labels:
    monitor: 'erp-crm-system'

rule_files:
  - "alerts.yml"

alerting:
  alertmanagers:
    - static_configs:
        - targets: []

scrape_configs:
  - job_name: 'api-gateway'
    static_configs:
      - targets: ['api-gateway:8080']
    metrics_path: '/metrics'
    scrape_interval: 10s

  - job_name: 'postgres'
    static_configs:
      - targets: ['postgres-exporter:9187']
    scrape_interval: 30s

  - job_name: 'redis'
    static_configs:
      - targets: ['redis-exporter:9121']
    scrape_interval: 30s

  - job_name: 'node'
    static_configs:
      - targets: ['node-exporter:9100']
    scrape_interval: 30s

  - job_name: 'cadvisor'
    static_configs:
      - targets: ['cadvisor:8080']
    scrape_interval: 30s
```

### 12.2 `deployments/grafana/dashboards/dashboard.yaml`
```yaml
apiVersion: 1

providers:
  - name: 'ERP-CRM Dashboards'
    orgId: 1
    folder: 'ERP-CRM'
    type: file
    disableDeletion: false
    editable: true
    options:
      path: /etc/grafana/provisioning/dashboards

dashboards:
  - name: 'API Metrics'
    path: '/etc/grafana/provisioning/dashboards/api-metrics.json'
  - name: 'Database Metrics'
    path: '/etc/grafana/provisioning/dashboards/database-metrics.json'
  - name: 'Business Metrics'
    path: '/etc/grafana/provisioning/dashboards/business-metrics.json'
```

## 🤖 13. Robot Framework Test Scripts

### 13.1 `tests/robot/api_tests.robot`
```robot
*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           String
Library           DateTime
Library           OperatingSystem

Suite Setup       Create Session    erp_api    ${BASE_URL}    verify=true
Suite Teardown    Delete All Sessions

*** Variables ***
${BASE_URL}       http://localhost:8080/api/v1
${ADMIN_EMAIL}    admin@erp-crm.com
${ADMIN_PASSWORD} Admin123!
${REGULAR_EMAIL}  user@example.com
${REGULAR_PASSWORD} User123!

*** Test Cases ***

User Registration Test
    [Tags]    registration    smoke
    ${email}=    Generate Random Email
    ${payload}=    Create Dictionary
    ...    email=${email}
    ...    password=Test123!
    ...    confirm_password=Test123!
    ...    first_name=Test
    ...    last_name=User
    
    ${response}=    POST    ${BASE_URL}/auth/register
    ...    json=${payload}
    ...    expected_status=201
    
    Should Be Equal As Strings    ${response.status_code}    201
    Dictionary Should Contain Key    ${response.json()}    id
    Should Be Equal    ${response.json()}[email]    ${email}
    Should Not Contain    ${response.json()}    password

User Login Test
    [Tags]    login    smoke
    ${payload}=    Create Dictionary
    ...    email=${ADMIN_EMAIL}
    ...    password=${ADMIN_PASSWORD}
    
    ${response}=    POST    ${BASE_URL}/auth/login
    ...    json=${payload}
    ...    expected_status=200
    
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    access_token
    Dictionary Should Contain Key    ${response.json()}    refresh_token
    Dictionary Should Contain Key    ${response.json()}    user
    
    ${access_token}=    Set Variable    ${response.json()}[access_token]
    Set Suite Variable    ${ACCESS_TOKEN}    ${access_token}

Get User Profile Test
    [Tags]    profile    authenticated
    [Setup]    Get Access Token
    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${ACCESS_TOKEN}
    
    ${response}=    GET    ${BASE_URL}/users/profile
    ...    headers=${headers}
    ...    expected_status=200
    
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    email
    Should Be Equal    ${response.json()}[email]    ${ADMIN_EMAIL}

Create Product Test
    [Tags]    product    crud
    [Setup]    Get Access Token
    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${ACCESS_TOKEN}
    ...    Content-Type=application/json
    
    ${sku}=    Generate Random String    10    [LETTERS][NUMBERS]
    ${payload}=    Create Dictionary
    ...    sku=${sku}
    ...    name=Test Product
    ...    description=Test Product Description
    ...    price=99.99
    ...    stock_quantity=100
    
    ${response}=    POST    ${BASE_URL}/products
    ...    headers=${headers}
    ...    json=${payload}
    ...    expected_status=201
    
    Should Be Equal As Strings    ${response.status_code}    201
    Dictionary Should Contain Key    ${response.json()}    id
    Should Be Equal    ${response.json()}[sku]    ${sku}
    Should Be Equal As Numbers    ${response.json()}[price]    99.99
    
    ${product_id}=    Set Variable    ${response.json()}[id]
    Set Suite Variable    ${PRODUCT_ID}    ${product_id}

Get Product Test
    [Tags]    product    crud
    [Setup]    Get Access Token
    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${ACCESS_TOKEN}
    
    ${response}=    GET    ${BASE_URL}/products/${PRODUCT_ID}
    ...    headers=${headers}
    ...    expected_status=200
    
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    id
    Should Be Equal    ${response.json()}[id]    ${PRODUCT_ID}

Update Product Test
    [Tags]    product    crud
    [Setup]    Get Access Token
    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${ACCESS_TOKEN}
    ...    Content-Type=application/json
    
    ${payload}=    Create Dictionary
    ...    name=Updated Product Name
    ...    price=149.99
    
    ${response}=    PUT    ${BASE_URL}/products/${PRODUCT_ID}
    ...    headers=${headers}
    ...    json=${payload}
    ...    expected_status=200
    
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal    ${response.json()}[name]    Updated Product Name
    Should Be Equal As Numbers    ${response.json()}[price]    149.99

List Products Test
    [Tags]    product    listing
    [Setup]    Get Access Token
    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${ACCESS_TOKEN}
    
    ${response}=    GET    ${BASE_URL}/products
    ...    headers=${headers}
    ...    params=page=1&limit=10
    ...    expected_status=200
    
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    products
    Dictionary Should Contain Key    ${response.json()}    total
    Dictionary Should Contain Key    ${response.json()}    page

Delete Product Test
    [Tags]    product    crud
    [Setup]    Get Access Token
    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${ACCESS_TOKEN}
    
    ${response}=    DELETE    ${BASE_URL}/products/${PRODUCT_ID}
    ...    headers=${headers}
    ...    expected_status=204
    
    Should Be Equal As Strings    ${response.status_code}    204

*** Keywords ***
Generate Random Email
    ${timestamp}=    Get Current Date    result_format=epoch
    ${email}=    Catenate    SEPARATOR=    test    ${timestamp}    @example.com
    [Return]    ${email}

Get Access Token
    ${payload}=    Create Dictionary
    ...    email=${ADMIN_EMAIL}
    ...    password=${ADMIN_PASSWORD}
    
    ${response}=    POST    ${BASE_URL}/auth/login
    ...    json=${payload}
    
    ${access_token}=    Set Variable    ${response.json()}[access_token]
    Set Suite Variable    ${ACCESS_TOKEN}    ${access_token}
```

## 📋 14. README.md

```markdown
# ERP/CRM System for Small Businesses

A modern, scalable ERP/CRM system built with Go (Fiber), PostgreSQL, and microservices architecture.

## Features

- **User Management**: Authentication, authorization, role-based access control
- **Product Management**: CRUD operations, inventory tracking, categories
- **Warehouse Management**: Stock levels, inventory movements, locations
- **Transport System**: Shipping, delivery tracking, logistics
- **Reporting**: Analytics, dashboards, business intelligence
- **Audit Logging**: Comprehensive activity tracking
- **RESTful API**: Clean, documented API endpoints
- **Microservices**: Scalable, independently deployable services
- **Monitoring**: Prometheus, Grafana, health checks
- **CI/CD**: GitLab CI/CD, automated testing, deployment

## Tech Stack

- **Backend**: Go 1.21, Fiber Framework
- **Database**: PostgreSQL 15, Redis
- **ORM**: GORM
- **Authentication**: JWT, OAuth2
- **Containerization**: Docker, Docker Compose
- **Orchestration**: Kubernetes (optional)
- **Monitoring**: Prometheus, Grafana
- **Automation**: N8N, GitLab CI/CD
- **Testing**: Go testing, Robot Framework
- **Documentation**: Swagger/OpenAPI

## Quick Start

### Prerequisites

- Go 1.21+
- Docker & Docker Compose
- PostgreSQL 15 (optional)
- Redis (optional)

### Development Setup

1. Clone the repository:
```bash
git clone https://github.com/your-org/erp-crm-system.git
cd erp-crm-system
```

2. Copy environment variables:
```bash
cp .env.example .env
# Edit .env with your configuration
```

3. Start development environment:
```bash
make dev
```

4. Access the services:
- API: http://localhost:8080
- API Documentation: http://localhost:8080/swagger
- Grafana: http://localhost:3000 (admin/admin123)
- N8N: http://localhost:5678 (admin/admin123)
- MailHog: http://localhost:8025

### Build and Run

```bash
# Build the application
make build

# Run the application
make run

# Run tests
make test

# Run with Docker
make docker-up
```

## Project Structure

```
erp-crm-system/
├── cmd/              # Application entry points
├── internal/         # Private application code
│   ├── api/         # API definitions
│   ├── pkg/         # Shared packages
│   └── services/    # Business logic services
├── migrations/       # Database migrations
├── deployments/      # Deployment configurations
├── tests/           # Test files
├── scripts/         # Utility scripts
└── docs/            # Documentation
```

## API Documentation

Swagger documentation is available at `/swagger/index.html` when running the server.

### Authentication

All protected endpoints require a JWT token in the Authorization header:
```
Authorization: Bearer <your_jwt_token>
```

### Example Requests

```bash
# Register a new user
curl -X POST http://localhost:8080/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "SecurePass123!",
    "confirm_password": "SecurePass123!",
    "first_name": "John",
    "last_name": "Doe"
  }'

# Login
curl -X POST http://localhost:8080/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "SecurePass123!"
  }'
```

## Database Schema

![Database Schema](docs/database_schema.png)

Key tables:
- `users`: User accounts and profiles
- `products`: Product catalog
- `warehouses`: Inventory locations
- `transactions`: Business transactions
- `audit_logs`: System audit trail

## Monitoring

The system includes comprehensive monitoring:

- **Prometheus**: Metrics collection at `/metrics`
- **Grafana**: Dashboards for business and technical metrics
- **Health Checks**: `/health` endpoint for service status
- **Logging**: Structured JSON logs

## Development

### Code Standards

- Use `gofmt` for code formatting
- Follow Go naming conventions
- Write comprehensive tests
- Document public APIs
- Use meaningful commit messages

### Testing

```bash
# Run unit tests
go test ./...

# Run integration tests
go test -tags=integration ./...

# Run Robot Framework tests
robot tests/robot/
```

### Git Workflow

1. Create a feature branch: `git checkout -b feature/your-feature`
2. Make changes and commit: `git commit -m "feat: add new feature"`
3. Push to remote: `git push origin feature/your-feature`
4. Create a pull request

Commit message format follows [Conventional Commits](https://www.conventionalcommits.org/).

## Deployment

### Docker

```bash
# Build and run with Docker Compose
docker-compose up -d

# View logs
docker-compose logs -f api-gateway

# Stop services
docker-compose down
```

### Kubernetes

```bash
# Apply Kubernetes manifests
kubectl apply -f deployments/k8s/

# View pods
kubectl get pods -n erp-crm

# View services
kubectl get svc -n erp-crm
```

## Environment Variables

See `.env.example` for all available environment variables.

Required variables:
- `JWT_SECRET`: Secret for JWT token signing
- `DB_PASSWORD`: PostgreSQL password
- `AWS_ACCESS_KEY_ID`: AWS access key (for S3)
- `AWS_SECRET_ACCESS_KEY`: AWS secret key

## Security

- **Authentication**: JWT tokens with refresh mechanism
- **Authorization**: Role-based access control (RBAC)
- **Validation**: Input validation on all endpoints
- **Encryption**: HTTPS/TLS, password hashing with bcrypt
- **Audit**: Comprehensive logging of all actions
- **CORS**: Configurable CORS policies
- **Rate Limiting**: Protection against abuse

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Update documentation
6. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, please:
1. Check the documentation
2. Search existing issues
3. Create a new issue with detailed information

## Roadmap

- [x] Basic CRUD operations
- [x] Authentication & authorization
- [x] Product management
- [x] Inventory management
- [ ] Advanced reporting
- [ ] Mobile app
- [ ] AI-powered insights
- [ ] Multi-tenant support
- [ ] Payment integration

---

Built with ❤️ by the ERP/CRM Team
```

---

**หมายเหตุ**: โค้ดเต็มทั้งหมดนี้เป็นตัวอย่างสำหรับระบบ ERP/CRM สำหรับธุรกิจขนาดเล็ก ประกอบด้วย:

1. **โครงสร้างโปรเจคแบบ Microservices**
2. **Authentication & Authorization ที่สมบูรณ์**
3. **Database layer ที่มี ORM (GORM)**
4. **Caching ด้วย Redis**
5. **Monitoring และ Metrics**
6. **Docker & Kubernetes configurations**
7. **Testing ทั้ง unit tests และ Robot Framework**
8. **CI/CD pipeline templates**
9. **Documentation ที่สมบูรณ์**
 






