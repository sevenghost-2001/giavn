<?php echo $this->fetch('header.html'); ?>
<div id="rightTop">
    <p>Site Settings</p>
    <ul class="subnav">
        <li><a class="btn1" href="index.php?app=setting&amp;act=base_setting">Cơ bản</a></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=base_information">Thông tin</a></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=email_setting">Email</a></li>
        <li><span>Mã bảo vệ</span></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=store_setting">Thiết lập cửa hàng</a></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=credit_setting">Thiết lập tiền tệ</a></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=subdomain_setting">hai miền</a></li>
        </ul>
</div>

<div class="info">
    <form method="post" enctype="multipart/form-data">
        <table class="infoTable">
            <tr>
                <th class="paddingT15">
                    Thời gian mở cửa:</th>
              <td class="paddingT15 wordSpacing5">
                  <input id="captcha_status1" type="checkbox" name="captcha_status[login]" value="1" <?php if ($this->_var['setting']['captcha_status']['login']): ?>checked<?php endif; ?>/> <label for="captcha_status1">Ma trận đăng nhập</label>
                    <input id="captcha_status2" type="checkbox" name="captcha_status[register]" value="1" <?php if ($this->_var['setting']['captcha_status']['register']): ?>checked<?php endif; ?>/> <label for="captcha_status2">Mặt trận đăng ký</label>
                     <input id="captcha_status3" type="checkbox" name="captcha_status[goodsqa]" value="1" <?php if ($this->_var['setting']['captcha_status']['goodsqa']): ?>checked<?php endif; ?>/> <label for="captcha_status3">Tư vấn sản phẩm</label> 
                    <input id="captcha_status4" type="checkbox" name="captcha_status[backend]" value="1" <?php if ($this->_var['setting']['captcha_status']['backend']): ?>checked<?php endif; ?>/> <label for="captcha_status4">quản lý</label>                </td>
            </tr>
            <!--<tr>
                <th class="paddingT15">
                    Cho phép các lỗi đăng nhập:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableInput" id="captcha_error_login" type="text" name="captcha_error_login" value="<?php echo $this->_var['setting']['captcha_error_login']; ?>"/></td>
            </tr>-->
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
