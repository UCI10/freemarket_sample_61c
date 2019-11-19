$(document).on('turbolinks:load', function(){
  var dropzone = $('.dropzone-area');
  var images = [];
  var inputs  =[];
  var preview = $('#preview');
  // 画像プレビュー画面用HTML
  function buildImage(loadedImageUri){
    var html =
    `<div class="images-preview-box">
      <div class="img-box">
        <img src=${loadedImageUri} >
      </div>  
      <div class="preview-box-btn">
        <div class="preview__box__edit">編集</div>
        <div class="preview__box__delete">削除</a></div>
      </div>
    </div>
    `
    return html
  };
  // 商品画像の選択後イベント
    $(document).on('change','input[type= "file"].preview-image', function (e) {
      e.preventDefault();
      var file = $(this).prop('files')[0];
      var reader = new FileReader();
      inputs.push($(this));
      var img = $(`<div class= "img-box"><img></div>`);
      reader.onload = function (e) {
      var loadedImageUri = e.target.result;
      // HTML形成
      $(buildImage(loadedImageUri,)).appendTo(".preview-image-box");
      };
      reader.readAsDataURL(file);
      images.push(img);
      // 画像枚数による表示変更条件分岐
      if(images.length <= 4){
        $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview.append(image);
        dropzone.css({
          'width': `calc(100% - (120px * ${images.length - 5}))`
        })
        dropzone.css({
          'display': `block`
        })
      })
      }
      else {
        dropzone.css({
          'display': `none`
        })

      return;
      }
      var new_image = $(`<input multiple= "multiple" name="images[image_url][]" class="preview-image ${images.length}" data-image= ${images.length} type="file" id="preview-image" style="display:none;">`);
      $('.file_input_area').prepend(new_image);
  });
  // クリックされた画像を削除する。
  $(document).on('click','.preview__box__delete','turbolinks:load', function(){
    var index = $(".preview__box__delete").index(this);
    var inp_num = images.length - index - 1
    var target_image = $(this).parent().parent();
    var preview_delete = $(".preview-image").eq(inp_num);
    var del_num = inp_num
    images.splice(index , 1);
    target_image.val('');
    $(this).parent().val('');
    target_image.remove();
    $(this).parent().remove();
    $(".preview-image").splice(del_num - 1 , 1);
    preview_delete.val('');
    preview_delete.remove()
    // 画像枚数による表示変更条件分岐
    if(images.length <= 4){
      dropzone.css({
        'display': `block`
      })
    }
    else {
      dropzone.css({
        'display': `none`
      })

    return;
    }  
    // 商品編集用です
    // hidden_form = `<input type="hidden", name="[delete_ids][]", value="${img_id}">`
    // $('.dropzone-container3').append(hidden_form)

  });
});  

