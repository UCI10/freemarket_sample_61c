$(document).on('turbolinks:load', function() {
  $('img.details__photo__under__image').mouseover(function() {
    var ImgSrc = $(this).attr("src");
    $("img#mainphoto").attr({src:ImgSrc});
    $("img#mainphoto").hide();
    $("img#mainphoto").fadeIn();
        return false;
    });
  });