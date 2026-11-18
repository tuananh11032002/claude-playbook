# Bảng chấm giao diện PASS / CHƯA PASS

Người chấm là Claude chính (lead), không phải người dùng. Màn nào cũng phải qua bảng này mới được gộp vào main. Trả lời từng màn: **PASS**, hoặc **CHƯA PASS** + danh sách mã + chỗ cần sửa.

## Người dùng là ai, quen gì

| Họ là | Họ quen | Giao diện nên |
|---|---|---|
| Dev / dân văn phòng đang cầm sẵn 1 file | Mở file rồi mới chọn việc | Bắt đầu từ file: kéo thả / Ctrl+O, tool tự nhận rồi gợi ý |
| Dùng Windows, màn 24-27" | Hộp thoại chọn file gốc, Enter / Esc, chuột phải, kéo thả | Hộp thoại gốc; Enter = nút chính, Esc = đóng; nhớ thư mục lần trước |
| Làm lặp đi lặp lại | Không muốn chọn lại từ đầu | Nhớ lựa chọn; "Chạy lại" từ lịch sử |
| Bận, dữ liệu to | Không chịu nổi màn hình đơ | Phần nhanh hiện ngay, phần nặng chạy nền, huỷ được |

## G - Gọn, không rối (bắt buộc)

| Mã | Tiêu chí |
|---|---|
| G1 | Tối đa 1 nút chính (màu nhấn) + 1-2 nút phụ mỗi màn; còn lại vào menu "..." |
| G2 | Chỉ hiện vấn đề: mục đạt gom 1 dòng; giải thích dài sau (i); tùy chọn ít dùng trong "nâng cao" (đóng, có tóm tắt 1 dòng) |
| G3 | Bảng ít cột: thông tin phụ thành dòng 2 màu xám; cột gần như toàn "-" thì bỏ; nút trên dòng chỉ hiện khi rê chuột (trừ dòng lỗi) |
| G4 | Đường dẫn chỉ hiện tên file, đầy đủ khi rê chuột; luôn có "Sao chép đường dẫn" |
| G5 | Không đồ trang trí: chip kỹ thuật ở tiêu đề, badge "trực tiếp", số phiên bản, avatar, KPI bịa, chữ IN HOA, gradient |
| G6 | Radio chỉ hiện ô nhập của lựa chọn đang chọn; tab không gắn số (trừ số lỗi / cảnh báo) |

## Q - Quen tay (bắt buộc)

| Mã | Tiêu chí |
|---|---|
| Q1 | Menu trái chung, mục đang ở được tô; Ctrl+K mở bảng lệnh |
| Q2 | Màn có đầu vào: kéo thả + nút "Chọn file" + "Gần đây" |
| Q3 | Enter = nút chính, Esc = đóng ngăn / hộp thoại; Tab đúng thứ tự; vòng focus thấy rõ |
| Q4 | Mặc định đúng cho đa số, chạy ngay không cần chỉnh |
| Q5 | Việc phá dữ liệu (ghi đè, xoá, sửa file gốc, DROP) phải xác nhận, nêu đúng tên thứ sẽ mất |
| Q6 | Xong việc có bước tiếp rõ ràng (Mở file / Mở thư mục / Xem lỗi) và ghi vào Lịch sử |
| Q7 | Nhớ lựa chọn lần trước (thư mục, định dạng...) |

## T - Tải dần, phản hồi (bắt buộc)

| Mã | Tiêu chí |
|---|---|
| T1 | Phần nhanh hiện ngay; phần nặng chạy nền với chữ "đang làm gì" cụ thể |
| T2 | Không lớp phủ chặn cả màn khi chạy nền được; mọi việc lâu có Huỷ |
| T3 | Đổi lựa chọn thì huỷ việc cũ, không lẫn kết quả cũ và mới |
| T4 | Đủ 4 trạng thái: rỗng (1 câu + 1 nút), đang tải (khung xương / dòng chờ), có dữ liệu, lỗi |

## L - Lỗi và rủi ro (bắt buộc)

| Mã | Tiêu chí |
|---|---|
| L1 | Lỗi nêu **nguyên nhân thật + cách sửa** bằng lời thường, chỉ đúng chỗ (bảng / dòng / cột); không stack trace (chi tiết sau "Chi tiết") |
| L2 | Thao tác có thể mất dữ liệu: hiện "Rủi ro", dòng nặng nhất lên đầu, phải tick đồng ý mới chạy |

## M - Màu, chữ, kích thước (bắt buộc)

| Mã | Tiêu chí |
|---|---|
| M1 | Chỉ dùng token màu trong file CSS chung; 1 màu nhấn; màu trạng thái chỉ báo trạng thái; sáng và tối đều đọc rõ (tương phản >= 4.5:1) |
| M2 | Tiếng Việt có dấu, viết hoa đầu câu; số kiểu Việt Nam; không lẫn chữ Anh khi có từ Việt thông dụng |
| M3 | 1920x1080 và 2560x1440: không cuộn ngang, không khoảng trống vô nghĩa (form có độ rộng tối đa); 1366x768 vẫn dùng được |
| M4 | Chạy offline: 0 request ra ngoài 127.0.0.1 (font, icon, thư viện đều local) |
| M5 | Nút chỉ có icon phải có tooltip + aria-label |

## Bảng rà nhanh theo 5W2H

| Nhóm | Câu hỏi |
|---|---|
| What / Why | Màn này để làm gì? Mỗi khối tự nói nó là gì, vì sao ở đây? |
| How / How much | Người dùng biết bước tiếp theo? Có con số (bao nhiêu dòng, lỗi) không? |
| Where | Kết quả nằm đâu, mở bằng 1 bấm được không? |
| Nút khoá | Có lý do ngay cạnh? |
| Cảnh báo | Nói đúng nguyên nhân, có cách sửa, không mâu thuẫn chỗ khác? |
| An toàn | Đóng khi đang sửa dở có hỏi? Ghi đè file có báo? |
| Thân thiện | Mất kết nối / lỗi có câu nói phải làm gì? |

## Agent nộp gì để được chấm

| Thứ nộp | Chi tiết |
|---|---|
| Ảnh chụp thật | Mỗi màn: sáng + tối, 1920x1080 + 2560x1440, đủ 4 trạng thái T4 và trạng thái riêng của màn (rủi ro, đang chạy), cả trạng thái MỞ HẾT |
| Bảng tự kiểm | Theo mã trên: Đạt / Không áp dụng / Chưa đạt (lý do) |
| Kiểm M4 | Log request của trình duyệt khi chụp, không có địa chỉ ngoài |

Lead chỉ xem 1-2 ảnh mỗi màn (xem `screenshot-review.md`).
