# Chụp giao diện tự động để chấm

Cách làm đã chạy tốt: một script Python dùng Playwright (điều khiển trình duyệt Chrome có sẵn, không tải thêm) chụp từng màn ở từng trạng thái, rồi lead xem 1-2 ảnh để chấm. Script cụ thể phụ thuộc dự án nên chỉ mô tả cách làm ở đây.

## Cách tổ chức

| Phần | Cách làm |
|---|---|
| Môi trường | Venv riêng cho Python (đặt trên ổ còn nhiều chỗ), cài Playwright, dùng `channel="chrome"` |
| Điểm vào | Một script nhận `--cong-goc <cổng>` và `--man <tên màn>`; mỗi agent được giao cổng riêng để không đụng nhau |
| Khai báo trạng thái | Mỗi màn một file nhỏ liệt kê các trạng thái cần chụp (rỗng, đang tải, có dữ liệu, lỗi, mở hết, riêng của màn) và các bước để đưa app tới đó |
| Ma trận chụp | Sáng + tối, 1920x1080 + 2560x1440 (+ 1366x768 khi cần) |
| Tên ảnh | `<màn>_<trạng thái>_<sáng/tối>_<độ rộng>.png` để lead tìm đúng ảnh |

## Mẹo bắt buộc

| Vấn đề | Cách xử lý |
|---|---|
| Trạng thái cũ ảnh hưởng lần chụp sau | RESET trạng thái app (xoá localStorage, dữ liệu phiên) trước MỖI trạng thái chụp |
| Dán văn bản lớn vào textarea | Đặt `value` rồi bắn sự kiện `input` bằng script; KHÔNG dùng `fill` (rất chậm) |
| Đua giữa khôi phục localStorage và thao tác người dùng | Dùng cờ "user đã chạm"; chụp lỗi này như lỗi thật, đừng né |
| Chờ render | Chờ phần tử cụ thể xuất hiện, không `sleep` cứng |
| Giả lập trạng thái lỗi / đang tải | Chặn hoặc làm chậm request bằng route của Playwright |

## Kiểm M4 (offline)

Ghi lại mọi request trong lúc chụp. Đạt khi 0 request ra ngoài `127.0.0.1` (font, icon, thư viện đều local). Script in dòng `M4: ĐẠT` hoặc liệt kê địa chỉ vi phạm.

## Lead chấm bằng ít ảnh

| Quy tắc | Chi tiết |
|---|---|
| Số ảnh | 1-2 mỗi màn: 1920 sáng; thêm tối hoặc 1366 khi cần |
| Agent | Chụp đủ để lưu nhưng TỰ MỞ XEM tối đa 2 ảnh |
| Phải có | Trạng thái MỞ HẾT (accordion, nâng cao), không chỉ ảnh mặc định |
| Kết quả | PASS hoặc CHƯA PASS + mã tiêu chí (xem `ui-review-checklist.md`) |

## Sổ tay có ảnh cho người dùng

Có thể dùng chính ảnh chụp để dựng sổ tay HTML 1 file (ảnh nhúng base64) đặt cạnh file chạy và mở bằng nút "?" trong tool.

## Kịch bản "hành hạ" giao diện

Ngoài ảnh đẹp, thỉnh thoảng chạy kịch bản phá: dán văn bản khổng lồ, bấm nút liên tục, đổi lựa chọn giữa chừng, đóng tab khi đang chạy, file rỗng, tên file có dấu cách và tiếng Việt. Mục đích tìm crash trước người dùng.
