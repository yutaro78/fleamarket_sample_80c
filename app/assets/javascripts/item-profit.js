// editページに遷移時に自動で計算
$(window).load(function(){
  // 販売価格に入力された値を取得し代入→手数料と利益を計算し代入
  let priceData = $('#item-price').val();
  let priceProfit = Math.ceil(priceData * 0.9);
  let priceFee = Math.ceil(priceData * 0.1);
  // htmlメソッドで手数料と利益を書き換え
  $('.fee__value').html(priceFee);
  $('.profit__value').html(priceProfit);

  // 販売価格入力でイベント発火
  $('#item-price').on('change', function(){
    // 販売価格に入力した値を取得し代入→手数料と利益を計算し代入
    let priceData = $(this).val();
    let priceProfit = Math.ceil(priceData * 0.9);
    let priceFee = Math.ceil(priceData * 0.1);
    // htmlメソッドで手数料と利益を書き換え
    $('.fee__value').html(priceFee);
    $('.profit__value').html(priceProfit);
    // 不正金額時メッセージ表示
    if (priceData < 300 || priceData > 9999999) {
      $('.price-aleat-message').css('display','block');
    }
    if (priceData > 300 && priceData < 9999999) {
      $('.price-aleat-message').css('display','none');
    }
  });
});
