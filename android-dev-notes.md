# Làm app Android: bẫy khi build và thử máy

Đọc khi build / cài / thử app Android trên máy ảo hoặc máy thật. Nguyên tắc thiết kế giao diện xem `ui-design-principles.md`.

## Build và cài

| Bẫy | Cách tránh |
|---|---|
| Lọc log build (vd `Select-String`, `head`) giấu mất dòng `BUILD FAILED` → máy nhận APK cũ mà tưởng mới | Sau khi cài, **so md5 APK trên máy** (`pm path` rồi `md5sum`) với APK vừa build |
| Build tăng dần báo "Unresolved reference" vô lý | `gradlew clean` rồi build lại |
| Cài bản debug lên máy đang có bản release (khác chữ ký) | Phải gỡ app = **mất dữ liệu người dùng**. Máy thật chỉ cài bản release, cài đè `install -r` |
| Cài đè (`install -r`) | Giữ dữ liệu; tiến trình bị tắt nên dịch vụ Trợ năng có thể bị Android coi là "hỏng" (công tắc vẫn bật mà không chạy) |
| Ghi file có dấu bằng PowerShell 5.1 (`Get-Content` / `Set-Content`) | Hỏng mã hóa tiếng Việt; dùng công cụ sửa file hoặc `sed` / Python với UTF-8 |

## Thử bằng adb

| Bẫy | Cách tránh |
|---|---|
| `uiautomator dump` tạm **tắt các dịch vụ Trợ năng** của app | Đừng dùng khi thử app có dịch vụ Trợ năng; app sẽ báo thiếu quyền giả |
| `input tap` theo tọa độ rơi vào nút mở app thật (app mua sắm, ngân hàng…) | Trên máy ảo vô hiệu hóa app nhạy cảm (`pm disable-user`); thử trên trang giả trong app; chụp màn hình xác định tọa độ trước khi chạm |
| Git Bash đổi đường dẫn `/sdcard/...` | Đặt `MSYS_NO_PATHCONV=1` |
| Nhiều thiết bị cùng nối (máy ảo + máy thật) | Mọi lệnh có `-s <thiết bị>` |
| Lưu ảnh chụp bằng `>` trong PowerShell | Hỏng file nhị phân; chụp bằng `adb exec-out screencap -p > file.png` trong bash |
| Máy ảo dùng chung với phiên / agent khác | Bản cài có thể bị ghi đè giữa chừng, app khác có thể đang mở: gộp xong cài lại 1 lần, không đụng app khác |
| Máy ảo báo thiếu dung lượng | Cần vài GB trống ở ổ chứa AVD; snapshot khởi động nhanh chiếm nhiều chỗ |

## Máy Xiaomi / MIUI

| Đặc điểm | Hệ quả |
|---|---|
| Chặn `input`, `pm grant`, `settings put secure` qua adb (trừ khi bật "Gỡ lỗi USB (Cài đặt bảo mật)") | Người dùng bấm, mình chỉ chụp màn hình để kiểm |
| Đóng hẳn app (vuốt tắt / force-stop) **tắt luôn công tắc Trợ năng** | Màn cấp quyền phải xử lý cả trạng thái "tắt" lẫn "bật mà không chạy" |
| adb không dây đổi cổng khi đổi Wi-Fi / khởi động lại | Nhờ người dùng đọc "Địa chỉ IP & Cổng" ở màn Gỡ lỗi không dây rồi connect lại |

## Quyền và giới hạn hệ thống

- Một app **không tự gỡ được app khác**; chỉ mở được hộp gỡ của hệ thống để người dùng xác nhận.
- Lấy mã đăng nhập Google luôn bật khung "Signing you in"; đăng nhập lại ngầm chỉ nên làm khi máy chủ đang trả lời.
- Ô trong thanh cài đặt nhanh (TileService): Android 13+ hỏi thêm ô bằng `requestAddTileService`; máy cũ hơn phải hướng dẫn kéo ô bằng tay.
