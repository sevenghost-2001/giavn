$(function(){
    /* Chọn tất cả */
    $('.checkall').click(function(){
        $('.checkitem').attr('checked', this.checked)
    });

    /* Hàng loạt hoạt động nút */
    if($('#batchAction').length == 1){
        $('.batchButton').click(function(){
            /* Có một sự lựa chọn */
            if($('.checkitem:checked').length == 0){    //không có sự lựa chọn
                return false;
            }
            /* Run presubmit */
            if($(this).attr('presubmit')){
                if(!eval($(this).attr('presubmit'))){
                    return false;
                }
            }
            /* Lấy mục kiểm tra */
            var items = '';
            $('.checkitem:checked').each(function(){
                items += this.value + ',';
            });
            items = items.substr(0, (items.length - 1));
            /* Mục được chọn sẽ được gửi thông qua GET đến URI quy định */
            var uri = $(this).attr('uri');
            window.location = uri + '&' + $(this).attr('name') + '=' + items;
        });
    }

    /* Giảm hình ảnh lớn */
    $('.makesmall').each(function(){
        if(this.complete){
            makesmall(this, $(this).attr('max_width'), $(this).attr('max_height'));
        }else{
            $(this).load(function(){
                makesmall(this, $(this).attr('max_width'), $(this).attr('max_height'));
            });
        }
    });
});
function drop_confirm(msg, url){
    if(confirm(msg)){
        if(url == undefined){
            return true;
        }
        window.location = url;
    }else{
        if(url == undefined){
            return false;
        }
    }
}
function makesmall(obj,w,h){
    srcImage=obj;
    var srcW=srcImage.width;
    var srcH=srcImage.height;
    if (srcW==0)
    {
        obj.src=srcImage.src;
        srcImage.src=obj.src;
        var srcW=srcImage.width;
        var srcH=srcImage.height;
    }
    if (srcH==0)
    {
        obj.src=srcImage.src;
        srcImage.src=obj.src;
        var srcW=srcImage.width;
        var srcH=srcImage.height;
    }

    if(srcW>srcH){
        if(srcW>w){
            obj.width=newW=w;
            obj.height=newH=(w/srcW)*srcH;
        }else{
            obj.width=newW=srcW;
            obj.height=newH=srcH;
        }
    }else{
        if(srcH>h){
            obj.height=newH=h;
            obj.width=newW=(h/srcH)*srcW;
        }else{
            obj.width=newW=srcW;
            obj.height=newH=srcH;
        }
    }
    if(newW>w){
        obj.width=w;
        obj.height=newH*(w/newW);
    }else if(newH>h){
        obj.height=h;
        obj.width=newW*(h/newH);
    }
}
