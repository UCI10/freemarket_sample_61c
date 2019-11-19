$(document).on('turbolinks:load', function() {
  //始めにactionを追加
  $('.product-exhibit-photo__low.displayflex .product-exhibit-photo__low__image:first-child').addClass('active');
  $('.product-exhibit-photo__low.displayflex .product-exhibit-photo__low__image:first-child').css({'opacity':'1','pointer':'default'});
  //hover時に色変更&activeクラス追加
  $('.product-exhibit-photo__low__image').hover(function(){
    $('.active').css({'opacity':'','pointer':''})
    $('.active').removeClass('active');
    $(this).addClass('active');
    $(this).css({'opacity':'1','pointer':'default'});
  });
  //スライド
  $('.product-exhibit-photo__high').slick({
    autoplay: false,
    Speed: 3000,
    arrows: false,
    dots: false,
    dotsClass: 'product-exhibit-photo__low.displayflex',
    pauseOnDotsHover: true,
    infinite: true,
  });

  $('.product-exhibit-photo__low__image').on('mouseover', function(e){
    var $currTarget = $(e.currentTarget);
    index = $('.product-exhibit-photo__low__image').index(this);
    slickObj = $('.product-exhibit-photo__high').slick('getSlick');
    slickObj.slickGoTo(index);    // アニメーション中でも切り替える
  });
});
$(document).on('turbolinks:load', function() {
  // mouseoverを使用
  $(".product-exhibit-photo__low__image__1").mouseover(function() {
    $(this).animate({opacity : 1});
  });
  $(".product-exhibit-photo__low__image__1").mouseout(function(){
    $(this).animate({opacity : 0.4});
  });
});