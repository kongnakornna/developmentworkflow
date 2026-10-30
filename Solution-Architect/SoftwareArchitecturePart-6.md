# 📘 เล่มที่ 6: DevOps & Cloud

---

# บทที่ 1: CI/CD Pipeline

## 1. บทนำ

CI/CD คือหัวใจของ DevOps สมัยใหม่ บริษัทที่ Deploy ได้วันละหลายร้อยครั้ง (Amazon, Netflix, Google) ต้องมี Pipeline ที่แข็งแรง ในขณะที่ทีมที่ยัง Deploy เดือนละครั้งมักประสบปัญหา Release Day ที่เต็มไปด้วยความเสี่ยง

CI/CD ไม่ใช่แค่เครื่องมือ (Jenkins, GitLab CI, GitHub Actions) แต่เป็น **วัฒนธรรม** ที่ต้องอาศัย Discipline, Automation, และ Observability บทนี้จะพาคุณเข้าใจ CI/CD ตั้งแต่หลักการ ไปจนถึงการ Implement ใน Production

## 2. บทนิยาม

**Continuous Integration (CI)** หมายถึง การที่ Developers รวมโค้ดเข้า Main Branch บ่อยๆ (อย่างน้อยวันละครั้ง) โดยมี Automated Tests และ Build ตรวจสอบทุกครั้ง

**Continuous Delivery (CD)** หมายถึง การที่โค้ดทุก Commit พร้อม Deploy สู่ Production ได้ตลอดเวลา (แต่ยังต้อง Approve Manual)

**Continuous Deployment (CD)** หมายถึง การ Deploy อัตโนมัติทุก Commit ที่ผ่าน Tests สู่ Production โดยไม่มี Manual Approval

**คำนิยามของ Martin Fowler:**
> "Continuous Integration is a software development practice where members of a team integrate their work frequently, usually each person integrates at least daily — leading to multiple integrations per day."

**ความแตกต่าง:**

| มิติ | CI | Continuous Delivery | Continuous Deployment |
|------|-----|---------------------|----------------------|
| **Deploy** | ไม่ Deploy | Manual Approval | อัตโนมัติ |
| **ความถี่** | ทุก Commit | ทุก Commit | ทุก Commit |
| **ความเสี่ยง** | ต่ำ | กลาง | สูง |
| **ทีม** | ทุกทีม | ทีม Mature | Elite Teams |

## 3. บทหัวข้อ

### 3.1 CI/CD คืออะไร

**CI/CD Pipeline Stages:**

```
┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐
│  Code   │─▶│  Build  │─▶│  Test   │─▶│ Deploy  │─▶│ Monitor │
│ Commit  │  │         │  │         │  │  Stage  │  │         │
└─────────┘  └─────────┘  └─────────┘  └─────────┘  └─────────┘
     │            │            │            │            │
   Git Push    Compile      Unit Test    Staging      Metrics
               Docker       Integration  Production   Alerts
               Bundle       E2E          Canary       Logs
```

**Pipeline Best Practices:**

| Practice | คำอธิบาย |
|----------|----------|
| **Fast Feedback** | Pipeline ควรเสร็จ < 10 นาที |
| **Fail Fast** | Test ที่เร็วรันก่อน |
| **Idempotent** | รันซ้ำได้ผลเดิม |
| **Immutable Artifacts** | Build ครั้งเดียว ใช้ทุก Environment |
| **Trunk-Based** | Merge เข้า Main บ่อยๆ |
| **Feature Flags** | Deploy โดยไม่เปิด Feature |

**Branching Strategies:**

| Strategy | ลักษณะ | ใช้เมื่อ |
|----------|--------|----------|
| **Trunk-Based** | Merge เข้า Main ทุกวัน | Elite Teams |
| **GitHub Flow** | Feature Branch + PR | ทั่วไป |
| **GitFlow** | Develop, Release, Hotfix | Release Cycles ยาว |
| **Release Branch** | Branch ต่อ Release | Mobile, Enterprise |

### 3.2 ทำงานอย่างไร

**GitHub Actions Example:**

```yaml
# .github/workflows/ci.yml
name: CI/CD Pipeline

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

env:
  REGISTRY: ghcr.io
  IMAGE_NAME: ${{ github.repository }}

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.12'
      - run: pip install ruff
      - run: ruff check .

  test:
    runs-on: ubuntu-latest
    needs: lint
    services:
      postgres:
        image: postgres:16
        env:
          POSTGRES_PASSWORD: test
        ports:
          - 5432:5432
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.12'
      - run: pip install -r requirements.txt
      - run: pytest --cov=src --cov-report=xml
      - uses: codecov/codecov-action@v4

  build:
    runs-on: ubuntu-latest
    needs: test
    permissions:
      contents: read
      packages: write
    steps:
      - uses: actions/checkout@v4
      - uses: docker/setup-buildx-action@v3
      - uses: docker/login-action@v3
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}
      - uses: docker/build-push-action@v5
        with:
          push: true
          tags: |
            ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:${{ github.sha }}
            ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:latest
          cache-from: type=gha
          cache-to: type=gha,mode=max

  deploy-staging:
    runs-on: ubuntu-latest
    needs: build
    environment: staging
    steps:
      - uses: actions/checkout@v4
      - run: |
          kubectl set image deployment/app \
            app=${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:${{ github.sha }} \
            --namespace=staging
      - run: kubectl rollout status deployment/app -n staging

  smoke-test:
    runs-on: ubuntu-latest
    needs: deploy-staging
    steps:
      - run: |
          curl -f https://staging.example.com/health || exit 1
          curl -f https://staging.example.com/api/v1/status || exit 1

  deploy-production:
    runs-on: ubuntu-latest
    needs: smoke-test
    environment: production
    steps:
      - run: |
          kubectl set image deployment/app \
            app=${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:${{ github.sha }} \
            --namespace=production
      - run: kubectl rollout status deployment/app -n production
```

**GitLab CI Example:**

```yaml
# .gitlab-ci.yml
stages:
  - build
  - test
  - security
  - deploy

variables:
  DOCKER_DRIVER: overlay2
  IMAGE_TAG: $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA

build:
  stage: build
  image: docker:24
  services:
    - docker:24-dind
  script:
    - docker build -t $IMAGE_TAG .
    - docker push $IMAGE_TAG
  only:
    - main
    - merge_requests

test:unit:
  stage: test
  image: python:3.12
  script:
    - pip install -r requirements.txt
    - pytest tests/unit --cov=src
  coverage: '/TOTAL.*\s+(\d+%)$/'
  artifacts:
    reports:
      coverage_report:
        coverage_format: cobertura
        path: coverage.xml

test:integration:
  stage: test
  image: python:3.12
  services:
    - postgres:16
  variables:
    POSTGRES_DB: test
    POSTGRES_PASSWORD: test
  script:
    - pytest tests/integration

security:sast:
  stage: security
  image: returntocorp/semgrep
  script:
    - semgrep --config=auto --sarif -o semgrep.sarif
  artifacts:
    reports:
      sast: semgrep.sarif

security:container:
  stage: security
  image: aquasec/trivy
  script:
    - trivy image --exit-code 1 --severity HIGH,CRITICAL $IMAGE_TAG

deploy:staging:
  stage: deploy
  image: bitnami/kubectl
  script:
    - kubectl set image deployment/app app=$IMAGE_TAG -n staging
  environment:
    name: staging
    url: https://staging.example.com
  only:
    - main

deploy:production:
  stage: deploy
  image: bitnami/kubectl
  script:
    - kubectl set image deployment/app app=$IMAGE_TAG -n production
  environment:
    name: production
    url: https://example.com
  when: manual
  only:
    - main
```

**Deployment Strategies:**

| Strategy | ลักษณะ | ข้อดี | ข้อเสีย |
|----------|--------|-------|---------|
| **Recreate** | หยุดเก่า เริ่มใหม่ | ง่าย | Downtime |
| **Rolling** | ค่อยๆ เปลี่ยน | ไม่มี Downtime | ช้า |
| **Blue-Green** | สอง Environment | Rollback เร็ว | ทรัพยากร 2x |
| **Canary** | ปล่อยบางส่วน | ความเสี่ยงต่ำ | ซับซ้อน |
| **A/B Testing** | แบ่งตาม User | วัดผลได้ | ซับซ้อน |

**Canary Deployment:**

```yaml
apiVersion: flagger.app/v1beta1
kind: Canary
metadata:
  name: app
  namespace: production
spec:
  targetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: app
  progressDeadlineSeconds: 60
  service:
    port: 80
    targetPort: 8080
  analysis:
    interval: 1m
    threshold: 5
    maxWeight: 50
    stepWeight: 10
    metrics:
      - name: request-success-rate
        thresholdRange:
          min: 99
        interval: 1m
      - name: request-duration
        thresholdRange:
          max: 500
        interval: 1m
```

### 3.3 การใช้งาน

**CI/CD ใช้เมื่อ:**

1. **ทีมมากกว่า 2 คน** — ลด Conflict
2. **Deploy บ่อย** — หลายครั้งต่อสัปดาห์
3. **ระบบ Production** — ต้องเสถียร
4. **มี Automated Tests** — ตรวจสอบได้
5. **ต้องการ Quality Gate** — Security, Performance

### 3.4 ข้อดี

- ✅ **Fast Feedback** — รู้ปัญหาเร็ว
- ✅ **Reduce Risk** — Deploy ทีละน้อย
- ✅ **Automation** — ลดงาน Manual
- ✅ **Reproducible** — ผลเหมือนกันทุกครั้ง
- ✅ **Audit Trail** — ตรวจสอบได้
- ✅ **Team Velocity** — ส่งงานเร็วขึ้น

### 3.5 ข้อเสีย

- ❌ **Initial Setup** — ใช้เวลาตั้ง
- ❌ **Maintenance** — ต้องดูแล
- ❌ **Cost** — Compute, Storage
- ❌ **Learning Curve** — ต้องเรียนรู้
- ❌ **Complexity** — Pipeline ซับซ้อน

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- ระวัง Secrets ใน Pipeline
- ระวัง Flaky Tests
- ระวัง Pipeline นานเกิน
- ระวัง Cache Poisoning

**ข้อห้าม:**
- ❌ ห้าม Deploy โดยไม่ Test
- ❌ ห้าม Hardcode Secrets
- ❌ ห้าม Skip Tests ใน Main
- ❌ ห้าม Deploy วันศุกร์ (ถ้าไม่พร้อม)
- ❌ ห้าม Manual Config บน Production

**ข้อจำกัด:**
- ต้องการ Automated Tests
- ต้องการ Infrastructure รองรับ
- ต้องการ Team Discipline
- ต้องการ Monitoring

### 3.7 สรุป

CI/CD เป็นรากฐานของ DevOps สมัยใหม่ ต้องลงทุนแต่ให้ผลตอบแทนสูง

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

```
┌─────────────────────────────────────────────┐
│            Source Control                   │
│              (Git)                          │
└──────────────────┬──────────────────────────┘
                   │
┌──────────────────▼──────────────────────────┐
│              CI Server                      │
│   (GitHub Actions, GitLab CI, Jenkins)      │
└──────────────────┬──────────────────────────┘
                   │
        ┌──────────┼──────────┐
        ▼          ▼          ▼
   ┌─────────┐ ┌─────────┐ ┌─────────┐
   │  Build  │ │  Test   │ │Security │
   └────┬────┘ └────┬────┘ └────┬────┘
        │           │           │
        └───────────┼───────────┘
                    ▼
            ┌─────────────┐
            │  Artifact   │
            │  Registry   │
            └──────┬──────┘
                   │
        ┌──────────┼──────────┐
        ▼          ▼          ▼
   ┌─────────┐ ┌─────────┐ ┌─────────┐
   │ Staging │ │  Prod   │ │  DR     │
   └─────────┘ └─────────┘ └─────────┘
```

### 4.2 โครงสร้างทำงานอย่างไร

**Pipeline Flow:**

```
1. Developer Push Code → Git
2. CI Server ตรวจ Webhook
3. Checkout Code
4. Install Dependencies
5. Lint + Type Check
6. Unit Tests
7. Build Artifact (Docker Image)
8. Integration Tests
9. Security Scan
10. Push to Registry
11. Deploy to Staging
12. Smoke Tests
13. Deploy to Production
14. Monitor
```

### 4.3 โครงสร้างการใช้งาน

| Stage | Tools | Output |
|-------|-------|--------|
| Source | Git, GitHub | Code |
| Build | Docker, Maven | Artifact |
| Test | pytest, Jest | Report |
| Security | Trivy, Snyk | SARIF |
| Deploy | ArgoCD, Flux | Running App |
| Monitor | Prometheus | Metrics |

### 4.4 สรุป

โครงสร้าง CI/CD ที่ดีต้องมี Stages ชัดเจน, Fast Feedback, และ Observability

---

## 5. แนวทางการประยุกต์ใช้

**Framework:**

```
1. เริ่มจาก CI
   - Automated Tests
   - Lint, Type Check
   - Build Artifact

2. เพิ่ม CD
   - Auto Deploy to Staging
   - Manual Approval for Prod

3. เพิ่ม Security
   - SAST, DAST
   - Dependency Scan
   - Container Scan

4. เพิ่ม Observability
   - Metrics, Logs, Traces
   - Alerts

5. Optimize
   - Cache
   - Parallel Jobs
   - Incremental Build
```

**DORA Metrics:**

| Metric | Elite | High | Medium | Low |
|--------|-------|------|--------|-----|
| **Deploy Frequency** | On-demand | Daily-Weekly | Weekly-Monthly | Monthly+ |
| **Lead Time** | < 1 hour | 1 day - 1 week | 1 week - 1 month | 1-6 months |
| **MTTR** | < 1 hour | < 1 day | < 1 week | 1 week+ |
| **Change Failure Rate** | 0-15% | 16-30% | 16-30% | 16-30% |

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา: E-Commerce Platform**

**Requirements:**
- Deploy 10+ ครั้ง/วัน
- Zero Downtime
- Rollback < 5 นาที
- Security Scan ทุก Commit

**Pipeline:**

```yaml
name: Production Pipeline

on:
  push:
    branches: [main]

jobs:
  ci:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup
        run: make setup
      - name: Lint
        run: make lint
      - name: Test
        run: make test
      - name: Build
        run: make build
      - name: Scan
        run: make scan

  deploy-staging:
    needs: ci
    runs-on: ubuntu-latest
    steps:
      - name: Deploy
        run: make deploy-staging
      - name: Smoke Test
        run: make smoke-test ENV=staging
      - name: E2E Test
        run: make e2e ENV=staging

  deploy-production:
    needs: deploy-staging
    runs-on: ubuntu-latest
    environment:
      name: production
      url: https://example.com
    steps:
      - name: Canary 10%
        run: make canary WEIGHT=10
      - name: Monitor 10m
        run: make monitor DURATION=10m
      - name: Canary 50%
        run: make canary WEIGHT=50
      - name: Monitor 10m
        run: make monitor DURATION=10m
      - name: Full Rollout
        run: make rollout
      - name: Notify
        run: make notify SLACK_CHANNEL=deployments
```

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| Pipeline ช้า | Tests เยอะ | Parallel, Cache |
| Flaky Tests | Race Condition | Retry, Fix Root Cause |
| Secret Leak | Hardcode | Vault, Secrets Manager |
| Deploy Fail | Manual Config | IaC, GitOps |
| Rollback ยาก | ไม่มี Version | Immutable Artifacts |
| Cost สูง | Self-Hosted Runner | Spot, Auto-scale |

---

# บทที่ 2: Cloud Platform AWS

## 1. บทนำ

AWS (Amazon Web Services) เป็น Cloud Platform ที่ใหญ่ที่สุดในโลก ด้วย Market Share ~32% และมี Services มากกว่า 200 บริการ การเข้าใจ AWS จึงเป็นทักษะจำเป็นสำหรับวิศวกรซอฟต์แวร์สมัยใหม่

บทนี้จะพาคุณเข้าใจ AWS ตั้งแต่ Core Services (Compute, Storage, Database) ไปจนถึง Advanced Services (ML, Analytics) พร้อม Best Practices

## 2. บทนิยาม

**AWS** หมายถึง Cloud Computing Platform ของ Amazon ที่ให้บริการ Infrastructure, Platform, และ Software แบบ Pay-as-you-go

**Cloud Service Models:**

| Model | ความหมาย | ตัวอย่าง |
|-------|----------|----------|
| **IaaS** | Infrastructure | EC2, VPC, EBS |
| **PaaS** | Platform | Elastic Beanstalk, RDS |
| **SaaS** | Software | WorkMail, Chime |
| **FaaS** | Function | Lambda |
| **CaaS** | Container | ECS, EKS |

## 3. บทหัวข้อ

### 3.1 AWS คืออะไร

**Core Services:**

| หมวด | Services | ใช้เมื่อ |
|------|----------|----------|
| **Compute** | EC2, Lambda, ECS, EKS | รัน Application |
| **Storage** | S3, EBS, EFS, Glacier | เก็บข้อมูล |
| **Database** | RDS, DynamoDB, ElastiCache | เก็บข้อมูล |
| **Network** | VPC, Route 53, CloudFront | เชื่อมต่อ |
| **Security** | IAM, KMS, WAF | ป้องกัน |
| **Analytics** | Kinesis, Athena, EMR | วิเคราะห์ |
| **ML** | SageMaker, Bedrock | AI/ML |

**Compute Options:**

| Service | เหมาะกับ | ข้อดี | ข้อเสีย |
|---------|----------|-------|---------|
| **EC2** | Full Control | ยืดหยุ่น | ต้องจัดการ |
| **Lambda** | Event-Driven | Serverless | Timeout 15m |
| **ECS** | Container | ง่าย | AWS-specific |
| **EKS** | Kubernetes | Standard | ซับซ้อน |
| **Fargate** | Serverless Container | ไม่จัดการ Server | แพงกว่า |

**Storage Options:**

| Service | ประเภท | ใช้เมื่อ |
|---------|--------|----------|
| **S3** | Object | ไฟล์, Backup, Static |
| **EBS** | Block | EC2 Volume |
| **EFS** | File | Shared File |
| **Glacier** | Archive | Long-term Backup |

**S3 Storage Classes:**

| Class | ใช้เมื่อ | Retrieval |
|-------|----------|-----------|
| Standard | บ่อย | ms |
| Intelligent-Tiering | ไม่แน่ใจ | Auto |
| Standard-IA | นานๆ ที | ms |
| One Zone-IA | ไม่สำคัญ | ms |
| Glacier Instant | Archive | ms |
| Glacier Flexible | Archive | นาที-ชั่วโมง |
| Glacier Deep | Archive | 12 ชั่วโมง |

### 3.2 ทำงานอย่างไร

**VPC Architecture:**

```
┌─────────────────────────────────────────────────┐
│                    VPC 10.0.0.0/16              │
│  ┌─────────────────────────────────────────┐   │
│  │         Availability Zone A             │   │
│  │  ┌──────────────┐  ┌──────────────┐    │   │
│  │  │ Public Subnet│  │Private Subnet│    │   │
│  │  │ 10.0.1.0/24  │  │ 10.0.2.0/24  │    │   │
│  │  │  ┌────────┐  │  │  ┌────────┐  │    │   │
│  │  │  │  NAT   │  │  │  │  EC2   │  │    │   │
│  │  │  │Gateway │  │  │  │        │  │    │   │
│  │  │  └────────┘  │  │  └────────┘  │    │   │
│  │  │  ┌────────┐  │  │  ┌────────┐  │    │   │
│  │  │  │  ALB   │  │  │  │  RDS   │  │    │   │
│  │  │  └────────┘  │  │  └────────┘  │    │   │
│  │  └──────────────┘  └──────────────┘    │   │
│  └─────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────┐   │
│  │         Availability Zone B             │   │
│  │  (เหมือน AZ A)                          │   │
│  └─────────────────────────────────────────┘   │
└─────────────────────────────────────────────────┘
```

**Lambda Function:**

```python
# handler.py
import json
import boto3
from datetime import datetime

s3 = boto3.client('s3')
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('ProcessingLog')

def handler(event, context):
    """
    ประมวลผล S3 Event เมื่อมีไฟล์อัปโหลด
    """
    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        
        try:
            # ดาวน์โหลดไฟล์
            response = s3.get_object(Bucket=bucket, Key=key)
            content = response['Body'].read()
            
            # ประมวลผล
            result = process(content)
            
            # บันทึก Log
            table.put_item(Item={
                'id': f"{bucket}/{key}",
                'processed_at': datetime.utcnow().isoformat(),
                'size': len(content),
                'status': 'SUCCESS'
            })
            
            return {'statusCode': 200, 'body': json.dumps(result)}
        
        except Exception as e:
            table.put_item(Item={
                'id': f"{bucket}/{key}",
                'processed_at': datetime.utcnow().isoformat(),
                'status': 'FAILED',
                'error': str(e)
            })
            raise

def process(content):
    # Business Logic
    return {'length': len(content)}
```

**Lambda Configuration:**

```yaml
# serverless.yml
service: image-processor

provider:
  name: aws
  runtime: python3.12
  region: ap-southeast-1
  memorySize: 1024
  timeout: 300
  environment:
    BUCKET: ${self:custom.bucket}
    TABLE: ${self:custom.table}
  iam:
    role:
      statements:
        - Effect: Allow
          Action:
            - s3:GetObject
            - s3:PutObject
          Resource: "arn:aws:s3:::${self:custom.bucket}/*"
        - Effect: Allow
          Action:
            - dynamodb:PutItem
          Resource: "arn:aws:dynamodb:*:*:table/${self:custom.table}"

functions:
  processImage:
    handler: handler.handler
    events:
      - s3:
          bucket: ${self:custom.bucket}
          event: s3:ObjectCreated:*
          rules:
            - suffix: .jpg
            - suffix: .png

custom:
  bucket: my-images-${self:provider.stage}
  table: processing-log-${self:provider.stage}
```

**RDS Multi-AZ:**

```
┌─────────────────────────────────────────────┐
│              Application                    │
└──────────────────┬──────────────────────────┘
                   │
        ┌──────────┼──────────┐
        ▼          ▼          ▼
   ┌─────────┐ ┌─────────┐ ┌─────────┐
   │  AZ A   │ │  AZ B   │ │  AZ C   │
   │ Primary │ │ Standby │ │ Read    │
   │   RDS   │ │   RDS   │ │ Replica │
   └─────────┘ └─────────┘ └─────────┘
        │           ▲
        └───────────┘
       Sync Replication
       
   Failover: อัตโนมัติภายใน 60-120 วินาที
```

**S3 Lifecycle Policy:**

```json
{
  "Rules": [
    {
      "Id": "ArchiveOldFiles",
      "Status": "Enabled",
      "Filter": {
        "Prefix": "logs/"
      },
      "Transitions": [
        {
          "Days": 30,
          "StorageClass": "STANDARD_IA"
        },
        {
          "Days": 90,
          "StorageClass": "GLACIER"
        },
        {
          "Days": 365,
          "StorageClass": "DEEP_ARCHIVE"
        }
      ],
      "Expiration": {
        "Days": 2555
      }
    }
  ]
}
```

### 3.3 การใช้งาน

**Well-Architected Framework:**

| Pillar | หลักการ |
|--------|---------|
| **Operational Excellence** | Automate, Learn, Improve |
| **Security** | Least Privilege, Defense in Depth |
| **Reliability** | Recover, Scale, Test |
| **Performance** | Right-sizing, Caching |
| **Cost Optimization** | Pay for Value, Measure |
| **Sustainability** | ลด Carbon Footprint |

**Cost Optimization:**

| Strategy | ประหยัด |
|----------|---------|
| Reserved Instances | 40-60% |
| Savings Plans | 30-50% |
| Spot Instances | 70-90% |
| S3 Intelligent-Tiering | 20-40% |
| Auto-scaling | 30-50% |

### 3.4 ข้อดี

- ✅ **Global** — 30+ Regions
- ✅ **Services เยอะ** — 200+ Services
- ✅ **Mature** — ตั้งแต่ 2006
- ✅ **Scalable** — Scale ง่าย
- ✅ **Ecosystem** — Community ใหญ่
- ✅ **Innovation** — Services ใหม่บ่อย

### 3.5 ข้อเสีย

- ❌ **Complexity** — Services เยอะเกิน
- ❌ **Cost** — อาจบานปลาย
- ❌ **Vendor Lock-in** — ย้ายยาก
- ❌ **Learning Curve** — ต้องเรียนเยอะ
- ❌ **Billing** — ซับซ้อน

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- ระวัง Billing Surprise
- ระวัง Region Lock-in
- ระวัง IAM Over-permission
- ระวัง Data Transfer Cost

**ข้อห้าม:**
- ❌ ห้ามใช้ Root Account
- ❌ ห้าม Hardcode Credentials
- ❌ ห้าม Public S3 โดยไม่ตั้งใจ
- ❌ ห้าม Single AZ สำหรับ Production
- ❌ ห้าม Ignore Cost

**ข้อจำกัด:**
- Lambda Timeout 15 นาที
- S3 Object Size 5 TB
- RDS Storage 64 TB
- VPC Peering Limits

### 3.7 สรุป

AWS เป็น Platform ที่ทรงพลัง แต่ต้องเข้าใจ Cost, Security, และ Best Practices

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

```
┌─────────────────────────────────────────────┐
│              AWS Organization               │
│  ┌─────────────────────────────────────┐    │
│  │          Account: Prod              │    │
│  │  ┌─────────────────────────────┐    │    │
│  │  │      Region: ap-southeast-1 │    │    │
│  │  │  ┌───────────────────────┐  │    │    │
│  │  │  │        VPC            │  │    │    │
│  │  │  │  ┌─────────────────┐  │  │    │    │
│  │  │  │  │  Public Subnet  │  │  │    │    │
│  │  │  │  │  - ALB          │  │  │    │    │
│  │  │  │  │  - NAT          │  │  │    │    │
│  │  │  │  └─────────────────┘  │  │    │    │
│  │  │  │  ┌─────────────────┐  │  │    │    │
│  │  │  │  │ Private Subnet  │  │  │    │    │
│  │  │  │  │  - EC2/EKS      │  │  │    │    │
│  │  │  │  │  - RDS          │  │  │    │    │
│  │  │  │  └─────────────────┘  │  │    │    │
│  │  │  └───────────────────────┘  │    │    │
│  │  └─────────────────────────────┘    │    │
│  └─────────────────────────────────────┘    │
│  ┌─────────────────────────────────────┐    │
│  │          Account: Dev               │    │
│  └─────────────────────────────────────┘    │
└─────────────────────────────────────────────┘
```

### 4.2 โครงสร้างทำงานอย่างไร

**Multi-Account Strategy:**

```
┌─────────────────────────────────────────────┐
│           AWS Organizations                 │
│  ┌─────────────────────────────────────┐    │
│  │       Management Account            │    │
│  │       (Billing, SCP)                │    │
│  └─────────────────────────────────────┘    │
│  ┌─────────────────────────────────────┐    │
│  │       Security OU                   │    │
│  │  - Log Archive                      │    │
│  │  - Security Tooling                 │    │
│  └─────────────────────────────────────┘    │
│  ┌─────────────────────────────────────┐    │
│  │       Infrastructure OU             │    │
│  │  - Shared Services                  │    │
│  │  - Network                          │    │
│  └─────────────────────────────────────┘    │
│  ┌─────────────────────────────────────┐    │
│  │       Workloads OU                  │    │
│  │  - Prod                             │    │
│  │  - Staging                          │    │
│  │  - Dev                              │    │
│  └─────────────────────────────────────┘    │
└─────────────────────────────────────────────┘
```

### 4.3 โครงสร้างการใช้งาน

| Layer | Services | หน้าที่ |
|-------|----------|----------|
| Edge | CloudFront, Route 53 | CDN, DNS |
| Network | VPC, ALB, NAT | Networking |
| Compute | EC2, ECS, Lambda | Application |
| Data | RDS, S3, DynamoDB | Storage |
| Security | IAM, KMS, WAF | Security |
| Observability | CloudWatch, X-Ray | Monitoring |

### 4.4 สรุป

โครงสร้าง AWS ที่ดีต้องมี Multi-Account, Multi-AZ, และ Well-Architected

---

## 5. แนวทางการประยุกต์ใช้

**Framework:**

```
1. เริ่มจาก Account Structure
   - Organizations
   - SCPs
   - IAM

2. สร้าง Network
   - VPC, Subnets
   - Security Groups
   - Route Tables

3. เลือก Compute
   - EC2: Full Control
   - ECS/EKS: Container
   - Lambda: Serverless

4. เลือก Storage
   - S3: Object
   - RDS: Relational
   - DynamoDB: NoSQL

5. Security
   - IAM Roles
   - KMS Encryption
   - WAF, Shield

6. Observability
   - CloudWatch
   - X-Ray
   - CloudTrail

7. Cost
   - Budgets
   - Cost Explorer
   - Trusted Advisor
```

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา: RAG System บน AWS**

```
┌─────────────────────────────────────────────┐
│              CloudFront                     │
│              (CDN)                          │
└──────────────────┬──────────────────────────┘
                   │
┌──────────────────▼──────────────────────────┐
│              API Gateway                    │
│              (REST/WebSocket)               │
└──────────────────┬──────────────────────────┘
                   │
        ┌──────────┼──────────┐
        ▼          ▼          ▼
   ┌─────────┐ ┌─────────┐ ┌─────────┐
   │ Lambda  │ │ Lambda  │ │ Lambda  │
   │ Ingest  │ │ Query   │ │ Admin   │
   └────┬────┘ └────┬────┘ └────┬────┘
        │           │           │
        └───────────┼───────────┘
                    │
        ┌───────────┼───────────┐
        ▼           ▼           ▼
   ┌─────────┐ ┌─────────┐ ┌─────────┐
   │   S3    │ │OpenSearch│ │DynamoDB │
   │(Docs)   │ │(Vector)  │ │(Meta)   │
   └─────────┘ └─────────┘ └─────────┘
                    │
                    ▼
            ┌─────────────┐
            │  Bedrock    │
            │  (LLM)      │
            └─────────────┘
```

**Services ที่ใช้:**
- **S3** — เก็บ Documents
- **Lambda** — Ingest, Query
- **OpenSearch** — Vector Store
- **DynamoDB** — Metadata
- **Bedrock** — LLM (Claude, Titan)
- **API Gateway** — REST API
- **CloudFront** — CDN
- **Cognito** — Authentication
- **CloudWatch** — Monitoring

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| Billing Surprise | ไม่ตั้ง Budget | AWS Budgets, Alerts |
| Slow Lambda | Cold Start | Provisioned Concurrency |
| S3 Public | Misconfiguration | S3 Block Public Access |
| IAM Over-permission | ไม่มี Least Privilege | IAM Access Analyzer |
| Cross-AZ Cost | Data Transfer | Same-AZ Communication |
| Vendor Lock-in | ใช้ Managed Services | Abstraction Layer |

---

# บทที่ 3: Infrastructure as Code (IaC)

## 1. บทนำ

Infrastructure as Code (IaC) คือการจัดการ Infrastructure ผ่านโค้ด แทนการคลิกใน Console หรือรัน Script Manual แนวคิดนี้ทำให้ Infrastructure กลายเป็น Version-Controlled, Reproducible, และ Testable เหมือน Application Code

เครื่องมือ IaC ที่นิยม: Terraform, CloudFormation, Pulumi, Ansible, Crossplane

## 2. บทนิยาม

**Infrastructure as Code (IaC)** หมายถึง การจัดการและ Provision Infrastructure ผ่าน Machine-Readable Files แทนการทำ Manual

**คำนิยามของ Kief Morris:**
> "Infrastructure as Code is an approach to infrastructure automation based on practices from software development."

**ประเภทของ IaC:**

| ประเภท | ลักษณะ | ตัวอย่าง |
|--------|--------|----------|
| **Declarative** | บอกผลลัพธ์ | Terraform, CloudFormation |
| **Imperative** | บอกขั้นตอน | Ansible, Scripts |
| **GitOps** | Git เป็น Source of Truth | ArgoCD, Flux |

## 3. บทหัวข้อ

### 3.1 IaC คืออะไร

**Terraform vs CloudFormation vs Pulumi:**

| มิติ | Terraform | CloudFormation | Pulumi |
|------|-----------|----------------|--------|
| **Cloud** | Multi | AWS Only | Multi |
| **ภาษา** | HCL | YAML/JSON | Python, Go, TS |
| **State** | External | Managed | Managed |
| **Ecosystem** | ใหญ่ | AWS | กลาง |
| **Learning** | กลาง | ง่าย | ง่าย (ถ้ารู้ภาษา) |

**Terraform Workflow:**

```
┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐
│  Write  │─▶│  Plan   │─▶│  Apply  │─▶│ Destroy │
│  .tf    │  │  Diff   │  │  Create │  │  Clean  │
└─────────┘  └─────────┘  └─────────┘  └─────────┘
```

**State Management:**

```
Local State:
terraform.tfstate (ไม่แนะนำสำหรับทีม)

Remote State (S3 + DynamoDB):
┌─────────────────────────────────────┐
│  S3 Bucket                          │
│  - terraform.tfstate                │
│  - Versioning enabled               │
│  - Encryption                       │
└─────────────────────────────────────┘
         │
         │ Lock
         ▼
┌─────────────────────────────────────┐
│  DynamoDB Table                     │
│  - LockID (primary key)             │
│  - TTL                              │
└─────────────────────────────────────┘
```

### 3.2 ทำงานอย่างไร

**Terraform Example:**

```hcl
# main.tf
terraform {
  required_version = ">= 1.5"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "prod/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

# Variables
variable "environment" {
  type        = string
  description = "Environment name"
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Must be dev, staging, or prod"
  }
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

# Provider
provider "aws" {
  region = "ap-southeast-1"
  
  default_tags {
    tags = {
      Environment = var.environment
      ManagedBy   = "Terraform"
      Project     = "my-app"
    }
  }
}

# VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  tags = {
    Name = "my-vpc-${var.environment}"
  }
}

# Subnets
resource "aws_subnet" "public" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  
  map_public_ip_on_launch = true
  
  tags = {
    Name = "public-${count.index + 1}-${var.environment}"
    Type = "public"
  }
}

resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index + 10)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  
  tags = {
    Name = "private-${count.index + 1}-${var.environment}"
    Type = "private"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  
  tags = {
    Name = "igw-${var.environment}"
  }
}

# NAT Gateway
resource "aws_eip" "nat" {
  count  = 2
  domain = "vpc"
}

resource "aws_nat_gateway" "main" {
  count         = 2
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id
  
  tags = {
    Name = "nat-${count.index + 1}-${var.environment}"
  }
  
  depends_on = [aws_internet_gateway.main]
}

# Route Tables
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  
  tags = {
    Name = "public-rt-${var.environment}"
  }
}

resource "aws_route_table" "private" {
  count  = 2
  vpc_id = aws_vpc.main.id
  
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main[count.index].id
  }
  
  tags = {
    Name = "private-rt-${count.index + 1}-${var.environment}"
  }
}

# RDS
resource "aws_db_instance" "main" {
  identifier = "my-db-${var.environment}"
  
  engine         = "postgres"
  engine_version = "16.1"
  instance_class = var.environment == "prod" ? "db.r6g.xlarge" : "db.t3.medium"
  
  allocated_storage     = 100
  max_allocated_storage = 1000
  storage_encrypted     = true
  storage_type          = "gp3"
  
  db_name  = "app"
  username = "admin"
  password = random_password.db_password.result
  
  multi_az               = var.environment == "prod"
  backup_retention_period = var.environment == "prod" ? 30 : 7
  backup_window          = "03:00-04:00"
  maintenance_window     = "sun:04:00-sun:05:00"
  
  vpc_security_group_ids = [aws_security_group.db.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
  
  deletion_protection = var.environment == "prod"
  skip_final_snapshot = var.environment != "prod"
  
  performance_insights_enabled = true
  
  tags = {
    Name = "my-db-${var.environment}"
  }
}

# Outputs
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC ID"
}

output "db_endpoint" {
  value       = aws_db_instance.main.endpoint
  description = "RDS Endpoint"
  sensitive   = true
}
```

**Modules:**

```hcl
# modules/vpc/main.tf
variable "name" { type = string }
variable "cidr" { type = string }
variable "azs" { type = list(string) }

resource "aws_vpc" "this" {
  cidr_block = var.cidr
  tags = { Name = var.name }
}

# ... more resources

output "vpc_id" {
  value = aws_vpc.this.id
}

# environments/prod/main.tf
module "vpc" {
  source = "../../modules/vpc"
  
  name = "prod-vpc"
  cidr = "10.0.0.0/16"
  azs  = ["ap-southeast-1a", "ap-southeast-1b"]
}

module "eks" {
  source = "../../modules/eks"
  
  cluster_name = "prod-cluster"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnet_ids
}
```

**Terragrunt (DRY):**

```hcl
# terragrunt.hcl
terraform {
  source = "git::https://github.com/myorg/terraform-modules.git//vpc?ref=v1.0.0"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  name = "prod-vpc"
  cidr = "10.0.0.0/16"
  azs  = ["ap-southeast-1a", "ap-southeast-1b"]
}
```

### 3.3 การใช้งาน

**IaC ใช้เมื่อ:**

1. **Multi-Environment** — Dev, Staging, Prod
2. **ทีมใหญ่** — ต้อง Share Config
3. **Compliance** — ต้อง Audit
4. **Reproducibility** — สร้างซ้ำได้
5. **Disaster Recovery** — สร้างใหม่ได้เร็ว

**Testing IaC:**

```python
# test_vpc.py
import pytest
import boto3

@pytest.fixture
def vpc():
    ec2 = boto3.client('ec2', region_name='ap-southeast-1')
    response = ec2.describe_vpcs(
        Filters=[{'Name': 'tag:Name', 'Values': ['prod-vpc']}]
    )
    return response['Vpcs'][0]

def test_vpc_exists(vpc):
    assert vpc['State'] == 'available'

def test_vpc_cidr(vpc):
    assert vpc['CidrBlock'] == '10.0.0.0/16'

def test_vpc_dns_enabled(vpc):
    assert vpc['EnableDnsHostnames'] is True
```

**Policy as Code:**

```rego
# policy/vpc.rego
package terraform

deny[msg] {
    resource := input.resource_changes[_]
    resource.type == "aws_vpc"
    not resource.change.after.enable_dns_hostnames
    msg := "VPC must have DNS hostnames enabled"
}

deny[msg] {
    resource := input.resource_changes[_]
    resource.type == "aws_db_instance"
    not resource.change.after.storage_encrypted
    msg := "RDS must have storage encryption"
}
```

### 3.4 ข้อดี

- ✅ **Reproducible** — สร้างซ้ำได้
- ✅ **Version Control** — Track Changes
- ✅ **Automation** — ลด Manual
- ✅ **Documentation** — โค้ดเป็นเอกสาร
- ✅ **Testing** — Test ได้
- ✅ **Disaster Recovery** — สร้างใหม่เร็ว

### 3.5 ข้อเสีย

- ❌ **Learning Curve** — ต้องเรียน
- ❌ **State Management** — ซับซ้อน
- ❌ **Drift** — Manual Changes
- ❌ **Initial Setup** — ใช้เวลา
- ❌ **Tool Lock-in** — ผูกเครื่องมือ

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- ระวัง State File หาย
- ระวัง Drift
- ระวัง Secrets ใน State
- ระวัง Destroy โดยไม่ตั้งใจ

**ข้อห้าม:**
- ❌ ห้าม Commit State File
- ❌ ห้าม Hardcode Secrets
- ❌ ห้าม Manual Change ใน Prod
- ❌ ห้าม Apply โดยไม่ Plan
- ❌ ห้ามใช้ Local State สำหรับทีม

**ข้อจำกัด:**
- Terraform State Lock
- Provider Bugs
- ไม่รองรับทุก Resources
- State File ใหญ่ช้า

### 3.7 สรุป

IaC เป็นรากฐานของ Cloud Automation ต้องลงทุนแต่ให้ผลตอบแทนสูง

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

```
terraform/
├── modules/                    # Reusable Modules
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── README.md
│   ├── eks/
│   ├── rds/
│   └── s3/
│
├── environments/               # Environment Configs
│   ├── dev/
│   │   ├── main.tf
│   │   ├── terraform.tfvars
│   │   └── backend.tf
│   ├── staging/
│   └── prod/
│
├── global/                     # Global Resources
│   ├── iam/
│   └── route53/
│
└── policies/                   # Policy as Code
    └── vpc.rego
```

### 4.2 โครงสร้างทำงานอย่างไร

**Module Composition:**

```
┌─────────────────────────────────────────────┐
│              Prod Environment               │
│  ┌─────────────────────────────────────┐    │
│  │         VPC Module                  │    │
│  │  - VPC, Subnets, IGW, NAT           │    │
│  └──────────────┬──────────────────────┘    │
│                 │                            │
│  ┌──────────────▼──────────────────────┐    │
│  │         EKS Module                  │    │
│  │  - Cluster, Node Groups             │    │
│  └──────────────┬──────────────────────┘    │
│                 │                            │
│  ┌──────────────▼──────────────────────┐    │
│  │         RDS Module                  │    │
│  │  - PostgreSQL, Multi-AZ             │    │
│  └─────────────────────────────────────┘    │
└─────────────────────────────────────────────┘
```

### 4.3 โครงสร้างการใช้งาน

| Layer | ไฟล์ | หน้าที่ |
|-------|------|----------|
| Root | main.tf | Provider, Backend |
| Variables | variables.tf | Input |
| Resources | resources.tf | Resources |
| Outputs | outputs.tf | Output |
| Module | modules/ | Reusable |

### 4.4 สรุป

โครงสร้าง IaC ที่ดีต้องมี Modules, Environments, และ Policies

---

## 5. แนวทางการประยุกต์ใช้

**Framework:**

```
1. เริ่มจาก Single Environment
   - เขียน Terraform
   - Local State

2. ย้ายเป็น Remote State
   - S3 + DynamoDB
   - Versioning

3. สร้าง Modules
   - VPC, RDS, EKS
   - Reusable

4. Multi-Environment
   - dev, staging, prod
   - Terragrunt

5. Testing
   - Terratest
   - Policy as Code

6. CI/CD
   - GitHub Actions
   - Atlantis

7. GitOps
   - ArgoCD
   - Flux
```

**GitOps Workflow:**

```
Developer → Git Push → PR → Review → Merge
                                    │
                                    ▼
                              ArgoCD Detect
                                    │
                                    ▼
                              Sync to Cluster
                                    │
                                    ▼
                              Monitor & Alert
```

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา: Multi-Region EKS**

```hcl
# environments/prod/main.tf
module "vpc_sg" {
  source = "../../modules/vpc"
  name   = "prod-vpc-sg"
  cidr   = "10.0.0.0/16"
  azs    = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

module "vpc_us" {
  source = "../../modules/vpc"
  name   = "prod-vpc-us"
  cidr   = "10.1.0.0/16"
  azs    = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

module "eks_sg" {
  source       = "../../modules/eks"
  cluster_name = "prod-sg"
  vpc_id       = module.vpc_sg.vpc_id
  subnet_ids   = module.vpc_sg.private_subnet_ids
  
  node_groups = {
    general = {
      instance_types = ["m6i.xlarge"]
      min_size       = 3
      max_size       = 20
      desired_size   = 5
    }
    memory = {
      instance_types = ["r6i.xlarge"]
      min_size       = 2
      max_size       = 10
      desired_size   = 3
    }
  }
}

module "rds_sg" {
  source      = "../../modules/rds"
  name        = "prod-db-sg"
  vpc_id      = module.vpc_sg.vpc_id
  subnet_ids  = module.vpc_sg.private_subnet_ids
  multi_az    = true
  instance_class = "db.r6g.xlarge"
}
```

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| State Lock | Process ตาย | Force Unlock |
| Drift | Manual Change | Import, Refresh |
| State ใหญ่ | Resources เยอะ | Split State |
| Secrets ใน State | ไม่ Encrypt | KMS, Vault |
| Slow Apply | Resources เยอะ | Parallel, Split |
| Module ซับซ้อน | Abstraction เยอะ | Simplify |

---

# 📘 สรุปเล่มที่ 6

**สิ่งที่ได้เรียนรู้:**

1. **CI/CD Pipeline** — Build, Test, Deploy อัตโนมัติ
2. **Cloud Platform AWS** — Compute, Storage, Network
3. **Infrastructure as Code** — Terraform, GitOps

**คำแนะนำ:**
- เริ่มจาก CI ก่อน CD
- ใช้ AWS Well-Architected
- IaC ตั้งแต่เริ่ม
- GitOps สำหรับ Kubernetes

**หนังสือแนะนำ:**
- "Accelerate" — Nicole Forsgren
- "The DevOps Handbook" — Gene Kim
- "Terraform: Up & Running" — Yevgeniy Brikman
- "AWS Certified Solutions Architect" — Study Guide
- "Kubernetes Patterns" — Bilgin Ibryam

---

# 📘 เล่มถัดไป (โครงร่าง)

## เล่มที่ 7: AI Systems Architecture
- บทที่ 1: RAG Pipeline Architecture
- บทที่ 2: Agentic AI Architecture
- บทที่ 3: LLM Platform Engineering
- บทที่ 4: Production AI Case Studies

---
 