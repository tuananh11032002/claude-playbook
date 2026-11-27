# Claude Playbook

Sổ tay kinh nghiệm để Claude đọc ở đầu mỗi dự án mới, khỏi phải nhắc lại từ đầu. Mỗi file ngắn (dưới ~150 dòng), chỉ mở file đang cần cho việc đang làm.

## Gắn vào dự án mới (3 dòng cho CLAUDE.md của dự án)

```
## Playbook kinh nghiệm
Đọc <đường dẫn tới claude-playbook>\README.md trước; chỉ mở file cần cho việc đang làm.
Đầu việc luôn đọc user-preferences.md (rất ngắn).
```

## Mục lục: việc đang làm thì đọc file nào

| File | Đọc khi |
|---|---|
| `user-preferences.md` | Luôn đọc đầu tiên: cách người dùng muốn được trả lời, viết tài liệu, ra quyết định |
| `ui-design-principles.md` | Thiết kế giao diện cho tool nội bộ / desktop-style |
| `android-ui-notes.md` | Làm giao diện app Android: quy trình bản vẽ → duyệt → nhánh, quy tắc màn hình, màu, bảng nổi (overlay), bẫy thử máy ảo / máy thật |
| `ui-review-checklist.md` | Chấm một màn hình PASS / CHƯA PASS (mã G/Q/T/L/M) |
| `ux-behaviors.md` | Hành vi chuẩn: tải dần, bàn phím, thông báo, trạng thái, mất kết nối |
| `help-writing.md` | Viết hướng dẫn, bài học, tài liệu cho người đọc |
| `coding-style.md` | Viết / sửa code (quy tắc dễ đọc, C# và chung) |
| `multi-agent-workflow.md` | Chia việc cho nhiều agent, gộp nhánh, chấm kết quả |
| `token-optimization.md` | Muốn tốn ít token hơn (index code, lọc log, chọn model) |
| `screenshot-review.md` | Tự động chụp giao diện để chấm (Playwright) |
| `offline-packaging.md` | Đóng gói app chạy trên máy không có Internet |
| `windows-pitfalls.md` | Làm việc trên Windows: git, CRLF, PowerShell, ổ đĩa |
| `blazor-notes.md` | Blazor Server / app .NET kiểu desktop |
| `feature-proposals.md` | Đề xuất tính năng mới cho người dùng |
| `release-and-versioning.md` | Giao bản mới: đánh số x.y.z, CHANGELOG, tag |
| `misc-lessons.md` | Bài học lẻ chưa có chỗ riêng (đổi tên dự án, push lần đầu, Docker, Excel) |
| `templates/agent-brief.md` | Mẫu giao việc cho agent con |
| `templates/agent-quick-doc.md` | Mẫu "đọc nhanh 1 trang" mỗi dự án nên có |
| `scripts/kiem-nhanh.ps1` | Mẫu script build + test chỉ in lỗi và tổng kết |

## Quy ước của chính repo này

| Thứ | Quy ước |
|---|---|
| Tên file | Tiếng Anh |
| Nội dung | Tiếng Việt có dấu, dễ đọc, bảng khi so sánh |
| Sơ đồ | Chỉ ASCII (`-`, `/`, `\`, `^`, `<-`); cấm ký tự vẽ khung và mũi tên Unicode |
| Riêng tư | Không tên công ty, tên đăng nhập, email, IP, đường dẫn nội bộ, mật khẩu |
| Thêm bài học | Thêm vào file đúng chủ đề; không vừa file nào thì vào `misc-lessons.md`; file nào vượt 150 dòng thì tách |
