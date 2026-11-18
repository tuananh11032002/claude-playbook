# Đóng gói app chạy trên máy không có Internet

Máy chạy thật có thể là server không mạng, nên bản đóng gói phải tự đủ: không cần cài runtime, không tải gì lúc chạy.

## Nguyên tắc

| Nguyên tắc | Chi tiết |
|---|---|
| Self-contained | Publish kèm runtime (ví dụ .NET self-contained, Windows x64); máy đích không cần cài gì |
| Không CDN | Font, JavaScript, CSS, icon, nền bản đồ, dữ liệu tham chiếu đều nằm trong gói |
| Giấy phép | Thư viện đóng gói kèm phải MIT / Apache / BSD (kiểm trước khi thêm) |
| Giữ đúng bản runtime | `RollForward=LatestPatch`; kiểm `runtimeconfig.json` của gói: chỉ đúng bản lớn yêu cầu. Từng chạy nhầm bản mới hơn làm một file JS của framework trả 404 |
| Một lệnh | Một script `dong-goi.ps1`: publish, chép file chạy, ghi `PHIEN-BAN.txt` (số bản, ngày, commit), nén zip |
| An toàn khi xoá | Script chỉ xoá bản đóng gói cũ BÊN TRONG thư mục đích; từ chối ổ đĩa gốc và thư mục mã nguồn |
| Lỗi thì dừng | Publish lỗi: dừng ngay và báo, không đóng zip dở |
| Số phiên bản | Đặt ở một chỗ (`Directory.Build.props`, thẻ `<Version>`) |

## Kiểm tra gói trước khi mang đi

Script `kiem-tra-goi.ps1` giải nén vào thư mục tạm NGOÀI repo, chạy exe từ một thư mục làm việc khác (cổng riêng, không mở trình duyệt), rồi kiểm:

| Việc | Đạt khi |
|---|---|
| Các trang chính + file CSS / JS của framework | Trả 200 |
| Tiến trình đang chạy | Runtime nạp từ thư mục gói, đúng bản lớn |
| Chụp giao diện | Có `M4: ĐẠT` (0 request ra ngoài 127.0.0.1) |
| Chạy thử bằng CLI trên dữ liệu mẫu | File kết quả được tạo |

Dữ liệu người dùng khi kiểm tra tách riêng bằng biến môi trường trỏ vào thư mục tạm, không đụng dữ liệu thật. Thoát mã 1 nếu có bước hỏng. Dọn thư mục tạm sau khi kiểm.

## File chạy kiểu "bấm đúp là chạy"

| Hành vi file `.bat` | Lý do |
|---|---|
| Cổng đã có chương trình KHÁC nghe | Báo rõ và chỉ cách đổi cổng, không mở trình duyệt vào chương trình lạ |
| Chỉ mở trình duyệt khi cổng đúng là của tool | Tránh mở nhầm |
| Cho phép đổi cổng bằng tham số | `--urls http://127.0.0.1:5290` |
| Câu `echo` thuần ASCII | Font console cũ trên server không hiển thị dấu |
| Ghi stderr ra file log | Lỗi khởi động không biến mất cùng cửa sổ đen |
| Dùng xong đóng cửa sổ đen là tắt tool | Ghi rõ trong hướng dẫn |
| (Tùy chọn) tự tìm cổng trống, script cập nhật chạy từ bản sao ở thư mục tạm, từ chối khi tool đang chạy, sao lưu cấu hình riêng | Chỉ làm khi người dùng chốt |

## Cài lên máy chủ: hướng dẫn cho người dùng

| Bước | Làm gì |
|---|---|
| 1 | Chép file zip lên máy chủ |
| 2 | Giải nén vào thư mục riêng |
| 3 | Bấm đúp file `.bat`, trình duyệt tự mở địa chỉ `http://127.0.0.1:<cổng>` |
| 4 | Dùng xong đóng cửa sổ đen |

Mỗi tài khoản Windows có dữ liệu riêng ở `%LOCALAPPDATA%\<tên-tool>`; muốn xoá sạch thì tắt tool rồi xoá thư mục đó. Cấu hình dùng chung đặt cạnh exe; thư mục không ghi được thì lưu ở `%LOCALAPPDATA%`. Nơi lưu kết quả mặc định nên là thư mục cục bộ của máy (đọc file qua ổ mạng rất chậm); ổ mạng vẫn chọn làm đầu vào bình thường.

## Phần mềm bên thứ ba trên máy không mạng

Một số phần mềm (ví dụ app GIS) tự tải font thiếu và hiện hộp thoại lỗi khi không có mạng. Không liên quan dữ liệu tool xuất ra; tắt tùy chọn tự cài font trong Options của phần mềm đó và ghi vào hướng dẫn.

## Danh sách kiểm trước khi giao

| Mục | Đã làm? |
|---|---|
| Ổ đĩa còn trống đủ để publish + zip (xem `windows-pitfalls.md`) | |
| Đã nâng số bản + CHANGELOG (xem `release-and-versioning.md`) | |
| Gói chạy được từ thư mục lạ, không có runtime cài sẵn | |
| M4 đạt | |
| Quét bí mật và đường dẫn nội bộ trước khi đưa lên bất cứ đâu | |
