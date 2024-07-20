<?php echo $this->fetch('header.html'); ?>
<div id="rightTop">
    <p>Site Settings</p>
    <ul class="subnav">
        <li><a class="btn1" href="index.php?app=setting&amp;act=base_setting">Cơ bản</a></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=base_information">Thông tin</a></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=email_setting">Email</a></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=captcha_setting">Mã bảo vệ</a></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=store_setting">Thiết lập cửa hàng</a></li>
        <li><a class="btn1" href="index.php?app=setting&amp;act=credit_setting">Thiết lập tiền tệ</a></li>
        <li><span>hai miền</span></li>
    </ul>
</div>

<div class="info">
    <form method="post">
        <table class="infoTable">
            <tr>
                <th class="paddingT15">
                    Cho dù để cho phép cấp thứ hai miền:</th>
                <td class="paddingT15 wordSpacing5">
                    <?php echo $this->html_radios(array('name'=>'enabled_subdomain','options'=>$this->_var['yes_or_no'],'checked'=>$this->_var['config']['enabled_subdomain'])); ?>
                <span class="grey">Kích hoạt tính năng hai máy chủ tên miền cần hỗ trợ của bạn，Cấu hình cụ thể để tạo điều kiện gói cài đặt, xin vui lòng xem các thư mục tài liệu của hai tài liệu cấu hình miền</span>
                </td>
            </tr>
            <tr>
                <th class="paddingT15">
                    Thứ hai miền cấp hậu tố:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableInput" id="subdomain_suffix" type="text" name="subdomain_suffix" value="<?php echo $this->_var['config']['subdomain_suffix']; ?>"/>
                <span class="grey">Ví dụ: người sử dụng sẽ là tên miền thứ cấp"test.mall.example.com", Bạn chỉ cần điền vào"mall.example.com"</span>
                </td>
            </tr>
            <tr>
                <th class="paddingT15">
                    Chọn một tên:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableInput" id="subdomain_reserved" type="text" name="subdomain_reserved" value="<?php echo $this->_var['setting']['subdomain_reserved']; ?>"/>
                <span class="grey">Xin vui lòng nhập các tên miền bạn muốn giữ hai，Giữa số lượng các tên miền dành riêng, xin vui lòng sử dụng","số tách</span>
                </td>
            </tr>
            <tr>
                <th class="paddingT15">
                    chiều dài:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableInput" id="subdomain_length" type="text" name="subdomain_length" value="<?php echo $this->_var['setting']['subdomain_length']; ?>"/>
                    <span class="grey">Mẫu"3-12"，Đăng ký tên miền thay mặt giới hạn 3-12 ký tự</span>
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
