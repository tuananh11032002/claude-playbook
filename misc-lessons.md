# Bài học lẻ

Những bài học chưa có file riêng. Khi một nhóm đủ lớn thì tách ra file mới và ghi vào README.

## Đổi tên dự án: danh sách kiểm

| Việc | Chi tiết |
|---|---|
| Giữ nguyên tên định dạng chuẩn của lĩnh vực | Ví dụ tên định dạng mở của một tổ chức chuẩn; không thay trong chuỗi định danh định dạng |
| Giữ BYTE-IDENTICAL hằng số mã hoá | Entropy / salt của DPAPI: đổi là không giải mã được dữ liệu cũ |
| Dữ liệu người dùng | Migrate bằng COPY, không MOVE (còn đường lùi) |
| Biến môi trường | Tên mới, nhưng fallback về tên cũ |
| Khoá localStorage | Khoá mới, fallback về khoá cũ |
| Thời điểm | Đổi TRƯỚC lần push đầu lên GitHub |
| Lịch chạy | Chỉ khi không còn agent nào đang chạy (xem `multi-agent-workflow.md`) |
| Sau đổi | `codegraph sync` hoặc init lại; build + full test; quét tên cũ còn sót |

## Trước lần push đầu tiên

| Việc | Cách |
|---|---|
| Quét bí mật | Khoá API, mật khẩu, chuỗi kết nối, token, file `.env` |
| Quét thông tin cá nhân | Tên thật, email, tên đăng nhập, IP, tên máy |
| Quét đường dẫn nội bộ | Đường dẫn ổ mạng, thư mục của công ty |
| Không chắc | Để repo PRIVATE |
| Lịch sử git | Bí mật đã lỡ commit thì phải xoá khỏi lịch sử, không chỉ xoá ở commit sau |

Lệnh gợi ý: `git grep -n -i -E "password|secret|token|api[_-]?key"` rồi tìm tên người, tên công ty, địa chỉ IP.

## Excel .xlsx có công thức trên Windows

Công cụ recalc bằng LibreOffice có thể lỗi trên Windows (`AF_UNIX` không có), và máy có thể chưa cài. Dùng Excel COM qua PowerShell làm engine thật.

| # | Bước |
|---|---|
| 1 | `New-Object -ComObject Excel.Application`; `Visible = $false`, `DisplayAlerts = $false` |
| 2 | `$excel.CalculateFull()` |
| 3 | Quét lỗi mỗi sheet: `UsedRange.SpecialCells(-4123, 16)` (công thức + lỗi); bọc try/catch vì không có ô lỗi thì nó ném ngoại lệ |
| 4 | Lưu: `$wb.SaveAs($path, 51)` (xlsx) để ghi sẵn giá trị cache, lên Drive không vỡ |
| 5 | Kiểm dropdown: `Range("A2").Validation.Type` bằng 3 nghĩa là list |

Lý do: thư viện ghi công thức dạng chuỗi không kèm giá trị cache; cần engine thật xác nhận 0 lỗi trước khi giao. Bảng tính nên dùng Excel Table + SUMIF; dropdown "chọn hoặc tự nhập" cho ô danh mục.

## Docker Compose

Env không bao giờ build lại image; env đổi thì recreate container (từ image cũ). Chi tiết bảng ở `help-writing.md`. Với stack nhiều dự án chạy chung host, luôn đặt tên project (`-p`) để các lệnh không đụng stack khác.

## Site "sập" dù app khỏe (mạng / DNS)

Khi site không vào được mà container báo healthy: nghi DNS. Bẫy deadlock khi DNS của host phụ thuộc dịch vụ chạy trên chính host. Đổi DNS của host thì phải force-recreate container để nạp lại. Kiểm tra từ trong container, không chỉ từ host.

## Kiến trúc chụp / điều khiển thiết bị

| Chủ đề | Bài học |
|---|---|
| Tự động hoá trên emulator | Thử qua `adb` bằng tọa độ trước, rồi mới viết logic; `force-stop` có thể làm mất quyền Trợ năng nên cần tự bật lại |
| Dừng khẩn cấp cho tool điều khiển chuột | Phím dừng (Esc/F9), thread riêng, cầu dao (kill switch) độc lập với logic chính |
| Đọc màn hình | Ưu tiên đọc cây Trợ năng (nhanh, vài chục ms) hơn chụp ảnh + OCR; chụp ảnh là phương án dự phòng |
| Việc thử nghiệm rủi ro | Làm ở worktree riêng |

## Tải dữ liệu từ dịch vụ ngoài

Lấy từng endpoint thật rồi ghi lại cấu trúc phản hồi vào một file ghi chú ngắn trước khi code; đọc thử bằng một lần gọi thật, đừng đoán.

## Việc đã nhắc là phải nhớ

| Tình huống | Hành động |
|---|---|
| Người dùng chốt một quy tắc ("lưu rule đó lại") | Ghi vào đúng file của playbook này trong cùng lượt |
| Người dùng chê một cách làm | Ghi nguyên nhân (why) để không lặp lại |
| Phát hiện bẫy mới | Thêm một dòng bảng, không viết đoạn dài |
