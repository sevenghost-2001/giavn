<?php echo $this->fetch('header.html'); ?>
<div id="rightTop">
    <p>Site Settings</p>
    <ul class="subnav">
        <li><a class="btn1" href="index.php?app=setting&amp;act=base_setting">Cơ bản</a></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=base_information">Thông tin</a></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=email_setting">Email</a></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=captcha_setting">Mã bảo vệ</a></li>
        <li><span>Thiết lập cửa hàng</span></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=credit_setting">Thiết lập tiền tệ</a></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=subdomain_setting">hai miền</a></li>
        </ul>
</div>

<div class="info">
    <form method="post" enctype="multipart/form-data">
        <table class="infoTable">
            <tr>
                <th class="paddingT15">
                    Được phép áp dụng cho cửa hàng:</th>
                <td class="paddingT15 wordSpacing5">
                    <input id="store_allow0" type="radio" name="store_allow" <?php if ($this->_var['setting']['store_allow'] == 0): ?>checked<?php endif; ?> value="0" /> <label for="store_allow0">Đóng</label>
                    <input id="store_allow1" type="radio" name="store_allow" <?php if ($this->_var['setting']['store_allow'] == 1): ?>checked<?php endif; ?> value="1" /> <label for="store_allow1">Mở</label>
                </td>
            </tr>
            <tr>
            <th></th>
            <td class="ptb20">
                <input class="formbtn" type="submit" name="Submit" value="Gửi" />
                <input class="formbtn" type="reset" name="Submit2" value="Làm lại" />
            </td>
        </tr>
        </table>
    </form>
</div>
<?php echo $this->fetch('footer.html'); ?>
