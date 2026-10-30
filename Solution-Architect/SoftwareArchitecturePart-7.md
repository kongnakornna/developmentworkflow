# 📘 เล่มที่ 7: AI Systems Architecture

---

# บทที่ 1: RAG Pipeline Architecture

## 1. บทนำ

Retrieval-Augmented Generation (RAG) คือสถาปัตยกรรมที่Combiningความสามารถของ Large Language Models (LLMs) เข้ากับ External Knowledge Base เพื่อให้ AI ตอบคำถามได้แม่นยำ ตามข้อมูลล่าสุด และอ้างอิงแหล่งที่มาได้

RAG กลายเป็น Standard Architecture สำหรับ Enterprise AI เพราะแก้ปัญหา 3 ข้อหลักของ LLM:
1. **Hallucination** — LLM มโนคำตอบ
2. **Knowledge Cutoff** — LLM ไม่รู้ข้อมูลหลัง Training
3. **Domain-specific Knowledge** — LLM ไม่รู้ข้อมูลภายในองค์กร

บทนี้จะพาคุณเจาะลึก RAG Pipeline ตั้งแต่ Document Ingestion ไปจนถึง Generation พร้อม Best Practices จาก Production

## 2. บทนิยาม

**Retrieval-Augmented Generation (RAG)** หมายถึง สถาปัตยกรรม AI ที่ Retrieval System ดึงข้อมูลที่เกี่ยวข้องจาก Knowledge Base แล้วส่งให้ LLM ใช้สร้างคำตอบ

**คำนิยามเชิงปฏิบัติ:**
> RAG = Retrieve Relevant Context + Generate Grounded Answer

**องค์ประกอบหลัก:**

| องค์ประกอบ | หน้าที่ |
|-----------|----------|
| **Ingestion** | นำเข้าข้อมูล |
| **Chunking** | แบ่งข้อมูล |
| **Embedding** | แปลงเป็น Vector |
| **Vector Store** | เก็บ Vector |
| **Retrieval** | ค้นหาข้อมูล |
| **Reranking** | จัดลำดับ |
| **Generation** | สร้างคำตอบ |

**RAG vs Fine-tuning vs Long Context:**

| มิติ | RAG | Fine-tuning | Long Context |
|------|-----|-------------|--------------|
| **ความรู้** | Dynamic | Static | Static |
| **Cost** | ต่ำ | สูง | สูง |
| **Update** | ทันที | ต้อง Retrain | ต้องโหลดใหม่ |
| **Attribution** | ได้ | ยาก | ยาก |
| **Context Limit** | ไม่จำกัด | ไม่จำกัด | จำกัด |

## 3. บทหัวข้อ

### 3.1 RAG Pipeline คืออะไร

**Complete RAG Architecture:**

```
┌─────────────────────────────────────────────────────────┐
│                  INGESTION PIPELINE                     │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐   │
│  │Document │─▶│Chunking │─▶│Embedding│─▶│ Vector  │   │
│  │ Loader  │  │         │  │  Model  │  │  Store  │   │
│  └─────────┘  └─────────┘  └─────────┘  └─────────┘   │
│       ▲                                       │         │
│       │                                       │         │
│  ┌────┴────┐                                  │         │
│  │ Sources │                                  │         │
│  │ - PDF   │                                  │         │
│  │ - Web   │                                  │         │
│  │ - DB    │                                  │         │
│  │ - API   │                                  │         │
│  └─────────┘                                  │         │
└───────────────────────────────────────────────┼─────────┘
                                                │
┌───────────────────────────────────────────────┼─────────┐
│                  QUERY PIPELINE               │         │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌────▼────┐   │
│  │  User   │─▶│ Query   │─▶│Retrieval│─▶│Reranker │   │
│  │ Query   │  │Transform│  │         │  │         │   │
│  └─────────┘  └─────────┘  └─────────┘  └────┬────┘   │
│                                                │         │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌────▼────┐   │
│  │ Answer  │◀─│ Response│◀─│  LLM    │◀─│ Prompt  │   │
│  │         │  │         │  │Generator│  │ Builder │   │
│  └─────────┘  └─────────┘  └─────────┘  └─────────┘   │
└─────────────────────────────────────────────────────────┘
```

**Stack Options:**

| Layer | Options | แนะนำ |
|-------|---------|--------|
| **Document Loader** | Unstructured, LlamaParse, PyPDF | LlamaParse |
| **Chunking** | Fixed, Recursive, Semantic | Semantic |
| **Embedding** | OpenAI, Cohere, BGE, E5 | Cohere v3 |
| **Vector Store** | Milvus, FAISS, Qdrant, Pinecone | Milvus |
| **Retrieval** | LangChain, LlamaIndex, Haystack | LlamaIndex |
| **Reranker** | Cohere Rerank, BGE | Cohere Rerank |
| **LLM** | GPT-4, Claude, LLaMA, Mistral | GPT-4o / Claude |
| **Framework** | LangChain, LlamaIndex, DSPy | LlamaIndex |

### 3.2 ทำงานอย่างไร

**Stage 1: Document Ingestion**

```python
from llama_parse import LlamaParse
from llama_index.core import SimpleDirectoryReader

# PDF Parsing ด้วย LlamaParse
parser = LlamaParse(
    api_key="llx-...",
    result_type="markdown",
    num_workers=4,
    verbose=True,
    language="th",  # รองรับภาษาไทย
)

file_extractor = {".pdf": parser}

documents = SimpleDirectoryReader(
    input_dir="./docs",
    file_extractor=file_extractor,
    recursive=True
).load_data()

# Metadata Enrichment
for doc in documents:
    doc.metadata.update({
        "source": doc.metadata.get("file_path"),
        "ingested_at": datetime.utcnow().isoformat(),
        "department": extract_department(doc.metadata.get("file_path")),
        "classification": classify_document(doc.text),
    })
```

**Stage 2: Chunking**

```python
from llama_index.core.node_parser import (
    SemanticSplitterNodeParser,
    SentenceSplitter,
)
from llama_index.embeddings.openai import OpenAIEmbedding

# Semantic Chunking (แนะนำ)
embed_model = OpenAIEmbedding(model="text-embedding-3-small")
semantic_splitter = SemanticSplitterNodeParser(
    buffer_size=1,
    breakpoint_percentile_threshold=95,
    embed_model=embed_model,
)

# หรือ Recursive Chunking
recursive_splitter = SentenceSplitter(
    chunk_size=512,
    chunk_overlap=50,
    paragraph_separator="\n\n",
)

nodes = semantic_splitter.get_nodes_from_documents(documents)

# Chunk Enrichment
for node in nodes:
    node.metadata.update({
        "chunk_id": str(uuid4()),
        "parent_doc_id": node.ref_doc_id,
        "chunk_size": len(node.text),
        "position": node.metadata.get("position"),
    })
```

**Chunking Strategies:**

| Strategy | ข้อดี | ข้อเสีย | ใช้เมื่อ |
|----------|-------|---------|---------|
| **Fixed Size** | ง่าย, เร็ว | ตัดกลางประโยค | Prototype |
| **Recursive** | สมดุล | ยังตัดกลาง | ทั่วไป |
| **Semantic** | คุณภาพสูง | ช้า, แพง | Production |
| **Hierarchical** | Parent-Child | ซับซ้อน | เอกสารยาว |
| **Sentence Window** | Context ดี | Memory สูง | Q&A แม่นยำ |

**Stage 3: Embedding**

```python
from llama_index.embeddings.cohere import CohereEmbedding
from llama_index.embeddings.openai import OpenAIEmbedding

# Cohere v3 (แนะนำสำหรับ Multilingual)
embed_model = CohereEmbedding(
    model_name="embed-multilingual-v3.0",
    api_key="...",
    input_type="search_document",
)

# หรือ OpenAI
embed_model = OpenAIEmbedding(
    model="text-embedding-3-large",
    dimensions=1024,  # ลดมิติได้
)

# Batch Embedding
embeddings = embed_model.get_text_embedding_batch(
    [node.text for node in nodes],
    show_progress=True,
)
```

**Embedding Model Comparison:**

| Model | Dimensions | ภาษาไทย | Cost | Performance |
|-------|-----------|---------|------|-------------|
| OpenAI text-embedding-3-large | 3072 | ดี | $0.13/1M | สูง |
| OpenAI text-embedding-3-small | 1536 | ดี | $0.02/1M | กลาง |
| Cohere embed-multilingual-v3 | 1024 | ดีมาก | $0.10/1M | สูง |
| BGE-M3 | 1024 | ดี | ฟรี (Self-host) | สูง |
| E5-multilingual | 768 | ดี | ฟรี | กลาง |

**Stage 4: Vector Store**

```python
from llama_index.vector_stores.milvus import MilvusVectorStore
from llama_index.core import VectorStoreIndex, StorageContext

# Milvus
vector_store = MilvusVectorStore(
    uri="http://localhost:19530",
    collection_name="documents",
    dim=1024,
    overwrite=False,
    similarity_metric="COSINE",
    index_type="HNSW",
    index_params={
        "M": 16,
        "efConstruction": 200,
    },
)

storage_context = StorageContext.from_defaults(vector_store=vector_store)

# สร้าง Index
index = VectorStoreIndex(
    nodes=nodes,
    storage_context=storage_context,
    embed_model=embed_model,
    show_progress=True,
)
```

**Vector Store Comparison:**

| Store | ประเภท | ข้อดี | ข้อเสีย |
|-------|--------|-------|---------|
| **Milvus** | Open Source | Scale ใหญ่ | ต้อง Setup |
| **Qdrant** | Open Source | ง่าย, Rust | Ecosystem เล็ก |
| **Weaviate** | Open Source | GraphQL | Resource สูง |
| **Pinecone** | Managed | ไม่ต้องดูแล | แพง, Lock-in |
| **FAISS** | Library | เร็ว, ฟรี | ไม่ Distributed |
| **pgvector** | Extension | ใช้ Postgres | Scale จำกัด |

**Stage 5: Retrieval**

```python
from llama_index.core.retrievers import VectorIndexRetriever
from llama_index.core.query_engine import RetrieverQueryEngine
from llama_index.postprocessor.cohere_rerank import CohereRerank

# Hybrid Retrieval (Vector + BM25)
from llama_index.retrievers.bm25 import BM25Retriever
from llama_index.core.retrievers import QueryFusionRetriever

vector_retriever = VectorIndexRetriever(
    index=index,
    similarity_top_k=20,
)

bm25_retriever = BM25Retriever.from_defaults(
    docstore=index.docstore,
    similarity_top_k=20,
)

hybrid_retriever = QueryFusionRetriever(
    [vector_retriever, bm25_retriever],
    similarity_top_k=10,
    num_queries=3,
    mode="reciprocal_rerank",
    use_async=True,
)

# Reranking
reranker = CohereRerank(
    model="rerank-multilingual-v3.0",
    top_n=5,
)
```

**Retrieval Techniques:**

| Technique | คำอธิบาย | ใช้เมื่อ |
|-----------|----------|----------|
| **Vector Search** | Semantic | ทั่วไป |
| **BM25** | Keyword | คำเฉพาะ |
| **Hybrid** | ผสม | Production |
| **Multi-Query** | หลายคำถาม | Query ซับซ้อน |
| **HyDE** | สร้าง Hypothetical Doc | Query สั้น |
| **Parent-Child** | ดึง Parent | Context ใหญ่ |

**Stage 6: Query Transformation**

```python
from llama_index.core.query_engine import (
    HyDEQueryTransform,
    MultiStepQueryEngine,
)
from llama_index.core.indices.query.query_transform import (
    StepDecomposeQueryTransform,
)

# HyDE: สร้าง Hypothetical Document
hyde = HyDEQueryTransform(include_original=True)
query_engine = RetrieverQueryEngine.from_args(
    retriever=hybrid_retriever,
    query_transform=hyde,
    node_postprocessors=[reranker],
)

# Multi-Step: แยกคำถามซับซ้อน
step_decompose = StepDecomposeQueryTransform(
    llm=llm,
    verbose=True,
)

multi_step_engine = MultiStepQueryEngine(
    query_engine=query_engine,
    query_transform=step_decompose,
    index_summary="Documents about company policies",
)
```

**Stage 7: Prompt Engineering**

```python
from llama_index.core import PromptTemplate

RAG_PROMPT = PromptTemplate(
    """คุณเป็นผู้ช่วยตอบคำถามที่แม่นยำและสุภาพ

ข้อมูลอ้างอิง:
---------------------
{context_str}
---------------------

คำถาม: {query_str}

คำแนะนำ:
1. ตอบโดยอ้างอิงจากข้อมูลอ้างอิงเท่านั้น
2. ถ้าข้อมูลไม่เพียงพอ ให้บอกว่า "ไม่พบข้อมูลในเอกสาร"
3. อ้างอิงแหล่งที่มาด้วย [1], [2] ตามลำดับ
4. ตอบเป็นภาษาไทยที่อ่านง่าย

คำตอบ:"""
)

query_engine.update_prompts({
    "response_synthesizer:text_qa_template": RAG_PROMPT,
})
```

**Stage 8: Generation**

```python
from llama_index.llms.openai import OpenAI
from llama_index.llms.azure_openai import AzureOpenAI

# OpenAI
llm = OpenAI(
    model="gpt-4o",
    temperature=0.1,
    max_tokens=1024,
)

# Azure OpenAI
llm = AzureOpenAI(
    engine="gpt-4o",
    azure_endpoint="https://...openai.azure.com/",
    api_key="...",
    api_version="2024-08-01-preview",
    temperature=0.1,
)

# ผสมกับ Query Engine
query_engine = RetrieverQueryEngine.from_args(
    retriever=hybrid_retriever,
    llm=llm,
    node_postprocessors=[reranker],
)

response = query_engine.query("นโยบายลาพักร้อนเป็นอย่างไร?")
print(response)
print(response.source_nodes)  # Citations
```

### 3.3 การใช้งาน

**RAG ใช้เมื่อ:**

1. **Enterprise Q&A** — ถาม-ตอบจากเอกสารภายใน
2. **Customer Support** — Chatbot ตอบจาก Knowledge Base
3. **Legal/Compliance** — ค้นหากฎหมาย
4. **Medical** — อ้างอิงงานวิจัย
5. **Code Assistant** — ตอบจาก Codebase

**เมื่อไม่ควรใช้:**

- ข้อมูลน้อย (< 10 หน้า�)
- ข้อมูล Static ที่ Fine-tune ได้
- งานที่ไม่ต้องการความแม่นยำสูง
- Real-time Data Streaming

### 3.4 ข้อดี

- ✅ **Up-to-date** — อัปเดตข้อมูลได้ทันที
- ✅ **Attribution** — อ้างอิงแหล่งที่มา
- ✅ **Cost-effective** — ถูกกว่า Fine-tuning
- ✅ **Flexible** — เปลี่ยน Knowledge Base ได้
- ✅ **Domain-specific** — ใช้ข้อมูลองค์กร

### 3.5 ข้อเสีย

- ❌ **Complexity** — หลาย Stages
- ❌ **Latency** — ช้ากว่า LLM ตรงๆ
- ❌ **Retrieval Errors** — ดึงผิด
- ❌ **Chunking Challenges** — แบ่งยาก
- ❌ **Context Limit** — LLM รับได้จำกัด

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- ระวัง Chunk Size ใหญ่เกิน
- ระวัง Embedding Model ไม่เหมาะ
- ระวัง Retrieval ไม่ตรงคำถาม
- ระวัง Context Window เกิน
- ระวัง Prompt Injection

**ข้อห้าม:**
- ❌ ห้ามใช้ Chunk เดียวสำหรับทุกเอกสาร
- ❌ ห้ามใช้ Embedding Model ผิดภาษา
- ❌ ห้ามละเลย Reranking
- ❌ ห้าม Ignore Metadata
- ❌ ห้ามใช้ Production โดยไม่มี Evaluation

**ข้อจำกัด:**
- Context Window ของ LLM
- Cost ของ Embedding
- Latency ของ Retrieval
- Quality ของเอกสารต้นทาง

### 3.7 สรุป

RAG เป็นสถาปัตยกรรมที่ทรงพลังสำหรับ Enterprise AI ต้องเข้าใจทุก Stage และ Optimize ตาม Use Case

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

```
rag-system/
├── ingestion/                  # Ingestion Pipeline
│   ├── loaders/
│   │   ├── pdf_loader.py
│   │   ├── web_loader.py
│   │   └── db_loader.py
│   ├── chunkers/
│   │   ├── semantic.py
│   │   └── recursive.py
│   ├── embedders/
│   │   ├── cohere.py
│   │   └── openai.py
│   └── pipeline.py
│
├── retrieval/                  # Retrieval Layer
│   ├── vector_store/
│   │   ├── milvus.py
│   │   └── qdrant.py
│   ├── retrievers/
│   │   ├── vector.py
│   │   ├── bm25.py
│   │   └── hybrid.py
│   └── rerankers/
│       └── cohere.py
│
├── generation/                 # Generation Layer
│   ├── llms/
│   │   ├── openai.py
│   │   ├── azure.py
│   │   └── ollama.py
│   ├── prompts/
│   │   └── templates.py
│   └── query_engine.py
│
├── evaluation/                 # Evaluation
│   ├── metrics/
│   │   ├── faithfulness.py
│   │   ├── relevancy.py
│   │   └── context_recall.py
│   └── ragas_runner.py
│
├── api/                        # API Layer
│   ├── routes/
│   │   ├── ingest.py
│   │   ├── query.py
│   │   └── feedback.py
│   └── main.py
│
└── config/
    └── settings.py
```

### 4.2 โครงสร้างทำงานอย่างไร

**Data Flow:**

```
Ingestion:
Source → Loader → Chunker → Embedder → Vector Store

Query:
User Query → Query Transform → Retrieval → Rerank → 
Prompt Build → LLM → Response + Citations
```

**Advanced RAG Patterns:**

| Pattern | คำอธิบาย | ใช้เมื่อ |
|---------|----------|----------|
| **Naive RAG** | Retrieve → Generate | Prototype |
| **Advanced RAG** | + Rerank, Query Transform | Production |
| **Modular RAG** | ประกอบได้อิสระ | Enterprise |
| **Agentic RAG** | Agent ตัดสินใจ | ซับซ้อน |
| **Graph RAG** | Knowledge Graph | ความสัมพันธ์ |

### 4.3 โครงสร้างการใช้งาน

| Layer | Components | หน้าที่ |
|-------|-----------|----------|
| Ingestion | Loader, Chunker, Embedder | นำเข้าข้อมูล |
| Storage | Vector Store, DocStore | เก็บข้อมูล |
| Retrieval | Retriever, Reranker | ค้นหา |
| Generation | LLM, Prompt | สร้างคำตอบ |
| Evaluation | Metrics, Feedback | วัดผล |

### 4.4 สรุป

โครงสร้าง RAG ที่ดีต้องแยก Layer ชัดเจน และ Modular เพื่อให้เปลี่ยน Component ได้

---

## 5. แนวทางการประยุกต์ใช้

**Framework:**

```
1. เริ่มจาก Naive RAG
   - Loader → Chunker → Embedder → Vector Store
   - Query → Retrieve → Generate

2. เพิ่ม Reranking
   - Cohere Rerank
   - Cross-Encoder

3. เพิ่ม Query Transformation
   - HyDE, Multi-Query
   - Step Decompose

4. เพิ่ม Hybrid Retrieval
   - Vector + BM25
   - Reciprocal Rank Fusion

5. เพิ่ม Evaluation
   - RAGAS
   - Human Feedback

6. Optimize
   - Caching
   - Async
   - Batch
```

**Evaluation Metrics (RAGAS):**

| Metric | วัดอะไร |
|--------|---------|
| **Faithfulness** | คำตอบตรงกับ Context |
| **Answer Relevancy** | คำตอบตรงคำถาม |
| **Context Precision** | Context ที่ดึงมาตรง |
| **Context Recall** | ดึง Context ครบ |
| **Answer Correctness** | คำตอบถูกต้อง |

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา: Enterprise Q&A System**

**Requirements:**
- 100K+ เอกสาร
- 10K Users
- P99 < 3s
- Multi-language (ไทย, อังกฤษ)

**Architecture:**

```
┌─────────────────────────────────────────────┐
│              Streamlit UI                   │
└──────────────────┬──────────────────────────┘
                   │
┌──────────────────▼──────────────────────────┐
│              FastAPI                        │
│         /query, /ingest, /feedback          │
└──────────────────┬──────────────────────────┘
                   │
        ┌──────────┼──────────┐
        ▼          ▼          ▼
   ┌─────────┐ ┌─────────┐ ┌─────────┐
   │ Query   │ │Retrieval│ │ LLM     │
   │Transform│ │+Rerank  │ │ Service │
   └────┬────┘ └────┬────┘ └────┬────┘
        │           │           │
        └───────────┼───────────┘
                    │
        ┌───────────┼───────────┐
        ▼           ▼           ▼
   ┌─────────┐ ┌─────────┐ ┌─────────┐
   │ Milvus  │ │ Redis   │ │Cohere   │
   │         │ │ Cache   │ │ Rerank  │
   └─────────┘ └─────────┘ └─────────┘
```

**Performance Optimization:**

| เทคนิค | ผลลัพธ์ |
|--------|---------|
| Semantic Caching | ลด 60% LLM Calls |
| Async Retrieval | ลด 40% Latency |
| Batch Embedding | ลด 50% Cost |
| Streaming Response | ลด TTFT 70% |
| HNSW Index | ลด 80% Search Time |

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| Hallucination | Context ไม่พอ | เพิ่ม Reranking |
| Retrieval Miss | Embedding ไม่ดี | Hybrid, Fine-tune |
| Latency สูง | หลาย Stages | Cache, Async |
| Context เกิน | Chunk ใหญ่ | ลด Size, Rerank |
| Multi-language | Model ผิด | Cohere v3, BGE-M3 |
| Cost บาน | Embedding บ่อย | Cache, Batch |
| Stale Data | ไม่อัปเดต | Incremental Ingest |

---

# บทที่ 2: Agentic AI Architecture

## 1. บทนำ

Agentic AI คือวิวัฒนาการขั้นต่อไปของ AI Systems — จาก RAG ที่แค่ Retrieve + Generate ไปสู่ Agent ที่ **คิด วางแผน ใช้เครื่องมือ และลงมือทำ** เพื่อบรรลุเป้าหมาย

Agentic AI กำลังเปลี่ยนวิธีที่เราสร้าง Software ตั้งแต่ Chatbot ที่ตอบคำถาม ไปสู่ Agent ที่จองตั๋วเครื่องบิน วิเคราะห์ข้อมูล เขียนโค้ด และทำงานหลายขั้นตอนได้เอง

บทนี้จะพาคุณเข้าใจ Agentic AI Architecture ตั้งแต่ ReAct Pattern ไปจนถึง Multi-Agent Systems และ Production Deployment

## 2. บทนิยาม

**AI Agent** หมายถึง ระบบ AI ที่สามารถรับรู้สภาพแวดล้อม ตัดสินใจ และลงมือทำเพื่อบรรลุเป้าหมาย โดยอัตโนมัติ

**คำนิยามของ LangChain:**
> "An agent is a system that uses an LLM to decide what actions to take and in what order."

**Agentic AI vs Traditional AI:**

| มิติ | Traditional AI | Agentic AI |
|------|---------------|------------|
| **Input** | Single Query | Goal |
| **Process** | Single Pass | Multi-Step |
| **Tools** | ไม่มี | มีหลาย |
| **Memory** | Stateless | Stateful |
| **Autonomy** | ต่ำ | สูง |
| **Planning** | ไม่มี | มี |

**องค์ประกอบหลัก:**

| องค์ประกอบ | หน้าที่ |
|-----------|----------|
| **LLM** | สมอง |
| **Tools** | มือ |
| **Memory** | ความจำ |
| **Planner** | วางแผน |
| **Executor** | ลงมือ |
| **Reflector** | ตรวจสอบ |

## 3. บทหัวข้อ

### 3.1 Agentic AI คืออะไร

**Agent Patterns:**

| Pattern | คำอธิบาย | ใช้เมื่อ |
|---------|----------|----------|
| **ReAct** | Reason + Act | ทั่วไป |
| **Plan-and-Execute** | วางแผนก่อนทำ | งานซับซ้อน |
| **Reflexion** | ทบทวนตนเอง | ต้องการคุณภาพ |
| **Tool Use** | ใช้เครื่องมือ | ต้องการ Action |
| **Multi-Agent** | หลาย Agent | งานใหญ่ |

**Agent Architecture:**

```
┌─────────────────────────────────────────────┐
│                  Agent                      │
│  ┌─────────────────────────────────────┐    │
│  │           LLM (Brain)               │    │
│  │  - Reasoning                        │    │
│  │  - Planning                         │    │
│  │  - Decision                         │    │
│  └──────────────┬──────────────────────┘    │
│                 │                            │
│  ┌──────────────▼──────────────────────┐    │
│  │           Memory                    │    │
│  │  - Short-term (Context)             │    │
│  │  - Long-term (Vector DB)            │    │
│  │  - Episodic (History)               │    │
│  └──────────────┬──────────────────────┘    │
│                 │                            │
│  ┌──────────────▼──────────────────────┐    │
│  │           Tools                     │    │
│  │  - Search, Calculator               │    │
│  │  - API, Database                    │    │
│  │  - Code Executor                    │    │
│  └─────────────────────────────────────┘    │
└─────────────────────────────────────────────┘
```

### 3.2 ทำงานอย่างไร

**ReAct Pattern:**

```python
from langchain.agents import AgentExecutor, create_react_agent
from langchain.tools import Tool
from langchain_openai import ChatOpenAI

# Tools
def search_web(query: str) -> str:
    """ค้นหาข้อมูลจากเว็บ"""
    return tavily_search(query)

def calculator(expression: str) -> str:
    """คำนวณคณิตศาสตร์"""
    return str(eval(expression))

def query_database(sql: str) -> str:
    """Query Database"""
    return db.execute(sql)

tools = [
    Tool(name="Search", func=search_web, description="ค้นหาข้อมูล"),
    Tool(name="Calculator", func=calculator, description="คำนวณ"),
    Tool(name="Database", func=query_database, description="Query DB"),
]

# Agent
llm = ChatOpenAI(model="gpt-4o", temperature=0)
agent = create_react_agent(llm, tools, prompt)
agent_executor = AgentExecutor(
    agent=agent,
    tools=tools,
    max_iterations=10,
    verbose=True,
    handle_parsing_errors=True,
)

# ใช้งาน
result = agent_executor.invoke({
    "input": "ยอดขายเดือนที่แล้วเป็นเท่าไร? แล้วเพิ่ม 15% เป็นเท่าไร?"
})
```

**ReAct Loop:**

```
Thought:  ฉันต้องหายอดขายเดือนที่แล้ว
Action:   query_database("SELECT SUM(amount) FROM sales WHERE month = 'last'")
Observation: 1,000,000 บาท

Thought:  ต้องคำนวณ 15% ของ 1,000,000
Action:   calculator("1000000 * 1.15")
Observation: 1,150,000

Thought:  ฉันได้คำตอบแล้ว
Answer:   ยอดขายเดือนที่แล้ว 1,000,000 บาท เพิ่ม 15% เป็น 1,150,000 บาท
```

**Plan-and-Execute:**

```python
from langchain.chains import LLMChain
from langchain.prompts import PromptTemplate

PLANNER_PROMPT = PromptTemplate(
    input_variables=["goal", "tools"],
    template="""คุณเป็น Planner ที่เก่ง

เป้าหมาย: {goal}
เครื่องมือที่มี: {tools}

จงสร้างแผนทีละขั้นตอน (ตอบเป็น JSON):
[
  {{"step": 1, "action": "...", "tool": "...", "reasoning": "..."}},
  ...
]
"""
)

class PlanAndExecuteAgent:
    def __init__(self, llm, tools, executor):
        self.llm = llm
        self.tools = tools
        self.executor = executor
        self.planner = LLMChain(llm=llm, prompt=PLANNER_PROMPT)
    
    def run(self, goal: str) -> str:
        # Step 1: วางแผน
        plan = self.planner.run(goal=goal, tools=self.tools)
        steps = json.loads(plan)
        
        # Step 2: Execute แต่ละ Step
        results = []
        for step in steps:
            result = self.executor.execute(step)
            results.append(result)
        
        # Step 3: สรุป
        return self._synthesize(goal, results)
```

**Reflexion Pattern:**

```python
class ReflexionAgent:
    def __init__(self, llm, executor):
        self.llm = llm
        self.executor = executor
        self.max_reflections = 3
    
    def run(self, task: str) -> str:
        attempt = self.executor.execute(task)
        
        for i in range(self.max_reflections):
            # Self-Reflection
            reflection = self._reflect(task, attempt)
            
            if reflection["is_satisfied"]:
                break
            
            # Improve
            attempt = self.executor.execute(
                task,
                feedback=reflection["feedback"]
            )
        
        return attempt
    
    def _reflect(self, task, attempt):
        prompt = f"""Task: {task}
        Attempt: {attempt}
        
        จงประเมิน:
        1. คำตอบถูกต้องไหม?
        2. มีจุดที่ปรับปรุงไหม?
        3. ถ้าต้องแก้ จะแก้อย่างไร?
        
        ตอบเป็น JSON: {{"is_satisfied": bool, "feedback": "..."}}"""
        
        return json.loads(self.llm.invoke(prompt))
```

**Tool Calling (Function Calling):**

```python
from openai import OpenAI

client = OpenAI()

tools = [
    {
        "type": "function",
        "function": {
            "name": "get_weather",
            "description": "ดึงข้อมูลอากาศของเมือง",
            "parameters": {
                "type": "object",
                "properties": {
                    "city": {"type": "string", "description": "ชื่อเมือง"},
                    "unit": {"type": "string", "enum": ["celsius", "fahrenheit"]},
                },
                "required": ["city"],
            },
        },
    },
    {
        "type": "function",
        "function": {
            "name": "search_flights",
            "description": "ค้นหาเที่ยวบิน",
            "parameters": {
                "type": "object",
                "properties": {
                    "origin": {"type": "string"},
                    "destination": {"type": "string"},
                    "date": {"type": "string", "format": "date"},
                },
                "required": ["origin", "destination", "date"],
            },
        },
    },
]

def run_agent(user_input: str):
    messages = [{"role": "user", "content": user_input}]
    
    while True:
        response = client.chat.completions.create(
            model="gpt-4o",
            messages=messages,
            tools=tools,
            tool_choice="auto",
        )
        
        message = response.choices[0].message
        messages.append(message)
        
        if not message.tool_calls:
            return message.content
        
        for tool_call in message.tool_calls:
            result = execute_tool(tool_call.function.name, 
                                   json.loads(tool_call.function.arguments))
            messages.append({
                "role": "tool",
                "tool_call_id": tool_call.id,
                "content": str(result),
            })
```

**Memory Management:**

```python
from langchain.memory import (
    ConversationBufferMemory,
    ConversationSummaryMemory,
    VectorStoreRetrieverMemory,
)

# Short-term: Buffer
buffer_memory = ConversationBufferMemory(
    memory_key="chat_history",
    return_messages=True,
)

# Long-term: Summary
summary_memory = ConversationSummaryMemory(
    llm=llm,
    memory_key="summary",
)

# Episodic: Vector Store
vector_memory = VectorStoreRetrieverMemory(
    retriever=vector_store.as_retriever(),
    memory_key="relevant_history",
)
```

**Multi-Agent Systems:**

```python
from langgraph.graph import StateGraph, END
from typing import TypedDict, Annotated
import operator

class AgentState(TypedDict):
    messages: Annotated[list, operator.add]
    next_agent: str

# Agents
def researcher_agent(state):
    # ค้นคว้าข้อมูล
    return {"messages": [research_result]}

def analyst_agent(state):
    # วิเคราะห์
    return {"messages": [analysis]}

def writer_agent(state):
    # เขียนรายงาน
    return {"messages": [report]}

def supervisor(state):
    # ตัดสินใจว่าใครทำต่อ
    if needs_research(state):
        return {"next_agent": "researcher"}
    elif needs_analysis(state):
        return {"next_agent": "analyst"}
    else:
        return {"next_agent": "writer"}

# Graph
workflow = StateGraph(AgentState)
workflow.add_node("supervisor", supervisor)
workflow.add_node("researcher", researcher_agent)
workflow.add_node("analyst", analyst_agent)
workflow.add_node("writer", writer_agent)

workflow.set_entry_point("supervisor")
workflow.add_conditional_edges(
    "supervisor",
    lambda x: x["next_agent"],
    {
        "researcher": "researcher",
        "analyst": "analyst",
        "writer": "writer",
        "end": END,
    }
)
workflow.add_edge("researcher", "supervisor")
workflow.add_edge("analyst", "supervisor")
workflow.add_edge("writer", END)

app = workflow.compile()
```

### 3.3 การใช้งาน

**Agentic AI ใช้เมื่อ:**

1. **Multi-Step Tasks** — งานหลายขั้นตอน
2. **Tool Use** — ต้องใช้เครื่องมือ
3. **Autonomous Decision** — ตัดสินใจเอง
4. **Complex Workflow** — Workflow ซับซ้อน
5. **Dynamic Environment** — สภาพแวดล้อมเปลี่ยน

**ตัวอย่าง Use Cases:**

| Use Case | Agent | Tools |
|----------|-------|-------|
| **Customer Support** | Support Agent | KB, Ticketing, CRM |
| **Code Assistant** | Coding Agent | Terminal, Editor, Git |
| **Data Analysis** | Analyst Agent | SQL, Python, Charts |
| **Travel Planning** | Travel Agent | Flights, Hotels, Maps |
| **Research** | Research Agent | Web, Papers, Notes |

### 3.4 ข้อดี

- ✅ **Autonomy** — ทำงานเองได้
- ✅ **Flexibility** — ปรับตัวได้
- ✅ **Multi-Step** — งานซับซ้อน
- ✅ **Tool Use** — ใช้เครื่องมือ
- ✅ **Reasoning** — คิดเป็น

### 3.5 ข้อเสีย

- ❌ **Unpredictable** — คาดเดายาก
- ❌ **Cost สูง** — หลาย LLM Calls
- ❌ **Latency** — ช้ากว่า RAG
- ❌ **Debugging ยาก** — ซับซ้อน
- ❌ **Safety** — เสี่ยง Action ผิด

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- ระวัง Infinite Loop
- ระวัง Cost บาน
- ระวัง Tool Misuse
- ระวัง Prompt Injection
- ระวัง Hallucinated Tools

**ข้อห้าม:**
- ❌ ห้ามให้ Agent เข้าถึง Production โดยไม่มี Guardrails
- ❌ ห้ามไม่มี Max Iterations
- ❌ ห้ามไม่มี Human-in-the-Loop สำหรับ Critical Actions
- ❌ ห้ามไม่มี Observability
- ❌ ห้าม Ignore Cost

**ข้อจำกัด:**
- Context Window
- Latency ของแต่ละ Step
- LLM Reasoning Limits
- Tool Reliability

### 3.7 สรุป

Agentic AI เป็นวิวัฒนาการสำคัญ แต่ต้องมี Guardrails, Observability, และ Cost Control

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

```
agent-system/
├── agents/                     # Agent Definitions
│   ├── base.py
│   ├── react_agent.py
│   ├── plan_execute.py
│   ├── reflexion.py
│   └── multi_agent.py
│
├── tools/                      # Tools
│   ├── search.py
│   ├── calculator.py
│   ├── database.py
│   ├── api_client.py
│   └── code_executor.py
│
├── memory/                     # Memory
│   ├── short_term.py
│   ├── long_term.py
│   └── episodic.py
│
├── prompts/                    # Prompts
│   ├── react.txt
│   ├── planner.txt
│   └── reflector.txt
│
├── guardrails/                 # Safety
│   ├── input_filter.py
│   ├── output_filter.py
│   └── action_validator.py
│
├── observability/              # Monitoring
│   ├── tracer.py
│   ├── cost_tracker.py
│   └── metrics.py
│
└── api/
    └── main.py
```

### 4.2 โครงสร้างทำงานอย่างไร

**Agent Execution Flow:**

```
User Goal
    │
    ▼
┌─────────────┐
│  Planner    │ ← วางแผน
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Executor   │ ← เลือก Tool
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Tools     │ ← ลงมือ
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Observer   │ ← สังเกต
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Reflector  │ ← ทบทวน
└──────┬──────┘
       │
   ┌───┴───┐
   │       │
  Done?   No → Loop
   │
   ▼
Response
```

### 4.3 โครงสร้างการใช้งาน

| Layer | Components | หน้าที่ |
|-------|-----------|----------|
| Agent | LLM, Planner | ตัดสินใจ |
| Tools | APIs, DB | ลงมือ |
| Memory | Buffer, Vector | จำ |
| Guardrails | Filters | ป้องกัน |
| Observability | Traces | ติดตาม |

### 4.4 สรุป

โครงสร้าง Agent ที่ดีต้องมี Guardrails, Memory, และ Observability

---

## 5. แนวทางการประยุกต์ใช้

**Framework:**

```
1. เริ่มจาก Simple Agent
   - ReAct Pattern
   - 2-3 Tools

2. เพิ่ม Memory
   - Short-term: Buffer
   - Long-term: Vector Store

3. เพิ่ม Guardrails
   - Input/Output Filter
   - Action Validator
   - Human-in-the-Loop

4. เพิ่ม Observability
   - LangSmith, Langfuse
   - Cost Tracking
   - Latency Metrics

5. Scale เป็น Multi-Agent
   - Supervisor Pattern
   - Specialized Agents

6. Optimize
   - Caching
   - Async
   - Smaller Models for Simple Tasks
```

**Guardrails Implementation:**

```python
class ActionValidator:
    DANGEROUS_ACTIONS = ["delete", "drop", "truncate", "rm -rf"]
    
    def validate(self, action: str, params: dict) -> bool:
        # Check action type
        if any(d in action.lower() for d in self.DANGEROUS_ACTIONS):
            raise UnsafeActionError(f"Action '{action}' is not allowed")
        
        # Check params
        if "sql" in params:
            self._validate_sql(params["sql"])
        
        # Rate limit
        if not self.rate_limiter.allow():
            raise RateLimitError()
        
        return True
    
    def _validate_sql(self, sql: str):
        # ห้าม DROP, DELETE, UPDATE โดยไม่มี WHERE
        if re.search(r"\b(DROP|TRUNCATE)\b", sql, re.I):
            raise UnsafeActionError("DDL not allowed")
        if re.search(r"\b(DELETE|UPDATE)\b", sql, re.I) and "WHERE" not in sql.upper():
            raise UnsafeActionError("DELETE/UPDATE requires WHERE")
```

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา: Customer Support Agent**

**Requirements:**
- ตอบคำถามลูกค้า
- ค้นหาข้อมูลใน KB
- สร้าง Ticket
- Escalate เมื่อจำเป็น

**Architecture:**

```python
class CustomerSupportAgent:
    def __init__(self, llm, tools, memory, guardrails):
        self.llm = llm
        self.tools = tools
        self.memory = memory
        self.guardrails = guardrails
    
    def handle(self, user_message: str, user_id: str):
        # 1. Guardrail Check
        self.guardrails.validate_input(user_message)
        
        # 2. Load Context
        history = self.memory.get_history(user_id)
        kb_context = self.tools["search_kb"].run(user_message)
        
        # 3. Decide Action
        action = self._decide_action(user_message, history, kb_context)
        
        # 4. Execute
        if action["type"] == "answer":
            response = self._generate_answer(action["context"])
        elif action["type"] == "create_ticket":
            ticket = self.tools["create_ticket"].run(action["params"])
            response = f"สร้าง Ticket #{ticket.id} เรียบร้อย"
        elif action["type"] == "escalate":
            self.tools["escalate"].run(user_id, action["reason"])
            response = "กำลังส่งต่อให้เจ้าหน้าที่"
        
        # 5. Save
        self.memory.save(user_id, user_message, response)
        
        # 6. Guardrail Output
        self.guardrails.validate_output(response)
        
        return response
```

**Metrics:**

| Metric | Target |
|--------|--------|
| Resolution Rate | > 70% |
| Avg Steps | < 5 |
| Latency P99 | < 5s |
| Cost per Conversation | < $0.10 |
| Escalation Rate | < 20% |

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| Infinite Loop | ไม่มี Max Iterations | ตั้ง Limit |
| Cost บาน | หลาย LLM Calls | Cache, Smaller Models |
| Hallucinated Tools | Prompt ไม่ชัด | Tool Schema ชัด |
| Unsafe Actions | ไม่มี Guardrails | Action Validator |
| Debugging ยาก | หลาย Steps | Tracing, LangSmith |
| Latency สูง | Sequential | Parallel, Async |
| Prompt Injection | ไม่มี Filter | Input Sanitization |

---

# บทที่ 3: LLM Platform Engineering

## 1. บทนำ

เมื่อ AI Systems เติบโตจาก Prototype สู่ Production สิ่งที่สำคัญไม่ใช่แค่ Model แต่คือ **Platform** ที่รองรับการ Deploy, Scale, Monitor, และ Evolve AI Systems อย่างยั่งยืน

LLM Platform Engineering คือสาขาที่ว่าด้วยการสร้าง Infrastructure และ Tooling สำหรับ AI Systems ตั้งแต่ Model Serving, Prompt Management, Evaluation ไปจนถึง Cost Optimization และ Observability

บทนี้จะพาคุณเข้าใจ Platform Engineering สำหรับ LLM ตั้งแต่ต้นจนจบ

## 2. บทนิยาม

**LLM Platform** หมายถึง ชุดของ Infrastructure, Services, และ Tooling ที่รองรับการพัฒนา Deploy และดูแล AI Applications

**องค์ประกอบหลัก:**

| องค์ประกอบ | หน้าที่ |
|-----------|----------|
| **Model Serving** | ให้บริการ LLM |
| **Prompt Management** | จัดการ Prompts |
| **Evaluation** | วัดผล |
| **Observability** | ติดตาม |
| **Cost Management** | ควบคุมค่าใช้จ่าย |
| **Safety** | ป้องกัน |

**Evolution Phases:**

```
Prototype → Product → Platform

Prototype:
- Jupyter Notebook
- Hardcoded Prompts
- Manual Testing

Product:
- FastAPI Service
- Versioned Prompts
- Basic Monitoring

Platform:
- Multi-Model Serving
- Prompt Registry
- A/B Testing
- Full Observability
- Cost Optimization
```

## 3. บทหัวข้อ

### 3.1 LLM Platform คืออะไร

**Platform Architecture:**

```
┌─────────────────────────────────────────────┐
│              Developer Portal               │
│  (Prompt IDE, Evaluation, Deployment)       │
└──────────────────┬──────────────────────────┘
                   │
┌──────────────────▼──────────────────────────┐
│              API Gateway                    │
│  (Auth, Rate Limit, Routing)                │
└──────────────────┬──────────────────────────┘
                   │
        ┌──────────┼──────────┐
        ▼          ▼          ▼
   ┌─────────┐ ┌─────────┐ ┌─────────┐
   │ Prompt  │ │ Model   │ │ Eval    │
   │ Registry│ │ Gateway │ │ Service │
   └────┬────┘ └────┬────┘ └────┬────┘
        │           │           │
        └───────────┼───────────┘
                    │
        ┌───────────┼───────────┐
        ▼           ▼           ▼
   ┌─────────┐ ┌─────────┐ ┌─────────┐
   │ Vector  │ │  Cache  │ │Observ-  │
   │ Store   │ │ (Redis) │ │ability  │
   └─────────┘ └─────────┘ └─────────┘
```

**Key Services:**

| Service | หน้าที่ | Tools |
|---------|----------|-------|
| **Model Gateway** | Route ไปยัง LLM | LiteLLM, OpenRouter |
| **Prompt Registry** | จัดการ Prompts | Langfuse, PromptLayer |
| **Evaluation** | วัดผล | RAGAS, DeepEval |
| **Observability** | ติดตาม | Langfuse, LangSmith |
| **Cache** | ลด Cost | Redis, GPTCache |
| **Vector Store** | เก็บ Embeddings | Milvus, Qdrant |

### 3.2 ทำงานอย่างไร

**Model Gateway (LiteLLM):**

```python
from litellm import Router

router = Router(
    model_list=[
        {
            "model_name": "gpt-4o",
            "litellm_params": {
                "model": "azure/gpt-4o",
                "api_key": "...",
                "api_base": "...",
            },
        },
        {
            "model_name": "gpt-4o",
            "litellm_params": {
                "model": "openai/gpt-4o",
                "api_key": "...",
            },
        },
        {
            "model_name": "claude",
            "litellm_params": {
                "model": "anthropic/claude-3-5-sonnet",
                "api_key": "...",
            },
        },
    ],
    routing_strategy="latency-based-routing",
    fallbacks=[{"gpt-4o": ["claude"]}],
    num_retries=3,
    timeout=30,
    cache_responses=True,
)

response = router.completion(
    model="gpt-4o",
    messages=[{"role": "user", "content": "Hello"}],
    metadata={"user_id": "user123", "trace_id": "trace456"},
)
```

**Prompt Registry:**

```python
from langfuse import Langfuse

langfuse = Langfuse()

# ดึง Prompt จาก Registry
prompt = langfuse.get_prompt(
    name="rag-qa",
    version=3,  # หรือ label="production"
)

# ใช้งาน
response = llm.complete(
    prompt.compile(
        context=retrieved_context,
        query=user_query,
    )
)

# บันทึก Trace
trace = langfuse.trace(
    name="rag-query",
    user_id="user123",
    metadata={"session_id": "sess456"},
)

generation = trace.generation(
    name="llm-call",
    model="gpt-4o",
    input=messages,
    output=response.text,
    usage={"input": 100, "output": 50},
)
```

**Evaluation Pipeline:**

```python
from ragas import evaluate
from ragas.metrics import (
    faithfulness,
    answer_relevancy,
    context_precision,
    context_recall,
)
from datasets import Dataset

# เตรียม Dataset
eval_dataset = Dataset.from_dict({
    "question": [...],
    "answer": [...],
    "contexts": [...],
    "ground_truth": [...],
})

# รัน Evaluation
result = evaluate(
    dataset=eval_dataset,
    metrics=[
        faithfulness,
        answer_relevancy,
        context_precision,
        context_recall,
    ],
    llm=evaluator_llm,
    embeddings=evaluator_embeddings,
)

print(result)
# {'faithfulness': 0.92, 'answer_relevancy': 0.88, ...}

# บันทึกผล
langfuse.score(
    trace_id=trace.id,
    name="faithfulness",
    value=result["faithfulness"],
)
```

**Caching Strategy:**

```python
from langchain.cache import RedisSemanticCache
from langchain.globals import set_llm_cache
from langchain_openai import OpenAIEmbeddings
import redis

# Semantic Cache
set_llm_cache(RedisSemanticCache(
    redis_url="redis://localhost:6379",
    embedding=OpenAIEmbeddings(),
    score_threshold=0.95,
))

# ตอนนี้ LLM Calls ที่คล้ายกันจะ Hit Cache
response1 = llm.invoke("What is Python?")
response2 = llm.invoke("Tell me about Python")  # Hit cache
```

**Observability:**

```python
from opentelemetry import trace
from opentelemetry.exporter.otlp.proto.grpc.trace_exporter import OTLPSpanExporter
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor

# Setup
provider = TracerProvider()
processor = BatchSpanProcessor(OTLPSpanExporter(endpoint="http://jaeger:4317"))
provider.add_span_processor(processor)
trace.set_tracer_provider(provider)

tracer = trace.get_tracer(__name__)

# Instrument
with tracer.start_as_current_span("rag-query") as span:
    span.set_attribute("user.id", user_id)
    span.set_attribute("query.text", query)
    
    with tracer.start_as_current_span("retrieval"):
        context = retrieve(query)
        span.set_attribute("retrieval.count", len(context))
    
    with tracer.start_as_current_span("llm-call"):
        response = llm.generate(query, context)
        span.set_attribute("llm.tokens.input", response.usage.input)
        span.set_attribute("llm.tokens.output", response.usage.output)
```

### 3.3 การใช้งาน

**Platform ใช้เมื่อ:**

1. **หลายทีม** — แชร์ Infrastructure
2. **หลาย Models** — สลับ Model
3. **Production** — ต้องการ Reliability
4. **Cost Concern** — ต้องควบคุม
5. **Compliance** — ต้อง Audit

### 3.4 ข้อดี

- ✅ **Consistency** — มาตรฐานเดียวกัน
- ✅ **Reusability** — ใช้ซ้ำได้
- ✅ **Observability** — ติดตามได้
- ✅ **Cost Control** — ควบคุมได้
- ✅ **Faster Iteration** — พัฒนาเร็ว

### 3.5 ข้อเสีย

- ❌ **Initial Investment** — ลงทุนสูง
- ❌ **Complexity** — ซับซ้อน
- ❌ **Maintenance** — ต้องดูแล
- ❌ **Over-Engineering** — สำหรับทีมเล็ก

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- ระวัง Vendor Lock-in
- ระวัง Cost บาน
- ระวัง Latency เพิ่ม
- ระวัง Data Privacy

**ข้อห้าม:**
- ❌ ห้าม Build Platform ก่อนมี Use Case
- ❌ ห้าม Ignore Cost
- ❌ ห้ามเก็บ PII ใน Logs
- ❌ ห้ามใช้ Production เป็น Playground
- ❌ ห้าม Ignore Security

**ข้อจำกัด:**
- Cost ของ Observability
- Latency ของ Gateway
- Complexity ของ Multi-Model
- Team Maturity

### 3.7 สรุป

LLM Platform Engineering เป็นสิ่งที่ขาดไม่ได้สำหรับ Enterprise AI แต่ต้อง Build เมื่อจำเป็น

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

```
llm-platform/
├── gateway/                    # Model Gateway
│   ├── router.py               # LiteLLM Router
│   ├── fallbacks.py
│   └── rate_limit.py
│
├── prompts/                    # Prompt Registry
│   ├── registry.py
│   ├── templates/
│   │   ├── rag-qa.yaml
│   │   └── agent.yaml
│   └── versioning.py
│
├── evaluation/                 # Evaluation
│   ├── datasets/
│   ├── metrics/
│   │   ├── ragas.py
│   │   └── custom.py
│   └── runner.py
│
├── observability/              # Observability
│   ├── tracing.py              # OpenTelemetry
│   ├── logging.py
│   ├── metrics.py
│   └── langfuse_client.py
│
├── cache/                      # Caching
│   ├── semantic.py
│   ├── exact.py
│   └── redis_client.py
│
├── safety/                     # Safety
│   ├── input_filter.py
│   ├── output_filter.py
│   └── pii_detector.py
│
├── cost/                       # Cost Management
│   ├── tracker.py
│   ├── budgets.py
│   └── alerts.py
│
└── api/
    └── main.py
```

### 4.2 โครงสร้างทำงานอย่างไร

**Request Flow:**

```
Client → API Gateway → Auth → Rate Limit
                              │
                              ▼
                        Model Gateway
                              │
                    ┌─────────┼─────────┐
                    ▼         ▼         ▼
                 Cache    Prompt    Safety
                 Check    Registry  Filter
                    │         │         │
                    └─────────┼─────────┘
                              │
                              ▼
                         LLM Provider
                              │
                              ▼
                        Observability
                              │
                              ▼
                          Response
```

### 4.3 โครงสร้างการใช้งาน

| Layer | Components | หน้าที่ |
|-------|-----------|----------|
| Gateway | Router, Rate Limit | Routing |
| Prompts | Registry, Versioning | จัดการ Prompt |
| Evaluation | Metrics, Datasets | วัดผล |
| Observability | Tracing, Logs | ติดตาม |
| Safety | Filters, PII | ป้องกัน |

### 4.4 สรุป

โครงสร้าง Platform ที่ดีต้อง Modular และ Observability-First

---

## 5. แนวทางการประยุกต์ใช้

**Framework:**

```
1. เริ่มจาก Single Service
   - FastAPI + OpenAI
   - Basic Logging

2. เพิ่ม Model Gateway
   - LiteLLM
   - Fallbacks

3. เพิ่ม Prompt Registry
   - Langfuse
   - Versioning

4. เพิ่ม Observability
   - OpenTelemetry
   - Langfuse

5. เพิ่ม Evaluation
   - RAGAS
   - A/B Testing

6. เพิ่ม Cost Management
   - Budgets
   - Alerts

7. เพิ่ม Safety
   - Input/Output Filter
   - PII Detection
```

**Cost Optimization:**

| เทคนิค | ประหยัด |
|--------|---------|
| Semantic Cache | 40-60% |
| Prompt Compression | 20-30% |
| Smaller Models | 50-80% |
| Batch Processing | 30-50% |
| Streaming | - |

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา: Enterprise LLM Platform**

**Requirements:**
- 10 Teams
- 5 Models (OpenAI, Azure, Anthropic, LLaMA)
- 1M Requests/day
- Cost < $10K/day

**Architecture:**

```
┌─────────────────────────────────────────────┐
│              Kubernetes (AKS)               │
│  ┌─────────────────────────────────────┐    │
│  │         API Gateway (Kong)          │    │
│  └──────────────┬──────────────────────┘    │
│                 │                            │
│  ┌──────────────▼──────────────────────┐    │
│  │      LiteLLM Router (HPA)           │    │
│  │      - Load Balancing               │    │
│  │      - Fallbacks                    │    │
│  │      - Caching                      │    │
│  └──────────────┬──────────────────────┘    │
│                 │                            │
│  ┌──────────────┼──────────────────────┐    │
│  │              │                      │    │
│  ▼              ▼                      ▼    │
│ ┌─────┐      ┌─────┐                ┌─────┐ │
│ │Redis│      │Lang-│                │Milvus│ │
│ │Cache│      │fuse │                │      │ │
│ └─────┘      └─────┘                └─────┘ │
│                                              │
│  ┌─────────────────────────────────────┐    │
│  │      Observability Stack            │    │
│  │  - OpenTelemetry                    │    │
│  │  - Prometheus                       │    │
│  │  - Grafana                          │    │
│  │  - Jaeger                           │    │
│  └─────────────────────────────────────┘    │
└─────────────────────────────────────────────┘
```

**Results:**
- Cost: ลด 55% ด้วย Caching
- Latency: P99 < 2s
- Availability: 99.95%
- Teams: 10 teams, 30+ Applications

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| Cost บาน | ไม่มี Budget | Budgets, Alerts |
| Latency สูง | Gateway Overhead | Optimize, Cache |
| Vendor Lock-in | ใช้ SDK ตรง | LiteLLM Abstraction |
| Data Leak | ไม่มี Filter | PII Detection |
| Debugging ยาก | Distributed | Tracing |
| Prompt Drift | ไม่มี Versioning | Prompt Registry |
| Model Deprecation | ใช้ Version เก่า | Multi-Model Strategy |

---

# บทที่ 4: Production AI Case Studies

## 1. บทนำ

ทฤษฎีสำคัญ แต่การนำไปใช้จริงคือสิ่งที่ท้าทายที่สุด บทนี้จะพาคุณผ่าน Case Studies จาก Production จริง ตั้งแต่ RAG System สำหรับ Enterprise, Agentic AI สำหรับ Customer Support, ไปจนถึง LLM Platform สำหรับองค์กรขนาดใหญ่

## 2. บทนิยาม

**Production AI** หมายถึง AI Systems ที่ทำงานจริงในสภาพแวดล้อม Production รองรับผู้ใช้จริง มี SLA และต้องดูแลอย่างต่อเนื่อง

## 3. บทหัวข้อ

### 3.1 Case Studies คืออะไร

**Case Studies ที่จะกล่าวถึง:**

1. **Enterprise RAG** — Q&A จากเอกสาร 100K+
2. **Customer Support Agent** — Agentic AI
3. **Code Assistant** — AI สำหรับ Developers
4. **Document Processing** — OCR + LLM
5. **LLM Platform** — Platform สำหรับองค์กร

### 3.2 ทำงานอย่างไร

**Case 1: Enterprise RAG System**

**Requirements:**
- 100K เอกสาร (PDF, Word, Excel)
- 10K Users
- ไทย + อังกฤษ
- P99 < 3s
- Citations

**Architecture:**

```python
# Ingestion Pipeline
class IngestionPipeline:
    def __init__(self):
        self.loader = LlamaParseLoader(language="th")
        self.chunker = SemanticChunker(
            embed_model=CohereEmbedding("embed-multilingual-v3.0"),
            breakpoint_percentile=95,
        )
        self.embedder = CohereEmbedding("embed-multilingual-v3.0")
        self.vector_store = MilvusVectorStore(
            collection="documents",
            dim=1024,
            index_type="HNSW",
        )
    
    async def ingest(self, file_path: str):
        # 1. Load
        docs = await self.loader.load(file_path)
        
        # 2. Enrich Metadata
        for doc in docs:
            doc.metadata.update({
                "source": file_path,
                "department": extract_department(file_path),
                "classification": classify(doc.text),
                "language": detect_language(doc.text),
            })
        
        # 3. Chunk
        nodes = self.chunker.get_nodes_from_documents(docs)
        
        # 4. Embed (Batch)
        embeddings = await self.embedder.embed_batch(
            [n.text for n in nodes],
            batch_size=96,
        )
        
        # 5. Store
        await self.vector_store.upsert(nodes, embeddings)
        
        return len(nodes)

# Query Pipeline
class QueryPipeline:
    def __init__(self):
        self.query_transform = HyDEQueryTransform()
        self.retriever = HybridRetriever(
            vector_store=self.vector_store,
            bm25_index=self.bm25,
            fusion="reciprocal_rerank",
        )
        self.reranker = CohereRerank("rerank-multilingual-v3.0")
        self.llm = AzureOpenAI("gpt-4o")
        self.cache = SemanticCache(redis_client, threshold=0.95)
    
    async def query(self, question: str, user_id: str):
        # 1. Cache Check
        cached = await self.cache.get(question)
        if cached:
            return cached
        
        # 2. Query Transform
        transformed = await self.query_transform(question)
        
        # 3. Retrieve
        candidates = await self.retriever.retrieve(
            transformed, top_k=20
        )
        
        # 4. Rerank
        reranked = await self.reranker.rerank(
            question, candidates, top_n=5
        )
        
        # 5. Generate (Streaming)
        response = await self.llm.generate_stream(
            prompt=RAG_PROMPT,
            context=reranked,
            query=question,
        )
        
        # 6. Cache
        await self.cache.set(question, response)
        
        return response
```

**Results:**
| Metric | Before | After |
|--------|--------|-------|
| Answer Accuracy | 65% | 92% |
| Latency P99 | 8s | 2.5s |
| Cost/Query | $0.05 | $0.02 |
| User Satisfaction | 3.2/5 | 4.5/5 |

**Case 2: Customer Support Agent**

**Requirements:**
- ตอบคำถามลูกค้า
- สร้าง Ticket
- Escalate
- หลายภาษา

**Architecture:**

```python
from langgraph.graph import StateGraph, END
from langgraph.checkpoint.sqlite import SqliteSaver

class SupportState(TypedDict):
    messages: list
    user_id: str
    intent: str
    context: dict
    action_taken: str

# Nodes
async def classify_intent(state):
    intent = await classifier.classify(state["messages"][-1])
    return {"intent": intent}

async def retrieve_kb(state):
    context = await kb_retriever.retrieve(state["messages"][-1])
    return {"context": context}

async def decide_action(state):
    action = await action_decider.decide(state)
    return {"action_taken": action}

async def answer_question(state):
    response = await llm.generate(state)
    return {"messages": [response]}

async def create_ticket(state):
    ticket = await ticketing.create(state)
    return {"messages": [f"สร้าง Ticket #{ticket.id}"]}

async def escalate(state):
    await escalation.escalate(state["user_id"])
    return {"messages": ["กำลังส่งต่อให้เจ้าหน้าที่"]}

# Graph
graph = StateGraph(SupportState)
graph.add_node("classify", classify_intent)
graph.add_node("retrieve", retrieve_kb)
graph.add_node("decide", decide_action)
graph.add_node("answer", answer_question)
graph.add_node("ticket", create_ticket)
graph.add_node("escalate", escalate)

graph.set_entry_point("classify")
graph.add_edge("classify", "retrieve")
graph.add_edge("retrieve", "decide")
graph.add_conditional_edges(
    "decide",
    lambda x: x["action_taken"],
    {
        "answer": "answer",
        "ticket": "ticket",
        "escalate": "escalate",
    }
)
graph.add_edge("answer", END)
graph.add_edge("ticket", END)
graph.add_edge("escalate", END)

app = graph.compile(checkpointer=SqliteSaver.from_conn_string(":memory:"))
```

**Results:**
| Metric | Target | Actual |
|--------|--------|--------|
| Auto-Resolution | 70% | 73% |
| Avg Handle Time | < 2 min | 1.5 min |
| CSAT | > 4.0 | 4.3 |
| Cost/Ticket | < $0.20 | $0.15 |
| Escalation | < 20% | 17% |

**Case 3: LLM Platform**

**Requirements:**
- 10 Teams, 30+ Applications
- 5 LLM Providers
- 1M Requests/day
- Cost Control

**Architecture:**

```python
# Model Gateway
class ModelGateway:
    def __init__(self):
        self.router = LiteLLM.Router(
            model_list=MODEL_CONFIGS,
            routing_strategy="cost-based-routing",
            fallbacks=FALLBACK_MAP,
            cache=RedisCache(),
        )
        self.cost_tracker = CostTracker()
        self.guardrails = Guardrails()
    
    async def complete(self, request: CompletionRequest):
        # 1. Guardrails
        await self.guardrails.validate(request)
        
        # 2. Route
        model = self.select_model(request)
        
        # 3. Execute
        response = await self.router.acompletion(
            model=model,
            messages=request.messages,
            metadata={
                "user_id": request.user_id,
                "app_id": request.app_id,
                "trace_id": request.trace_id,
            },
        )
        
        # 4. Track Cost
        await self.cost_tracker.track(
            app_id=request.app_id,
            model=model,
            tokens=response.usage,
        )
        
        # 5. Trace
        await self.tracer.trace(request, response)
        
        return response
    
    def select_model(self, request):
        # Cost-based routing
        if request.complexity == "low":
            return "gpt-4o-mini"
        elif request.complexity == "medium":
            return "gpt-4o"
        else:
            return "claude-3-5-sonnet"
```

**Results:**
| Metric | Before | After |
|--------|--------|-------|
| Cost/day | $18K | $8K |
| Latency P99 | 5s | 2s |
| Availability | 95% | 99.9% |
| Teams | 3 | 10 |
| Applications | 5 | 30+ |

### 3.3 การใช้งาน

**Case Studies ใช้เพื่อ:**
- เรียนรู้จากประสบการณ์จริง
- เห็น Patterns ที่ใช้ซ้ำ
- เข้าใจ Trade-offs
- เตรียมพร้อมสำหรับ Production

### 3.4 ข้อดี

- ✅ **Practical** — ใช้จริงได้
- ✅ **Proven** — ผ่านการพิสูจน์
- ✅ **Pattern Recognition** — เห็น Pattern
- ✅ **Trade-offs** — เข้าใจการตัดสินใจ

### 3.5 ข้อเสีย

- ❌ **Context-specific** — ใช้กับทุกอย่างไม่ได้
- ❌ **Simplified** — ไม่ครอบคลุม Edge Cases
- ❌ **Outdated** — เทคโนโลยีเปลี่ยนเร็ว

### 3.6 ข้อควรระวัง / ข้อห้าม / ข้อจำกัด

**ข้อควรระวัง:**
- อย่า Copy Architecture โดยไม่เข้าใจ Context
- อย่าละเลย Constraints จริง
- อย่า Over-Engineer

**ข้อห้าม:**
- ❌ ห้ามใช้ Architecture ของ Google กับ Startup
- ❌ ห้าม Ignore Cost
- ❌ ห้าม Ignore Team Size

### 3.7 สรุป

Case Studies เป็นเครื่องมือฝึกคิด ไม่ใช่ Template ที่ Copy ได้ทุกบริบท

---

## 4. โครงสร้าง (Structure)

### 4.1 โครงสร้างคืออะไร

```
Production AI System:
├── Data Layer
│   ├── Ingestion
│   ├── Storage
│   └── Processing
├── Model Layer
│   ├── Serving
│   ├── Routing
│   └── Caching
├── Application Layer
│   ├── RAG
│   ├── Agents
│   └── Workflows
├── Platform Layer
│   ├── Observability
│   ├── Evaluation
│   └── Safety
└── Operations Layer
    ├── CI/CD
    ├── Monitoring
    └── Incident Response
```

### 4.2 โครงสร้างทำงานอย่างไร

**End-to-End Flow:**

```
User Request
    │
    ▼
┌─────────────┐
│  API Gateway│
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Guardrails │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Cache      │ ← Hit? Return
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Router     │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Retrieval  │ (ถ้า RAG)
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  LLM Call   │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Post-proc  │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Observability│
└──────┬──────┘
       │
       ▼
Response
```

### 4.3 โครงสร้างการใช้งาน

| Layer | Components | หน้าที่ |
|-------|-----------|----------|
| Data | Loaders, Stores | จัดการข้อมูล |
| Model | Routers, Caches | ให้บริการ Model |
| Application | RAG, Agents | Business Logic |
| Platform | Observability | ติดตาม |
| Operations | CI/CD | Deploy |

### 4.4 สรุป

Production AI System ต้องมีครบทุก Layer และ Observability-First

---

## 5. แนวทางการประยุกต์ใช้

**Framework:**

```
1. เริ่มจาก MVP
   - Simple RAG
   - 1 Model
   - Basic Monitoring

2. เพิ่ม Reliability
   - Fallbacks
   - Retries
   - Caching

3. เพิ่ม Quality
   - Reranking
   - Evaluation
   - A/B Testing

4. เพิ่ม Scale
   - Multi-Model
   - Platform
   - Auto-scaling

5. เพิ่ม Safety
   - Guardrails
   - PII Detection
   - Audit Logs

6. Optimize
   - Cost
   - Latency
   - Quality
```

**Lessons Learned:**

| บทเรียน | รายละเอียด |
|---------|-----------|
| **Start Simple** | อย่า Over-Engineer ตอนแรก |
| **Measure Everything** | วัดผลทุกอย่าง |
| **Cache Aggressively** | Cache ลด Cost ได้มาก |
| **Guardrails First** | Safety ต้องมาก่อน |
| **Observability** | ต้องมีตั้งแต่ Day 1 |
| **Cost Control** | Budgets, Alerts |
| **Iterate Fast** | Deploy บ่อย วัดผลเร็ว |

---

## 6. การนำไปใช้งานจริง

**กรณีศึกษา: Document Processing System**

**Requirements:**
- 1M เอกสาร/เดือน
- OCR ไทย + อังกฤษ
- สกัดข้อมูล
- ส่งเข้า RAG

**Architecture:**

```python
class DocumentProcessor:
    def __init__(self):
        self.ocr = AzureDocumentIntelligence()
        self.classifier = DocumentClassifier()
        self.extractor = FieldExtractor()
        self.validator = DataValidator()
        self.rag_ingester = RAGIngester()
    
    async def process(self, document: bytes, doc_type: str = None):
        # 1. OCR
        text = await self.ocr.extract(document)
        
        # 2. Classify
        if not doc_type:
            doc_type = await self.classifier.classify(text)
        
        # 3. Extract Fields
        fields = await self.extractor.extract(text, doc_type)
        
        # 4. Validate
        validation = await self.validator.validate(fields, doc_type)
        if not validation.is_valid:
            return ProcessingResult(
                status="NEEDS_REVIEW",
                errors=validation.errors,
            )
        
        # 5. Ingest to RAG
        await self.rag_ingester.ingest(text, {
            "doc_type": doc_type,
            "fields": fields,
            "source": "ocr_pipeline",
        })
        
        return ProcessingResult(
            status="SUCCESS",
            fields=fields,
        )
```

**Results:**
| Metric | Target | Actual |
|--------|--------|--------|
| Throughput | 40K/day | 45K/day |
| Accuracy | 95% | 97% |
| Cost/Doc | $0.05 | $0.03 |
| Review Rate | < 10% | 7% |

---

## 7. ปัญหาและแนวทางแก้ไข

| ปัญหา | สาเหตุ | แนวทางแก้ไข |
|-------|--------|-------------|
| Cost บาน | ไม่มี Budget | Budgets, Alerts |
| Latency สูง | หลาย Stages | Cache, Async |
| Accuracy ต่ำ | Retrieval แย่ | Reranking, Fine-tune |
| Hallucination | Context ไม่พอ | Citations, Guardrails |
| Data Leak | ไม่มี Filter | PII Detection |
| Model Deprecation | ใช้ Version เก่า | Multi-Model |
| Vendor Lock-in | ใช้ SDK ตรง | Abstraction Layer |

---

# 📘 สรุปเล่มที่ 7

**สิ่งที่ได้เรียนรู้:**

1. **RAG Pipeline** — Ingestion, Retrieval, Generation
2. **Agentic AI** — ReAct, Plan-Execute, Multi-Agent
3. **LLM Platform** — Gateway, Registry, Observability
4. **Case Studies** — RAG, Agent, Platform

**คำแนะนำ:**
- เริ่มจาก RAG พื้นฐาน
- เพิ่ม Agent เมื่อจำเป็น
- Build Platform เมื่อ Scale
- วัดผลทุกอย่าง
- ใส่ใจ Cost และ Safety

**หนังสือแนะนำ:**
- "Building LLM Powered Applications" — Valentina Alto
- "AI Engineering" — Chip Huyen
- "Prompt Engineering for LLMs" — John Berryman
- "Building Agents with LLMs" — Various Authors
- "Designing Machine Learning Systems" — Chip Huyen

---

# 📘 สรุปชุดคู่มือ Software Architecture (ทั้ง 7 เล่ม)

| เล่ม | ชื่อ | หัวข้อหลัก |
|------|------|-----------|
| **1** | รากฐานการคำนวณ | Data Structures, Algorithms, Big O |
| **2** | กระบวนทัศน์การเขียนโปรแกรม | OOP, FP, Design Patterns |
| **3** | การออกแบบระบบ | System Design, Scalability, Distributed |
| **4** | สถาปัตยกรรมซอฟต์แวร์ | Clean, Hexagonal, Event-Driven |
| **5** | Domain-Driven Design | Strategic, Tactical, Practice |
| **6** | DevOps & Cloud | CI/CD, AWS, IaC |
| **7** | AI Systems Architecture | RAG, Agentic AI, LLM Platform |

**เส้นทางการเรียนรู้:**

```
Foundation (1-2) → Design (3-4) → Domain (5) → Ops (6) → AI (7)
     6 เดือน          6 เดือน        3 เดือน      3 เดือน    3 เดือน
```

**ข้อความส่งท้าย:**

> "Architecture is not about predicting the future. It's about making decisions that let you change your mind later — cheaply."

พื้นฐานที่แข็งแรง + สถาปัตยกรรมที่ยืดหยุ่น + การลงมือทำจริง = วิศวกรซอฟต์แวร์ที่ยั่งยืนในทุกยุคเทคโนโลยี

---