# Viết hướng dẫn, bài học, tài liệu

Tài liệu tốt đọc như đồng nghiệp đang giải thích, không như bảng tra cứu máy móc. Người dùng vừa thích bảng vừa ghét khô khan, nên bảng luôn đi kèm lời dẫn.

## Khuôn một mục

| Phần | Nội dung |
|---|---|
| 1-2 câu mở | Ý chính và "vì sao", văn xuôi |
| Ví von đời thường | Khi có thể (image là cái khuôn, container là cái bánh) |
| Bảng | Chỉ để so sánh; mỗi bảng có câu dẫn |
| Ví dụ | Có số, có tên cụ thể, tính từng bước |
| Bẫy | 1-2 chỗ dễ sai thật sự |

Tránh: dày đặc ký hiệu tick/cross, viết tắt khó đọc, gạch đầu dòng cụt lủn chồng chất, câu nhồi 5-6 mệnh đề.

## Dạy lệnh và tham số

| Quy tắc | Chi tiết |
|---|---|
| Lệnh bài tập dùng thì lý thuyết phải dạy trước | Không để lệnh chỉ xuất hiện lần đầu ở bài tập |
| Bài xoay quanh 1 lệnh | 2 bảng LÊN ĐẦU: "Các dạng lệnh" (lệnh, so / làm gì, dùng khi) và "Công dụng tham số" (tham số, công dụng, ví dụ) |
| Mổ xẻ cờ | Cả ngắn lẫn dài; bắt buộc hay không; thêm cột "bẫy" khi cần |
| Không chỉ CLI | Cũng mổ xẻ cấu hình khai báo (param / resource / output), truy vấn, YAML pipeline |

## Công thức dễ hiểu

Khi cần "công thức", dùng cộng trừ bằng tên thật trong code block thường, kèm ví dụ có số.

```
nhánh_mới = main + (nhánh_cũ - main)
ví dụ: main có A B, nhánh có A B F1 F2 => nhánh_mới = A B + (F1 F2)
```

Kèm bảng "lệnh, trừ gì, cộng vào đâu" và mẹo nhớ rút ra từ công thức. Cấm LaTeX và ký hiệu tập hợp.

## Sơ đồ trong markdown

| Quy tắc | Chi tiết |
|---|---|
| Ký tự vẽ | ASCII: `-`, `/`, `\`, `^`, `|`, `+--`, `<-`, `=>`, `<=>` |
| Cấm | Ký tự vẽ khung Unicode, các mũi tên Unicode, dấu trừ toán học U+2212 |
| Chữ trong code block | PHẢI có dấu tiếng Việt (dựng sẵn NFC), tên biến cũng có dấu |
| Ngoại lệ không dấu | Tên nhánh, đường dẫn, lệnh thật, dữ liệu do lab sinh ra |
| Căn cột | Chữ có dấu NFC vẫn chiếm 1 ô; vẽ xong đếm cột để `/` `\` `^` nối đúng điểm |

```
main:     A---B---C
               \
nhánh:          F1---F2
```

## Hướng dẫn thao tác giao diện

Theo khuôn 6 phần, mỗi bước:

| # | Phần |
|---|---|
| 1 | `### Bước N: <Loại> <tên>` |
| 2 | Dòng đường bấm in đậm: **Menu > Menu > nút X** (kèm vị trí nút nếu dễ nhầm) |
| 3 | Bảng `Chỗ / Ô / Giá trị`, mỗi ô một dòng; nhiều môi trường thì mỗi môi trường một cột giá trị |
| 4 | "Bấm **Create**." |
| 5 | Dòng kiểm tra: thấy gì là đúng; không thấy thì dừng, chụp màn hình |
| 6 | 1-2 cảnh báo chỗ dễ sai thật sự |

Đầu bài đặt bảng tổng các object (loại + tên). Khái niệm cần thiết nói 2-3 câu kèm sơ đồ cây nhỏ, đặt trước bảng.

## Câu hỏi hóc búa kiểu phỏng vấn

Sau mỗi chủ đề thêm 1-3 câu phân biệt hai thứ gần giống. Format "bẫy trước, đáp sau", nêu cả đáp án nông mà nhiều người mắc. Gom bộ câu mẫu vào một file riêng của bộ bài.

## Docker: env, build, recreate (ví dụ bảng tốt)

Hai việc tách rời: build lại image và tạo lại container.

| Đổi gì | Build lại image? | Tạo lại container? |
|---|---|---|
| Không đổi | Không | Không |
| Biến môi trường | Không | Có (từ image cũ) |
| Code | Có (`--build`) | Có (vì image mới) |

Env nạp lúc tạo container nên muốn có hiệu lực phải recreate bằng `up`, không phải `restart`. Lưu ý BuildKit sinh image ID mới mỗi lần `--build` nên container bị tạo lại mỗi lần; chỉ `--build` khi thật sự sửa code.
