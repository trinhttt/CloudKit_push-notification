# Push notification with Subscriptions in CloudKit 

Dịch vụ đẩy thông báo của Apple trong CloudKit là Subscribing to Record Changes:

– Khi đăng ký thay đổi bản ghi và để máy chủ chạy truy vấn trong nền. 

– Máy chủ sẽ thông báo cho ứng dụng của bạn về những thay đổi mà người dùng hoặc ứng dụng quan tâm. 

Ví dụ: nếu bạn là Sky, ứng dụng của bạn có thể được thông báo khi ca khúc của Sếp vừa ra.

Các bước chi tiết:

B1: Kết nối cloudkit: dùng tài khoản dev 99$/năm 😦

B2: Bật Push Notifications & remote Notifications

B3: Trong AppDelegate.swift và thêm đoạn code yêu cầu người dùng cho phép gửi thông báo và lấy devive-token (khi dùng pusher)

Subscriptions trong CloudKit

B4: Tạo đối tượng và lưu đăng ký và Cơ sở dữ liệu.

B5: Tạo đăng ký chỉ định loại bản ghi, và tùy chọn thông báo.

B6: Lưu đăng ký vào cơ sở dữ liệu.

B7: Thêm the application:didReceiveRemoteNotification: protocol method to the app’s delegate.

B8: Nhận nội dung thông báo và cập nhật lượt xem hoặc thông báo cho người dùng theo những thay đổi về bản ghi.

B9: Màn hình iPhone hiện thông báo đẩy khi thay đổi record đã đăng ký.

(Click to watch full demo)
[![Click to watch full demo](https://scontent.fsgn5-6.fna.fbcdn.net/v/t1.0-9/36840253_849086465284076_6813363353314918400_o.jpg?_nc_cat=0&oh=e90c95510c3cd50ba62b6648a9612d80&oe=5BA99C47)](https://www.youtube.com/watch?v=ynK9rMfAHu8)

