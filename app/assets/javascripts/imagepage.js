$(function(){
  // 最初の画像のみ半透明解除
  $(".thumbsimage").first().css('opacity', '1');
  // マウスオーバーの処理
  $(".thumbsimage").mouseover(function(e){
    let mainDataIndex = $(this).parent().attr('data-index')
    $(".thumbsimage").each(function(){
      let subDataIndex = $(this).parent().attr('data-index');
      if (subDataIndex == mainDataIndex){
        $(this).css('opacity', '1');
      } else {
        $(this).css('opacity', '0.5');
      };
    });
    $(".body__main__lists").each(function(index){
      if(index == mainDataIndex){
        $(this).css('z-index', 1);
      } else {
        $(this).css('z-index', -1);
      };
    });
  });
});