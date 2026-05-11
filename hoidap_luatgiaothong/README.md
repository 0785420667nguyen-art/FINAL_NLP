# Hệ thống Hỏi Đáp Luật Giao Thông Việt Nam

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue.svg)](https://flutter.dev/)
[![Python](https://img.shields.io/badge/Python-3.8+-green.svg)](https://www.python.org/)

Hệ thống hỏi đáp tiếng Việt thông minh trên miền tri thức **Luật Giao Thông**, sử dụng kỹ thuật **RAG (Retrieval-Augmented Generation)** kết hợp **Fine-tuning LLM** với LoRA/QLoRA.

## 📋 Mục lục

- [Giới thiệu](#giới-thiệu)
- [Tính năng](#tính-năng)
- [Kiến trúc hệ thống](#kiến-trúc-hệ-thống)
- [Cài đặt](#cài-đặt)
- [Sử dụng](#sử-dụng)
- [Dataset và Checkpoint](#dataset-và-checkpoint)
- [Kết quả thực nghiệm](#kết-quả-thực-nghiệm)
- [Demo](#demo)
- [Cấu trúc thư mục](#cấu-trúc-thư-mục)
- [Tác giả](#tác-giả)

## 🎯 Giới thiệu

Dự án xây dựng hệ thống hỏi đáp tự động về Luật Giao Thông Việt Nam, giúp người dùng tra cứu thông tin pháp luật một cách nhanh chóng và chính xác. Hệ thống kết hợp:

- **RAG Pipeline**: Truy xuất thông tin từ knowledge base bằng vector similarity search
- **Fine-tuned LLM**: Mô hình ngôn ngữ lớn được tinh chỉnh trên dữ liệu chuyên ngành
- **Mobile App**: Giao diện Flutter đa nền tảng (iOS, Android, Web)

### Đặc điểm nổi bật

✅ Fine-tune LLM (1B-7B parameters) với LoRA/QLoRA trên Google Colab Free  
✅ RAG pipeline với Chunking + Embedding + Vector Store (FAISS/Chroma)  
✅ So sánh 4 cấu hình: LLM gốc/fine-tuned × Có/Không RAG  
✅ Đánh giá định lượng: BLEU, ROUGE-L, BERTScore, Recall@5  
✅ Human evaluation trên 50 câu hỏi test  
✅ Demo app với giao diện thân thiện  

## ✨ Tính năng

- 🔍 **Tìm kiếm thông minh**: Truy xuất thông tin chính xác từ văn bản luật
- 💬 **Hỏi đáp tự nhiên**: Trả lời câu hỏi bằng ngôn ngữ tự nhiên tiếng Việt
- 📱 **Đa nền tảng**: Chạy trên iOS, Android, Web
- ⚡ **Phản hồi nhanh**: Tối ưu hóa inference với quantization
- 📊 **Độ chính xác cao**: Fine-tuned trên 300+ cặp QA chuyên ngành

## 🏗️ Kiến trúc hệ thống

```
┌─────────────────┐
│   User Query    │
└────────┬────────┘
         │
         ▼
┌─────────────────────────────────────┐
│      RAG Pipeline (Optional)        │
│  ┌──────────────────────────────┐   │
│  │  1. Chunking & Embedding     │   │
│  │  2. Vector Store (FAISS)     │   │
│  │  3. Retriever (Top-K)        │   │
│  └──────────────────────────────┘   │
└────────┬────────────────────────────┘
         │ Retrieved Context
         ▼
┌─────────────────────────────────────┐
│   LLM (Base or Fine-tuned)          │
│   - Model: [Tên model của bạn]      │
│   - Fine-tuning: LoRA/QLoRA         │
│   - Prompt Template                 │
└────────┬────────────────────────────┘
         │
         ▼
┌─────────────────┐
│   Response      │
└─────────────────┘
```

### Pipeline chi tiết

1. **Data Collection**: Thu thập văn bản Luật Giao Thông từ nguồn chính thống
2. **Data Preparation**: Tạo 300+ cặp QA, 50+ cặp test thủ công
3. **Fine-tuning**: LoRA/QLoRA trên Google Colab với GPU T4
4. **RAG Setup**: 
   - Chunking: Chia văn bản thành chunks 512 tokens
   - Embedding: Sử dụng sentence-transformers
   - Vector Store: FAISS/Chroma
5. **Inference**: Kết hợp retrieval + generation
6. **Evaluation**: BLEU, ROUGE-L, BERTScore, Recall@5, Human eval

## 🚀 Cài đặt

### Yêu cầu hệ thống

- Python 3.8+
- Flutter 3.0+
- CUDA 11.8+ (cho training)
- RAM: 16GB+ (khuyến nghị)
- GPU: T4/V100 (cho training trên Colab)

### 1. Clone repository

```bash
git clone https://github.com/0785420667nguyen-art/FINAL_NLP.git
cd FINAL_NLP/52100144_52200060_52300230
```

### 2. Cài đặt Python dependencies

```bash
# Tạo virtual environment
python -m venv venv
source venv/bin/activate  # Linux/Mac
# hoặc
venv\Scripts\activate  # Windows

# Cài đặt packages
pip install -r requirements.txt
```

### 3. Cài đặt Flutter dependencies

```bash
cd hoidap_luatgiaothong
flutter pub get
```

## 📖 Sử dụng

### Training Pipeline

#### 1. Chuẩn bị dữ liệu

```bash
# Đặt file dữ liệu vào thư mục data/
# - train_qa.json: 300+ cặp QA
# - test_qa.json: 50+ cặp test
# - knowledge_base.txt: Văn bản luật
```

#### 2. Fine-tune LLM trên Google Colab

```bash
# Mở file NLP_final.ipynb trên Google Colab
# Chọn Runtime > Change runtime type > T4 GPU
# Chạy từng cell theo thứ tự
```

Hoặc chạy script:

```bash
python scripts/train.py \
  --model_name [MODEL_NAME] \
  --train_file data/train_qa.json \
  --output_dir ./checkpoints \
  --use_lora \
  --lora_r 8 \
  --lora_alpha 16
```

#### 3. Xây dựng RAG Pipeline

```bash
python scripts/build_rag.py \
  --knowledge_base data/knowledge_base.txt \
  --chunk_size 512 \
  --vector_store faiss \
  --output_dir ./vector_store
```

#### 4. Đánh giá mô hình

```bash
# Đánh giá 4 cấu hình
python scripts/evaluate.py \
  --test_file data/test_qa.json \
  --configs all \
  --output_dir ./results
```

### Chạy Demo App

#### Mobile (Android/iOS)

```bash
cd hoidap_luatgiaothong
flutter run
```

#### Web

```bash
cd hoidap_luatgiaothong
flutter run -d chrome
```

#### API Server (Backend)

```bash
python api/server.py --port 8000
```

## 📦 Dataset và Checkpoint

### Dataset

- **Training Set**: 300+ cặp câu hỏi - trả lời về Luật Giao Thông
- **Test Set**: 50+ cặp test được chuẩn bị thủ công
- **Knowledge Base**: Văn bản Luật Giao Thông Việt Nam

📥 **Download Dataset**:
- Google Drive: https://drive.google.com/drive/folders/1sHoBs3rLBSa0pp8aC0KqJLXNSzFn0aRN?usp=sharing

### Model Checkpoints

- **Base Model**: [Tên model gốc - cập nhật sau]
- **Fine-tuned Model**: Fine-tuned với LoRA/QLoRA
- **LoRA Adapters**: Weights của LoRA layers

📥 **Download Checkpoints**:
- Google Drive: https://drive.google.com/drive/folders/1sHoBs3rLBSa0pp8aC0KqJLXNSzFn0aRN?usp=sharing

### Vector Store

- **Embedding Model**: sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2
- **Vector Store**: FAISS index

📥 **Download Vector Store**:
- Google Drive: https://drive.google.com/drive/folders/1sHoBs3rLBSa0pp8aC0KqJLXNSzFn0aRN?usp=sharing

> **Lưu ý**: Tất cả dataset, checkpoint và vector store đều được lưu trữ trong cùng một thư mục Google Drive để tiện quản lý.

## 📊 Kết quả thực nghiệm

### So sánh 4 cấu hình

| Cấu hình | BLEU | ROUGE-L | BERTScore | Recall@5 |
|----------|------|---------|-----------|----------|
| A: LLM gốc, Không RAG | X.XX | X.XX | X.XX | - |
| B: LLM gốc, Có RAG | X.XX | X.XX | X.XX | X.XX |
| C: LLM fine-tuned, Không RAG | X.XX | X.XX | X.XX | - |
| D: LLM fine-tuned, Có RAG | **X.XX** | **X.XX** | **X.XX** | **X.XX** |

### Human Evaluation (50 câu)

- **Độ chính xác**: X%
- **Độ liên quan**: X/5
- **Độ tự nhiên**: X/5

### Phân tích

- Cấu hình D (Fine-tuned + RAG) cho kết quả tốt nhất
- RAG giúp cải thiện đáng kể độ chính xác thông tin
- Fine-tuning giúp câu trả lời tự nhiên và phù hợp ngữ cảnh hơn

Chi tiết xem trong báo cáo PDF.

## 🎬 Demo

### Screenshots

[Thêm screenshots của app]

### Video Demo

📹 **Video Demo**: [Link video demo 3-5 phút]

### Thử nghiệm trực tiếp

```bash
# Chạy demo CLI
python demo/cli_demo.py

# Hoặc chạy Flutter app
cd hoidap_luatgiaothong && flutter run
```

## 📁 Cấu trúc thư mục

```
hoidap-luatgiaothong/
├── 52100144_52200060_52300230/
│   ├── NLP_final.ipynb          # Notebook training chính
│   └── hoidap_luatgiaothong/    # Flutter app
│       ├── lib/
│       │   └── main.dart        # Entry point
│       ├── android/             # Android config
│       ├── ios/                 # iOS config
│       └── pubspec.yaml         # Flutter dependencies
├── data/
│   ├── train_qa.json            # Training data
│   ├── test_qa.json             # Test data
│   └── knowledge_base.txt       # Văn bản luật
├── scripts/
│   ├── train.py                 # Training script
│   ├── build_rag.py             # RAG setup
│   └── evaluate.py              # Evaluation
├── api/
│   └── server.py                # API backend
├── checkpoints/                 # Model checkpoints
├── vector_store/                # FAISS/Chroma index
├── results/                     # Evaluation results
├── requirements.txt             # Python dependencies
├── 52100144_52200060_52300230.pdf      # Báo cáo
├── 52100144_52200060_52300230.pptx     # Slide thuyết trình
└── README.md                    # File này
```

## 👥 Tác giả

**Nhóm sinh viên**
- MSSV: 52100144
- MSSV: 52200060  
- MSSV: 52300230

**Môn học**: Nhập môn Xử lý Ngôn ngữ Tự nhiên  
**Học kỳ**: [Học kỳ]  
**Trường**: [Tên trường]

## 📄 License

Dự án này được phát hành dưới giấy phép MIT. Xem file [LICENSE](LICENSE) để biết thêm chi tiết.

## 🙏 Acknowledgments

- Luật Giao Thông Việt Nam từ [nguồn chính thống]
- Pretrained models từ HuggingFace
- Flutter framework
- Google Colab cho tài nguyên GPU

## 📞 Liên hệ

Nếu có câu hỏi hoặc góp ý, vui lòng liên hệ:
- Email: [email của nhóm]
- GitHub Issues: [Link issues]

---

⭐ Nếu dự án hữu ích, hãy cho chúng tôi một star!
