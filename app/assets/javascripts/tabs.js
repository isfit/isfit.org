
ready = function () {
  $(function() {
    var $cn_list    = $('#workshop-list');
    var $items      = $cn_list.find('.workshop-field');
    var $cn_preview = $('#workshop-preview');
    var current     = 1;
    $items.each(function(i){
      var $item = $(this);
      $item.data('idx',i+1);
      $item.bind({
        mouseenter: function(e) {
          // Hover event handler
          console.log("hei");
        // Hover event handler
          var $this       = $(this);
          $cn_list.find('.selected').removeClass('selected');
          $this.addClass('selected');
          var idx         = $(this).data('idx');
          var $current    = $cn_preview.find('.workshop_content:nth-child('+current+')');
          var $next       = $cn_preview.find('.workshop_content:nth-child('+idx+')');
          $current.addClass('workshop_content_invisible');
          $next.removeClass('workshop_content_invisible');
          current = idx;        
        },
        mouseleave: function(e) {
          // Hover event handler
        },
        click: function(e) {
          // Click event handler
        },
        blur: function(e) {
          // Blur event handler
        }
      });
    });
  });
  
  $(document).scroll(function() {
    var sidebar = $(".sidebar");
    var footer = $(".footer");
    var positionfooter = footer.offset();
    var positionsidebar = sidebar.offset();
    console.log("DD: " + ((positionsidebar.top + sidebar.height()) + " < " + positionfooter.top - 10));
    if((positionsidebar.top + sidebar.height()) >= positionfooter.top){
      console.log("Hei");
      sidebar.fadeOut();
    }
    if($(document).scrollTop() + window.innerHeight < positionfooter.top){
      sidebar.fadeIn();
    }

   

  });

}
$(document).ready(ready);
$(document).on('page:load', ready);




       