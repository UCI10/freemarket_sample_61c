// var position = $("#target").offset().top; //最初の要素の、ドキュメント上での表示位置[y軸]を返す


// $("#scroll_button").click(function(){
//     $("html,body").animate({
//         scrollTop : position // さっき変数に入れた位置まで
//     }, {
//         queue : false  // どれくらい経過してから、アニメーションを始めるか。キュー[待ち行列]。falseを指定すると、キューに追加されずに即座にアニメーションを実行。
//     });
// });

// $(function(){
//   // #で始まるリンクをクリックしたら実行されます
//   $('#scroll_button').click(function() {
//     // スクロールの速度
//     var speed = 400; // ミリ秒で記述
//     var href= $(this).attr("#scroll_button");
//     var target = $(href == "#" || href == "" ? 'html' : href);
//     var position = target.offset().top;
//     $('body,html').animate({scrollTop:position}, speed, 'swing');
//     return false;
//   });
// });

$(function () {
  $('a[href^="#"]').click(function () {
      var speed = 500;
      var href= $(this).attr("href");
      var target = $(href == "#" || href == "" ? 'html' : href);
      var position = target.offset().top;
      $("html, body").animate({scrollTop:position}, speed, 'swing');
      return false;
  });
});