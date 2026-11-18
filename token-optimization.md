# Tiết kiệm token

Một ngày làm việc nhiều agent có thể tốn hàng triệu token, phần lớn do đọc lại cùng một thứ. Dưới đây là các cách đã áp dụng.

## Bảng cách làm

| Cách | Làm thế nào |
|---|---|
| Index code | Chạy `codegraph init` ở gốc repo (hỏi người dùng trước), thêm `.codegraph/` vào `.gitignore`. Dùng `codegraph explore "<câu hỏi>"`, `codegraph node <symbol hoặc file>`, `codegraph impact <symbol>` TRƯỚC khi grep hay đọc file. Sau khi commit nhiều file mới hoặc đổi tên thư mục: `codegraph sync` |
| Wrapper build / test | Script chỉ in lỗi và dòng tổng kết (`scripts/kiem-nhanh.ps1`). Không chạy `dotnet build` / `dotnet test` trần |
| Lọc log | Đọc `Select-Object -Last 20`, `Select-String`; không đổ cả log, cả JSON, cả danh sách |
| Đọc file | Theo `offset` / `limit`; chỉ Read khi cần sửa đúng đoạn |
| Model | Subagent mặc định Sonnet; chỉ dùng mạnh nhất cho việc lớn hoặc khó |
| Dùng lại agent | SendMessage cho agent cũ (đã có ngữ cảnh, cache rẻ) thay vì agent mới |
| Brief gọn | Trỏ tới 1 file đọc nhanh + đúng khu vực, không bắt đọc 4-6 tài liệu dài |
| Báo cáo ngắn | Dưới 300 chữ; báo cáo 1.500-2.500 chữ bị đọc lại mỗi lượt |
| Ít ảnh | Agent tự xem tối đa 2 ảnh; lead chấm 1-2 ảnh mỗi màn |
| Gom việc | Việc nhỏ cùng khu vực vào 1 agent |
| Tắt thứ không dùng | Plugin, MCP không cần |
| Phiên mới | Sau mỗi giai đoạn lớn mở phiên mới, để lại ghi chú |
| Test theo chỗ sửa | Không chạy cả bộ mỗi lần (xem `user-preferences.md`) |

## Cái KHÔNG nên làm

| Đừng | Lý do |
|---|---|
| Cài MCP "nén output" của bên thứ ba chưa kiểm chứng | Nó đọc được mọi output của mọi tool (lộ dữ liệu, mã nguồn, bí mật). CodeGraph + lọc log đã đủ |
| Giao agent mới cho việc cùng khu vực | Mất công đọc lại từ đầu |
| Dán ảnh hàng loạt | Mỗi ảnh tốn token đáng kể |
| Nhiều agent cùng đọc cả repo | Dùng index thay vì đọc rộng |

## Viết file đọc nhanh cho agent

Một trang, gồm: ngăn xếp công nghệ, cấu trúc thư mục, cách tìm code (lệnh index), cách build/test, quy tắc làm việc, tóm tắt tiêu chí giao diện, cách chụp ảnh, định dạng báo cáo. Mẫu ở `templates/agent-quick-doc.md`.

## Quy trình thử nhanh khi có việc lạ

| Bước | Làm |
|---|---|
| 1 | Hỏi index (explore / node) |
| 2 | Chỉ khi cần sửa mới Read đúng đoạn |
| 3 | Chạy wrapper, đọc 15 dòng lỗi đầu |
| 4 | Báo cáo ngắn |

## Lỗi "file bị khoá" khi build

Thường là người dùng đang mở app. Build ở worktree riêng, không tắt app của họ.

## Đo chi phí thật và cách cắt (bài học 18/11/2026)

| Hiểu nhầm | Thực tế |
|---|---|
| "289k tokens in context" = đã tiêu 289k | Đó là ĐỘ DÀI NGỮ CẢNH hiện tại. Chi phí ≈ độ dài ngữ cảnh × số lần gọi model (phần lặp lại tính giá cache ≈ 1/10) |
| Tự làm luôn rẻ hơn sinh agent | Chỉ đúng khi ngữ cảnh phiên chính còn ngắn. Phiên dài nhiều ngày thì mỗi lần gọi công cụ cũng đắt |

Số đo 1 phiên 6 ngày (ToolPack): phiên chính 1.062 lần gọi, 55 agent con 5.329 lần gọi → agent con ≈ 80% chi phí.
Đo lại bằng cách cộng `usage` (input / cache_creation / cache_read / output) theo `message.id` trong `~/.claude/projects/<dự án>/<phiên>.jsonl` và thư mục `subagents/`.

Cắt chi phí theo thứ tự hiệu quả:
1. Có `CLAUDE.md` ở gốc repo (mẫu `templates/CLAUDE.md.template`): phiên mới + agent con tự nạp quy tắc, bẫy, lệnh build/test → không phải dò lại dự án.
2. Mở phiên mới khi xong một giai đoạn (ghi tóm tắt vào memory trước).
3. Việc nhỏ / vừa tự làm; chỉ sinh agent cho việc lớn cần song song, dùng loại agent riêng (mẫu `templates/agents/dev-agent.md`, model Sonnet).
4. Agent: chụp 1 cỡ ảnh, test phần mình, cả bộ 1 lần cuối, báo cáo < 250 chữ. "Fork" (agent kế thừa toàn bộ ngữ cảnh) chỉ dùng đầu phiên khi ngữ cảnh còn ngắn — luôn chạy model đắt.
