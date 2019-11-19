$(document).on('turbolinks:load', function() {
  $('img.details__photo__under__image').mouseover(function() {
    var ImgSrc = $(this).attr("src");
    $("img#mainphoto").attr({src:ImgSrc});
    $("img#mainphoto").hide();
    $("img#mainphoto").fadeIn();
        return false;
    });
  });
  // $(document).on('turbolinks:load', function() {
  //   // mouseoverを使用
  //   $(".product-exhibit-photo__low__image__1").mouseover(function() {
  //     $(this).animate({opacity : 1});
  //   });
  //   $(".product-exhibit-photo__low__image__1").mouseout(function(){
  //     $(this).animate({opacity : 0.4});
  //   });
  // });