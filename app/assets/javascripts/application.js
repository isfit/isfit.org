// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require bootstrap/scrollspy
//= require_tree .
/**$(document).ready(function () {

    var menu = $('.navbar');
    var origOffsetY = menu.offset().top+35;

    function scroll() {
        if ($(window).scrollTop() >= origOffsetY) {
            $('.navbar').addClass('navbar-fixed-top');

            //$('.content').addClass('menu-padding');
        } else {
            $('.navbar').removeClass('navbar-fixed-top');
            //$('.content').removeClass('menu-padding');
        }


    }

    document.onscroll = scroll;

});*/
/**$(document).ready(function () {  
  var top = $('.navbar').offset().top - parseFloat($('.navbar').css('marginTop').replace(/auto/, 100));
  $(window).scroll(function (event) {
    // what the y position of the scroll is
    var y = $(this).scrollTop();

    // whether that's below the form
    if (y >= top) {
      // if so, ad the fixed class
      $('.navbar').addClass('navbar-fixed-top');
    } else {
      // otherwise remove it
      $('.navbar').removeClass('navbar-fixed-top');
    }
  });
});*/

ready = function () {
  console.log("hei");
  $('ul.nav-left li a').bind('click', function() {
    console.log("HALLA");
    var link = $(this).attr('href');
    var posi = $(link).offset().top - 54;
    $('body,html').animate({scrollTop:posi},700);
    return false;
  });
  //you know the position.
  $(window).scroll(function () { 
    if ($(window).scrollTop() > 99) {
      $('.navbar').addClass('navbar-fixed-top');
      $("body").css("padding-top", 54);
    }
    if ($(window).scrollTop() < 100) {
      $("body").css("padding-top", 0);
      $('.navbar').removeClass('navbar-fixed-top');
    }
  });


  $('body').scrollspy({
    offset: 200
  });
}
$(document).ready(ready)
$(document).on('page:load', ready)

$(document).ready(function() {
  //change the integers below to match the height of your upper dive, which I called
  //banner.  Just add a 1 to the last number.  console.log($(window).scrollTop())
  //to figure out what the scroll position is when exactly you want to fix the nav
  //bar or div or whatever.  I stuck in the console.log for you.  Just remove when

});