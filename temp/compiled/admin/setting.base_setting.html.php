<?php echo $this->fetch('header.html'); ?>

<script type="text/javascript">
//<!CDATA[
$(function(){
    $(".show_image").mouseover(function(){
        $(this).next("div").show();
    });
    $(".show_image").mouseout(function(){
        $(this).next("div").hide();
    });
    <?php if ($this->_var['setting']['sitemap_enabled']): ?>
    $('#sitemap_frequency_setting').show();
    <?php endif; ?>
    $('#sitemap_disabled').click(function(){
        $('#sitemap_frequency_setting').hide();
    });
    $('#sitemap_enabled').click(function(){
        $('#sitemap_frequency_setting').show();
    });
});
//]]>
</script>

<div id="rightTop">
  <p>Site Settings</p>
  <ul class="subnav">
    <li><span>Cơ bản</span></li>
    <li><a class="btn1" href="index.php?app=setting&amp;act=base_information">Thông tin</a></li>
    <li><a class="btn1" href="index.php?app=setting&amp;act=email_setting">Email</a></li>
    <li><a class="btn1" href="index.php?app=setting&amp;act=captcha_setting">Mã bảo vệ</a></li>
    <li><a class="btn1" href="index.php?app=setting&amp;act=store_setting">Thiết lập cửa hàng</a></li>
    <li><a class="btn1" href="index.php?app=setting&amp;act=credit_setting">Thiết lập tiền tệ</a></li>
    <li><a class="btn1" href="index.php?app=setting&amp;act=subdomain_setting">hai miền</a></li>
  </ul>
</div>
<div class="info">
  <form method="post" enctype="multipart/form-data">
    <table class="infoTable">
      <tr>
        <th class="paddingT15"><label for="time_zone"> Đặt múi giờ:</label></th>
        <td class="paddingT15 wordSpacing5"><select id="time_zone" name="time_zone">
                <?php echo $this->html_options(array('options'=>$this->_var['time_zone'],'selected'=>$this->_var['setting']['time_zone'])); ?>
          </select>
          <span class="grey">Nên dùng múi giờ +7</span>
        </td>
      </tr>
      <tr>
        <th class="paddingT15"><label for="time_format_simple"> Thời gian ( đơn giản):</label></th>
        <td class="paddingT15 wordSpacing5"><input id="time_format_simple" type="text" name="time_format_simple" value="<?php echo $this->_var['setting']['time_format_simple']; ?>" class="infoTableInput"/></td>
      </tr>
      <tr>
        <th class="paddingT15"><label for="time_format_complete"> Thời gian ( đầy đủ):</label></th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput" id="time_format_complete" type="text" name="time_format_complete" value="<?php echo $this->_var['setting']['time_format_complete']; ?>"/></td>
      </tr>
      <tr>
        <th class="paddingT15"><label for="price_format"> Đinh dạng tiền tệ:</label></th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput" id="price_format" type="text" name="price_format" value="<?php echo $this->_var['setting']['price_format']; ?>"/></td>
      </tr>
<!--      <tr>
        <th class="paddingT15"> Chuyễn URL:</th>
        <td class="paddingT15 wordSpacing5"><input id="url_rewrite0" type="radio" name="url_rewrite" <?php if ($this->_var['setting']['url_rewrite'] == 0): ?>checked<?php endif; ?> value="0"/>
          <label for="url_rewrite0">Đóng</label>
          <input id="url_rewrite1" type="radio" name="url_rewrite" <?php if ($this->_var['setting']['url_rewrite'] == 1): ?>checked<?php endif; ?> value="1" />
          <label for="url_rewrite1">Mở</label>
        </td>
      </tr>
      <tr>
        <th class="paddingT15"><label for="cache_life"> Thời gian cache có hiệu lực (giây)):</label></th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput" id="cache_life" type="text" name="cache_life" value="<?php echo $this->_var['setting']['cache_life']; ?>"/></td>
      </tr>-->
      <tr>
        <th class="paddingT15"> <label for="default_goods_image">Ảnh mặc định sản phẩm:</label></th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableFile" id="default_goods_image" type="file" name="default_goods_image" />
          <?php if ($this->_var['setting']['default_goods_image']): ?>
          <img class="show_image" src="<?php echo $this->res_base . "/" . 'style/images/right.gif'; ?>" />
          <div style="position:absolute; display:none"><img src="<?php echo $this->_var['site_url']; ?>/<?php echo $this->_var['setting']['default_goods_image']; ?>?<?php echo $this->_var['random_number']; ?>" /></div>
          <?php endif; ?></td>
      </tr>
      <tr>
        <th class="paddingT15"> <label for="default_store_logo">Logo mặc định:</label></th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableFile" id="default_store_logo" type="file" name="default_store_logo" />
          <?php if ($this->_var['setting']['default_store_logo']): ?>
          <img class="show_image" src="<?php echo $this->res_base . "/" . 'style/images/right.gif'; ?>" />
          <div style="position:absolute; display:none"><img src="<?php echo $this->_var['site_url']; ?>/<?php echo $this->_var['setting']['default_store_logo']; ?>?<?php echo $this->_var['random_number']; ?>" /></div>
          <?php endif; ?></td>
      </tr>
      <tr>
        <th class="paddingT15"> <label for="default_user_portrait">Avata mặc định:</label></th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableFile" id="default_user_portrait" type="file" name="default_user_portrait" />
          <?php if ($this->_var['setting']['default_user_portrait']): ?>
          <img class="show_image" src="<?php echo $this->res_base . "/" . 'style/images/right.gif'; ?>" />
          <div style="position:absolute; display:none"><img src="<?php echo $this->_var['site_url']; ?>/<?php echo $this->_var['setting']['default_user_portrait']; ?>?<?php echo $this->_var['random_number']; ?>" /></div>
          <?php endif; ?></td>
      </tr>
      <?php if ($this->_var['feed_enabled']): ?>
      <tr>
        <th class="paddingT15"> <label for="default_feed_config">Các thiết lập mặc định cá nhân năng động:</label></th>
        <td class="paddingT15 wordSpacing5">
            <?php $_from = $this->_var['feed_items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('_fi', '_fn');if (count($_from)):
    foreach ($_from AS $this->_var['_fi'] => $this->_var['_fn']):
?>
            <input type="checkbox" id="feed_<?php echo $this->_var['_fi']; ?>" name="default_feed_config[<?php echo $this->_var['_fi']; ?>]" value="1" <?php if ($this->_var['default_feed_config'][$this->_var['_fi']]): ?> checked="true"<?php endif; ?> /><label for="feed_<?php echo $this->_var['_fi']; ?>"><?php echo $this->_var['_fn']; ?></label>&nbsp;
            <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
        </td>
      </tr>
      <?php endif; ?>
      <tr>
        <th class="paddingT15"> <label for="statistics_code">Lưu lượng số liệu thống kê mã:</label></th>
        <td class="paddingT15 wordSpacing5"><textarea name="statistics_code" id="statistics_code"><?php echo htmlspecialchars($this->_var['setting']['statistics_code']); ?></textarea></td>
      </tr>
<!--      <tr>
        <th class="paddingT15">Hiển thị hàng bán:</th>
        <td><input id="disaplay_sales_volume0" type="radio" name="disaplay_sales_volume" <?php if ($this->_var['setting']['disaplay_sales_volume'] == 0): ?>checked<?php endif; ?> value="0" />
          <label for="disaplay_sales_volume0">Đóng</label>
          <input id="disaplay_sales_volume1" type="radio" name="disaplay_sales_volume" <?php if ($this->_var['setting']['disaplay_sales_volume'] == 1): ?>checked<?php endif; ?> value="1" />
          <label for="disaplay_sales_volume1">Mở</label>
        </td>
      </tr>-->
      <tr>
        <th class="paddingT15">Cho phép du khách đến tham khảo ý kiến:</th>
        <td class="paddingT15"><input id="guest_comment_disabled" type="radio" name="guest_comment" <?php if (! $this->_var['setting']['guest_comment']): ?>checked<?php endif; ?> value="0" />
          <label for="guest_comment_disabled">Không</label>
          <input type="radio" id="guest_comment_enable" name="guest_comment" <?php if ($this->_var['setting']['guest_comment']): ?>checked<?php endif; ?> value="1" />
          <label for="guest_comment_enable">Có</label>&nbsp;&nbsp;&nbsp;&nbsp;
          <span class="grey"></span>
        </td>
      </tr>
      <tr>
        <th class="paddingT15">Cho phép giả tĩnh:</th>
        <td class="paddingT15"><input id="rewrite_disabled" type="radio" name="rewrite_enabled" <?php if (! $this->_var['setting']['rewrite_enabled']): ?>checked<?php endif; ?> value="0" />
          <label for="rewrite_disabled">Không</label>
          <input type="radio" id="rewrite_enabled" name="rewrite_enabled" <?php if ($this->_var['setting']['rewrite_enabled']): ?>checked<?php endif; ?> value="1" />
          <label for="rewrite_enabled">Có</label>&nbsp;&nbsp;&nbsp;&nbsp;
          <span class="grey">SEO sẽ giúp kích hoạt các giả tĩnh，Và tăng khả năng đọc của URL</span>
        </td>
      </tr>
      <tr>
        <th class="paddingT15">Bật Sitemap:</th>
        <td class="paddingT15"><input id="sitemap_disabled" type="radio" name="sitemap_enabled" <?php if (! $this->_var['setting']['sitemap_enabled']): ?>checked<?php endif; ?> value="0" />
          <label for="sitemap_disabled">Không</label>
          <input type="radio" id="sitemap_enabled" name="sitemap_enabled" <?php if ($this->_var['setting']['sitemap_enabled']): ?>checked<?php endif; ?> value="1" />
          <label for="sitemap_enabled">Có</label>&nbsp;&nbsp;&nbsp;&nbsp;
          <span class="grey">Các giao thức được sử dụng sitemaps.org，Được hỗ trợ là công cụ tìm kiếm Google, Yahoo!, MSN, Thông tin địa chỉ là: thăm địa chỉ trang Web của bạn/index.php?app=sitemap</span>
        </td>
      </tr>
      <tr id="sitemap_frequency_setting" style="display:none">
        <th class="paddingT15">
            Cập nhật chu kỳ (giờ)
        </th>
        <td class="paddingT15">
            <input type="text" name="sitemap_frequency" value="<?php echo $this->_var['setting']['sitemap_frequency']; ?>" />
        </td>
      </tr>
      <tr>
        <th></th>
        <td class="ptb20"><input class="formbtn" type="submit" name="Submit" value="Gửi" />
          <input class="formbtn" type="reset" name="Submit2" value="Làm lại" />
        </td>
      </tr>
    </table>
  </form>
</div>
<?php echo $this->fetch('footer.html'); ?>
