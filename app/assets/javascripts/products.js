$(document).on('turbolinks:load', function(){

  function buildImage(loadedImageUri){
    var html =
    `
      <div class="img-box">
        <img src=${loadedImageUri} >
      </div>
      <div class="item__images__container__preview__box">
        <div class="delete_btn_box delete_img_js">
          <div class="item__images__container__preview__box__delete">削除</a>
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







  





$('#preview-image').on('change', function (e) {
  e.preventDefault();
  files = $(this)[0].files;
  var reader = new FileReader();

  reader.onload = function (e) {

  

      var loadedImageUri = e.target.result;
      $(buildImage(loadedImageUri,)).appendTo(".preview-image-box").trigger("create").trigger("create");
  }
  reader.readAsDataURL(e.target.files[0]);
});





$(document).on('turbolinks:load', function(){
  var dropzone = $('.dropzone-area');
  var dropzone2 = $('.dropzone-area2');
  var dropzone_box = $('.dropzone-box');
  var images = [];
  var inputs  =[];
  var input_area = $('.input_area');
  var preview = $('#preview');
  var preview2 = $('#preview2');

  $(document).on('change', 'input[type= "file"].upload-image',function(event) {
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    inputs.push($(this));
    var img = $(`<div class= "img_view"><img></div>`);
    reader.onload = function(e) {
      var btn_wrapper = $('<div class="btn_wrapper"><div class="btn edit">編集</div><div class="btn delete">削除</div></div>');
      img.append(btn_wrapper);
      img.find('img').attr({
        src: e.target.result
      })
    }
    reader.readAsDataURL(file);
    images.push(img);

    if(images.length >= 5) {
      dropzone2.css({
        'display': 'block'
      })
      dropzone.css({
        'display': 'none'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview2.append(image);
        dropzone2.css({
          'width': `calc(100% - (135px * ${images.length - 5}))`
        })
      })
      if(images.length == 9) {
        dropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
    } else {
        $('#preview').empty();
        $.each(images, function(index, image) {
          image.attr('data-image', index);
          preview.append(image);
        })
        dropzone.css({
          'width': `calc(100% - (135px * ${images.length}))`
        })
      }
      if(images.length == 4) {
        dropzone.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
    if(images.length == 10) {
      dropzone2.css({
        'display': 'none'
      })
      return;
    }
    var new_image = $(`<input multiple= "multiple" name="images[image_url][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`);
    input_area.prepend(new_image);
  });
  $(document).on('click', '.delete', function() {
    var target_image = $(this).parent().parent();
    $.each(inputs, function(index, input){
      if ($(this).data('image') == target_image.data('image')){
        $(this).remove();
        target_image.remove();
        var num = $(this).data('image');
        images.splice(num, 1);
        inputs.splice(num, 1);
        if(inputs.length == 0) {
          $('input[type= "file"].upload-image').attr({
            'data-image': 0
          })
        }
      }
    })
    $('input[type= "file"].upload-image:first').attr({
      'data-image': inputs.length
    })
    $.each(inputs, function(index, input) {
      var input = $(this)
      input.attr({
        'data-image': index
      })
      $('input[type= "file"].upload-image:first').after(input)
    })
    if (images.length >= 5) {
      dropzone2.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview2.append(image);
      })
      dropzone2.css({
        'width': `calc(100% - (135px * ${images.length - 5}))`
      })
      if(images.length == 9) {
        dropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
      if(images.length == 8) {
        dropzone2.find('i').replaceWith('<p>ココをクリックしてください</p>')
      }
    } else {
      dropzone.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview.append(image);
      })
      dropzone.css({
        'width': `calc(100% - (135px * ${images.length}))`
      })
    }
    if(images.length == 4) {
      dropzone2.css({
        'display': 'none'
      })
    }
    if(images.length == 3) {
      dropzone.find('i').replaceWith('<p>ココをクリックしてください</p>')
    }
  })
});







});





