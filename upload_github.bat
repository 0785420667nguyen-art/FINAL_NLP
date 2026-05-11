@echo off
echo ========================================
echo UPLOAD DU AN LEN GITHUB
echo ========================================
echo.

REM Kiem tra xem da cai git chua
git --version >nul 2>&1
if errorlevel 1 (
    echo [LOI] Git chua duoc cai dat!
    echo Vui long tai Git tai: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo [1/7] Khoi tao Git repository...
git init
if errorlevel 1 (
    echo [LOI] Khong the khoi tao git!
    pause
    exit /b 1
)

echo.
echo [2/7] Them tat ca file vao git...
git add .
if errorlevel 1 (
    echo [LOI] Khong the them file!
    pause
    exit /b 1
)

echo.
echo [3/7] Tao commit...
git commit -m "Initial commit: Vietnamese Traffic Law QA System with RAG and Fine-tuned LLM"
if errorlevel 1 (
    echo [CANH BAO] Co the da commit roi hoac khong co thay doi
)

echo.
echo ========================================
echo BUOC TIEP THEO - TAO REPO TREN GITHUB
echo ========================================
echo.
echo 1. Mo trinh duyet va truy cap: https://github.com/new
echo 2. Dien thong tin:
echo    - Repository name: hoidap-luatgiaothong-nlp
echo    - Description: He thong hoi dap Luat Giao Thong Viet Nam su dung RAG va Fine-tuned LLM
echo    - Chon: Public
echo    - KHONG tich "Initialize this repository with a README"
echo 3. Click "Create repository"
echo.
echo 4. Sau khi tao xong, GitHub se hien thi cac lenh.
echo    Sao chep USERNAME cua ban tu URL: https://github.com/USERNAME
echo.

set /p GITHUB_USERNAME="[4/7] Nhap GitHub USERNAME cua ban: "

if "%GITHUB_USERNAME%"=="" (
    echo [LOI] Ban chua nhap username!
    pause
    exit /b 1
)

echo.
echo [5/7] Lien ket voi GitHub repository...
git remote add origin https://github.com/%GITHUB_USERNAME%/hoidap-luatgiaothong-nlp.git
if errorlevel 1 (
    echo [CANH BAO] Co the da lien ket roi
    git remote set-url origin https://github.com/%GITHUB_USERNAME%/hoidap-luatgiaothong-nlp.git
)

echo.
echo [6/7] Doi ten branch thanh main...
git branch -M main

echo.
echo [7/7] Push code len GitHub...
echo.
echo QUAN TRONG: Ban se can nhap GitHub credentials:
echo - Username: %GITHUB_USERNAME%
echo - Password: Personal Access Token (KHONG phai password thuong)
echo.
echo Neu chua co Personal Access Token:
echo 1. Truy cap: https://github.com/settings/tokens
echo 2. Click "Generate new token" ^> "Generate new token (classic)"
echo 3. Chon scope: repo (tick tat ca)
echo 4. Click "Generate token"
echo 5. Copy token va dan vao day
echo.
pause

git push -u origin main

if errorlevel 1 (
    echo.
    echo ========================================
    echo [LOI] KHONG THE PUSH LEN GITHUB!
    echo ========================================
    echo.
    echo Nguyen nhan co the:
    echo 1. Chua tao repository tren GitHub
    echo 2. Username sai
    echo 3. Chua nhap dung Personal Access Token
    echo 4. Repository da ton tai
    echo.
    echo Hay thu lai:
    echo 1. Kiem tra da tao repo: https://github.com/%GITHUB_USERNAME%/hoidap-luatgiaothong-nlp
    echo 2. Chay lai script nay
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo THANH CONG! DA UPLOAD LEN GITHUB
echo ========================================
echo.
echo Repository cua ban:
echo https://github.com/%GITHUB_USERNAME%/hoidap-luatgiaothong-nlp
echo.
echo BUOC TIEP THEO:
echo 1. Mo link tren de kiem tra
echo 2. Cap nhat link nay vao README.md
echo 3. Kiem tra video demo
echo 4. Nop bai!
echo.
pause
