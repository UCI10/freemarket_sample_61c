// 商品出品用 完成
$(function(){
  $('.select-brand-box').attr('autocomplete', 'off'); //入力履歴非表示
  var dropzone = $('.dropzone-area');
  var images = [];
  var inputs  =[];
  var preview = $('preview-image-box');
  var im_num = 0

  $(function(){
  // 画像プレビュー画面用HTML
  function buildImage(loadedImageUri){
    var html =
    `
    <div class="images-preview-box image${images.length}">
      <div class="img-box image${images.length}">
        <img src=${loadedImageUri} >
      </div>  
      <div class="preview-box-btn image${images.length}">
        <div class="preview__box__edit image${images.length}">編集</div>
        <div class="preview__box__delete image${images.length}">削除</a></div>
      </div>
    </div>
    `
    return html
  };
  
  // 商品画像の選択後イベント
  $(document).off('change')
    $(document).on('change','input[type= "file"].preview-image', function () {
      var file = $(this).prop('files')[0];
      var reader = new FileReader();
      inputs.unshift($(this));
      reader.onload = function (e) {
      var loadedImageUri = e.target.result;
      // HTML形成
      $(buildImage(loadedImageUri)).prependTo("#preview-image-box");
      };
      var img_box = $(`<div class= "img-box"><img></div>`);
      reader.readAsDataURL(file);
      var index_num = $(".preview__box__delete").index(this);
      im_num += 1
      // 画像枚数による表示変更条件分岐
      if(im_num <= 4){
        $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview.prepend(image);
        dropzone.css({
          'width': `calc(100% - (120px * ${images.length - 5}))`
        })
        dropzone.css({
          'display': `block`
        })
      })
      }
      else if (im_num == 5){
        dropzone.css({
          'display': `none`
        })

      }
      else {
        $.each(images, function(index, image) {
        image.attr('data-image', index);
        dropzone.css({
          'display': `none`
        })
      })
      return;
      }
      var new_image = $(`<input multiple= "multiple" name="images[image_url][]" class="preview-image image${images.length}" data-image= ${images.length} type="file" id="preview-image" style="display:none;">`);
      $('.file_input_area').prepend(new_image);

    })
  });

  //出品時の画像数を取得
  var savedtotal = 0
  if ( $(".block-image").data("savedtotal") ){
    savedtotal = $(".block-image").data("savedtotal");
  }
  var delete_request_index = [];
   // クリックされた画像を削除する。
  $(document).on('click','.preview__box__delete', function(){
    var index_num = $(".preview__box__delete").index(this);
    var del_num = index_num + 1
    var preview_delete = $(".preview-image").eq(del_num);
    images.splice(index_num , 1);
    inputs.splice(index_num , 1);
    delete_request_index.push($(this).parent().parent().data("image"));
    $(this).parent().parent().remove();
    preview_delete.val('');
    preview_delete.remove();
    $(document).on('change')
    im_num -= 1
    // 画像枚数による表示変更条件分岐
    if(im_num <= 4){
      dropzone.css({
        'display': `block`
      })
    }
    else {
      dropzone.css({
        'display': `none`
      })
    }  
  })
});  











