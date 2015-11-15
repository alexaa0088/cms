$(document).on('page:change',function() {
  /* Push the body and the nav over by 240px over */
  $('.icon-menu').click(function() {
    $('.menu').animate({
      right: "0px"
    }, 200);

  });

  /* Then push them back */
  $('.icon-close').click(function() {
    $('.menu').animate({
      right: "-240px"
    }, 200);

  });

});