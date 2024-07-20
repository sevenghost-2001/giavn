<?php echo $this->fetch('header.html'); ?>
<div id="rightTop">
    <p>Site Settings</p>
    <ul class="subnav">
        <li><a class="btn1" href="index.php?app=setting&amp;act=base_setting">Cơ bản</a></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=base_information">Thông tin</a></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=email_setting">Email</a></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=captcha_setting">Mã bảo vệ</a></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=store_setting">Thiết lập cửa hàng</a></li>
        <li><span>Thiết lập tiền tệ</span></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=subdomain_setting">hai miền</a></li>
        </ul>
</div>

<div class="info">
    <form method="post" enctype="multipart/form-data">
        <table class="infoTable">
            <tr>
                <th class="paddingT15">
                    Các khoản tín dụng L mức cần thiết:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableInput" id="upgrade_required" type="text" name="upgrade_required" value="<?php echo $this->_var['setting']['upgrade_required']; ?>"/></td>
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
