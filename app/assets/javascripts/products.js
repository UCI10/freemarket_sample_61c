$(document).on('turbolinks:load', function(){




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

  //手数料の計算
  var $price_input = $('#price-box');// 入力価格のタグID名
  var $price_fee = $('#fee-box');// 販売手数料
  var $price_profit = $('#profit-box');  // 販売利益
  var fee_rate = 0.1; // 販売手数料の割合
  var maxPriceInput = 100000000; // 入力できる値段の上限
  var minPriceInput = 300; // 入力できる値段の下限
  $('#price-box').attr('autocomplete', 'off'); //入力履歴非表示
  $('#fee-box').text('-')  //デフォルトの表示
  $('#profit-box').text('-') //デフォルトの表示
  $price_input.on('input', function(event) {
    var input_val = $(this).val();  //入力した値
    var input_val_num = Number(input_val.replace(/[^[0-9]+$/g, '')); // 整数以外の文字列を削除し整数限定にする
    if(input_val_num >= minPriceInput && input_val_num < maxPriceInput) { // 入力数値が上限と下限の間の場合
      $(this).val(input_val_num);  
      var total_price_fee = Math.floor(input_val_num * fee_rate); // 合計販売手数料(入力数値＊手数料割合を小数点以下切り捨て)
      var total_profit = Math.floor(input_val_num - total_price_fee); // 合計販売利益（入力数値-手数料割合を小数点以下切り捨て）
      $price_fee.text("¥"+total_price_fee.toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,')); // 出力対象（販売手数料）のタグID名と引数、カンマをつける
      $price_profit.text("¥"+total_profit.toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,')); // 出力対象（販売利益）のタグID名と引数、カンマをつける
    }
    else{  //上限か下限どちらかを超えている時
      $price_fee.text('-');
      $price_profit.text('-');
    }
  });



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

$('#preview-image').on('change', function (e) {
  e.preventDefault();
  

  files = $(this)[0].files;

  
  if( images_array.length + files.length <= total_image_max){
    for (var i=0; i<files.length; i++) {
      images_array.push(files[i]);

  var reader = new FileReader();

  reader.onload = function (e) {

  

      var loadedImageUri = e.target.result;
      $(buildImage(loadedImageUri,)).appendTo(".preview-image-box").trigger("create").trigger("create");
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
  $(document).on('click','.preview__box__delete', function(){
    var index = $(".preview__box__delete").index(this);
    // images_array.splice(index - 1, 1);
    $(this).parent().parent().parent().remove();
  });



  

});  


// $(document).on('change', '.preview-image',function(e) {


// });

// {
  /* <div class="sell-dropbox-container-sai">
<%= f.fields_for :images do |image| %>
<%= g.label :image_url, for="preview-image, class: 'form__mask__image'>名前：</label>
< div class="sell-dropbox-container-sai__image">
<i class="fa fa-camera icon-camera"></i>
<p class="sell-form__upload-box__image-upload__text"></p>
<%= g.file_field :image_url,  multiple: true, name: 'images[image_url][]', class: 'preview-image.sell-dropbox-container-sai__image__file', id: "preview-image", 'data-image': 0 %>
<pre class="sell-dropbox-container-sai__image__visible">ドラッグアンドドロップ またはクリックしてファイルをアップロード</pre>
</div>
</div> */
// }



