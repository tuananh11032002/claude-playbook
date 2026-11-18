# Phong cách code: dễ đọc trước tiên

Áp dụng khi viết hoặc sửa code. Mục tiêu: code đọc như một chuỗi khái niệm nghiệp vụ, không phải chuỗi bước cài đặt. Hành vi phải giữ nguyên; chỉ refactor để dễ đọc và dễ bảo trì.

## Quy tắc dễ đọc

| # | Quy tắc |
|---|---|
| 1 | Code điều phối cấp cao viết theo kiểu khai báo |
| 2 | Chi tiết cài đặt tách thành hàm phụ đặt tên rõ nghĩa |
| 3 | Mỗi pipeline LINQ chỉ là MỘT phép biến đổi logic, không gánh nhiều trách nhiệm |
| 4 | Lambda phức tạp thay bằng method reference có tên nói rõ ý định |
| 5 | Chuỗi cấu hình / literal lặp lại gom vào biến cục bộ |
| 6 | Ưu tiên code đọc như chuỗi khái niệm nghiệp vụ |
| 7 | Tách theo khái niệm nghiệp vụ, không chỉ vì "dài" |
| 8 | Parse, xử lý null, chuyển kiểu giấu sau hàm có tên |
| 9 | Đăng ký dependency injection không chứa logic parse hay map |
| 10 | Dễ đọc hơn là ít dòng hơn |
| 11 | Biểu thức lồng nhau: thay bằng biến có tên hoặc hàm phụ |
| 12 | Giữ nguyên hành vi; refactor chỉ vì đọc và bảo trì |

## Ví dụ: trước và sau

```csharp
// Trước: một biểu thức làm 3 việc
var active = users.Where(u => u.LastLogin != null && (DateTime.UtcNow - u.LastLogin.Value).Days < 30)
                  .Select(u => u.Email.Trim().ToLower()).Distinct().ToList();

// Sau: đọc như câu nghiệp vụ
var active = users.Where(IsActiveRecently).Select(NormalizedEmail).Distinct().ToList();

static bool IsActiveRecently(User u) => u.LastLogin is { } t && (DateTime.UtcNow - t).Days < 30;
static string NormalizedEmail(User u) => u.Email.Trim().ToLowerInvariant();
```

## Quy ước phụ trợ

| Thứ | Quy ước |
|---|---|
| Chữ cho người dùng | Tiếng Việt có dấu |
| Số cho người đọc | Một hàm định dạng chung (1.234, 1,5%); dữ liệu xuất và toạ độ giữ dấu chấm |
| Thêm tính năng vào chỗ đăng ký | Chỉ thêm 1 dòng cuối khối (registry lệnh, khối dịch vụ có đánh dấu), để nhiều agent không đụng nhau |
| Phiên bản runtime | Giữ đúng bản người dùng yêu cầu (ví dụ .NET 8), không tự nâng; chốt `RollForward=LatestPatch` |
| Thư viện | Kiểm giấy phép (MIT / Apache / BSD) nếu app phát hành |
| Test | Chạy test phần vừa sửa; toàn bộ khi đụng lõi chung hoặc trước khi giao |
| Test tạo thư mục tạm | Phải xoá khi xong (xem `windows-pitfalls.md`) |
| Test chạy theo thời gian | Cho riêng một collection không chạy song song + hạn chót dài hơn |
| File bin / obj / dist / dữ liệu sinh ra | Vào `.gitignore` ngay từ commit đầu |

## Trước khi sửa thứ dùng chung

Xem ai đang gọi nó (CodeGraph `impact`, hoặc grep có chọn lọc). Sửa xong chạy test của các chỗ gọi, không chỉ test của hàm.
