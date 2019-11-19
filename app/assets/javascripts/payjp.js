// $(function(){
//   var submit = document.getElementById("token_submit");

//   submit.addEventListener('click', function(e){  // 追加するボタンが押されたらイベント発火
//     e.preventDefault();  // ボタンを一旦無効化
//     Payjp.setPublicKey("pk_test_0ddb364bab7ed621b29956cb");
//     var pay = {  // 入力されたカード情報を取得
//       number: document.getElementById("card_number").value,
//       exp_month: document.getElementById("pay_exp_month").value,
//       exp_year: document.getElementById("pay_exp_year").value,
//       cvc: document.getElementById("pay_cvc").value
//     };
//     const
//     if (pay.number == "", pay.exp_month == "1", pay.exp_year == "2019", pay.cvc == "") {
//       alert("カード情報が入力されていません。"); // 送られた値がデフォルト値だった場合
//     } else { // デフォルト値以外の値が送られてきた場合
//       Payjp.createToken(pay, function(status, response) {  // トークンを生成
//         if (status === 200) {
//           $("#card_number").removeAttr("name");
//           $("#exp_month").removeAttr("name");
//           $("#exp_year").removeAttr("name"); 
//           $("#cvc").removeAttr("name");
//           $("#card_token").append(
//             $('<input type="hidden" name="payjp-token">').val(response.id)
//           ); 
//           document.inputForm.submit();  // 生成したトークンを送信する準備を整える
//           alert("登録が完了しました");
//         } else {
//           alert("正しいカード情報を入力してください。");
//         }
//       });
//     }
//     false
//   });
// });

// // document.addEventListener(
// //   "DOMContentLoaded", e => {
// //     if (document.getElementById("token_submit") != null) { //token_submitというidがnullの場合、下記コードを実行しない
// //       Payjp.setPublicKey("pk_test_0ddb364bab7ed621b29956cb"); //ここに公開鍵を直書き
// //       let btn = document.getElementById("token_submit"); //IDがtoken_submitの場合に取得されます
// //       btn.addEventListener("click", e => { //ボタンが押されたときに作動します
// //         e.preventDefault(); //ボタンを一旦無効化します
// //         let card = {
// //           number: document.getElementById("card_number").value,
// //           cvc: document.getElementById("pay_cvc").value,
// //           exp_month: document.getElementById("pay_exp_month").value,
// //           exp_year: document.getElementById("pay_exp_year").value
// //         }; //入力されたデータを取得します。
// //         Payjp.createToken(card, (status, response) => {
// //           if (status === 200) { //成功した場合
// //             $("#card_number").removeAttr("name");
// //             $("#cvc").removeAttr("name");
// //             $("#exp_month").removeAttr("name");
// //             $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
// //             $("#card_token").append(
// //               $('<input type="hidden" name="payjp-token">').val(response.id)
// //             ); //取得したトークンを送信できる状態にします
// //             document.inputForm.submit();
// //             alert("登録が完了しました"); //確認用
// //           } else {
// //             alert("カード情報が正しくありません。"); //確認用
// //           }
// //         });
// //       });
// //     }
// //   },
// //   false
// // );
