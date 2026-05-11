# Hướng dẫn Setup và Nộp bài

## 📋 Checklist nộp bài

### ✅ Đã có:
- [x] Báo cáo PDF (15-20 trang)
- [x] Slide PowerPoint
- [x] Video demo (3-5 phút)
- [x] Source code Flutter app
- [x] Notebook training (NLP_final.ipynb)
- [x] README.md chi tiết

### ⚠️ Cần làm:
- [ ] Upload code lên GitHub
- [ ] Upload dataset lên HuggingFace/Drive
- [ ] Upload checkpoint lên HuggingFace/Drive
- [ ] Cập nhật link vào README.md

---

## 🚀 Hướng dẫn chi tiết

### 1. Upload lên GitHub

#### Bước 1: Tạo repository mới
1. Truy cập https://github.com/new
2. Đặt tên: `hoidap-luatgiaothong-nlp`
3. Chọn **Public**
4. Không tích "Initialize with README" (vì đã có sẵn)
5. Click **Create repository**

#### Bước 2: Push code lên GitHub

```bash
# Di chuyển vào thư mục dự án
cd 52100144_52200060_52300230

# Khởi tạo git (nếu chưa có)
git init

# Tạo file .gitignore
cat > .gitignore << EOF
# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
venv/
env/
*.egg-info/
.ipynb_checkpoints/

# Model checkpoints (quá lớn, upload riêng)
checkpoints/
*.bin
*.safetensors
*.pth

# Vector store (quá lớn, upload riêng)
vector_store/
*.faiss
*.index

# Data (upload riêng)
data/
*.json
*.txt

# Flutter
hoidap_luatgiaothong/.dart_tool/
hoidap_luatgiaothong/build/
hoidap_luatgiaothong/.flutter-plugins
hoidap_luatgiaothong/.flutter-plugins-dependencies

# IDE
.vscode/
.idea/
*.iml

# OS
.DS_Store
Thumbs.db
EOF

# Add files
git add .
git commit -m "Initial commit: Vietnamese Traffic Law QA System"

# Link với GitHub repo (thay YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/hoidap-luatgiaothong-nlp.git

# Push lên GitHub
git branch -M main
git push -u origin main
```

---

### 2. Upload Dataset lên HuggingFace Hub

#### Bước 1: Tạo tài khoản HuggingFace
1. Truy cập https://huggingface.co/join
2. Đăng ký tài khoản miễn phí

#### Bước 2: Tạo dataset repository
1. Truy cập https://huggingface.co/new-dataset
2. Đặt tên: `luatgiaothong-qa`
3. Chọn **Public**
4. Click **Create dataset**

#### Bước 3: Upload dataset

**Cách 1: Qua Web UI**
1. Vào dataset repository vừa tạo
2. Click **Files and versions**
3. Click **Add file** > **Upload files**
4. Upload các file:
   - `train_qa.json`
   - `test_qa.json`
   - `knowledge_base.txt`
5. Commit changes

**Cách 2: Qua Python**

```python
from huggingface_hub import HfApi, create_repo

# Login (lần đầu)
# huggingface-cli login

api = HfApi()

# Tạo repo
repo_id = "YOUR_USERNAME/luatgiaothong-qa"
create_repo(repo_id, repo_type="dataset", exist_ok=True)

# Upload files
api.upload_file(
    path_or_fileobj="data/train_qa.json",
    path_in_repo="train_qa.json",
    repo_id=repo_id,
    repo_type="dataset",
)

api.upload_file(
    path_or_fileobj="data/test_qa.json",
    path_in_repo="test_qa.json",
    repo_id=repo_id,
    repo_type="dataset",
)

api.upload_file(
    path_or_fileobj="data/knowledge_base.txt",
    path_in_repo="knowledge_base.txt",
    repo_id=repo_id,
    repo_type="dataset",
)
```

#### Bước 4: Tạo Dataset Card (README)

Tạo file `README.md` trong dataset repo:

```markdown
---
language:
- vi
task_categories:
- question-answering
size_categories:
- n<1K
---

# Vietnamese Traffic Law QA Dataset

Dataset câu hỏi - trả lời về Luật Giao Thông Việt Nam.

## Dataset Structure

- `train_qa.json`: 300+ cặp QA cho training
- `test_qa.json`: 50+ cặp QA cho testing
- `knowledge_base.txt`: Văn bản Luật Giao Thông

## Usage

\`\`\`python
from datasets import load_dataset

dataset = load_dataset("YOUR_USERNAME/luatgiaothong-qa")
\`\`\`
```

---

### 3. Upload Model Checkpoint lên HuggingFace Hub

#### Bước 1: Tạo model repository
1. Truy cập https://huggingface.co/new
2. Đặt tên: `luatgiaothong-llm`
3. Chọn **Public**
4. Click **Create model**

#### Bước 2: Upload checkpoint

```python
from huggingface_hub import HfApi, create_repo

api = HfApi()

# Tạo repo
repo_id = "YOUR_USERNAME/luatgiaothong-llm"
create_repo(repo_id, exist_ok=True)

# Upload toàn bộ thư mục checkpoint
api.upload_folder(
    folder_path="checkpoints/final_model",
    repo_id=repo_id,
    commit_message="Upload fine-tuned model with LoRA"
)
```

---

### 4. Upload lên Google Drive (Phương án dự phòng)

#### Bước 1: Tạo thư mục trên Drive
1. Truy cập https://drive.google.com
2. Tạo thư mục: `NLP_Final_Project`
3. Tạo các thư mục con:
   - `dataset/`
   - `checkpoints/`
   - `vector_store/`

#### Bước 2: Upload files
1. Upload dataset vào `dataset/`
2. Upload model checkpoints vào `checkpoints/`
3. Upload vector store vào `vector_store/`

#### Bước 3: Chia sẻ công khai
1. Click chuột phải vào thư mục `NLP_Final_Project`
2. Chọn **Share** > **Get link**
3. Chọn **Anyone with the link** > **Viewer**
4. Copy link

---

### 5. Cập nhật README.md với links

Sau khi upload xong, cập nhật README.md:

```markdown
## 📦 Dataset và Checkpoint

### Dataset
📥 **Download Dataset**:
- HuggingFace Hub: https://huggingface.co/datasets/YOUR_USERNAME/luatgiaothong-qa
- Google Drive: https://drive.google.com/drive/folders/YOUR_FOLDER_ID

### Model Checkpoints
📥 **Download Checkpoints**:
- HuggingFace Hub: https://huggingface.co/YOUR_USERNAME/luatgiaothong-llm
- Google Drive: https://drive.google.com/drive/folders/YOUR_FOLDER_ID

### Vector Store
📥 **Download Vector Store**:
- Google Drive: https://drive.google.com/drive/folders/YOUR_FOLDER_ID
```

---

### 6. Cập nhật kết quả thực nghiệm

Điền số liệu thực tế vào bảng trong README.md:

```markdown
| Cấu hình | BLEU | ROUGE-L | BERTScore | Recall@5 |
|----------|------|---------|-----------|----------|
| A: LLM gốc, Không RAG | 0.25 | 0.35 | 0.78 | - |
| B: LLM gốc, Có RAG | 0.32 | 0.42 | 0.82 | 0.65 |
| C: LLM fine-tuned, Không RAG | 0.38 | 0.48 | 0.85 | - |
| D: LLM fine-tuned, Có RAG | **0.45** | **0.55** | **0.89** | **0.78** |
```

---

## 📝 Checklist cuối cùng trước khi nộp

- [ ] GitHub repo đã public và có README đầy đủ
- [ ] Dataset đã upload lên HuggingFace/Drive
- [ ] Checkpoint đã upload lên HuggingFace/Drive
- [ ] README.md đã cập nhật đầy đủ links
- [ ] Kết quả thực nghiệm đã điền số liệu thực tế
- [ ] Video demo đã upload (YouTube/Drive)
- [ ] Báo cáo PDF đã hoàn chỉnh (15-20 trang)
- [ ] Slide PowerPoint đã hoàn chỉnh
- [ ] Đã test lại các links trong README

---

## 🎯 Nộp bài

Nộp các file sau:

1. **Link GitHub repository** (trong file text hoặc comment)
2. **Báo cáo PDF**: `52100144_52200060_52300230.pdf`
3. **Slide PowerPoint**: `52100144_52200060_52300230.pptx`
4. **Video demo**: Link YouTube hoặc Drive
5. **Dataset & Checkpoint links**: Trong README.md của GitHub

---

## ❓ Troubleshooting

### Lỗi: File quá lớn khi push lên GitHub
```bash
# Sử dụng Git LFS cho file lớn
git lfs install
git lfs track "*.bin"
git lfs track "*.safetensors"
git add .gitattributes
git commit -m "Add Git LFS"
```

### Lỗi: Upload HuggingFace bị timeout
- Chia nhỏ file thành nhiều phần
- Hoặc sử dụng Google Drive thay thế

### Lỗi: Flutter app không chạy
```bash
flutter clean
flutter pub get
flutter run
```

---

## 📞 Hỗ trợ

Nếu gặp vấn đề, liên hệ:
- Email nhóm: [email]
- GitHub Issues: [link]
