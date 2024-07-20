<div id="footer">
    <p>
        <a href="index.php">Trang chủ</a>
        <?php $_from = $this->_var['navs']['footer']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'nav');if (count($_from)):
    foreach ($_from AS $this->_var['nav']):
?>
        | <a href="<?php echo $this->_var['nav']['link']; ?>"<?php if ($this->_var['nav']['open_new']): ?> target="_blank"<?php endif; ?>><?php echo htmlspecialchars($this->_var['nav']['title']); ?></a>
        <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
    </p>
    <?php echo sprintf('Trong %0.3f giây,chạy %d truy vấn  ,có <b>%d</b> người online', $this->_var['query_time'],$this->_var['query_count'],$this->_var['query_user_count']); ?>
    <?php if ($this->_var['gzip_enabled']): ?>,Gzip bật<?php else: ?>,Gzip tắt<?php endif; ?>
    <?php if ($this->_var['memory_info']): ?><?php echo sprintf(', chiếm %0.2f MB dung lượng', $this->_var['memory_info']); ?><?php endif; ?> <?php echo $this->_var['statistics_code']; ?><br />
    <a href="http://giasoc.com.vn" target="_blank">Copyright &copy; 2010 Giasoc Software Group Inc </a> - Hotline: 0908.722.688 - <a href="http://giasoc.com.vn" target="_blank">Design by thanhtc84.</a>
    <?php if ($this->_var['icp_number']): ?><br />
    <?php echo $this->_var['icp_number']; ?><?php endif; ?>
</div>
<?php echo $this->_var['async_sendmail']; ?>
</body>
</html>