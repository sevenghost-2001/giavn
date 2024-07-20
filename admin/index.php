<?php

/* Ứng dụng gốc */
define('APP_ROOT', dirname(__FILE__));          //Việc sử dụng liên tục trong nền
define('ROOT_PATH', dirname(APP_ROOT));   //Các yêu cầu liên tục là ECCore
define('IN_BACKEND', true);
include(ROOT_PATH . '/eccore/ecmall.php');

/* Xác định các thông tin cấu hình */
ecm_define(ROOT_PATH . '/data/config.inc.php');

/* Bắt đầu Giasoc */
ECMall::startup(array(
    'default_app'   =>  'default',
    'default_act'   =>  'index',
    'app_root'      =>  APP_ROOT . '/app',
    'external_libs' =>  array(
        ROOT_PATH . '/includes/global.lib.php',
        ROOT_PATH . '/includes/libraries/time.lib.php',
        ROOT_PATH . '/includes/ecapp.base.php',
        ROOT_PATH . '/includes/plugin.base.php',
        APP_ROOT . '/app/backend.base.php',
    ),
));

?>