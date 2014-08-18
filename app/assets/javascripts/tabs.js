

 /**var scrollspy = function(){
    	var scrollPos = $(document).scrollTop();
    	$('#sidebar-navbar a').each(function () {
        	var currLink = $(this);
        	var refElement = $(currLink.attr("href"));
        	if (refElement.position().top <= scrollPos && refElement.position().top + refElement.height() > scrollPos) {
            	$('#sidebar-navbar ul li').removeClass("active"); //added to remove active class from all a elements
            	currLink.addClass("active");
        	}
        	else{
            	currLink.removeClass("active");
        	}
    	});
}

$(document).bind('scroll', scrollspy);

 scrollspy();*/
 /*$(function() { 
 	$.scrollIt(); 
 });*/