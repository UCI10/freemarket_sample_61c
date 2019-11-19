// $(function(){
//   $(window).load(function(){
//       $('.fadein  li').each(function(i){
//           // $(this).delay(i * 50).css({visibility:'visible',opacity:'0'}).animate({opacity:'1'},1000);
//           $(this).delay(i * 50).css({display: 'block',opacity:'0'}).animate({opacity:'1'},1000);
//       });
//   });
// });

$(function(){
  $(window).scroll(function (){
      $('.fadein').each(function(){
          var position = $(this).offset().top;
          var scroll = $(window).scrollTop();
          var windowHeight = $(window).height();
          if (scroll > position - windowHeight + 200){
            $(this).addClass('active');
          }
      });
  });
});