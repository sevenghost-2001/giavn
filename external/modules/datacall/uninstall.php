<?php

/**
 * Ở đây bạn có thể đặt một thời gian để dỡ bỏ các mã mô-đun được thực thi, chẳng hạn như xóa các bảng, xóa các thư mục, tập tin, loại
 */

$filename = ROOT_PATH . '/data/datacall.inc.php';
if (file_exists($filename))
{
    @unlink($filename);
}

?>