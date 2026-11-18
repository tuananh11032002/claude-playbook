# Mẫu brief giao việc cho agent

Copy, điền phần trong `<...>`, xoá dòng không cần. Giữ brief ngắn: trỏ tới 1 file đọc nhanh, không dán lại tài liệu.

```
Việc: <1 câu: làm gì, để đạt gì>

Đọc trước (chỉ file này): <docs/agent-doc-nhanh.md>
Thêm nếu cần: <đúng 1-2 file cụ thể>

Nhánh và thư mục:
- Làm trong worktree <đường dẫn>, nhánh <feat/ten-viec> (lead đã tạo sẵn).
- Commit trên nhánh này. KHÔNG push, KHÔNG merge.

Phạm vi:
- Được sửa: <thư mục / file>
- KHÔNG đụng: <thư mục của agent khác>
- Đụng file dùng chung: chỉ thêm 1 dòng cuối (registry, khối dịch vụ), ghi vào SHARED EDITS.
- Cần thứ ở vùng khác: ghi vào SHARED REQUESTS, đừng tự sửa.

Số cần đo (báo số thật):
- <ví dụ: thời gian mở file 1 triệu dòng, bộ nhớ đỉnh, số test qua>

Kiểm tra: test theo chỗ sửa; chạy bộ đầy đủ 1 lần cuối bằng <scripts/kiem-nhanh.ps1>.
Giao diện (nếu có): chấm theo ui-review-checklist.md; nộp ảnh sáng + tối, 1920 + 2560; tự xem tối đa 2 ảnh.

Báo cáo DƯỚI 300 CHỮ, đúng khuôn:
1. Commit (hash)
2. Kết quả chính (số đo thật)
3. Quyết định thiết kế tôi có thể veto
4. SHARED EDITS
5. SHARED REQUESTS
6. Chưa kiểm (nói thật)
7. Đường dẫn ảnh quan trọng
Không kể lại quá trình.

Model: <sonnet mặc định; mạnh nhất chỉ cho việc lớn hoặc khó>
```

## Ghi chú cho lead

| Việc | Cách |
|---|---|
| Việc tiếp theo cùng khu vực | SendMessage cho agent cũ, đừng brief lại từ đầu |
| Chấm CHƯA PASS | Gửi danh sách đánh số "phải sửa" cho chính agent đó |
| Chia vùng file | Không chồng nhau giữa các agent |
| Việc đổi tên toàn dự án | Không giao khi còn agent khác chạy |
