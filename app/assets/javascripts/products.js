$(document).on('turbolinks:load', function(){
  // $("form")[0].reset();
  var dropzone = $('.dropzone-area');
  var images = [];
  var inputs  =[];
  var preview = $('#preview');
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
    $(document).on('change','input[type= "file"].preview-image', function (e) {
      e.preventDefault();
      file = $(this)[0].files;
      // var file = $(this).prop('files')[0];
      var reader = new FileReader();
      inputs.push($(this));
      var img = $(`<div class= "img-box"><img></div>`);

      reader.onload = function (e) {
      var loadedImageUri = e.target.result;
      // HTML形成
      $(buildImage(loadedImageUri,)).appendTo("#preview-image-box");
      };

      reader.readAsDataURL(file[0]);
      // var url = window.URL.createObjectURL(file),
  //     $img = $('<img>').on('load error', function(){
  //         $result.append(this);
  //     }).attr('src', url);
  // alert(url);



      // reader.readAsDataURL(file);


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
      var new_image = $(`<input multiple= "multiple" name="images[image_url][]" class="preview-image image${images.length}" data-image= ${images.length} type="file" id="preview-image" style="display:none;">`);
      $('.file_input_area').prepend(new_image);
  });











//    // クリックされた画像を削除する。
//  $(document).on('click','.preview__box__delete', function(){
//   var target_image = $(this).parent().parent();
//   $.each(inputs, function(index, input){
//     // if ($(this).data('image') == target_image.data('image')){
//       $(this).remove();
//       target_image.remove();
//       var num = $(this).data('image');
//       images.splice(num, 1);
//       inputs.splice(num, 1);
//       if(inputs.length == 0) {
//         $('input[type= "file"].preview-image').attr({'data-image': 0})
//       }
//     // }
//   })
//   $('input[type= "file"].preview-image:first').attr({
//     'data-image': inputs.length
//   })
//   $.each(inputs, function(index, input) {
//     var input = $(this)
//     input.attr({
//       'data-image': index
//     })
//     $('input[type= "file"].preview-image:first').after(input)
//   })
//   if(images.length <= 4){
//     dropzone.css({
//       'display': `block`
//     })
//   }
//   else {
//     dropzone.css({
//       'display': `none`
//     })

//   }  
// })








 // クリックされた画像を削除する。
 $(document).on('click','.preview__box__delete','turbolinks:load', function(){
  var index = $(".preview__box__delete").index(this);
  var target_image = $(this).parent().parent();
  var target_image_box = $(this).parent().closest().find("img-box");
  var target_image_img = $(this).parent().closest().find("img");
  var del_num = index + 1
  var preview_delete = $(".preview-image").eq(- del_num);
  // var del_num = index + 1
  // var preview_delete = $(".preview-image").eq(- del_num);
  var del_img = index
  images.splice(del_img , 1);
  inputs.splice(del_img , 1);
  target_image_img.remove();
  target_image_box.remove();
  target_image.remove();
  
  // $(this).parent().remove();


  // $(this).parent().remove();
  // console.log(preview_delete)
  // console.log(target_image)
  // console.log(target_image_box)
  // console.log(target_image_img)
  // console.log(images)
  // console.log(inputs)
  // console.log(del_num)
  // console.log(index)
  // console.log(images.length)
  // console.log(del_img)

  // img_box_delete.val('');
  preview_delete.val('');
  preview_delete.remove();
  $(this).remove();
  // $(".preview-image").splice(del_num , 1);
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

  }  
  // 商品編集用です
  // hidden_form = `<input type="hidden", name="[delete_ids][]", value="${img_id}">`
  // $('.dropzone-container3').append(hidden_form)

});

$(document).on('submit','.form__submit', function (e) {
  var target_reset1 = $(".image1");
  var target_reset2 = $(".image2");
  var target_reset3 = $(".image3");
  var target_reset3 = $(".image4");

  target_reset1.remove();
  target_reset2.remove();
  target_reset3.remove();
  target_reset4.remove();



  // console.log(target_reset1)
  // console.log(target_reset2)
  // console.log(target_reset3)
  // console.log(target_reset4)








//   var index = $(".preview__box__delete").index(this);
//   var del_num = index + 1
//   var preview_delete = $(".preview-image").eq(- del_num);
//   var del_img = index
//   images.splice(del_img , 1);
//   inputs.splice(del_img , 1);

//   target_image.remove();
//   // $(this).parent().remove();


//   // $(this).parent().remove();
//   console.log(preview_delete)
//   console.log(target_image)
//   console.log(images)
//   console.log(del_num)
//   console.log(index)
//   console.log(images.length)
//   console.log(del_img)

//   // img_box_delete.val('');
//   preview_delete.val('');
//   preview_delete.remove();
//   $(this).remove();
//   // $(".preview-image").splice(del_num , 1);
//   // 画像枚数による表示変更条件分岐
//   if(images.length <= 4){
//     dropzone.css({
//       'display': `block`
//     })
//   }
//   else {
//     dropzone.css({
//       'display': `none`
//     })

//   return;
//   }  
//   // 商品編集用です
//   // hidden_form = `<input type="hidden", name="[delete_ids][]", value="${img_id}">`
//   // $('.dropzone-container3').append(hidden_form)

// });



});  














//  // クリックされた画像を削除する。
//  $(document).on('click','.preview__box__delete','turbolinks:load', function(){
//   var index = $(".preview__box__delete").index(this);
//   var target_image = $(this).parent().parent();
//   var del_num = index + 1
//   var preview_delete = $(".preview-image").eq(- del_num);
//   var del_img = index
//   images.splice(del_img , 1);
//   inputs.splice(del_img , 1);
//   target_image.remove();
//   // $(this).parent().remove();


//   // $(this).parent().remove();
//   console.log(preview_delete)
//   console.log(target_image)
//   console.log(images)
//   console.log(del_num)
//   console.log(index)
//   console.log(images.length)
//   console.log(del_img)

//   // img_box_delete.val('');
//   preview_delete.val('');
//   preview_delete.remove();
//   $(this).remove();
//   // $(".preview-image").splice(del_num , 1);
//   // 画像枚数による表示変更条件分岐
//   if(images.length <= 4){
//     dropzone.css({
//       'display': `block`
//     })
//   }
//   else {
//     dropzone.css({
//       'display': `none`
//     })

//   return;
//   }  
//   // 商品編集用です
//   // hidden_form = `<input type="hidden", name="[delete_ids][]", value="${img_id}">`
//   // $('.dropzone-container3').append(hidden_form)

// });
});  
















//   // クリックされた画像を削除する。
//   $(document).on('click','.preview__box__delete','turbolinks:load', function(){
//     var index = $(".preview__box__delete").index(this);
//     var inp_num = images.length - index - 1
//     var target_image = $(this).parent().parent();
//     var preview_delete = $(".preview-image").eq(inp_num);
//     var del_num = inp_num
//     images.splice(index , 1);
//     // target_image.val('');
//     // $(this).parent().val('');
//     target_image.remove();
//     // $(this).parent().remove();
//     console.log(preview_delete)
//     console.log(target_image)
//     console.log(images)
//     console.log(del_num)
//     console.log(inp_num)
//     console.log(index)
//     console.log(images.length)


//     preview_delete.val('');
//     preview_delete.remove();
//     $(".preview-image").splice(del_num - 1 , 1);
//     // 画像枚数による表示変更条件分岐
//     if(images.length <= 4){
//       dropzone.css({
//         'display': `block`
//       })
//     }
//     else {
//       dropzone.css({
//         'display': `none`
//       })

//     return;
//     }  
//     // 商品編集用です
//     // hidden_form = `<input type="hidden", name="[delete_ids][]", value="${img_id}">`
//     // $('.dropzone-container3').append(hidden_form)

//   });
// });  

