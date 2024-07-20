<?php

/**
 * Giasoc.com.vn: Site Admin dữ liệu trong menu bên trái
 * ============================================================================
 * Copyright © 2010 Giasoc Software Group Inc 
 * Địa chỉ Web: http://www.giasoc.com.vn
 * -------------------------------------------------------
 * Y!M: thanhtc_bkhn
 * Email: thanhtc84@gmail.com
 * ============================================================================
 * $Id: inc.menu.php 16 2007-12-23 15:36:24Z Redstone $
 */

if (!defined('IN_ECM'))
{
    trigger_error('Hacking attempt', E_USER_ERROR);
}

$menu_data = array
(
    'mall_setting' => array
    (
        'default'     => 'default|all',//quản lý
        'setting'     => 'setting|all',//Cài đặt trang web
        'region'       => 'region|all',//Thiết lập khu vực
        'payment'    => 'payment|all',//Thanh toán
        'theme'     => 'theme|all',//Cài đặt Theme
        'mailtemplate'   => 'mailtemplate|all',//E-mail các mẫu
        'template'  => 'template|all',//Tiêu bản biên tập
    ),
    'goods_admin' => array
    (
        'gcategory'    => 'gcategory|all',//Quản lý Danh mục
        'brand' => 'brand|all',//Quản Lý Thương Hiệu
        'goods'    => 'goods|all',//Quản lý sản phẩm
        'recommend'    => 'recommend|all',//đề nghị loại
    ),
    'store_admin' => array
    (
        'sgrade'    => 'sgrade|all',//cửa hàng lớp
        'scategory'     => 'scategory|all',//danh mục hàng
        'store'   => 'store|all',//Quản lý cửa hàng
    ),
    'member' => array
    (
        'user'  => 'user|all',//Thành viên
        'admin' => 'admin|all',//quản trị viên để quản lý
        'notice' => 'notice|all',//Thành viên thông báo
    ),
    'order' => array
    (
        'order'   => 'order|all',//trật tự quản lý
    ),
    'website' => array
    (
        'acategory'    => 'acategory|all',//Điều mục
        'article'      => array('article' => 'article|all', 'upload' => array('comupload' => 'comupload|all', 'swfupload' => 'swfupload|all')),//Điều quản lý
        'partner'      => 'partner|all',//Đối tác
        'navigation'   => 'navigation|all',//trang mục chính
        'db'           => 'db|all',//Cơ sở dữ liệu
        'groupbuy'     => 'groupbuy|all',//mua hàng
        'consulting'   => 'consulting|all',//Tư vấn
        'share_link'   => 'share|all',//Chia sẻ quản lý

    ),

    'external' => array
    (
        'plugin' => 'plugin|all',//Quản lý Plugin
        'module'   => 'module|all',//Mô đun quản lý
        'widget'   => 'widget|all',//Mặt dây chuyền quản lý
    ),
    'clear_cache' =>array
    (
        'clear_cache' => 'clear_cache|all',//Xóa bộ nhớ cache
    )
);
?>