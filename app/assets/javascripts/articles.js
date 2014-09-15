

var ready;
ready = function() {
    $.getJSON("http://graph.facebook.com/?id=" + window.location.href, function (json){
        if(typeof json.shares === 'undefined'){
          $('#fb-counter1').text(0);
          $('#fb-counter2').text(0);
        }
        else{
          console.log("hei " + json.shares );
          $('#fb-counter1').text(json.shares);
          $('#fb-counter2').text(json.shares);
        }
    });
    function getTwitterCount(url) {
        $.ajax({
            method: "GET",
            url: url,
            dataType: "jsonp",
            jsonp: "callback",
            jsonpCallback: "jsonpcallback",
            success: function (json) {
                console.log("Test");
                if(typeof json.count === 'undefined'){
                    $('#twitter-counter1').text(0);
                    $('#twitter-counter2').text(0);
                }
                else{
                    console.log("hei " + json.count );
                    $('#twitter-counter1').text(json.count);
                    $('#twitter-counter2').text(json.count);
                }
            }
        });
    }
    getTwitterCount("http://urls.api.twitter.com/1/urls/count.json?url=" + window.location.href);

    
};
$(document).ready(ready);
$(document).on('page:load', ready);