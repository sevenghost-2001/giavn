/* Tab hiện tại */
var currTab = 'dashboard';
var firstOpen = [];
var maxHistoryLength = 5;
$(function(){
    /* Khởi tạo tab */
    initHistory();
    initTopTab();
    /* Thiết lập không gian làm việc của bạn */
    setWorkspace();
    /* thay đổi kích thước, tái thiết lập khu vực làm việc */
    $(window).resize(setWorkspace);
});
function initTopTab(){
    $.each(menu, function(k, v){
        var item = $('<li><a class="link" href="javascript:;" id="tab_' + k + '">' + v.text + '</a></li>');
        item.children('a').click(function(){var tabName = this.id.substr(4);if(tabName == currTab){return;}switchTab(tabName);openItem();});
        $('#nav').append(item);
    });

    /* Chuyển sang tab mặc định */
    switchTab(currTab);
    openItem(firstOpen[1], firstOpen[0]);
    $('#iframe_refresh').click(function(){
        $('#workspace').get(0).contentWindow.location.reload();
    });
    $('#clear_cache').click(function(){
        var url = 'index.php?act=clear_cache';
        $.getJSON(url, {}, function(data){
            alert(data.msg);
        });
    });
}
function initHistory(){
    readHistory();
    $(window).unload(saveHistory);
}
function readHistory(){
    var h = $.getCookie('actionHistory');
    if(h != '' && h != 'undefined'){
        var arr = h.split(',').reverse();
        $.each(arr, function(){
            var tmp = this.split('-');
            addHistoryItem(tmp[0], tmp[1]);
        });
        if(arr.length){
            firstOpen = arr[arr.length - 1].split('-');
        }
    }
}
function saveHistory(){
    var h = '';
    $('#history dd').each(function(){
        h += $(this).find('a:first').attr('id') + ',';
    });
    var v = h.substr(0, (h.length - 1));
    $.setCookie('actionHistory', v);
}
function addHistoryItem(tab, item){
    var id = '#' + tab + '-' + item;
    if($(id).length == 1){
        /* Nếu có trước đó */
        var cln = $(id).parent().clone(true);
        $(id).parent().remove();
        $('#history dt').after(cln);

    }
    else{
        /* Không tồn tại, thêm */
        if(typeof(menu[tab]['children'][item]) == 'undefined'){
            return;
        }
        if($('#history dd').length == maxHistoryLength){
            $('#history dd:last').remove();
        }
        var lnk = $('<a href="javascript:;" id="' + tab + '-' + item + '">' + menu[tab]['children'][item]['text'] + '</a>').css({"color":"#98a9c2"});
        var close = $('<a href="javascript:;" class="close"><img src="templates/style/images/close.gif" / ></a>');
        lnk.click(function(){
            openItem(item, tab);
        });
        close.click(function(){
            $(this).parent().remove();
        });
        $('<dd></dd>').append(lnk).append(close).insertAfter($('#history dt'));
    }
}
function switchTab(tabName){
    currTab = tabName;
    pickTab();
    loadSubmenu();
}
function pickTab(){
    var id = '#tab_' + currTab;
    $('#nav').find('a').each(function(){
        $(this).removeClass('actived');
        $(this).addClass('link');
    });
    $(id).addClass('actived');
}
function loadSubmenu(){
    var m = menu[currTab];
    /* Tiêu đề menu con */
    $('#submenuTitle').text(m.subtext ? m.subtext : m.text);
    /* Xóa tất cả các trình đơn phụ hiện tại */
    $('#submenu').find('dd').remove();
    /* Các mục trình đơn phụ của mục trình đơn */
    $.each(m.children, function(k, v){
        var p = v.parent ? v.parent : currTab;
        var item = $('<dd><a href="javascript:;" url="' + v.url + '" parent="' + p + '" id="item_' + k + '">' + v.text + '</a></dd>');
        item.children('a').click(function(){
            openItem(this.id.substr(5));
        });
        $('#submenu').append(item);
    });
}
function openItem(itemIndex, tab){
    if(typeof(itemIndex) == 'undefined')
    {
        var itemIndex = menu[currTab]['default'];
    }
    var id      = '#item_' + itemIndex;
    if(tab){
        var parent = tab;
    }else{
        var parent  = $(id).attr('parent');
    }
    /* Nếu trong tab hiện tại */
    if(parent != currTab){
        /* Chuyển sang tab quy định */
        switchTab(parent);
    }
    /* Đánh dấu các mục hiện hành */
    $('#submenu').find('a').each(function(){
        $(this).removeClass('selected');
    });
    $(id).addClass('selected');

    /* Cập nhật các nội dung của khung nội tuyến */
    $('#workspace').show();
    $('#workspace').attr('src', $(id).attr('url'));

    /* Thêm vào lịch sử hoạt động để truy cập chúng */
    addHistoryItem(currTab, itemIndex);
}
/* Thiết lập không gian làm việc của bạn */
function setWorkspace(){
    var wWidth = $(window).width();
    var wHeight = $(window).height();
    $('#workspace').width(wWidth - $('#left').width() - parseInt($('#left').css('margin-right')));
    $('#workspace').height(wHeight - $('#head').height());
}

/* Bối cảnh Navigation */
var num = 0;
var close_num = 0;
var div = document.getElementsByTagName('div');
window.onload = function()
{
    var img = document.getElementById('back_btn');
    img.onclick = display_fn;
    var closes = document.getElementsByTagName('div');
    for(i = 0; i < closes.length; i++)
    {
        if(closes[i].className == 'close_float')
        {
            close_num = i;
        }
    }
    closes[close_num].onclick = none_fn;
}
function display_fn()
{
    for(i = 0; i < div.length; i++)
    {
        if(div[i].className == 'back_nav')
        {
            num = i;
        }
    }
    div[num].style.display = 'block';
}
function none_fn()
{
    for(i = 0; i < div.length; i++)
    {
        if(div[i].className == 'back_nav')
        {
            num = i;
        }
    }
    div[num].style.display = 'none';
}
