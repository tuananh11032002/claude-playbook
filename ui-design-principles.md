# Nguyên tắc thiết kế giao diện (dùng cho mọi app)

Đọc khi thiết kế hoặc làm lại bất kỳ giao diện nào: web, máy tính, điện thoại. Chấm một màn hình xem `ui-review-checklist.md`; hành vi chuẩn (tải dần, thông báo, mất kết nối) xem `ux-behaviors.md`.

## 1. Quy trình

| Bước | Làm gì |
|---|---|
| Kê hết chức năng cũ | Trước khi vẽ lại, liệt kê mọi nút, trạng thái, lối đi của bản đang dùng. Bản mới không được làm rơi tính năng; danh sách này cũng lộ ra chỗ trùng, chỗ rối |
| Vẽ trước, code sau | Bản thiết kế (HTML tĩnh hoặc công cụ vẽ) cho người dùng duyệt. Mỗi màn ghi "đổi gì, học theo app nào"; đầu bản vẽ có bảng "bản đang dùng → bản mới" |
| Phân vân thì so sánh | Đặt 3–5 phương án cạnh nhau, cùng bố cục, chỉ khác đúng 1 thứ (màu, kiểu nút…), có chuyển động thật nếu là hiệu ứng. Người dùng chọn bằng mắt nhanh hơn đọc mô tả. Vẫn phân vân thì làm hết, cho chọn trong app |
| Thử trên thiết bị thật | Bản vẽ đẹp chưa chắc lên máy đẹp (khung nhỏ trong bản vẽ, lên màn thật mảng màu to gấp đôi). Chụp màn thật trước khi báo xong |
| Làm trên nhánh riêng | Người dùng dùng thử, ok mới gộp; người dùng hay đổi ý sau khi thấy thật |

## 2. Ít thông tin, không rối mắt (người dùng rất nhạy chỗ này)

| Nguyên tắc | Cách làm |
|---|---|
| Mỗi màn 1 việc chính | Việc phụ đi sau, việc hiếm vào menu "⋯" |
| Mỗi dòng chỉ tên + giá trị | Không thêm dòng mô tả dưới mỗi mục; chi tiết ở lớp sau: sheet, trang con, (i), mục "Nâng cao" đóng sẵn |
| Một thông tin chỉ ở 1 chỗ | Cùng 1 cài đặt / nút xuất hiện 2–3 nơi là lỗi thiết kế |
| Màn nhiều mục: khoảng 5–7 dòng | Nhiều hơn thì chia nhóm hoặc trang con |
| Gom mục đạt | Một dòng "N mục đạt" mở được; chỉ trải ra chỗ có vấn đề |
| Khung nhiều bước | Mở một bước một lúc; chỉ mở sẵn bước có vấn đề |
| Lúc đang chạy | Màn chỉ còn tiến độ + nút dừng |
| Báo ngắn | Thanh / chip 1 dòng tự ẩn; chỉ bật hộp chặn ngang khi bắt buộc |
| Cấp quyền, thiết lập lần đầu | Một màn một bước: hình, 1 câu, 1 nút; tình huống hiếm để sau nút "Không làm được?" |
| Màn trống | 1 câu ngắn + đúng 1 nút chính |

## 3. Dễ thao tác

| Nguyên tắc | Cách làm |
|---|---|
| 1 nút chính, ở chỗ dễ với nhất | Điện thoại: dính đáy, tầm ngón cái. Máy tính: thanh nút dính đáy, `[Phụ] [Chính]` canh phải |
| Nút chính tự đổi theo tình huống | Thiếu gì thì nút làm đúng việc đó ("Bật quyền…", "Thêm…"), đủ rồi mới là việc chính; người mới không phải đoán bước tiếp |
| Thứ bấm được phải nhìn ra là bấm được | Nền / viền, mũi tên ›, gợn sóng khi bấm. Gọn không có nghĩa là chìm |
| Vùng chạm đủ lớn | Điện thoại ≥ 48dp |
| Nút không nhảy chỗ | Khi đổi trạng thái, nút cũ đứng yên, nút mới mọc ra ngoài; nút vừa đổi nghĩa thì khóa chạm ~150 ms để tránh bấm theo quán tính |
| Phản hồi ngay | Vẽ lại ngay khi bấm (≤ 150 ms), không đợi nhịp cập nhật định kỳ |
| Bấm không làm bố cục nhảy | Chữ trạng thái đổi theo thao tác giữ chiều cao cố định (1 dòng + "…"); chữ cạnh công tắc / nút có bề rộng cố định; phần hiện / ẩn dùng chuyển cảnh ngắn; số chạy dùng font số đều. Người dùng rất khó chịu khi cả màn "đôn lên đôn xuống" |
| Không có thao tác ẩn | Nhấn giữ, vuốt bí mật mà không có gợi ý thì coi như không tồn tại; đổi thành chạm dòng / nút rõ |
| Xóa | Cho Hoàn tác thay vì hỏi lại; việc thật sự nguy hiểm thì đỏ, nằm riêng ở cuối, hỏi lại |
| Thông số theo lựa chọn | Nằm ngay dưới lựa chọn đó, chỉ hiện của lựa chọn đang chọn |
| Máy đoán được thì điền sẵn | Ghi "(tự nhận)"; có "Chỉnh tay"; chỉ đánh dấu bắt buộc cho ô thật sự phải quyết |
| Hành động cạnh thứ nó tác động | File vừa tạo kèm "Mở file" ngay dòng đó |

## 4. Màu

| Nguyên tắc | Chi tiết |
|---|---|
| Màu phải có ý nghĩa | Nhận diện khu vực, trạng thái (lỗi / cảnh báo / ok). Không để trang trí |
| Tránh nhiều khối màu đậm cạnh nhau | Dùng sắc nhạt (kiểu Material You) hoặc nền trắng + icon màu |
| Tránh mảng tối lớn trên trang sáng | Nhìn nặng dù trong bản vẽ thấy ổn; thẻ tối chỉ hợp trang nền tối |
| Trạng thái "tắt" vẫn phải rõ | Công tắc tắt có rãnh đủ đậm + viền; nhìn được trên màn kém |
| Cấm | Gradient trang trí, thẻ KPI / số liệu bịa, nhãn marketing, chữ IN HOA cả dòng, emoji làm icon |
| Token | Màu, cỡ chữ (khoảng 3 cỡ mỗi màn), bóng, bo góc khai báo ở 1 chỗ; bảng màu là dữ liệu, không if/else rải rác |
| Sáng / tối | Bản tối sinh từ token |
| Màu nhận diện có sẵn | Hỏi trước khi đổi, người dùng có thể muốn giữ dù phương án khác đẹp hơn |

## 5. Cài đặt và điều hướng

| Nguyên tắc | Cách làm |
|---|---|
| Cài đặt chung sau ảnh đại diện | Thói quen app Google: bấm ảnh đại diện → thẻ tài khoản xổ sẵn các mục chung |
| Cài đặt riêng nằm đúng chỗ dùng | Không lặp ra ngoài; ngoài chỉ có cài đặt chung |
| Nhiều khu vực / công cụ | Có màn chính gom lại (lưới ô), mỗi khu vực có ← về màn chính; khu vực đang chạy hiện băng "đang chạy · Mở" |
| Công cụ dùng chung | Độc lập với từng khu vực; tắt / đổi khu vực không được tắt nó |

## 6. Lớp nổi trên nội dung (bảng nổi, menu, bong bóng, thanh điều khiển)

| Nguyên tắc | Cách làm |
|---|---|
| Càng ít nút càng tốt | 1 nút chính to + 1–2 nút + "⋯"; "Thoát" đỏ ở cuối menu |
| Không che nội dung | Lúc chờ thu nhỏ (viên, bong bóng), nép nửa vào mép; báo bằng chip nhỏ 1 dòng sát mép trên, tự ẩn |
| Trong suốt, tự mờ | Nền kính trong suốt; không chạm vài giây thì mờ; chạm là rõ lại và cú chạm vẫn tính |
| Thứ phải đọc thì rõ | Menu gần như đặc; thứ nhỏ (bong bóng) không làm mờ, mờ thành xám bẩn |
| Hiệu ứng không chặn chạm | Sóng, quầng sáng vẽ ở lớp không nhận chạm |
| Mỗi thứ nổi có nút tắt riêng | Tắt cái này không được tắt kèm cái khác |
| Lúc quan trọng luôn rõ 100% | Vừa có kết quả, sắp tới giờ, có lỗi, đang kéo, menu đang mở |

## 7. Học từ app lớn: muốn làm X thì xem app nào

| Muốn làm | Xem |
|---|---|
| Hẹn giờ, đếm ngược | Đồng hồ Google (giờ là chữ to nhất, đang chạy chỉ còn đồng hồ + Dừng) |
| Trang cài đặt | Cài đặt Android / iOS |
| Cài đặt tài khoản | Gmail, YouTube (bấm ảnh đại diện) |
| Báo ngắn, hoàn tác | Snackbar của Gmail; Dynamic Island của iPhone |
| Thu gọn thành bong bóng | Bong bóng chat Messenger |
| Menu bung quanh 1 nút nổi | AssistiveTouch của iPhone |
| Đang làm việc dài trên nền | Google Maps lúc dẫn đường |
| Lưới chức năng ở màn chính | MoMo, Zalo; Samsung Good Lock |
| Bảng màu dịu theo khu vực | Material You (Google Home, Cài đặt Pixel) |
| Cấp quyền từng bước | Google Pay, Zalo |
| Danh sách thêm / sửa / xóa | Google Keep, danh bạ |
| Trang quản trị | Google Admin, Stripe, Linear (bảng + khung chi tiết bên phải, tự lưu) |

## 8. Riêng từng nền tảng

**Máy tính / web:** bảng lệnh Ctrl+K; nút trên dòng bảng chỉ hiện khi rê chuột (trừ dòng lỗi); đường dẫn chỉ hiện tên file, đầy đủ khi rê chuột, luôn có "Sao chép"; responsive có bậc (vd ≥1600 ba cột, 1200–1599 hai cột, nhỏ hơn thì cột bước thành ngăn kéo); màn có đầu vào nhận kéo thả + nút chọn file + danh sách "Gần đây".

**Điện thoại:** chỉnh sửa mở dạng sheet trượt từ dưới (nút Xong ở đáy); nội dung và nút dồn nửa dưới màn; 1 biểu tượng app, lối tắt khi nhấn giữ biểu tượng cho từng khu vực; ô trong thanh cài đặt nhanh cho công cụ hay bật / tắt.

## 9. Thư viện thành phần dùng chung

Từ 3 màn trở lên thì dựng 1 bộ thành phần dùng chung (đầu trang, menu "⋯", dòng tên + giá trị, sheet, thanh nút đáy, trạng thái rỗng, hộp xác nhận, thanh báo có Hoàn tác…) nhận màu khu vực làm tham số, kèm 1 file mục lục ngắn: dùng khi nào, tham số, ví dụ 3 dòng. Agent mới đọc mục lục thay vì tự chế lại.
