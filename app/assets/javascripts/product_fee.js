  // //手数料の計算
  // var $price_input = $('#price-box');// 入力価格のタグID名
  // var $price_fee = $('#fee-box');// 販売手数料
  // var $price_profit = $('#profit-box');  // 販売利益
  // var fee_rate = 0.1; // 販売手数料の割合
  // var maxPriceInput = 100000000; // 入力できる値段の上限
  // var minPriceInput = 300; // 入力できる値段の下限
  // $('#price-box').attr('autocomplete', 'off'); //入力履歴非表示
  // $('#fee-box').text('-')  //デフォルトの表示
  // $('#profit-box').text('-') //デフォルトの表示
  // $price_input.on('input', function(event) {
  //   var input_val = $(this).val();  //入力した値
  //   var input_val_num = Number(input_val.replace(/[^[0-9]+$/g, '')); // 整数以外の文字列を削除し整数限定にする
  //   if(input_val_num >= minPriceInput && input_val_num < maxPriceInput) { // 入力数値が上限と下限の間の場合
  //     $(this).val(input_val_num);  
  //     var total_price_fee = Math.floor(input_val_num * fee_rate); // 合計販売手数料(入力数値＊手数料割合を小数点以下切り捨て)
  //     var total_profit = Math.floor(input_val_num - total_price_fee); // 合計販売利益（入力数値-手数料割合を小数点以下切り捨て）
  //     $price_fee.text("¥"+total_price_fee.toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,')); // 出力対象（販売手数料）のタグID名と引数、カンマをつける
  //     $price_profit.text("¥"+total_profit.toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,')); // 出力対象（販売利益）のタグID名と引数、カンマをつける
  //   }
  //   else{  //上限か下限どちらかを超えている時
  //     $price_fee.text('-');
  //     $price_profit.text('-');
  //   }
  // });