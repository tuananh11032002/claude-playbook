# Nguyên tắc thiết kế giao diện tool nội bộ

Tool cho người dùng làm việc hằng ngày nên đi theo kiểu các công cụ năng suất lớn (Linear, Vercel, GitHub, Figma, VS Code, PowerToys / Fluent 2), không theo kiểu trang quảng cáo. Gọn, trung tính, một màu nhấn.

## Nên và không nên

| Nên | Không |
|---|---|
| Nền trung tính, 1 màu nhấn, icon đơn sắc | Lưới thẻ nhiều màu, gradient |
| Menu trái nhóm theo chủ đề, mục đang ở được tô | Nhãn marketing ("Enterprise", "Zero-copy") |
| Danh sách gọn, bảng ít cột | Ô KPI và số bịa; chỉ dùng số từ dữ liệu thật |
| Tối đa 1 nút chính mỗi màn, còn lại vào menu "..." | Nhiều nút cùng nổi bật |
| Có Ctrl+K (bảng lệnh) đi tới mọi công cụ | Bắt người dùng lần từng menu |
| Chữ thường, viết hoa đầu câu | Chữ IN HOA cả dòng |
| Thứ bấm được NHÌN RA bấm được (màu link, viền, hover) | Nút giống chữ thường |

## Chống rối mắt (người dùng rất nhạy chỗ này)

Nếu bắt buộc phải nhồi nhiều thông tin thì phải có cơ chế "bấm mới hiện".

| Kỹ thuật | Áp dụng |
|---|---|
| Gom mục đạt | Một dòng "OK N mục đạt" có thể mở; chỉ trải ra vấn đề |
| Tùy chọn ít dùng | Vào "Tùy chọn nâng cao", đóng sẵn, kèm tóm tắt 1 dòng |
| Giải thích dài | Sau dấu (i) hoặc mở dòng |
| Đường dẫn | Chỉ hiện tên file, đầy đủ khi rê chuột, luôn có "Sao chép đường dẫn" |
| Khung nhiều bước | Accordion MỞ MỘT BƯỚC MỘT LÚC; chỉ mở sẵn bước có vấn đề; bước tự nhận đúng chỉ 1 dòng + "Sửa" |
| Một thông tin | Chỉ hiện ở 1 chỗ |
| Nút trên dòng bảng | Chỉ hiện khi rê chuột (trừ dòng lỗi) |

Khi chấm phải xem cả trạng thái MỞ HẾT, không chỉ ảnh mặc định.

## Bắt đầu từ thứ người dùng đang cầm

Người dùng quen mở file rồi mới chọn việc (Excel, VS Code). Màn có đầu vào nhận kéo thả + nút "Chọn file" (hộp thoại gốc của hệ điều hành) + danh sách "Gần đây"; tool tự nhận kiểu rồi gợi ý việc.

## Máy tự nhận và người phải quyết

Ô có giá trị đoán được thì điền sẵn, ghi "(tự nhận)" và lý do đoán; để trống thì quay về mặc định; nút "Chỉnh tay" mở phần chọn. Chỉ đánh dấu bắt buộc cho ô thật sự phải quyết.

## Màu và chữ

| Quy tắc | Chi tiết |
|---|---|
| Token | Màu, cỡ chữ (khoảng 3 cỡ mỗi màn), bóng (3 mức), bo góc khai báo ở MỘT file CSS |
| Sáng / tối | Tối sinh từ token; mẫu thiết kế (nếu dùng công cụ vẽ) chỉ cần bản sáng, màu tự phối. Chữ tương phản >= 4.5:1 |
| Màu trạng thái | Chỉ để báo trạng thái (lỗi, cảnh báo, ok); nền cảnh báo nhạt (6-10%) |
| Số | Kiểu Việt Nam khi hiển thị (1.234.567 và 12,5 MB); dữ liệu xuất giữ dấu chấm |
| Font code | Tắt ligature (xem `blazor-notes.md`) |

## Bài học UX rút từ tool lớn

| Bài học | Cách làm |
|---|---|
| Huy hiệu trạng thái mỗi bước | OK / cảnh báo / lỗi ngay trên tiêu đề bước, kể cả khi đang thu gọn |
| Nút khoá | Luôn có 1 dòng lý do cạnh nút, không chỉ tooltip |
| Màn trống | 1 câu ngắn + đúng 1 nút chính; tìm không ra thì nói rõ từ khoá + nút "Xoá tìm" |
| Thứ tự nút | `[Phụ] [Chính]` canh phải, nút là động từ ("Lưu", "Huỷ xuất") |
| Thanh nút dính đáy | Nút chính luôn thấy, không phải cuộn tìm |
| Hành động cạnh thứ nó tác động | File vừa tạo kèm "Mở file" / "Mở thư mục" ngay cạnh |
| Đóng form dở | Hỏi "Bỏ thay đổi?" |
| Nhiều cảnh báo | Gom 1 dòng đếm ("1 lỗi, 2 cảnh báo") rồi mới liệt kê; trạng thái bước tính từ chính danh sách đó, không để 2 chỗ nói 2 ý |
| Responsive có bậc | Ví dụ >=1600 ba cột, 1200-1599 hai cột, dưới 1200 cột bước thành ngăn kéo |

## Thư viện thành phần dùng chung

Khi dự án có từ 3 màn trở lên, dựng catalog thành phần dùng chung (một file mục lục ngắn): đầu trang, menu "...", nhóm "mục đạt", tùy chọn nâng cao, hiển thị đường dẫn, bảng danh sách hai dòng, vùng thả file + gần đây, trạng thái rỗng, dòng việc nền (có Huỷ), hộp xác nhận, ngăn kéo (Esc, tự focus, `role="dialog"`), panel trợ giúp mỗi màn. Mỗi thành phần ghi: dùng khi nào, tham số, ví dụ 3 dòng. Agent mới đọc mục lục này thay vì tự chế lại. Màn mới nên chỉ cần: 1 file trang, 1 thư mục riêng, 1 dòng đăng ký dịch vụ, 1 dòng vào menu, 1 mục help.
