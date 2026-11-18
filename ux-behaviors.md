# Hành vi UX chuẩn

Giao diện tốt không chỉ đẹp mà còn phản hồi đúng lúc. Dưới đây là các hành vi đã được người dùng duyệt; thiết kế hay chấm màn nào cũng kiểm các mục này.

## Tải dần, không chặn người dùng

Hiện ngay phần rẻ, phần nặng chạy nền rồi điền vào chỗ của nó. Người dùng đã khen đúng kiểu này: "load lên, thông tin hiện ra, bên dưới xử lý nền phần chưa đọc xong".

| # | Quy tắc |
|---|---|
| 1 | Hiện ngay thứ rẻ (tên file, danh sách bảng, cột); quét mẫu, đếm dòng, dựng chỉ mục chạy nền |
| 2 | Không chặn người dùng nếu kết quả chỉ để tham khảo; không phủ cả màn bằng "Đang mở..." |
| 3 | Chờ quá ~300 ms thì ghi rõ "đang làm gì, với cái gì"; biết x/N thì hiện số; không bao giờ chỉ vòng quay trơn |
| 4 | Mỗi khối đủ 4 trạng thái: chưa đủ điều kiện (kèm hướng dẫn), đang chạy, xong, lỗi (lý do + "Thử lại") |
| 5 | Đổi input hoặc rời màn thì huỷ việc nền cũ; kết quả đã tính lưu theo input, quay lại không tính lại |
| 6 | Dữ liệu nặng cache theo đường dẫn + thời điểm sửa file; không nạp ngầm trong constructor |

Khối tự chạy phải nói vì sao nó chạy và dùng để làm gì.

## Trạng thái

| Trạng thái | Cách hiện |
|---|---|
| Trống | Icon xám + 1 câu + tối đa 1 nút (nút chính của màn đã có ở tiêu đề thì nút này thành phụ) |
| Tìm không ra | Nói rõ từ khoá + "Xoá tìm", khác với "chưa có dữ liệu" |
| Đang chạy | Chữ cụ thể + x/N hoặc %; việc dài: bước hiện tại, tốc độ, còn bao lâu |
| Lỗi | Lý do ngắn + "Thử lại"; chi tiết kỹ thuật trong "Xem chi tiết" |
| Mất kết nối | Thanh đáy: "Mất kết nối với tool. Tải lại trang (dữ liệu đã lưu không mất)" |

## Thông báo: 5 mức, khai báo một chỗ

| Mức | Chặn nút? |
|---|---|
| Lỗi chặn | Có |
| Cảnh báo | Không, nhưng kết quả có thể sai |
| Thông tin | Không |
| Thành công | Không |
| Đang xử lý | Không |

Mỗi mức 1 icon + 1 màu, ánh xạ ở MỘT nơi trong code. Câu thông báo gồm nguyên nhân cụ thể + con số + cách sửa + nút sửa nhanh nếu có. Xấu: "Không kết nối được DB" cho mọi lỗi. Tốt: "Trùng tên file nguồn data.csv. Đổi tên".

## Bàn phím và trợ năng

| Phím / thành phần | Hành vi |
|---|---|
| Enter | Bấm nút chính (làm một lần ở khung app; ô nhập nhiều dòng thì không bắt) |
| Esc | Đóng mọi lớp phủ, focus quay về nút đã mở nó |
| Tab | Đúng thứ tự, không kẹt; bọc tooltip không được tốn thêm 1 lần Tab |
| Focus | `:focus-visible` có viền rõ |
| Nút icon | Có tooltip ghi phím tắt + `aria-label` |
| Ctrl+K | Bảng lệnh đi tới mọi công cụ |
| Ctrl+O | Mở file |

## An toàn dữ liệu

| Tình huống | Hành vi |
|---|---|
| Ghi đè, xoá, sửa file gốc | Xác nhận, nêu đúng tên thứ sẽ mất |
| Chuyển đổi có thể mất dữ liệu | Khối "Rủi ro" (dòng nặng nhất lên đầu), phải tick đồng ý |
| Đóng form đang sửa dở | Hỏi "Bỏ thay đổi?" (nền tối, Esc, Huỷ đều tính) |
| "Chạy lại" file đã có | Hỏi ghi đè hay tạo file mới |
| Việc phá dữ liệu | Luôn nhìn ra khác với việc thường (không dùng nút chính mặc định) |

## Giao diện không được sập

| Rủi ro | Cách chặn |
|---|---|
| Lời gọi JS thiếu file hoặc lỗi làm sập cả phiên | Bọc mọi lời gọi JS trong try/catch, hiện lỗi thân thiện |
| Mất kết nối server | Thanh báo + khung "đang kết nối lại" bằng tiếng Việt |
| Lỗi chưa bắt | Khung lỗi gọn có nút "Tải lại", không màn trắng |
| Dán văn bản quá lớn | Chặn phía client trước khi gửi (xem `blazor-notes.md`) |

## Nút khoá và nút kết quả

Nút bị khoá luôn có 1 dòng lý do ngay cạnh. Màn kết quả: khối "File đã tạo" đứng đầu, nút "Mở file" / "Mở thư mục" ngay cạnh đường dẫn; dòng lỗi có nút "Xem" ngay cạnh.

## Lỗi kết nối cơ sở dữ liệu

Kiểm tra DNS (3 giây) rồi TCP (5 giây) trước, rồi mới để driver chờ timeout dài. Thông báo nêu bước nào hỏng (không phân giải được tên / không mở được cổng / sai mật khẩu).
