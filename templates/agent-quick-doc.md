# Mẫu "đọc nhanh cho agent" (1 trang cho mỗi dự án)

Đặt bản đã điền ở `docs/agent-doc-nhanh.md` của dự án. Mục đích: agent mới đọc 1 trang này thay vì 4-6 tài liệu dài, chỉ mở tài liệu gốc khi thật cần. Giữ dưới ~50 dòng.

```
# Đọc nhanh cho agent (đọc cái này trước)

## Dự án
- <Công nghệ và phiên bản bắt buộc, ví dụ .NET 8, KHÔNG nâng bản>
- <Ràng buộc: chạy offline? cấm CDN? giấy phép thư viện?>
- <Thư mục chính>: lõi (có test) / CLI (đăng ký lệnh 1 dòng cuối registry) / Web / tests
- <Quy ước chung: hàm định dạng số cho người đọc, nơi lưu dữ liệu người dùng, biến môi trường tách khi thử>

## Tìm code (TIẾT KIỆM TOKEN, làm trước khi grep / đọc file)
- Repo có chỉ mục CodeGraph (.codegraph/):
  - codegraph explore "<tên hàm hoặc câu hỏi>"  => mã nguồn đúng đoạn + ai gọi + test nào phủ
  - codegraph node <Symbol hoặc đường/dẫn/file>  => 1 hàm + nơi gọi, hoặc đọc file kèm số dòng
  - codegraph impact <Symbol> trước khi sửa thứ dùng chung; codegraph affected <file> để biết chạy test nào
- Chỉ Read khi cần sửa đúng đoạn; đọc theo offset/limit.
- Sau khi commit nhiều file mới: codegraph sync.
- Build + test: scripts/kiem-nhanh.ps1 [-Loc <tên test>] [-ChiBuild]; KHÔNG chạy build/test trần.
- Lệnh in nhiều: lọc trước khi xem (Select-Object -Last 20, Select-String).
- Lỗi "file bị khoá" khi build = người dùng đang mở app: build ở worktree của mình.

## Làm việc
- Worktree riêng + nhánh feat/<việc> từ main; commit trên nhánh mình, KHÔNG push / merge.
- Chỉ sửa vùng được giao; đụng file chung thì ghi SHARED EDITS.
- Test theo chỗ sửa; chạy cả bộ 1 lần cuối.
- Code: điều phối khai báo, tách hàm đặt tên theo nghiệp vụ, giấu parse / null vào hàm có tên. Chữ cho người dùng: tiếng Việt CÓ DẤU.

## Giao diện (tóm tắt tiêu chí chấm)
- 1 nút chính mỗi màn; thứ ít dùng vào "..." hoặc "Tùy chọn nâng cao"; chỉ hiện vấn đề.
- Đường dẫn chỉ tên file (đầy đủ khi rê chuột). Không chữ IN HOA, không trang trí.
- Thứ bấm được phải NHÌN RA bấm được.
- Việc lâu chạy nền, ghi rõ đang làm gì, có Huỷ; đủ 4 trạng thái rỗng / đang tải / có dữ liệu / lỗi.
- Lỗi = nguyên nhân + cách sửa. Mất dữ liệu = hộp rủi ro, tick mới chạy.
- Màu chỉ từ token CSS chung (sáng + tối).
- Thành phần dùng chung: <đường dẫn thư mục + mục lục>.
- Màn mới cần: <các file / dòng phải thêm>

## Chụp ảnh
- <lệnh chụp>; chụp đủ để lưu nhưng TỰ MỞ XEM tối đa 2 ảnh. M4 (0 request ra ngoài) phải đạt.

## Báo cáo (DƯỚI 300 CHỮ)
Commit, kết quả chính (số đo thật), đường dẫn ảnh quan trọng, SHARED EDITS, SHARED REQUESTS, điểm cần lead quyết, chưa kiểm. Không kể lại quá trình.
```

## Khi nào cập nhật

| Sự kiện | Cập nhật |
|---|---|
| Thêm thư mục chính hoặc đổi cách đăng ký | Mục "Dự án" |
| Đổi lệnh build / test | Mục "Tìm code" |
| Thêm tiêu chí giao diện | Mục "Giao diện" |
