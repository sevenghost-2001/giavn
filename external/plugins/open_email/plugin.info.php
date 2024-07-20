<?php

return array(
    'id' => 'open_email',
    'hook' => 'after_opening',
    'name' => 'Cửa hàng mail thông báo',
    'desc' => 'Sau thành công của các chủ cửa hàng để gửi đến',
    'author' => 'Giasoc Software Group Inc',
    'version' => '1.0',
    'config' => array(
        'subject' => array(
            'type' => 'text',
            'text' => 'Tiêu đề thư'
        ),
        'content' => array(
            'type' => 'textarea',
            'text' => 'Nội dung tin nhắn'
        )
    )
);

?>