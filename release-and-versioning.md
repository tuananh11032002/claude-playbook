# Giao bản và đánh số phiên bản

Người dùng cài lại nhiều lần trên máy thật, nên cần biết đang chạy bản nào và bản đó thêm / sửa / xoá gì, cả khi xem trên điện thoại.

## Quy tắc đánh số x.y.z

| Nấc | Khi nào nâng | Ví dụ |
|---|---|---|
| x | Đổi lớn cách dùng hoặc cấu trúc | Đổi giao diện toàn bộ, đổi định dạng dữ liệu |
| y | Thêm tính năng người dùng thấy được | Thêm một màn / một chế độ |
| z | Sửa lỗi, chỉnh nhỏ | Sửa crash, chỉnh chữ |

Nâng nấc trên thì các nấc dưới về 0 (1.4.2 thành 1.5.0). Claude tự quyết nấc nào, mỗi tính năng lớn đều phải nâng.

## Nơi đặt số

| Loại app | Chỗ đặt |
|---|---|
| .NET | `<Version>` trong `.csproj` hoặc `Directory.Build.props`; hiện trên tiêu đề cửa sổ hoặc "Giới thiệu" |
| Android | `versionName` + `versionCode = x*10000 + y*100 + z` trong file build |
| Đóng gói | File `PHIEN-BAN.txt` (số bản, ngày, commit) trong gói |

## CHANGELOG

Viết dạng danh sách, KHÔNG dùng bảng, để mở trên app điện thoại vẫn đọc được. Bản mới nhất ở trên cùng. Đầu file ghi luôn quy tắc đánh số.

```
## 1.5.0 · 18/11/2026 · commit abc1234

Thêm:
- Màn "So sánh văn bản".
Sửa lỗi:
- Dán văn bản lớn không còn làm đứt kết nối.
Thay đổi:
- Nút "Xuất" chuyển vào menu "...".
Xóa:
- Bỏ chế độ thử nghiệm cũ.
```

| Quy tắc | Chi tiết |
|---|---|
| Tiêu đề bản | `## x.y.z · dd/mm/yyyy · commit <hash>` |
| 4 mục | Thêm / Sửa lỗi / Thay đổi / Xóa; mục nào không có thì bỏ |
| Nội dung | Điều người dùng thấy, không phải chi tiết code |
| Lịch sử cũ | Có thể đánh số lại theo git cho đủ chuỗi từ 1.0.0 |

## Quy trình mỗi lần giao bản

| # | Việc |
|---|---|
| 1 | Nâng nấc phù hợp |
| 2 | Thêm mục vào CHANGELOG |
| 3 | Commit, ghi hash vào mục, gắn tag `vX.Y.Z` |
| 4 | Build / đóng gói (kiểm chỗ trống ổ đĩa trước) |
| 5 | Chạy script đẩy lên nơi lưu trữ; script đẩy kèm `CHANGELOG.txt` và TỪ CHỐI đẩy nếu CHANGELOG thiếu mục của bản đó |
| 6 | Nói rõ SỐ PHIÊN BẢN MỚI trong tin trả lời cho người dùng |

## Script đẩy bản

| Thứ | Quy ước |
|---|---|
| Vị trí | Một script `upload-*.ps1` ở mỗi repo |
| Đích | Kho lưu trữ CÁ NHÂN của người dùng (không dùng kho của công ty) |
| Gom | Theo thư mục tên tool |
| Kiểm | Từ chối khi CHANGELOG không có mục của bản hiện tại |

## Trước lần push đầu lên GitHub

Xem `misc-lessons.md`: quét bí mật, thông tin cá nhân, đường dẫn nội bộ; không chắc thì để private; đổi tên dự án trước lần push đầu.
