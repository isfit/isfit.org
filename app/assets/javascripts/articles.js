

var ready;
ready = function() {
    $.getJSON("http://graph.facebook.com/?id=" + "http://isfit.org"/**window.location.href*/, function (json){
        if(typeof json.shares === 'undefined'){
          $('#fb-counter').text(0);
        }
        else{
          console.log("hei " + json.shares );
          $('#fb-counter').text(json.shares);
        }
    });
    $.getJSON("http://urls.api.twitter.com/1/urls/count.json?url=" + "http://www.isfit.org"/**window.location.href*/, function (json){
        if(typeof json.count === 'undefined'){
          $('#twitter-counter').text(0);
        }
        else{
          console.log("hei " + json.count );
          $('#twitter-counter').text(json.count);
        }
    });
    
};
$(document).ready(ready);
$(document).on('page:load', ready);