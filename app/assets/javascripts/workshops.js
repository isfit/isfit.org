

ready = function () {

$(".workshop-field").hover(function() { // mouseenter

$(this).addClass("hover");

}, function() { // mouseleave

$(this).removeClass("hover");

});

}
$(document).ready(ready)
$(document).on('page:load', ready)

$(document).ready(function() {


});