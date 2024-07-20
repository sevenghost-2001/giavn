/* Chỉnh sửa chế độ khởi tạo */
$(function(){
    /* Liên kết trên trang không hợp lệ */
    disableLink($(document.body));

    /* Đang tải Panels */
    var d = DialogManager.create('loading_panel');
    d.disableClose(lang.loading_please);
    d.setTitle(lang.loading);
    d.setContents('loading', {'text' : 'loading...'});
    d.setWidth(270);
    d.show('center');
    $.get('admin/index.php?app=template&act=get_editor_panel', function(data){
        /* Trong chèn bảng điều khiển */
        $(document.body).prepend(data);

        /* Kể từ khi thông tin ban đầu mặt dây chuyền mặt dây chuyền phụ thuộc, để khởi tạo phải được đặt ở đây */
        $("[widget_type='widget']").each(function(){init_widget(this);});

        /* Đóng hộp thoại để tải */
        d.enableClose();
        DialogManager.close('loading_panel');
    });

    /* khởi tạo khu vực */
    set_widget_area();
    $("[widget_type='area']").sortable({
        items:"[widget_type='widget']",
        connectWith: "[widget_type='area']",
        opacity:0.6,
        forcePlaceholderSize : true,
        update:set_widget_area
    }).disableSelection();

    /* Cấu hình ban đầu khung nội tuyến */
    $(document.body).append($('<iframe src="about:blank" style="display:none;height:0px;width:0px;" id="_config_post_iframe_" name="_config_post_iframe_"></iframe>'));
});

function set_widget_area()
{
    $("[widget_type='area']").each(function(){init_widget_area(this);});
}
/**
 *    Mặt dây chuyền ban đầu khu vực
 *
 *    @author    Garbin
 *    @param    none
 *    @return    void
 */
function init_widget_area(area)
{
    /* Để đảm bảo rằng phong cách ưu tiên, mô hình này được kiểm soát bởi JS */
    $(area).css('border', 'yellow 1px solid');
    var _has_widget = $(area).find("[widget_type='widget']").length;
    var _has_empty_placeholder = $(area).find('.empty_widget_area').length;
    if (!_has_widget && !_has_empty_placeholder)
    {
        /* Nếu không có treo và giữ chỗ không có sản phẩm nào, với */
        $(area).prepend('<div class="empty_widget_area">' + lang.empty_area_notice + '</div>');
    }
    if (_has_widget && _has_empty_placeholder)
    {
        /* Nếu mặt dây chuyền và giữ chỗ trống, sau đó loại bỏ */
        $(area).find('.empty_widget_area').remove();
    }
}

/**
 *    Khởi mảnh treo
 *
 *    @author    Garbin
 *    @param    none
 *    @return    void
 */
function init_widget(widget)
{
    if ($(widget).css('position') != 'absolute')
    {
        $(widget).css('position', 'relative');
    }
    /* kéo */
    $(widget).css('cursor', 'move');

    /* Hành động Bar */
    var icon_bar = $('<div class="widget_icons"></div>');
    icon_bar.append($('<span class="delete_widget"></span>').click(function(){
        var d = DialogManager.create('confirm_delete');
        d.setWidth(300);
        d.setTitle(lang.please_confirm);
        d.setContents('message', {
            type:'confirm',
            text:lang.delete_widget_confirm,
            onClickYes:function(){
                $(widget).fadeOut('slow', function(){$(widget).remove();set_widget_area();});
            }
        });
        d.show('center');
    }));

    /* Nếu có cấu hình, nó cho thấy nút Configure */

    if (__widgets[$(widget).attr('name')]['configurable'])
    {
        icon_bar.append($('<span class="config_widget"></span>').click(function(){config_widget(widget);}));
    }

    $(widget).prepend(icon_bar);
}

/**
 *    lưu Trang
 *
 *    @author    Garbin
 *    @return    void
 */
function save_page()
{
    var d = DialogManager.create('save_page');
    d.setTitle(lang.saving);
    d.setContents('loading', {'text' : 'saving...'});
    d.setWidth(270);
    d.show('center');

    /* Tạo hình thức được gửi */
    create_save_form();

    /* Thông tin để xử lý kịch bản và hiển thị kết quả POST*/
    $.post('admin/index.php?app=template&act=save&page=' + __PAGE__, $('#_edit_page_form_').serialize(), function(rzt){
        d.setTitle(lang.save_successed);
        d.setContents('message', {text:rzt.msg});
    }, 'json');
}

function create_save_form()
{
    /* rõ ràng */
    $('#_edit_page_form_').empty();

    /* tái sinh */
    var widgets = get_widgets_on_page();
    var config  = get_widget_config_on_page();
    for (var widget_id in widgets)
    {
        $('#_edit_page_form_').append('<input type="checkbox" checked="true" name="widgets[' + widget_id + ']" value="' + widgets[widget_id] + '" />');
    }
    for (var area in config)
    {
        for (var nk in config[area])
        {
            $('#_edit_page_form_').append('<input type="checkbox" checked="true" name="config[' + area + '][]" value="' + config[area][nk] + '" />');
        }
    }
}

/**
 *    Nhận tất cả các mặt dây chuyền trong bộ sưu tập của trang
 *
 *    @author    Garbin
 *    @return    array
 */
function get_widgets_on_page()
{
    var rzt = {};
    $("[widget_type='widget']").each(function(k){
        rzt[$(this).attr('id')] = $(this).attr('name');
    });

    return rzt;
}

/**
 *    Nhận tất cả các khu vực phụ kiện trang ID và mối quan hệ giữa các mặt dây chuyền
 *
 *    @author    Garbin
 *    @param    none
 *    @return    void
 */
function get_widget_config_on_page()
{
    var rzt = {};
    $("[widget_type='area']").each(function(k){
        var area = $(this).attr('area');
        var area_widgets = [];
        $(this).find("[widget_type='widget']").each(function(wk){
            area_widgets.push($(this).attr('id'));
        });
        rzt[area] = area_widgets;
    });

    return rzt;
}

/* cấu hình mặt dây chuyền */
function config_widget(widget)
{
    var _id = $(widget).attr('id');
    var _name = $(widget).attr('name');
    var d = DialogManager.create('config_dialog');
    d.setTitle(lang.loading);
    d.setContents('loading', {text:'loading...'});
    d.setWidth(400);
    d.show('center');
    $.get('admin/index.php?app=template&act=get_widget_config_form&id=' + _id + '&name=' + _name + '&page=' + __PAGE__, function(rzt){
        var _form = '<div class="widget_config_form"><form enctype="multipart/form-data" method="POST" action="admin/index.php?app=template&act=config_widget&id='+_id+'&name='+_name+'&page='+__PAGE__+'" target="_config_post_iframe_" id="_config_widget_form_"><div class="widget_config_form_body">' + rzt + '</div><div class="dialog_buttons_bar" style="margin-top:20px;"><input type="submit" class="btn1" value="' + lang.submit + '" /><input type="reset" class="btn2" value="' + lang.reset + '" /></div></form></div>';
        d.setTitle(lang.config_widget);
        d.setContents($(_form));
        $('#_config_widget_form_').submit(function(){
            d.hide();
            /* Hiện loading... */
            var _sd = DialogManager.create('config_submitting');
            _sd.setWidth(270);
            _sd.setTitle(lang.submitting);
            _sd.setContents('loading', {text:'submitting...'});
            _sd.show('center');

            /* Đóng hộp thoại cùng một lúc đóng hộp thoại tải */
            d.onClose = function(){
                DialogManager.close('config_submitting');

                return true;
            };

            return true;
        });
    });
}

function add_widget(){
    /* Ajax có được thông qua các widget html */
    var _self = this;
    var d = DialogManager.create('add_widget');
    d.setWidth(270);
    d.setTitle(lang.loading);
    d.setContents('loading', {text: 'loading...'});
    d.show('center');
    $.getJSON('admin/index.php?app=template&act=add_widget&name='+$(this).attr('widget_name')+'&page=' + __PAGE__, function(rzt){
        if (rzt.done)
        {
            var widget_id = rzt.retval.widget_id;
            if ($('#' + widget_id).length)
            {
                $(_self).click();
            }
            var _c = $(rzt.retval.contents);
            disableLink(_c);
            $("[widget_type='area']:first").prepend(_c);
            init_widget($('#' + widget_id));
            $(window).scrollTop($('#' + widget_id).position().top);
            set_widget_area();
            DialogManager.close('add_widget');
            $('#' + widget_id).hide();
            $('#' + widget_id).fadeIn('slow');
        }
        else
        {
            var _msg = rzt;
            if (rzt.msg)
            {
                _msg = rzt.msg;
            }
            d.setTitle(lang.error);
            d.setContents('message', {
                type : 'warning',
                text : rzt.msg
            });
        }
    });
}
/**
 *    Ẩn bảng điều khiển hiển thị
 *
 *    @author    Garbin
 *    @param    none
 *    @return    void
 */
function toggle_panel()
{
    if ($(this).attr('status') == 'open')
    {
        $('#template_panel .handle_top ul a').removeClass('handle_hover').addClass('handle_link');//Chỉ khi một nhãn cho bây giờ
        $('#template_panel').css('paddingBottom', 0).find('.handle_bot, .handle_line').hide();
        $('#template_panel .handle_top').css('overflow', 'hidden');
        $(this).attr('status', 'close').html(lang.display);
    }
    else
    {
        $('#template_panel .handle_top ul a').removeClass('handle_link').addClass('handle_hover');//Chỉ khi một nhãn cho bây giờ
        $('#template_panel').css('paddingBottom', 10).find('.handle_bot, .handle_line').show();
        $('#template_panel .handle_top').css('overflow', '');
        $(this).attr('status', 'open').html(lang.hidden);
    }
}
function disableLink(doc)
{
    /* Tất cả là không neo một bộ lọc */
    doc.find("a[name='']").attr('href', 'javascript:void(0);').attr('target', '');
}
