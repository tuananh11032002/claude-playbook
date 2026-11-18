# Bẫy khi làm việc trên Windows

Những lỗi đã dính thật. Đọc trước khi dùng git nhiều nhánh, viết script PowerShell hoặc đóng gói.

## Git

| Bẫy | Cách xử lý |
|---|---|
| Xung đột CẢ FILE khi merge vì CRLF / LF | Lấy một bên, rồi áp lại phần thay đổi của bên kia bằng `git diff --ignore-cr-at-eol`; hoặc sửa bằng script giữ nguyên kiểu xuống dòng. Đặt `.gitattributes` sớm để tránh |
| `__pycache__` bị commit | KHÔNG BAO GIỜ commit; thêm `__pycache__/` và `*.pyc` vào `.gitignore` từ đầu |
| Xung đột add/add với trang giữ chỗ | Giữ bản của nhánh tính năng |
| Extension C# của VS Code âm thầm sửa `.csproj` (mất ProjectReference) | Sau mỗi merge chạy `git diff -- *.csproj` |
| Mỗi git worktree tốn ~1 GB (bin / obj) | Xoá worktree sau khi gộp: `git worktree remove` rồi `git worktree prune` |
| Thư mục hàng loạt chưa theo dõi (bin, dist, dữ liệu) | `.gitignore` trước commit đầu |

## PowerShell 5.1

| Bẫy | Cách xử lý |
|---|---|
| Script có tiếng Việt đọc sai chữ | Lưu `.ps1` dạng UTF-8 CÓ BOM (5.1 coi file không BOM là ANSI) |
| `Write-Output` trong hàm làm "bẩn" giá trị trả về | Dùng `Write-Host` cho thông báo; chỉ `return` giá trị thật |
| `&&` và `||` không có ở 5.1 | Dùng `A; if ($?) { B }` |
| `2>&1` với exe ngoài sinh lỗi giả | Tránh; hoặc gom bằng `ForEach-Object { "$_" }` như trong `scripts/kiem-nhanh.ps1` |
| `Set-Content` mặc định ANSI | Chỉ định `-Encoding utf8` |
| In tiếng Việt từ Python ra console bị lỗi cp1252 | Ghi ra file UTF-8 rồi đọc file |
| Chạy script bị chặn | `powershell -ExecutionPolicy Bypass -File ...` |

## Ổ đĩa

| Bẫy | Cách xử lý |
|---|---|
| Hết dung lượng giữa chừng khi đóng gói | KIỂM TRA chỗ trống ổ trước khi publish / zip / tạo worktree |
| Test để lại thư mục tạm | Mọi test PHẢI xoá thư mục tạm của mình (`try/finally` hoặc fixture Dispose); thư mục tạm test còn sót từng làm đầy ổ hệ thống |
| Ổ hệ thống gần đầy | Chuyển cache lớn (emulator, NuGet, Gradle, pagefile, venv) sang ổ khác bằng biến môi trường |
| Máy ảo / emulator sập | Thường do ổ hệ thống đầy; kiểm tra chỗ trống trước tiên |
| Thư mục tạm của script đóng gói | Dọn khi xong, kể cả khi lỗi |

## Quy trình ngắn trước khi merge nhiều nhánh

| # | Việc |
|---|---|
| 1 | Chỗ trống ổ đủ chưa |
| 2 | `git status` sạch, không file lạ (`__pycache__`, dist) |
| 3 | Merge `--no-ff` một nhánh một lần |
| 4 | `git diff -- *.csproj` |
| 5 | Build + full test |
| 6 | Xoá worktree của nhánh đã gộp |

## Tiện ích dòng lệnh

| Việc | Cách |
|---|---|
| Đọc giá trị biến môi trường trong PowerShell | `$env:TÊN` |
| Dòng lệnh dài dùng đường dẫn có dấu cách | Bọc dấu nháy kép; gọi exe bằng `& "đường\dẫn\app.exe" tham-số` |
| Đường dẫn trong bash trên Windows | `/d/repos/...`, không phải `D:\...` |
