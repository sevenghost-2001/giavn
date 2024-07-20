<?php echo $this->fetch('header.html'); ?>
<script type="text/javascript">
$(function(){
        $('#scategory_form').validate({
        errorPlacement: function(error, element){
            $(element).next('.field_notice').hide();
            $(element).after(error);
        },
        success       : function(label){
            label.addClass('right').text('OK!');
        },
        onfocusout : false,
        onkeyup    : false,
        rules : {
            cate_name : {
                required : true,
                remote   : {
                url :'index.php?app=scategory&act=check_scategory',
                type:'get',
                data:{
                    cate_name : function(){
                        return $('#cate_name').val();
                    },
                    parent_id : function() {
                        return $('#parent_id').val();
                    },
                    id : '<?php echo $this->_var['scategory']['cate_id']; ?>'
                  }
                }
            },
            sort_order : {
                number   : true
            }
        },
        messages : {
            cate_name : {
                required : 'Không thể để trống',
                remote   : 'Tên đã tồn tại! Vui lòng kiểm tra lại!'
            },
            sort_order  : {
                number   : 'Chỉ nhập số'
            }
        }
    });
});
</script>
<div id="rightTop">
    <p>Thể loại</p>
    <ul class="subnav">
        <li><a class="btn1" href="index.php?app=scategory">Quản lý</a></li>
        <li><?php if ($this->_var['scategory']['cate_id']): ?><a class="btn1" href="index.php?app=scategory&amp;act=add">Thêm</a><?php else: ?><span>Thêm</span><?php endif; ?></li>
    </ul>
</div>

<div class="info">
    <form method="post" enctype="multipart/form-data" id="scategory_form">
        <table class="infoTable">
            <tr>
                <th class="paddingT15">
                    Tên thể loại:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableInput2" id="cate_name" type="text" name="cate_name" value="<?php echo htmlspecialchars($this->_var['scategory']['cate_name']); ?>" />
                    <label class="field_notice">Tên thể loại</label>        </td>
            </tr>
            <tr>
                <th class="paddingT15">
                    <label for="parent_id">Mục chính:</label></th>
                <td class="paddingT15 wordSpacing5">
                    <select id="parent_id" name="parent_id"><option value="0">Hãy chọn...</option><?php echo $this->html_options(array('options'=>$this->_var['parents'],'selected'=>$this->_var['scategory']['parent_id'])); ?></select>
                    <label class="field_notice">Mục chính</label></td>
            </tr>
            <tr>
                <th class="paddingT15">
                    Phân loại:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="sort_order" id="sort_order" type="text" name="sort_order" value="<?php echo $this->_var['scategory']['sort_order']; ?>" />
                    <label class="field_notice">Cập nhâtt</label>              </td>
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
