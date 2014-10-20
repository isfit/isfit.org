function getInstagram(url, div_id, col_size) {
    $.ajax({
        method: "GET",
        url: url,
        dataType: "jsonp",
        jsonp: "callback",
        success: function (data) {
            var output = "";
            var div = document.getElementById(div_id);
            $.each(data.data, function (i, item) {
                output += '<div class="col-md-' + col_size + ' bottom-margin';      
                if(i == 0){
                    output += '"><a href="' + item.link +'"><img src="' + item.images.standard_resolution.url + '" class="instagram_image"' + 'id="instagram_' + i + '"/></a></div>';
                }
                else{
                    output += '"><a href="' + item.link +'"><img src="' + item.images.standard_resolution.url + '" class="instagram_image instagram_hided"' + 'id="instagram_' + i + '"/></a></div>';
                }
            });
            div.innerHTML = output;
        }
    });
}

var ready;
ready = function() {
    
        $(function() {
            var $cn_list    = $('#cn_list');
            var $items      = $cn_list.find('.cn_item');
            var $cn_preview = $('#cn_preview');
            var current     = 1;
            var i;
            $items.each(function(i){
                var $item = $(this);
                $item.data('idx',i+1);

                $item.bind('click',function(){
                    var $this       = $(this);
                    $cn_list.find('.selected').removeClass('selected');
                    $this.addClass('selected');
                    var idx         = $(this).data('idx');
                    var $current    = $cn_preview.find('.cn_content:nth-child('+current+')');
                    var $next       = $cn_preview.find('.cn_content:nth-child('+idx+')');
                    $current.addClass('cn_content_invisible');
                    $next.removeClass('cn_content_invisible');
                    current = idx;
                });
            });
            i = setInterval(function() {
                slideNews(1);
            }, 20000);


                $('#cn_list').hover(function() {
                    clearInterval(i);
                }, function() {
                    i = setInterval(function() {
                        slideNews(1);
                    }, 20000);
                });
            $('.cn_content').hover(function() {
                clearInterval(i);
            }, function() {
                i = setInterval(function() {
                    slideNews(1);
                }, 20000);
            });
            function slideNews(places){
                var idx         = current + places;
                if(idx > $items.length)
                {
                    idx = 1;
                }
                else if(idx <= 0)
                {
                    idx = $items.length;
                }

                var $current    = $cn_preview.find('.cn_content:nth-child(' + current + ')');
                var $next       = $cn_preview.find('.cn_content:nth-child(' + idx + ')');
                var $currentIndicator = $items.get(idx - 1);
                $cn_list.find('.selected').removeClass('selected');
                $($currentIndicator).addClass('selected');
                $current.addClass('cn_content_invisible');
                $next.removeClass('cn_content_invisible');
                current = idx;
            }
        });
        $(function(){
            var $video_list     = $('#video_list');
            var $items          = $video_list.find('.video_item');
            var $show_video     = $('#show_video');
            var current         = 1;
            $items.each(function(i){
               var $item = $(this);
                $item.data('idx', i+1);

                $item.bind('click',function(){
                    var $this       = $(this);
                    $video_list.find('.selected_video').removeClass('selected_video');
                    $this.addClass('selected_video');
                    var idx         = $(this).data('idx');
                    var $current    = $show_video.find('.video_content:nth-child(' + current + ')');
                    var $next       = $show_video.find('.video_content:nth-child(' + idx + ')');
                    $current.addClass('video_content_invisible');
                    $next.removeClass('video_content_invisible');
                    current = idx;
                });
            });
            var $left_button    = $('#button_left');
            var $right_button   = $('#button_right');
            $left_button.bind('click', function(){
               slideVideo(-1);
            });
            $right_button.bind('click', function(){
                slideVideo(1);
            });
            function slideVideo(places){
                var idx         = current + places;
                if(idx > $items.length)
                {
                    idx = 1;
                }
                else if(idx <= 0)
                {
                    idx = $items.length;
                }

                var $current    = $show_video.find('.video_content:nth-child(' + current + ')');
                var $next       = $show_video.find('.video_content:nth-child(' + idx + ')');
                var $currentIndicator = $items.get(idx - 1);
                $video_list.find('.selected_video').removeClass('selected_video');
                $($currentIndicator).addClass('selected_video');
                $current.addClass('video_content_invisible');
                $next.removeClass('video_content_invisible');
                current = idx;
            }
        });
        function slideInstagram(index){
            console.log(index);
      
            if(index === 0){
                $('#instagram_'+3+'').fadeOut(400, function() {
                    $('#instagram_' + index + '').fadeIn(400);
                });
            }
            else{
                $('#instagram_'+(index - 1)+'').fadeOut(400, function() {
                    $('#instagram_' + index + '').fadeIn(400);
                });
            }

            

        }
        getInstagram('https://api.instagram.com/v1/tags/tradeyourideas/media/recent?client_id=802d634befd6476c80cc18dbee1ce8e0&count=4','instagram-div-1','12');
        var i = 0;
        var indexVariable = 0;
            setInterval(function () {
            indexVariable = ++indexVariable % 4 ; // SET { 1-360 }
            slideInstagram(indexVariable);
        }, 3000);

        //getInstagram('https://api.instagram.com/v1/tags/isfit2015/media/recent?client_id=802d634befd6476c80cc18dbee1ce8e0&count=4', 'instagram-div-2','6');
};

$(document).ready(ready);
$(document).on('page:load', ready);