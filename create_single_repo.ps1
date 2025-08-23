# Create Single STM32Projects Repository Script
# Bu script tüm STM32 projelerini tek bir repository'de toplar

Write-Host "STM32 Projects - Tek Repository Olusturma Script'i" -ForegroundColor Green
Write-Host "=================================================" -ForegroundColor Green

# GitHub bilgileri
$githubUsername = "Gurtdereli"
$repoName = "STM32Projects"

Write-Host "GitHub User: $githubUsername" -ForegroundColor Cyan
Write-Host "Repository: $repoName" -ForegroundColor Cyan

# Ana .gitignore dosyası oluştur
Write-Host "`nAna .gitignore dosyasi olusturuluyor..." -ForegroundColor Yellow
$mainGitignore = @"
# STM32 Projects Workspace .gitignore

# STM32CubeIDE generated files
.metadata/
.guards/
.settings/
*.project
*.cproject
*.mxproject

# Build outputs
**/Debug/
**/Release/
**/build/
**/obj/
**/*.o
**/*.a
**/*.elf
**/*.bin
**/*.hex
**/*.map
**/*.list

# IDE files
.vscode/
.idea/
*.swp
*.swo
*~

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Temporary files
*.tmp
*.temp
*.log

# Keep source files
!**/Core/Src/**/*.c
!**/Core/Src/**/*.h
!**/Core/Inc/**/*.h
!**/Startup/**/*.s
!**/CMSIS/**/*.h
!**/Drivers/**/*.c
!**/Drivers/**/*.h
"@

Set-Content -Path ".gitignore" -Value $mainGitignore -Encoding UTF8
Write-Host "  Ana .gitignore olusturuldu" -ForegroundColor Green

# Ana README.md güncelle
Write-Host "`nAna README.md guncelleniyor..." -ForegroundColor Yellow
$mainReadme = @"
# STM32 Projects Collection

Bu repository, STM32 mikrodenetleyici projelerinin kapsamlı bir koleksiyonudur. Tüm projeler tek bir repository altında organize edilmiştir.

## 📁 Proje Kategorileri

### 🔌 GPIO ve Temel Projeler
- **Hello_World** - Temel GPIO projesi
- **HW1** - Ödev 1 projesi
- **HW2** - Ödev 2 projesi
- **HW3** - Ödev 3 projesi
- **HW4** - Ödev 4 projesi
- **HW5** - Ödev 5 projesi
- **HW6** - Ödev 6 projesi
- **HW7** - Ödev 7 projesi

### ⏱️ Timer ve Kesme Projeleri
- **SysTick_Timer** - SysTick timer projesi
- **Timer_Interrupt** - Timer kesme projesi
- **External_Interrupt** - Dış kesme projesi
- **Input_Capture_Mode** - Giriş yakalama modu

### 📊 ADC ve Sensör Projeleri
- **ADC_Internal_Temp_Sens** - Dahili sıcaklık sensörü
- **ADC_Interrupt** - ADC kesme projesi
- **ADC_LDR_Multi_Interrupt** - LDR çoklu kesme projesi

### 📡 İletişim Projeleri
- **UART** - UART haberleşme projesi
- **UART_Interrupt** - UART kesme projesi
- **SPI** - SPI haberleşme projesi
- **I2C_Oled_Screen** - I2C OLED ekran projesi
- **I2C_Oled_Screen_with_ADXL345** - I2C OLED + ADXL345 sensör projesi
- **Bluetooth** - Bluetooth haberleşme projesi

### 🚀 RTOS Projeleri
- **RTOS_Task_Create** - RTOS görev oluşturma
- **RTOS_ADC** - RTOS ADC projesi
- **RTOS_printf** - RTOS printf projesi
- **RTOS_UART** - RTOS UART projesi

### ⚡ Gelişmiş Projeler
- **DMA_Memory2Memory** - DMA bellek-bellek transferi
- **DMA_PE2ME_AND_ME2PE** - DMA çevresel-bellek transferi
- **Flash_Write_Read** - Flash yazma/okuma projesi
- **PWM** - PWM sinyal üretimi
- **Power_Management** - Güç yönetimi
- **IWDG** - Bağımsız watchdog timer
- **Library_Development** - Kütüphane geliştirme

### 🔧 Register Seviyesi Projeler
- **Register_Level_Part1** - Register seviyesi programlama 1
- **Register_Level_Part2** - Register seviyesi programlama 2

### 🎯 Özel Projeler
- **CBX01_Digital_6M_SW_V.1.0** - CBX01 dijital projesi

## 🛠️ Donanım Gereksinimleri

- STM32F411RE (Nucleo-F411RE) veya uyumlu STM32 board
- Gerekli sensörler ve bileşenler (proje detaylarına göre değişir)

## 💻 Yazılım Gereksinimleri

- STM32CubeIDE veya STM32CubeMX
- STM32 HAL kütüphaneleri
- C/C++ derleyici

## 📚 Kurulum

1. Bu repository'yi klonlayın
2. İstediğiniz proje klasörüne gidin
3. STM32CubeIDE ile açın
4. Gerekli kütüphaneleri ekleyin
5. Projeyi derleyin ve yükleyin

## 🔗 GitHub Profili

Bu projeler [https://github.com/Gurtdereli](https://github.com/Gurtdereli) adresinde bulunmaktadır.

## 📄 Lisans

Bu projeler eğitim amaçlı geliştirilmiştir.

## 📞 İletişim

Sorularınız için GitHub Issues kullanabilirsiniz.
"@

Set-Content -Path "README.md" -Value $mainReadme -Encoding UTF8
Write-Host "  Ana README.md guncellendi" -ForegroundColor Green

# Git repository başlat
Write-Host "`nGit repository baslatiliyor..." -ForegroundColor Yellow
if (Test-Path ".git") {
    Write-Host "  Mevcut .git klasoru kaldiriliyor..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force ".git"
}

git init
git add .
git commit -m "Initial commit: STM32 Projects Collection"

Write-Host "  Git repository baslatildi" -ForegroundColor Green

# GitHub'a yükleme talimatları
Write-Host "`n=================================================" -ForegroundColor Green
Write-Host "SONRAKI ADIMLAR:" -ForegroundColor Yellow
Write-Host "=================================================" -ForegroundColor Green
Write-Host "1. GitHub'da '$repoName' adinda yeni repository olusturun" -ForegroundColor Cyan
Write-Host "2. Asagidaki komutlari calistirin:" -ForegroundColor Cyan
Write-Host "   git remote add origin https://github.com/$githubUsername/$repoName.git" -ForegroundColor White
Write-Host "   git branch -M main" -ForegroundColor White
Write-Host "   git push -u origin main" -ForegroundColor White
Write-Host "=================================================" -ForegroundColor Green

Write-Host "`nScript tamamlandi!" -ForegroundColor Green
