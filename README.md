# Hệ thống Hỏi Đáp Luật Giao Thông Việt Nam

[![GitHub](https://img.shields.io/badge/GitHub-FINAL__NLP-blue)](https://github.com/0785420667nguyen-art/FINAL_NLP)
[![Drive](https://img.shields.io/badge/Google-Drive-green)](https://drive.google.com/drive/folders/1sHoBs3rLBSa0pp8aC0KqJLXNSzFn0aRN)

Dự án cuối kỳ môn **Nhập môn Xử lý Ngôn ngữ Tự nhiên**

Hệ thống hỏi đáp tiếng Việt thông minh trên miền tri thức **Luật Giao Thông**, sử dụng kỹ thuật **RAG (Retrieval-Augmented Generation)** kết hợp **Fine-tuning LLM** với LoRA/QLoRA.

---

## 📂 Cấu trúc dự án

```
FINAL_NLP/
├── 52100144_52200060_52300230.pdf          # Báo cáo chi tiết (15-20 trang)
├── 52100144_52200060_52300230.pptx         # Slide thuyết trình
├── demo_nlp_final.mov                      # Video demo (3-5 phút)
├── NLP_final.ipynb                         # Notebook training & evaluation
├── requirements.txt                        # Python dependencies
├── hoidap_luatgiaothong/                   # Flutter mobile app
│   ├── README.md                           # Hướng dẫn chi tiết
│   ├── lib/                                # Source code
│   ├── android/                            # Android config
│   └── ios/                                # iOS config
└── README.md                               # File này
```

---

## 🎯 Tính năng chính

- 🔍 **RAG Pipeline**: Truy xuất thông tin từ knowledge base bằng vector similarity search
- 🤖 **Fine-tuned LLM**: Mô hình ngôn ngữ lớn được tinh chỉnh với LoRA/QLoRA trên dữ liệu chuyên ngành
- 📱 **Mobile App**: Giao diện Flutter đa nền tảng (iOS, Android, Web)
- 📊 **Đánh giá toàn diện**: BLEU, ROUGE-L, BERTScore, Recall@5, Human evaluation

---

## 📥 Tài nguyên

### Dataset & Checkpoint
- **Google Drive**: [Dataset, Checkpoint, Vector Store](https://drive.google.com/drive/folders/1sHoBs3rLBSa0pp8aC0KqJLXNSzFn0aRN)
  - Training data: 300+ cặp QA
  - Test data: 50+ cặp QA
  - Knowledge base: Văn bản Luật Giao Thông
  - Model checkpoint: Fine-tuned LLM với LoRA
  - Vector store: FAISS index

### Source Code
- **GitHub Repository**: [FINAL_NLP](https://github.com/0785420667nguyen-art/FINAL_NLP)

---

## 🚀 Hướng dẫn sử dụng

### 1. Clone repository

```bash
git clone https://github.com/0785420667nguyen-art/FINAL_NLP.git
cd FINAL_NLP/52100144_52200060_52300230
```

### 2. Cài đặt dependencies

```bash
pip install -r requirements.txt
```

### 3. Chạy notebook

Mở `NLP_final.ipynb` trên Google Colab hoặc Jupyter Notebook

### 4. Chạy Flutter app

```bash
cd hoidap_luatgiaothong
flutter pub get
flutter run
```

---

## 📊 Kết quả thực nghiệm

Hệ thống được đánh giá trên 4 cấu hình:

| Cấu hình | Mô tả |
|----------|-------|
| **A** | LLM gốc, Không RAG |
| **B** | LLM gốc, Có RAG |
| **C** | LLM fine-tuned, Không RAG |
| **D** | LLM fine-tuned, Có RAG ⭐ |

Chi tiết kết quả xem trong **báo cáo PDF**.

---

## 📄 Tài liệu

- **Báo cáo**: [`52100144_52200060_52300230.pdf`](52100144_52200060_52300230.pdf)
- **Slide**: [`52100144_52200060_52300230.pptx`](52100144_52200060_52300230.pptx)
- **Video demo**: [`demo_nlp_final.mov`](demo_nlp_final.mov)
- **Hướng dẫn chi tiết**: [`hoidap_luatgiaothong/README.md`](hoidap_luatgiaothong/README.md)

---

## 👥 Thông tin nhóm

**Sinh viên thực hiện:**
- MSSV: 52100144
- MSSV: 52200060
- MSSV: 52300230

**Môn học**: Nhập môn Xử lý Ngôn ngữ Tự nhiên

---

## 📞 Liên hệ

- GitHub: [@0785420667nguyen-art](https://github.com/0785420667nguyen-art)
- Repository: [FINAL_NLP](https://github.com/0785420667nguyen-art/FINAL_NLP)

---

## 📝 License

Dự án học tập - Không sử dụng cho mục đích thương mại.

---

⭐ **Star repo nếu bạn thấy hữu ích!**
