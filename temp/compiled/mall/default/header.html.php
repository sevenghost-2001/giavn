<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<?php echo $this->_var['site_url']; ?>/" />

<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7 charset=<?php echo $this->_var['charset']; ?>" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /><style type="text/css">
<!--
body {
	background-image: url();
	background-repeat: no-repeat;
}
-->
</style>
<?php echo $this->_var['page_seo']; ?>

<meta name="author" content="ecmall.shopex.cn" />
<meta name="generator" content="ECMall <?php echo $this->_var['ecmall_version']; ?>" />
<meta name="copyright" content="ShopEx Inc. All Rights Reserved" />
<link href="<?php echo $this->res_base . "/" . 'css/ecmall.css'; ?>" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="index.php?act=jslang"></script>
<script type="text/javascript" src="<?php echo $this->lib_base . "/" . 'jquery.js'; ?>" charset="utf-8"></script>
<script type="text/javascript" src="<?php echo $this->lib_base . "/" . 'ecmall.js'; ?>" charset="utf-8"></script>
<script type="text/javascript" src="<?php echo $this->res_base . "/" . 'js/nav.js'; ?>" charset="utf-8"></script>
<script type="text/javascript" src="<?php echo $this->res_base . "/" . 'js/select.js'; ?>" charset="utf-8"></script>
<script type="text/javascript">
//<!CDATA[
var SITE_URL = "<?php echo $this->_var['site_url']; ?>";
var PRICE_FORMAT = '<?php echo $this->_var['price_format']; ?>';

$(function(){
    var select_list = document.getElementById("select_list");
    var float_list = document.getElementById("float_list");
    select_list.onmouseover = function () {
        float_list.style.display = "block";
    };
    select_list.onmouseout = function () {
        float_list.style.display = "none";
    };
});
//]]>
</script>

<?php echo $this->_var['_head_tags']; ?>
<!--<editmode></editmode>-->
</head>

<body>

<div id="head">
    <h1 title="<?php echo $this->_var['site_title']; ?>"><a href="http://giasoc.com.vn/" target="_blank"><img src="http://giasoc.com.vn/gianhang/themes/mall/default/styles/default/images/logogianhang.png" alt="Logo Gian h&agrave;ng Giasoc" width="337" height="79" longdesc="http://giasoc.com.vn" /></a></h1>
<div class="menu">
        <p class="link1">
            Xin chào,<?php echo htmlspecialchars($this->_var['visitor']['user_name']); ?>
            <?php if (! $this->_var['visitor']['user_id']): ?>
            [<a href="<?php echo url('app=member&act=login&ret_url=' . $this->_var['ret_url']. ''); ?>">Đăng nhập</a>]
            [<a href="<?php echo url('app=member&act=register&ret_url=' . $this->_var['ret_url']. ''); ?>">Đăng kí</a>]
            <?php else: ?>
            [<a href="<?php echo url('app=member&act=logout'); ?>">Thoát</a>]
            <?php endif; ?>
        </p>
        <ul class="subnav">
            <li id="select_list">
                <a class="z_index" href="<?php echo url('app=member'); ?>">Quản lý</a>
                <ul id="float_list">
                    <div class="adorn1"></div>
                    <div class="adorn2"></div>
                    <?php if ($this->_var['visitor']['store_id']): ?>
                    <li><a href="<?php echo url('app=my_goods'); ?>">Quản lý sản phẩm</a></li>
                    <li><a href="<?php echo url('app=seller_order'); ?>">Quản lý đơn hàng</a></li>
                    <li><a href="<?php echo url('app=my_qa'); ?>">Quản lý tư vấn</a></li>
                    <?php else: ?>
                    <li><a href="<?php echo url('app=buyer_order'); ?>">Đơn hàng</a></li>
                    <li><a href="<?php echo url('app=buyer_groupbuy'); ?>">Nhóm mua</a></li>
                    <li><a href="<?php echo url('app=my_question'); ?>">Tư vấn</a></li>
                    <?php endif; ?>
                </ul>
            </li>
            <li class="line"><a href="<?php echo url('app=message&act=newpm'); ?>">PM<?php if ($this->_var['new_message']): ?>(<?php echo $this->_var['new_message']; ?>)<?php endif; ?></a></li>
            <li class="line"><a href="<?php echo url('app=article&code=' . $this->_var['acc_help']. ''); ?>">Trợ giúp</a></li>
            <?php $_from = $this->_var['navs']['header']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'nav');if (count($_from)):
    foreach ($_from AS $this->_var['nav']):
?>
            <li class="line"><a href="<?php echo $this->_var['nav']['link']; ?>"<?php if ($this->_var['nav']['open_new']): ?> target="_blank"<?php endif; ?>><?php echo htmlspecialchars($this->_var['nav']['title']); ?></a></li>
            <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
        </ul>
    </div>
</div>

<ul id="nav">
    <div class="nav1"></div>
    <div class="nav2"></div>
    <li><a class="<?php if ($this->_var['index']): ?>link<?php else: ?>hover<?php endif; ?>" href="index.php"><span>Trang chủ</span></a></li>
    <?php $_from = $this->_var['navs']['middle']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'nav');if (count($_from)):
    foreach ($_from AS $this->_var['nav']):
?>
    <li><a class="<?php if (! $this->_var['index'] && $this->_var['nav']['link'] == $this->_var['current_url']): ?>link<?php else: ?>hover<?php endif; ?>" href="<?php echo $this->_var['nav']['link']; ?>"<?php if ($this->_var['nav']['open_new']): ?> target="_blank"<?php endif; ?>><span><?php echo htmlspecialchars($this->_var['nav']['title']); ?></span></a></li>
    <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
</ul>

<div class="search">
    <div class="search1"></div>
    <div class="search2"></div>
    <div class="wrap">
        <form method="GET" action="<?php echo url('app=search'); ?>">
            <div class="border">
                <div class="select_js">
                    <p>Sản phẩm</p>
                    <div class="ico"></div>
                    <ul>
                        <li ectype="index">Sản phẩm</li>
                        <li ectype="store">Cửa hàng</li>
                        <li ectype="groupbuy">Nhóm hàng</li>
                    </ul>
                    <input type="hidden" name="act" value="index" />
                </div>
                <input type="text" name="keyword" class="text2" />
            </div>
            <input type="hidden" name="app" value="search" />
            <input type="submit" name="Submit" value="Tìm kiếm" class="btn" />
        </form>
        <p><a href="<?php echo url('app=category'); ?>">Danh mục sản phẩm</a><br /><a href="<?php echo url('app=category&act=store'); ?>">Danh mục cửa hàng</a></p>
    </div>
    <div class="nav">
        <div class="nav1"></div>
        <div class="nav2"></div>
        <a href="<?php echo url('app=cart'); ?>" class="buy">Giỏ hàng <strong id="cart_goods_kinds"><?php echo $this->_var['cart_goods_kinds']; ?></strong> sản phẩm</a>
        <a href="<?php echo url('app=my_favorite'); ?>" class="buyline">Yêu thích</a>
        <a href="<?php echo url('app=buyer_order'); ?>" class="buyline">Đơn hàng</a>
    </div>
</div>
<div>
<div>
  <div align="center"><img src="http://giasoc.com.vn/gianhang/themes/mall/default/styles/default/images/hotrotaogianhangmienphi.png" width="991" height="51" /></div>
</div>
  <div align="center">Support 24/7 | Y!M <a href = 'ymsgr:sendim?thanhtc_bkhn'><img src="http://opi.yahoo.com/online?u=thanhtc_bkhn&m=g&t=1" border=0></font></a> | Hotline: 0908.722.688 | Email : thanhtc84@gmail.com</div>
</div>
