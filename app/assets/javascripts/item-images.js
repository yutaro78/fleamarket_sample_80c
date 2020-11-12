$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${num}][url]"
                    id="item_images_attributes_${num}_url"><br>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div class="preview">
                    <label for="item_images_attributes_${index}_url">
                    <img src="${url}" width="110px" height="110px" data-index="${index}"></label>
                    <div class="js-remove" >削除</div>
                  </div>`;
    return html;
  }

  const buildlabel = (num)=> {
    const html = `item_images_attributes_${num + 1}_url`;
    return html;
  }


  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  // 画像選択でイベント発火
  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    lastIndex = $('.js-file_group:last').data('index');

    // 要素を取得→プロパティを取得
    const element = document.getElementById("label_image");
    element.htmlFor;
    
    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#image-box').append(buildImg(targetIndex, blobUrl));

      const previewcount = $('.preview').length;
      const previewscount = $('.previews').length;
     
        // fileIndexの先頭の数字を使ってinputを作る
        $('#image-box').append(buildFileField(fileIndex[0]));
        fileIndex.shift();
        // 末尾の数に1足した数を追加する
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
        
        element.htmlFor = (buildlabel(lastIndex));

        // クリックエリアを非表示
        if (previewcount > 4) {
        $('#label_image').hide();
      }
        if (previewcount + previewscount > 4) {
        $('#label_image').hide();
      }
    }
  });

  // 削除ボタンを押すとイベント発火
  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().prev().data('index');

    $(`#item_images_attributes_${targetIndex}_url`).remove()

    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    lastIndex = $('.js-file_group:last').data('index');


    $(this).parent().remove();

    // クリックエリアを表示
    const previewcount = $('.preview').length;
      if (previewcount < 5) {
        $('#label_image').show();
      }

      // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});