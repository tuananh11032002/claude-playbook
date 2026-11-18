# Ghi chú Blazor Server / app .NET kiểu desktop

Dành cho app chạy cục bộ cho một người dùng (mở bằng trình duyệt tại 127.0.0.1), không phải web nhiều người.

## Bảng bẫy và cách xử lý

| Chủ đề | Bẫy | Cách xử lý |
|---|---|---|
| Hộp thoại chọn file gốc | Mở sai luồng, hiện sau trình duyệt, chồng nhiều hộp | Chạy trên luồng STA riêng; chỉ cho MỘT hộp thoại tại một thời điểm; đưa hộp thoại lên foreground (AttachThreadInput + SetForegroundWindow) |
| Dán văn bản lớn | Vượt giới hạn kích thước tin nhắn SignalR làm đứt mạch (circuit) | Chặn phía client TRƯỚC khi gửi; báo thân thiện (nguyên nhân + cách sửa: dùng "Mở file" thay vì dán) |
| Bộ nhớ | Server GC làm app một người dùng ngốn 300-690 MB | `ServerGarbageCollection=false`: còn ~170 MB |
| Việc nền báo "Xong" | Báo trước khi Task hoàn tất làm `InvokeAsync` chạy inline và deadlock | Phát sự kiện "Xong" SAU KHI Task kết thúc |
| Component render lại sau khi đóng | Truy cập null | Guard null cho component có thể render thêm một lần sau khi đóng |
| Test thời gian | Lúc chạy được lúc không | Cho vào collection riêng không chạy song song, hạn chót dài hơn |
| Kiểm tra kết nối DB | Treo đến hết timeout dài của driver | Tiền kiểm DNS (3 s) rồi TCP (5 s), báo rõ bước hỏng |
| Font code / ô monospace | Ligature biến `>=` thành dấu lớn hơn hoặc bằng và `<>` thành hình thoi | `font-variant-ligatures: none; font-feature-settings: "liga" 0, "calt" 0` |
| Thiếu file JS làm sập phiên | Lời gọi JS ném lỗi | Bọc try/catch mọi lời gọi JS interop |

## Viewer dữ liệu lớn kiểu Excel

Mục tiêu: tối đa vùng dữ liệu, mượt với hàng triệu dòng.

| Thành phần | Làm gì |
|---|---|
| Vùng dữ liệu | Chiếm tối đa chiều cao màn hình |
| Hàng | Cao 22 px |
| Tiêu đề cột | Dính (sticky) khi cuộn |
| Thanh trạng thái | Dòng, cột, vị trí con trỏ, đang làm gì |
| Chế độ tập trung / toàn màn hình | Ẩn mọi thứ trừ bảng |
| Chỉ mục vị trí dòng | Lưu offset byte của một dòng cho mỗi N dòng để nhảy nhanh |
| Đọc dạng luồng (streaming) | Không nạp cả file vào bộ nhớ |
| Hiện dòng đầu NGAY | Chưa đếm xong tổng số dòng vẫn hiện; số tổng điền sau (xem `ux-behaviors.md`) |
| Cache | Theo đường dẫn + thời điểm sửa file |

## Cấu trúc gợi ý

| Thư mục | Vai trò |
|---|---|
| `src/<App>.Core` | Lõi, có test, không phụ thuộc giao diện |
| `src/<App>.Cli` | Lệnh; registry mỗi lệnh 1 dòng |
| `src/<App>.Web` | Blazor Server; thành phần dùng chung ở `Components/Shared` |
| `tests/<App>.Core.Tests` | Test lõi |

## Chạy cục bộ an toàn

| Việc | Ghi chú |
|---|---|
| Chỉ nghe `127.0.0.1` | Không mở ra mạng |
| Cổng cố định + phát hiện cổng bận | Xem `offline-packaging.md` |
| Dữ liệu người dùng ở `%LOCALAPPDATA%` | Có biến môi trường để tách khi chạy thử |
| Chuỗi kết nối lưu | Mã hoá bằng DPAPI (xem `misc-lessons.md` về entropy) |

## Việc nền và huỷ

Mỗi việc nền có `CancellationToken`, nút Huỷ, và dòng chữ trạng thái cụ thể. Đổi input thì huỷ việc cũ trước khi chạy việc mới. Cập nhật giao diện từ luồng nền qua `InvokeAsync`, nhưng chỉ sau khi chắc chắn không giữ khoá nào mà `InvokeAsync` cần.

## Tên biến cấm trong file .razor

| Bẫy | Cách tránh |
|---|---|
| Đặt biến `section` rồi viết `@section.Label`: Razor của Visual Studio hiểu `@section` là directive, báo RZ2005/RZ1011 (`dotnet build` vẫn qua nên dễ lọt) | Không đặt biến trùng từ khoá Razor: `section`, `page`, `code`, `inject`, `model`, `layout`... Dùng tên rõ nghĩa: `menuSection` |
