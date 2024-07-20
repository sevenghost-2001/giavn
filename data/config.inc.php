<?php

//---Sửa đổi tập tin này, hãy cẩn thận và làm cho sao lưu thích hợp!---
/*
cấu hình hướng dẫn:

SITE_URL        :   Địa chỉ website truy cập, truy cập vào địa chỉ thay đổi khi bạn thay đổi sự xuất hiện, phải mất http://, Không được thêm vào cuối'/'

DB_CONFIG       :   Cơ sở dữ liệu cấu hình truy cập (giao thức: / / tên người dùng: mật khẩu @ cơ sở dữ liệu địa chỉ máy chủ: cổng / cơ sở dữ liệu tên)

DB_PREFIX       :   Cơ sở dữ liệu tên bảng tiền tố

LANG            :   Bộ ký tự và ngôn ngữ

COOKIE_DOMAIN   :   Trang web Cookie Phạm vi

COOKIE_PATH     :   Trang web Cookie vai trò trong con đường

ECM_KEY         :   trang chính

MALL_SITE_ID    :   ID trang web, không thể được sửa đổi

ENABLED_GZIP    :   Nén dữ liệu chuyển đổi, chuyển Nén dữ liệu sẽ tăng cường tốc độ truy cập của người dùng, tương ứng với chi phí của máy chủ sẽ tăng lên 0,1 để mở, 0 là tắt.

DEBUG_MODE      :   0: Tạo tập tin bộ nhớ cache, không lực lượng biên dịch mẫu 1:. Không tạo ra một tập tin bộ nhớ cache, các mẫu không ép buộc các trình biên dịch 2: tạo một tập tin bộ nhớ cache, buộc các mẫu trình biên dịch 3:. Không tạo ra một tập tin bộ nhớ cache, buộc các mẫu trình biên dịch 4:. Tạo ra bộ nhớ cache, trình biên dịch mẫu nhưng không tạo ra biên dịch các tập tin 5:. không tạo ra bộ nhớ cache, trình biên dịch tạo ra các tập tin biên dịch, nhưng không phải mẫu.

CACHE_SERVER    :   Bộ nhớ cache dữ liệu máy chủ, có thể được mặc định (php tập tin bộ nhớ cache), nó có thể được memcache

MEMBER_TYPE     :   Giá trị Tùy chọn: mặc định (sử dụng hệ thống người sử dụng tích hợp), uc (UCenter như một người dùng với hệ thống) có thể được bất kỳ hệ thống của bên thứ ba, miễn là bạn làm phần mở rộng có liên quan:)

ENABLED_SUBDOMAIN : Hai lĩnh vực chức năng chuyển đổi, 0 off, 1 là mở, bạn phải mở SUBDOMAIN_SUFFIX cấu hình Subdomain phương pháp kích hoạt,. Xem xét các gói cài đặt trong thư mục tài liệu của các tài liệu two cấu hình miền.

SUBDOMAIN_SUFFIX : Thứ hai miền cấp hậu tố, chẳng hạn như: người sử dụng tên miền phụ sẽ được "test.mall.example.com", bạn chỉ cần điền vào "mall.example.com".
*/

return array (
  'SITE_URL' => 'http://localhost/gianhang',
  'DB_CONFIG' => 'mysql://root:111@localhost:3306/giavn',
  'DB_PREFIX' => 'ecm_',
  'LANG' => 'sc-utf-8',
  'COOKIE_DOMAIN' => '',
  'COOKIE_PATH' => '/',
  'ECM_KEY' => 'e3c8b6cc949958dc2b6ff9ba18456c88',
  'MALL_SITE_ID' => 'EMLIPKve86HI05Xv',
  'ENABLED_GZIP' => 0,
  'DEBUG_MODE' => 0,
  'CACHE_SERVER' => 'default',
  'MEMBER_TYPE' => 'default',
  'ENABLED_SUBDOMAIN' => 0,
  'SUBDOMAIN_SUFFIX' => '',
);

?>
