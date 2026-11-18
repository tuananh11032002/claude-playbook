# Làm việc nhiều agent song song

Việc lớn tách được thì đừng giao một agent làm tuần tự. Người dùng đã nhiều lần hỏi "sao chỉ 1 agent làm?". Mỗi agent một nhánh và một worktree, từ main ổn định; lead gộp.

## Mô hình

```
main (build xanh, test xanh)
  |-- feat/viec-a  (worktree riêng, agent A)
  |-- feat/viec-b  (worktree riêng, agent B)
  |-- feat/viec-c  (worktree riêng, agent C)
lead: xem báo cáo -> chấm -> merge --no-ff từng nhánh -> build + full test
```

## Trước khi chia

| Bước | Làm |
|---|---|
| 1 | Build + test xanh, commit baseline (git init nếu chưa có) |
| 2 | `.gitignore` bỏ bin, obj, dist, dữ liệu sinh ra |
| 3 | Lead TỰ tạo worktree + nhánh (tránh nhiều agent tạo cùng lúc), đặt ngoài thư mục chính, trên ổ còn trống |
| 4 | Viết file đọc nhanh 1 trang (`templates/agent-quick-doc.md`) nếu chưa có |
| 5 | Rà danh sách việc tồn, giao luôn mọi việc chạy song song được; việc phụ thuộc vẫn tách được phần chuẩn bị |

## Luật cho agent

| Luật | Chi tiết |
|---|---|
| Git | Commit trên nhánh mình; KHÔNG push, KHÔNG merge |
| Phạm vi | Chỉ sửa vùng được giao; đụng file dùng chung thì ghi "SHARED EDITS" |
| File dùng chung | Registry lệnh chỉ thêm 1 dòng cuối; migration theo "area" riêng; tài liệu API viết file riêng cho từng việc |
| Cần thứ ở vùng khác | Ghi vào "SHARED REQUESTS", không tự sửa |
| Test | Theo chỗ sửa; bộ đầy đủ 1 lần cuối |
| Build khi app của người dùng đang mở | Build ở worktree của mình, không tắt app của người dùng |

## Báo cáo của agent (dưới 300 chữ)

| Mục | Nội dung |
|---|---|
| Commit | Hash trên nhánh |
| Kết quả | SỐ ĐO THẬT (thời gian, MB, số test), không nói chung chung |
| Quyết định thiết kế bạn có thể veto | Liệt kê để lead bác nếu không hợp |
| SHARED EDITS | File chung đã sửa |
| SHARED REQUESTS | Việc cần lead / agent khác làm |
| Chưa kiểm | Nói thật phần không test được |
| Ảnh quan trọng | Đường dẫn, không dán cả loạt |

Không kể lại quá trình.

## Lead chấm và gộp

| Việc | Cách |
|---|---|
| Chấm | PASS hoặc CHƯA PASS theo `ui-review-checklist.md` / tiêu chí đã giao |
| CHƯA PASS | Gửi danh sách ĐÁNH SỐ "phải sửa" cho CHÍNH agent đó (SendMessage): nó còn ngữ cảnh nên rẻ hơn agent mới |
| Lỗi chặn hay gặp | Crash, sai ký tự (font, ligature), nút bị xuống dòng |
| Gộp | `git merge --no-ff` từng nhánh, thứ tự ít xung đột trước; build + chạy FULL test sau mỗi lần gộp |
| Xung đột cả file | Thường do CRLF/LF; xem `windows-pitfalls.md` |
| Xung đột add/add với trang giữ chỗ | Giữ bản của nhánh tính năng |
| Sau khi gộp | Kiểm `git diff -- *.csproj` (IDE có thể âm thầm sửa); xoá worktree (mỗi cái ~1 GB bin/obj) |
| Đổi lớn xuyên suốt (đổi tên) | Chỉ làm khi KHÔNG còn agent nào đang chạy |

## Chọn model và dùng lại agent

| Việc | Model |
|---|---|
| Mặc định, việc nhỏ và vừa | Sonnet |
| Engine, kiến trúc, đổi tên toàn bộ, việc khó | Mạnh nhất |
| Việc tiếp theo cùng khu vực | SendMessage cho agent cũ, không tạo mới |
| Việc nhỏ cùng khu vực | Gom vào 1 agent |

Agent bị dừng vì hết phiên đăng nhập không phải lỗi code; gọi chạy tiếp.

## Kiểm tra khi agent mới chạy

Chờ thông báo hoàn thành, không dò kết quả liên tục. Đừng tự làm lại phần đã giao.
