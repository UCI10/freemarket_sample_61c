$(function() {
  var $price_input = $('#price-box');// 入力価格のタグID名
  var $price_fee = $('#pricefee');// 販売手数料
  var fee_rate = 0.1; // 販売手数料の割合
  var maxPriceInput = 99999999; // 入力できる値段の上限
  var maxPriceFee = 9999999; // 販売手数料の上限

  $price_input.on('input', function(event) {
    var inputval = $(this).val();  //入力した値
    var inputval_num = Number(inputval.replace(/[^0-9]/g, '')); // 整数以外の文字列を削除し整数限定にする
    if(inputval_num == 0) {  //入力数値が0の時
			inputval_num = '';
		} else if (inputval_num > maxPriceInput) { // 入力数値が上限を超える場合
			inputval_num = maxPriceInput;
		}
		$(this).val(inputval_num);  
		if(inputval_num != 0) { //入力数値が０以上上限以下の時
			var total_price_fee = Math.floor(inputval_num * fee_rate); // 入力数値＊手数料割合を小数点以下切り捨て
    }  else if (total_price_fee > maxPriceFee) { // 上限を超える手数料になった場合上限までとする
      total_price_fee = maxPriceFee;
    }
      $price_fee.text(total_price_fee);	// 出力対象のタグID名と引数
  });
 
  
  
  var $price_profit = $('#profits-box');
  $price_input.on('input', function(event) {
  	$price_profit.text($price_input.val());
  });
});

// IE 9+
// $(function() {
//   var $input = $('#input');
//   var $output = $('#output');
//   $input.on('input', function(event) {
//     var value = $input.val();
//     $output.text(value);
//   });
  
  
//   var $output2 = $('#output2');
//   $input.on('change', function(event) {
//   	$output2.text($input.val());
//   });
// });



// $(function(){
	// var value fee_rate= 300; // りんごの単品価格手数料部分
	// var maxNum maxPriceInput= 100; // 注文できる個数の上限入力値の上限がここ
// 	var tagInput $priceinput= $('#jsNum'); // 入力対象のinputタグID名
// 	var tagOutput $pricefee= $('#jsPrice'); // 出力対象のinputタグID名

// 	tagInput.on('change', function() {
// 		var str inputval = $(this priceinput).val();
		// var num inputvalnum = Number(str inputval.replace(/[^0-9]/g, '')); // 整数以外の文字列を削除
		// if(num inputvalnum  == 0) {
		// 	num = '';
		// } else if (num > maxNum) { // 上限を超える個数を入力した場合
		// 	num = maxNum;
		// }
		// $(this).val(num);
		// if(num != 0) {
		// 	var price = num * value;
		// 	tagOutput.val(price);
		// }
// 	});
// });
    
    
    
    // $.ajax({
    //   url: url,
    //   type: "POST",
    //   data: formData,
    //   dataType: 'json',
    //   processData: false,
    //   contentType: false
    // })
    // .done(function(data){
    //   var html = buildHTML(data);
    //   $('.comments').append(html);
    //   $('.textbox').val('');
    //   $('.form__submit').prop('disabled', false);
    // })
    // .fail(function(){
    //   alert('error');
    // })
//   })
// })
