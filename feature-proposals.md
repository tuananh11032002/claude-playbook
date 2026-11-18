# Đề xuất tính năng

Đề xuất tốt đến từ góc nhìn của người dùng thật, không phải chuyên gia lĩnh vực. Và đề xuất chưa phải lệnh làm.

## Đứng đúng vai

Trước khi liệt kê, tự hỏi: "một dev hoặc nhân viên văn phòng mở tool này mỗi ngày để làm gì?". Mục tiêu là một hộp công cụ gom đủ tiện ích hay dùng (kiểu DevToys / PowerToys, chạy offline), không phải bộ tính năng chuyên sâu của một ngành hẹp.

| Nhóm | Ví dụ việc hằng ngày |
|---|---|
| Dev | Định dạng JSON, Base64, JWT, Unix timestamp, GUID, hash file, regex, so sánh văn bản, đổi mã màu |
| Văn phòng | Mở CSV / Excel lớn, sửa lỗi font tiếng Việt, gộp / tách PDF, đổi cỡ ảnh, QR, đổi đơn vị |

Bài học: hai lượt đề xuất kiểu chuyên gia lĩnh vực bị chê "chưa thật sự cần" và "đứng sai vai trò".

## Bảng đề xuất

| Tính năng | Ai dùng | Ví dụ thật | Phần đã có để tái dùng | Công sức |
|---|---|---|---|---|
| Tên ngắn | Dev / văn phòng | 1 câu tình huống cụ thể | Thành phần, thư viện có sẵn | S / M / L |

Quy tắc: mỗi dòng phải có ví dụ thật và phần tái dùng; công sức ước theo S (dưới nửa ngày), M (1-2 ngày), L (nhiều ngày).

## Quy trình

| Bước | Làm |
|---|---|
| 1 | Liệt kê theo bảng, nhóm theo vai |
| 2 | Khuyến nghị TOP 3 kèm lý do |
| 3 | DỪNG. Chờ người dùng chốt ("làm đi", "chốt mục 1 và 3") |
| 4 | Mới giao việc / code |

"Liệt kê", "đề xuất", "giao cho X sau này" không có nghĩa là làm ngay. Đã từng tự spawn agent code khi người dùng chỉ bảo liệt kê, và bị phàn nàn.

## Công nghệ rủi ro: làm thử có đo trước

Với thứ chưa chắc chạy được (OCR, nhận dạng, tự động hoá màn hình, đọc tài liệu lạ), làm một bản thử (spike) rẻ nhất để đo trước khi dựng cả màn hình.

| Phần spike | Nội dung |
|---|---|
| Câu hỏi | 1 câu cần trả lời (ví dụ "nhận đúng chữ trên ảnh mẫu bao nhiêu %?") |
| Dữ liệu thật | Mẫu thật, không dữ liệu dễ |
| Số đo | Độ chính xác, thời gian, bộ nhớ |
| Phương án dự phòng | Nêu sẵn nếu phương án chính không đạt |
| Kết luận | Làm tiếp / đổi hướng / bỏ |
| Nơi làm | Nhánh hoặc worktree riêng, không đụng nhánh chính |

## Ý tưởng lớn do người dùng mô tả

Dù mô tả rất chi tiết, vẫn chưa phải lệnh code. Trả lời bằng: có khả thi không, rủi ro / chỗ chưa chắc, kế hoạch theo bước (bước kiểm tra khả thi rẻ nhất đặt lên đầu), câu hỏi cần chốt. Dạng bảng, rồi chờ.

## Khung trả lời gợi ý

```
1. Khả thi: có / có nhưng / chưa chắc (vì sao)
2. Rủi ro: ...
3. Kế hoạch: bước 1 (kiểm tra rẻ nhất), bước 2, ...
4. Cần bạn chốt: ...
```
