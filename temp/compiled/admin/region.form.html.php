<?php echo $this->fetch('header.html'); ?>
<div id="rightTop">
    <p>Khu vực</p>
    <ul class="subnav">
        <li><a class="btn1" href="index.php?app=region">Quản lý</a></li>
        <li><?php if ($this->_var['region']['region_id']): ?><a class="btn1" href="index.php?app=region&amp;act=add">Thêm</a><?php else: ?><span>Thêm</span><?php endif; ?></li>
    </ul>
</div>

<div class="info">
    <form method="post" enctype="multipart/form-data">
        <table class="infoTable">
            <tr>
                <th class="paddingT15">
                    Tên khu vực:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableInput2" id="region_name" type="text" name="region_name" value="<?php echo htmlspecialchars($this->_var['region']['region_name']); ?>" />                </td>
            </tr>
            <tr>
                <th class="paddingT15">
                    <label for="parent_id">Mục chính:</label></th>
                <td class="paddingT15 wordSpacing5">
                    <select id="parent_id" name="parent_id"><option value="0">Hãy chọn...</option><?php echo $this->html_options(array('options'=>$this->_var['parents'],'selected'=>$this->_var['region']['parent_id'])); ?></select>                </td>
            </tr>
            <tr>
                <th class="paddingT15">
                    Phân loại:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="sort_order" id="sort_order" type="text" name="sort_order" value="<?php echo $this->_var['region']['sort_order']; ?>" />                </td>
            </tr>
        <tr>
            <th></th>
            <td class="ptb20">
                <input class="formbtn" type="submit" name="Submit" value="Gửi" />
                <input class="formbtn" type="reset" name="reset" value="Làm lại" />            </td>
        </tr>
        </table>
    </form>
</div>
<?php echo $this->fetch('footer.html'); ?>
