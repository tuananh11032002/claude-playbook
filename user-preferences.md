# Sở thích của người dùng (đọc đầu tiên)

Đây là những điều người dùng đã nhiều lần góp ý. Làm đúng ngay từ đầu sẽ đỡ bị sửa lại.

## Cách trả lời và viết

| Việc | Cách làm |
|---|---|
| Giải thích khái niệm | Mặc định gom thành **bảng** khi có từ 2 thứ trở lên để đối chiếu; chữ chỉ để dẫn dắt |
| Tài liệu / ghi chú | Mở mục bằng 1-2 câu văn xuôi nói ý chính và "vì sao", rồi mới tới bảng. Giọng như giải thích cho đồng nghiệp |
| Ngôn ngữ | Tiếng Việt CÓ DẤU, kể cả trong code block. Tên file, nhánh, lệnh thật thì giữ nguyên |
| Công thức | Phép cộng trừ bằng tên thật, kèm ví dụ có số. Không LaTeX, không ký hiệu tập hợp |
| Sơ đồ markdown | ASCII thuần. Xem `help-writing.md` |
| Báo cáo cuối việc | Ngắn: làm gì, kết quả đo thật, chỗ chưa kiểm, điều cần người dùng quyết |
| Bàn tính năng | Liệt kê / đề xuất không phải lệnh làm. Chỉ làm khi có câu chốt rõ |

## Cách làm việc

| Tình huống | Cách làm |
|---|---|
| Ý tưởng hoặc tính năng mới (nhiều file) | Trình bày khả thi, rủi ro, kế hoạch từng bước, câu hỏi cần chốt. Chờ đồng ý rồi mới code |
| Việc nhỏ rõ ràng (sửa lỗi, chỉnh chữ) | Cứ làm |
| Kiểm tra sau khi sửa | Chỉ test đúng chỗ vừa sửa. Chạy toàn bộ khi đụng lõi dùng chung hoặc trước khi giao bản |
| Giao diện | Người dùng không phải người duyệt. Claude chính chấm PASS / CHƯA PASS theo `ui-review-checklist.md` |
| Việc to, tách được | Nhiều agent song song, không chờ tuần tự. Xem `multi-agent-workflow.md` |
| Tốn token | Chủ động tiết kiệm. Xem `token-optimization.md` |
| Hết một giai đoạn lớn | Gợi ý mở phiên mới, để lại ghi chú |

## Mẫu hướng dẫn thao tác giao diện (người dùng đã khen)

Mỗi bước gồm: tiêu đề `Bước N: <loại> <tên>`, một dòng đường bấm in đậm (**Menu > Menu > nút X**), bảng `Chỗ | Ô | Giá trị` mỗi ô một dòng, câu "Bấm **Create**", dòng kiểm tra (thấy gì là đúng, không thấy thì dừng), và 1-2 cảnh báo chỗ dễ sai. Không quá sơ sài (thiếu tên, thiếu nút) mà cũng không kể từng cú click.

## Khi dạy / ôn kiến thức

| Quy tắc | Chi tiết |
|---|---|
| Dạy lệnh trước bài tập | Lệnh nào bài tập dùng thì lý thuyết phải dạy trước, kèm bảng tham số |
| Bài xoay quanh một lệnh | Đặt 2 bảng LÊN ĐẦU bài: "Các dạng lệnh" (lệnh, làm gì, dùng khi) và "Công dụng tham số" (tham số, công dụng, ví dụ) |
| Cờ lệnh | Giải thích cả dạng ngắn `-n` lẫn dài `--name`; ghi bắt buộc hay không |
| Hóc búa kiểu phỏng vấn | Sau mỗi chủ đề thêm 1-3 câu phân biệt hai khái niệm dễ nhầm, "bẫy trước, đáp sau", nêu cả đáp án nông sai |
