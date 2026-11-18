# Build + test, chỉ in thứ cần đọc: lỗi build, test hỏng (tên + dòng lỗi đầu) và dòng tổng kết.
# Mục đích: agent / người chạy không phải đọc hàng trăm dòng log (tiết kiệm token).
# Mẫu dùng lại: đặt ở <repo>\scripts\kiem-nhanh.ps1; tự tìm file .sln / .slnx ở thư mục gốc repo.
# LƯU Ý: file này phải là UTF-8 CÓ BOM (PowerShell 5.1 mới đọc đúng tiếng Việt).
# Dùng:
#   powershell -ExecutionPolicy Bypass -File scripts\kiem-nhanh.ps1                  # build + cả bộ test
#   powershell -ExecutionPolicy Bypass -File scripts\kiem-nhanh.ps1 -Loc TenTest     # chỉ test có tên chứa "TenTest"
#   powershell -ExecutionPolicy Bypass -File scripts\kiem-nhanh.ps1 -ChiBuild
#   powershell -ExecutionPolicy Bypass -File scripts\kiem-nhanh.ps1 -Giai D:\duong\dan\x.sln
param(
    [string]$Loc = "",
    [switch]$ChiBuild,
    [string]$Giai = ""
)

$ErrorActionPreference = "Continue"
$root = Split-Path -Parent $PSScriptRoot

function Find-Solution {
    param([string]$Explicit, [string]$Root)
    if ($Explicit) { return $Explicit }
    # Ưu tiên solution có trong git: IDE hay tự tạo lại file .sln/.slnx tên cũ (chưa track) sau khi đổi tên dự án.
    $tracked = git -C $Root ls-files -- '*.slnx' '*.sln' 2>$null | Select-Object -First 1
    $found = if ($tracked) { Get-Item (Join-Path $Root $tracked) } else { Get-ChildItem -Path $Root -Include *.sln, *.slnx -File -Recurse -Depth 1 | Select-Object -First 1 }
    if (-not $found) { Write-Host "Không tìm thấy file .sln / .slnx dưới $Root (dùng -Giai để chỉ rõ)."; exit 2 }
    return $found.FullName
}

# Lưu ý: dùng Write-Host cho thông báo. Write-Output trong hàm sẽ lẫn vào giá trị trả về.
function Show-BuildErrors {
    param([string[]]$Lines)
    $errors = $Lines | Where-Object { $_ -match ': error ' } | Sort-Object -Unique
    if ($errors) {
        Write-Host "BUILD HỎNG ($($errors.Count) lỗi):"
        $errors | Select-Object -First 15 | ForEach-Object { Write-Host ("  " + ($_ -replace '\s*\[[^\]]+\.csproj\]$', '')) }
        return $false
    }
    Write-Host "Build: 0 lỗi"
    return $true
}

function Show-TestSummary {
    param([string[]]$Lines)
    $failed = $Lines | Where-Object { $_ -match '^\s*Failed\s+\S' }
    if ($failed) {
        Write-Host "TEST HỎNG:"
        $failed | Select-Object -First 15 | ForEach-Object { Write-Host ("  " + $_.Trim()) }
        $messages = $Lines | Where-Object { $_ -match '^\s*(Assert\.|Expected|Actual|System\.\w+Exception)' }
        $messages | Select-Object -First 10 | ForEach-Object { Write-Host ("    " + $_.Trim()) }
    }
    $summary = $Lines | Where-Object { $_ -match '(Passed|Failed)!\s+-' -or $_ -match '^\s*(Total tests|Passed|Failed|Skipped):\s*\d' }
    if ($summary) { $summary | ForEach-Object { Write-Host $_.Trim() } }
    else { Write-Host "Không thấy dòng tổng kết test: xem lại lệnh / bộ lọc." }
}

$solution = Find-Solution -Explicit $Giai -Root $root

$buildLines = & dotnet build $solution -nologo -v q -clp:ErrorsOnly 2>&1 | ForEach-Object { "$_" }
$built = Show-BuildErrors -Lines $buildLines
if (-not $built -or $ChiBuild) { return }

# Logger console mức normal mới in tên test hỏng; Show-TestSummary chỉ lọc dòng cần.
$testArgs = @('test', $solution, '--no-build', '--nologo', '--logger', 'console;verbosity=normal')
if ($Loc) { $testArgs += @('--filter', "FullyQualifiedName~$Loc") }
$testLines = & dotnet @testArgs 2>&1 | ForEach-Object { "$_" }
Show-TestSummary -Lines $testLines
