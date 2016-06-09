$(document).ready(function(){
  $('a.scroll-down').click(function(){
    var element = $($(this).attr('href'));

    if (element.length > 0) {
      $('html, body').animate({
          scrollTop: element.offset().top
      }, 500);
    }
    return false;
  });
});
