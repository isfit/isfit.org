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
//= require jquery.turbolinks
//= require turbolinks
//= require bootstrap
//= require bootstrap/scrollspy
//= require_tree .

ready = function () {


  $('ul.nav-left li a[href^="#"]').on('click', function(e) {
    e.preventDefault();
    var target = this.hash,
    $target = $(target);

    $('html, body').stop().animate({
          'scrollTop': $target.offset().top - 54
    }, 300, 'swing', function () {
          window.location.hash = target;
      });
    return false;
  });
  //you know the position.



  $('body').scrollspy({
    offset: 250,
    target: ''
  });
  var active_link_clone   = $('.navbar .nav.navbar-nav .current').clone(true);
  //change_subnavbar_behaviour();
  $(window).resize(function() {
    //change_subnavbar_behaviour();
  });

  /*function change_subnavbar_behaviour() {
    var active_link = $('.navbar .nav.navbar-nav .current');
      if ($('.navbar-left').length) {
        if ($(window).innerWidth() < 1300) {
          if (!active_link.hasClass('appended')) {
            $('.navbar-left div').html()
            active_link.append($('.navbar-left').html());
            active_link.addClass('appended');
            $('body').scrollspy('refresh');
          }
        }
        else {
          active_link.html(active_link_clone.html());
          active_link.removeClass('appended');
          $('body').scrollspy('refresh');
        }
      }
    }*/

}
$(document).ready(ready)
$(document).on('page:load', ready)

$(document).ready(function() {


});