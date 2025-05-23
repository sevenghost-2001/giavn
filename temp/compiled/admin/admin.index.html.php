<?php echo $this->fetch('header.html'); ?>
<div id="rightTop">
  <p>Quản trị</p>
  <ul class="subnav">
    <li><span>Quản Lí</span></li>
    <li><a class="btn1" href="index.php?app=admin&amp;act=add">Thêm</a></li>
  </ul>
</div>

<div class="mrightTop">
  <div class="fontr"><?php echo $this->fetch('page.top.html'); ?></div>
</div>
<div class="tdare">
  <form method=get>
  <table width="100%" cellspacing="0" class="dataTable">
    <?php if ($this->_var['admins']): ?>
    <tr class="tatr1">
      <td width="20" class="firstCell"><input type="checkbox" class="checkall" /></td>
      <td>Tên người dùng | Tên Thật</td>
      <td><span ectype="order_by" fieldname="email">Email</span></td>
      <td><span ectype="order_by" fieldname="im">IM</span></td>
      <td><span ectype="order_by" fieldname="last_login">Đăng nhập lần cuối</span></td>
      <td><span ectype="order_by" fieldname="logins">Số lần đăng nhập</span></td>
      <td class="handler">Chức vụ</td>
    </tr>
    <?php endif; ?>
    <?php $_from = $this->_var['admins']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'admin');if (count($_from)):
    foreach ($_from AS $this->_var['admin']):
?>
    <tr class="tatr2">
      <td class="firstCell"><input type="checkbox" class="checkitem" value="<?php echo $this->_var['admin']['user_id']; ?>" /></td>
      <td><?php echo htmlspecialchars($this->_var['admin']['user_name']); ?> | <?php echo htmlspecialchars($this->_var['admin']['real_name']); ?></td>
      <td><?php echo htmlspecialchars($this->_var['admin']['email']); ?></td>
      <td><?php if ($this->_var['admin']['im_qq']): ?>QQ: <?php echo htmlspecialchars($this->_var['admin']['im_qq']); ?><br />
        <?php endif; ?>
        <?php if ($this->_var['admin']['im_msn']): ?>MSN: <?php echo htmlspecialchars($this->_var['admin']['im_msn']); ?><br />
        <?php endif; ?></td>
      <td><?php if ($this->_var['admin']['last_login']): ?><?php echo local_date("Y-m-d",$this->_var['admin']['last_login']); ?><?php endif; ?><br />
        <?php echo $this->_var['admin']['last_ip']; ?></td>
      <td><?php echo $this->_var['admin']['logins']; ?></td>
      <td class="handler">
      <?php if ($this->_var['admin']['privs'] == all): ?>Quản trị viên hệ thống
      </td>
      <?php else: ?>
      <span style="width: 120px">
      <a href="index.php?app=admin&amp;act=edit&amp;id=<?php echo $this->_var['admin']['user_id']; ?>">Sữa</a> | <a href="javascript:drop_confirm('Bạn có chắc chắn muốn xóa nó?', 'index.php?app=admin&amp;act=drop&amp;id=<?php echo $this->_var['admin']['user_id']; ?>');">Hủy bỏ</a>
      </span>
      </td>
      <?php endif; ?>
    </tr>
    <?php endforeach; else: ?>
    <tr class="no_data">
      <td colspan="10">Không có dữ liệu</td>
    </tr>
    <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
  </table>
  </form>
  <?php if ($this->_var['admins']): ?>
  <div id="dataFuncs">
    <div id="batchAction" class="left paddingT15"> &nbsp;&nbsp;
      <input class="formbtn batchButton" type="button" value="Xóa" name="id" uri="index.php?app=admin&act=drop" presubmit="confirm('Bạn có chắc chắn muốn xóa nó?');" />
    </div>
    <div class="pageLinks"><?php echo $this->fetch('page.bottom.html'); ?></div>
    <div class="clear"></div>
  </div>
  <?php endif; ?>
</div>
<?php echo $this->fetch('footer.html'); ?> 