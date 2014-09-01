

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
  $(window).scroll(function () { 
    if ($(window).scrollTop() > $(".header").height()) {
      $('.navbar-top').addClass('navbar-fixed-top');
      $("body").css("padding-top", 54);
    }
    if ($(window).scrollTop() < $(".header").height()) {
      $("body").css("padding-top", 0);
      $('.navbar-top').removeClass('navbar-fixed-top');
    }
  });


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