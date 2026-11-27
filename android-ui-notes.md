# Làm giao diện app Android (đúc kết từ đợt làm lại toàn bộ giao diện một app nhiều "phòng")

Đọc khi: thiết kế / làm lại giao diện app điện thoại, nhất là app có **bảng nổi trên app khác** (overlay, Trợ năng). Nguyên tắc chung cho mọi giao diện xem thêm `ui-design-principles.md`, cách chấm xem `ui-review-checklist.md`.

## 1. Quy trình đã chạy tốt

| Bước | Làm gì | Vì sao |
|---|---|---|
| 1 | Agent rẻ (Sonnet, chỉ đọc) **kê lại toàn bộ chức năng** màn cũ: từng nút, trạng thái, lối đi | Bản vẽ mới không làm rơi tính năng; lộ ra chỗ trùng / rối |
| 2 | Vẽ **file HTML tĩnh trên máy** (không đưa lên web): khung điện thoại, mỗi màn 1 khung, dưới khung ghi "Đổi gì · học theo app nào"; đầu file 1 bảng "Bản đang dùng → Bản mới" | Người dùng duyệt nhanh, sửa trên bản vẽ rẻ hơn sửa code |
| 3 | Phân vân màu / kiểu thì làm **trang so sánh 4–5 phương án cạnh nhau** (cùng bố cục, chỉ khác 1 thứ), có chuyển động thật nếu là hiệu ứng | Người dùng chọn bằng mắt nhanh hơn đọc mô tả |
| 4 | Duyệt xong mới code, **mỗi việc 1 nhánh + worktree**; người dùng dùng thử trên máy ảo, "ok" mới gộp | Hay đổi ý sau khi thấy thật; nhánh riêng thì sửa không ảnh hưởng chỗ khác |
| 5 | Chạy máy ảo, **chụp từng màn ghép thành 1 ảnh** để chấm; rồi máy thật | Bản HTML đẹp chưa chắc lên máy đẹp (xem mục 4) |
| 6 | Đổi giao diện chính = **nâng số đầu** (2.x → 3.0.0) | Người dùng nhìn số là biết bản lớn |

## 2. Quy tắc màn hình trong app (người dùng đã duyệt)

| Quy tắc | Cụ thể |
|---|---|
| 1 nút chính, dính đáy, **tự đổi theo tình huống** | Thiếu quyền → "Bật quyền …"; chưa có dữ liệu → "Thêm …"; đủ → việc chính ("Hẹn bấm lúc 20:00:00") |
| Dòng cài đặt = **tên + giá trị + ›** | Không dòng phụ; chi tiết vào sheet trượt từ dưới / trang con / ⓘ |
| Màn nhiều mục thì ≤ 5–6 dòng | Người dùng chê "quá nhiều thông tin, rối" khi mỗi dòng có thêm mô tả |
| **Mỗi thông tin 1 chỗ** | Cùng 1 cài đặt xuất hiện 2–3 nơi là lỗi thiết kế |
| Thông số của 1 chế độ nằm **ngay dưới lựa chọn** chế độ đó | Không để ở tab Cài đặt xa tít |
| Thao tác ẩn (nhấn giữ để sửa / xóa) → đổi thành chạm dòng | Kèm Hoàn tác thay cho hộp hỏi lại |
| Đang chạy thì **cả màn chỉ còn tiến độ + nút Dừng** | Kiểu Đồng hồ Google lúc hẹn giờ |
| Cấp quyền: **1 màn = 1 bước** | Hình + 1 câu + 1 nút; lỗi hiếm sau nút "Không bật được?" |
| App nhiều phòng → **Trang chủ gom phòng**, 1 biểu tượng app + lối tắt khi nhấn giữ | Mỗi phòng có ← về Trang chủ |
| **Cài đặt chung sau ảnh đại diện** (kiểu app Google) | Thẻ tài khoản xổ sẵn các mục chung; **cài đặt riêng của phòng chỉ ở trong phòng**, không lặp ra ngoài |
| Công cụ dùng chung (đồng hồ…) **độc lập phòng / cấu hình** | Thêm ô trong thanh cài đặt nhanh (TileService) để bật ở bất kỳ đâu |

## 3. Màu

- Mỗi phòng 1 màu riêng (nhìn là biết đang ở phòng nào); vị trí / hình dáng nút giống nhau ở mọi phòng.
- Người dùng **chê ô đặc màu bão hòa** cạnh nhau; các app lớn dùng **sắc nhạt** (Material You) hoặc **thẻ trắng + icon màu**.
- **Mảng tối lớn trên trang nền sáng nhìn nặng** dù trên HTML thấy ổn → màu thẻ theo kiểu trang; chỉ kiểu nền tối mới dùng thẻ tối.
- Khi người dùng phân vân giữa nhiều kiểu: **code hết, cho tự chọn trong app** (bảng màu tách thành dữ liệu, không if/else rải rác).
- Người dùng có thể giữ màu cũ dù thấy phương án khác đẹp hơn: hỏi, đừng tự đổi màu nhận diện.

## 4. Bẫy "HTML đẹp, lên máy xấu"

| Bẫy | Cách tránh |
|---|---|
| Khung HTML nhỏ, lên màn thật mảng màu to gấp đôi | Chụp máy ảo / máy thật trước khi báo xong |
| Phóng to công tắc hệ thống (scale) → bị cắt mép | Tự vẽ công tắc đúng kích thước |
| Trạng thái tắt quá nhạt, khó thấy trên màn kém | Rãnh đủ đậm + viền |
| Bấm xong đợi nhịp cập nhật (1 giây) mới đổi | Vẽ lại **ngay khi bấm**, hoạt ảnh ≤ 150 ms |
| Dòng dài rớt 2 dòng trên máy thật | Rút gọn chữ theo ngữ cảnh ("đã khớp" thay "lệch 0,0 giây") |

## 5. Bảng nổi trên app khác (overlay)

| Quy tắc | Lý do |
|---|---|
| Nằm **nửa dưới, tầm ngón cái**, kéo đi được | Một tay bấm liên tục |
| Ít nút: **1 nút chính to + 2 nút + ⋯**; việc hiếm vào ⋯, "Thoát" đỏ ở cuối | 8 nút cùng cỡ thì không biết nút nào chính, dễ bấm nhầm |
| Lúc chờ thu thành **viên / bong bóng**; báo kết quả bằng **chip nhỏ 1 dòng sát mép trên, tự ẩn** (kiểu Dynamic Island) | Không che app bên dưới đúng lúc cần nhìn |
| **Nút chính không được nhảy chỗ** khi đổi trạng thái; nút mới mọc thêm ra ngoài | Ngón tay quen vị trí sẽ bấm trượt |
| Ngay sau khi nút đổi nghĩa (vd Vào lại → Chốt), **khóa chạm ~150 ms** | Tránh bấm theo quán tính |
| Hiệu ứng (sóng nhịp…) vẽ ở lớp **không nhận chạm** | Không chặn cú chạm vào app bên dưới |
| Lúc rảnh **nép nửa vào mép** | Không che cột nút của app đích (vd ô chọn) |
| Nền **kính trong suốt + tự mờ sau 3 giây**; chạm là rõ lại và cú chạm vẫn tính | Người dùng: "nút quá đậm, che hết bên dưới" |
| Bong bóng nhỏ và **menu ⋯ thì không làm mờ / gần đặc** | Bong bóng mờ thành xám bẩn; menu trong suốt thì chữ bên dưới lẫn vào |
| Mỗi thứ nổi **có nút tắt riêng**; "Thoát bảng" không được tắt thứ khác (đồng hồ) | Người dùng phàn nàn ngay khi bị tắt kèm |

## 6. Thử trên máy ảo / máy thật

- `uiautomator dump` **tạm tắt các dịch vụ Trợ năng** của app → app báo thiếu quyền giả. Đừng dùng khi đang thử app Trợ năng.
- Lệnh `adb shell input tap` theo tọa độ có thể rơi vào nút **mở app thật** (vd app mua sắm) → trên máy ảo vô hiệu hóa app nhạy cảm (`pm disable-user`), chỉ thử trên trang giả trong app.
- Lọc log build bằng `Select-String` có thể **giấu dòng BUILD FAILED** → điện thoại nhận APK cũ. Sau khi cài, **so md5 APK trên máy với APK vừa build**.
- Máy thật: chỉ cài **bản release** (khác chữ ký thì phải gỡ app = mất dữ liệu người dùng). MIUI chặn `input`, `pm grant` → người dùng bấm, mình chụp; MIUI force-stop app **tắt luôn công tắc Trợ năng**.
- Máy ảo dùng chung với phiên khác → app khác có thể đang mở; không đụng.

## 7. Chia việc agent cho giao diện

- Tách **"màn trong app"** và **"bảng nổi"** cho 2 agent song song; việc rủi ro (chạm xuyên, cửa sổ overlay) dùng model mạnh, việc theo bản vẽ dùng model rẻ.
- **Chốt hợp đồng chung trước khi tách** (vd hàm `scheduleFromApp()` của bộ máy), hai bên cùng tên enum / khóa cài đặt → gộp không xung đột.
- Việc tiếp theo cùng khu vực: **nhắn lại agent cũ** (còn ngữ cảnh) thay vì tạo agent mới.
- Dặn agent **không commit ảnh chụp**, lưu ảnh vào thư mục tạm.
- Agent tự chạy máy ảo được, nhưng bản trên máy ảo đổi qua lại khi 2 agent cùng cài: gộp xong cài lại 1 lần.
