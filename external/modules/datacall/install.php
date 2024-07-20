<?php

/**
 * Ở đây bạn có thể đặt một số module được cài đặt cần phải thực thi mã, chẳng hạn như các bảng mới, các thư mục mới, tập tin, và như thế
 */

/* Các mã sau đây là không cần thiết, chỉ là một ví dụ */
$filename = ROOT_PATH . '/data/datacall.inc.php';
file_put_contents($filename, "<?php return array(); ?>");

?>