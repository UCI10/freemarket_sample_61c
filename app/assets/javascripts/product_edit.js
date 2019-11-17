$(document).on('turbolinks:load', function() {
  

  var array = []
  $(".previews").each(function(){
    array.push($(this).data('id'));
  });

  $(".pic-form").each(function(i, pic){
    $(pic).data('id',i);
    var picId = $(pic).data('id');

    if ($.inArray(picId, array) == -1){
      $(pic).removeClass("kumogakure")
      return false    
    }
  });



  function buildImage(loadedImageUri){
    var html =
    `<div class="images-preview-box">
      <div class="img-box">
        <img src=${loadedImageUri} >
      </div>
      <div class="preview-box-btn-list">
        <div class="preview-box-btn">
          <div class="preview__box__edit">編集</div>
          <div class="preview__box__delete">削除</a></div>
        </div>
      </div>
    </div>

    
    `
    return html
  };
  var dropzone = $(".item__img__dropzone__input");
  var dropzone2 = $(".item__img__dropzone2__input2");
  var appendzone = $(".item__img__dropzone2")
  var input_area = $(".input-area");
  var preview = $("#preview");
  var preview2 = $("#preview2");
  var images_array = []
  var total_image_max = 10;
  // 登録済画像と新規追加画像を全て格納する配列（ビュー用）
  var images_array = []
  var total_image_max = 10;
  var images = [];
  var inputs  =[];
  // 登録済画像データだけの配列（DB用）
  var registered_images_ids =[]
  // 新規追加画像データだけの配列（DB用）
  var new_image_files = [];

$('#edit-image').on('change', function (e) {
  e.preventDefault();
  

  files = $(this)[0].files;

  
  if( images_array.length + files.length <= total_image_max){
    for (var i=0; i<files.length; i++) {
      images_array.push(files[i]);

  var reader = new FileReader();

  reader.onload = function (e) {

  

      var loadedImageUri = e.target.result;
      $(buildImage(loadedImageUri,)).appendTo(".preview-image-edit").trigger("create").trigger("create");
  };
  reader.readAsDataURL(e.target.files[i]);



  // $(this).parent().parent().remove();

    }
    // preview-image-box.css({
    //   'display': 'block'
    // })

    // sell-dropbox-container-sai.css({
    //   'width': `calc(600px - (120px * ${images_array.length}))`
    // })
    // .sell-dropbox-container-sai__file.css({
    //   'width': `calc(600px - (120px * ${images_array.length}))`
    // })

    

}



else{
  alert("登録可能な最大数を超えているためアップロードできません。");
}
});

// var new_image = $(
//   `<input multiple= "multiple" name="item_images[image][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`
// );
// input_area-box.append(new_image);



  // クリックされたaタグの順番から、削除すべき画像を特定し、配列から削除する。
  $(document).on('click','.kill-preview-image-box', function(){
    var index = $(".preview__box__delete").index(this);
    // images_array.splice(index - 1, 1);
    $(this).parent().parent().parent().remove();
  });


  // 
  $(document).on('click','.kill-preview-image-box', function(){
    e.preventDefault();
    var killTarget = $(this).parent(); 
    var killPoint = $(killTarget).data("id");
    $(this).parent().parent().parent().parent().parent().remove();

    $(".pic-gone-edit").each(function(){
      if ($(this).siblings(".pic-form").data("id") == killPoint) {
        $(this).val("");
        $(this).parents(".form__mask__image").siblings(".form__mask__image").find(".pic-form").addClass("kumogakure");
        $(this).siblings(".pic-form").removeClass(".sell-dropbox-container-sai__image__file ");
      }
    });
  });






  //   // カテゴリーセレクトボックスのオプションを作成
  // function appendOption(category){
  //   var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
  //   return html;
  // }
  // // 子カテゴリーの表示作成
  // function appendChidrenBox(insertHTML){
  //   var childSelectHtml = '';
  //   childSelectHtml = `<div class='listing-select-wrapper' id= 'children_wrapper' >
  //                       <div class='listing-select-wrapper__box'>
  //                       <div class='icon-arrow-bottom-sai'>
  //                         <i class="fa fa-angle-down chevron-down-icon"></i>
  //                         <select class="listing-select-wrapper__box--select" id="child_category" name="product[category_id]">
  //                           <option value="---" data-category="---">---</option>
  //                           ${insertHTML}
  //                         <select>
  //                         </div>
  //                       </div>
  //                     </div>`;
  //   $('.listing-product-detail__category').append(childSelectHtml);
  // }
  // // 孫カテゴリーの表示作成
  // function appendGrandchidrenBox(insertHTML){
  //   var grandchildSelectHtml = '';
  //   grandchildSelectHtml = `<div class='listing-select-wrapper' id= 'grandchildren_wrapper'>
  //                             <div class='listing-select-wrapper__box'>
  //                               <div class='icon-arrow-bottom-sai'>
  //                               <i class="fa fa-angle-down chevron-down-icon"></i>
  //                               <select class="listing-select-wrapper__box--select" id="grandchild_category" name="product[category_id]">
  //                                 <option value="---" data-category="---">---</option>
  //                                 ${insertHTML}
  //                               <select>
  //                               </div>
  //                             </div>
  //                           </div>`;
  //   $('.listing-product-detail__category').append(grandchildSelectHtml);
  // }
  // // 親カテゴリー選択後のイベント カテゴリーの子要素発火
  // $('#parent_category').on('change', function(){
  //   var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
  //   if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
  //     $.ajax({
  //       url: '/products/get_category_children',
  //       type: 'GET',
  //       data: { parent_name: parentCategory },
  //       dataType: 'json'
  //     })
  //     .done(function(children){
  //       $('#children_wrapper').remove(); //親が変更された時、子以下を削除するする
  //       $('#grandchildren_wrapper').remove();
  //       $('#size_wrapper').remove();
  //       $('#brand_wrapper').remove();
  //       var insertHTML = '';
  //       children.forEach(function(child){
  //         insertHTML += appendOption(child);
  //       });
  //       appendChidrenBox(insertHTML);
  //     })
  //     .fail(function(){
  //       alert('カテゴリー取得に失敗しました');
  //     })
  //   }else{
  //     $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
  //     $('#grandchildren_wrapper').remove();
  //     $('#size_wrapper').remove();
  //     $('#brand_wrapper').remove();
  //   }
  // });
  // // 子カテゴリー選択後のイベント カテゴリーの孫要素発火
  // $('.listing-product-detail__category').on('change', '#child_category', function(){
  //   var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
  //   if (childId != "---"){ //子カテゴリーが初期値でないことを確認
  //     $.ajax({
  //       url: '/products/get_category_grandchildren',
  //       type: 'GET',
  //       data: { child_id: childId },
  //       dataType: 'json'
  //     })
  //     .done(function(grandchildren){
  //       if (grandchildren.length != 0) {
  //         $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
  //         $('#size_wrapper').remove();
  //         $('#brand_wrapper').remove();
  //         var insertHTML = '';
  //         grandchildren.forEach(function(grandchild){
  //           insertHTML += appendOption(grandchild);
  //         });
  //         appendGrandchidrenBox(insertHTML);
  //       }
  //     })
  //     .fail(function(){
  //       alert('カテゴリー取得に失敗しました');
  //     })
  //   }else{
  //     $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
  //     $('#size_wrapper').remove();
  //     $('#brand_wrapper').remove();
  //   }
  // });









  
    // // カテゴリーセレクトボックスのオプションを作成
    // function appendOption(category){
    //   var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    //   return html;
    // }
    // // 子カテゴリーの表示作成
    // function appendChidrenBox(insertHTML){
    //   var childSelectHtml = '';
    //   childSelectHtml = `<div class='listing-select-wrapper' id= 'children_edit_wrapper' >
    //                       <div class='listing-select-wrapper__box'>
    //                       <div class='icon-arrow-bottom-sai'>
    //                         <i class="fa fa-angle-down chevron-down-icon"></i>
    //                         <select class="listing-select-wrapper__box--select" id="child_category" name="product[category_id]">
    //                           <option value="---" data-category="---">---</option>
    //                           ${insertHTML}
    //                         <select>
    //                         </div>
    //                       </div>
    //                     </div>`;
    //   $('.listing-product-detail__category').append(childSelectHtml);
    // }
    // // 孫カテゴリーの表示作成
    // function appendGrandchidrenBox(insertHTML){
    //   var grandchildSelectHtml = '';
    //   grandchildSelectHtml = `<div class='listing-select-wrapper' id= 'grandchildren_edit_wrapper'>
    //                             <div class='listing-select-wrapper__box'>
    //                               <div class='icon-arrow-bottom-sai'>
    //                               <i class="fa fa-angle-down chevron-down-icon"></i>
    //                               <select class="listing-select-wrapper__box--select" id="grandchild_category" name="product[category_id]">
    //                                 <option value="---" data-category="---">---</option>
    //                                 ${insertHTML}
    //                               <select>
    //                               </div>
    //                             </div>
    //                           </div>`;
    //   $('.listing-product-detail__category').append(grandchildSelectHtml);
    // }
    // // 親カテゴリー選択後のイベント カテゴリーの子要素発火
    // $('#parent_category_edit').on('change', function(){
    //   var input = $(this).val(); //選択された親カテゴリーの名前を取得
    //   if (input!= "---"){ //親カテゴリーが初期値でないことを確認
    //     $.ajax({
    //       url: '/products/select_category_m',
    //       type: 'GET',
    //       data: { category_id_parent: input },
    //       dataType: 'json'
    //     })
    //     .done(function(children){
    //       $('#children_edit_wrapper').remove(); //親が変更された時、子以下を削除するする
    //       $('#grandchildren_edit_wrapper').remove();
    //       $('#size_wrapper').remove();
    //       $('#brand_wrapper').remove();
    //       var insertHTML = '';
    //       children.forEach(function(child){
    //         insertHTML += appendOption(child);
    //       });
    //       appendChidrenBox(insertHTML);
    //     })
    //     .fail(function(){
    //       alert('カテゴリー取得に失敗しました');
    //     })
    //   }else{
    //     $('#children_edit_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
    //     $('#grandchildren_edit_wrappe').remove();
    //     $('#size_wrapper').remove();
    //     $('#brand_wrapper').remove();
    //   }
    // });
    // // 子カテゴリー選択後のイベント カテゴリーの孫要素発火
    // $('.listing-product-detail__category').on('change', '#children_category_edit', function(){
    //   var input = $('#children_category_edit option:selected').data('category'); //選択された子カテゴリーのidを取得
    //   if (input != "---"){ //子カテゴリーが初期値でないことを確認
    //     $.ajax({
    //       url: '/products/select_category_s',
    //       type: 'GET',
    //       data: { category_id_child: input },
    //       dataType: 'json'
    //     })
    //     .done(function(grandchildren){
    //       if (grandchildren.length != 0) {
    //         $('#grandchildren_edit_wrappe').remove(); //子が変更された時、孫以下を削除するする
    //         $('#size_wrapper').remove();
    //         $('#brand_wrapper').remove();
    //         var insertHTML = '';
    //         grandchildren.forEach(function(grandchild){
    //           insertHTML += appendOption(grandchild);
    //         });
    //         appendGrandchidrenBox(insertHTML);
    //       }
    //     })
    //     .fail(function(){
    //       alert('カテゴリー取得に失敗しました');
    //     })
    //   }else{
    //     $('#grandchildren_edit_wrappe').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
    //     $('#size_wrapper').remove();
    //     $('#brand_wrapper').remove();
    //   }
    // });
  
  
    $('.select-brand-box').attr('autocomplete', 'off'); //入力履歴非表示
  
  
  });





  

// });  
