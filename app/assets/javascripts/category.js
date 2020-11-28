$(window).load(function(){

  // 子要素を選択するフォームタグ
  function add_childSelect_tag() {
    let child_select_form = `
                <select name="item[category_id]" id="item_category_id" class="child_category_id category__selectbox__contents">
                <option value="">カテゴリを選択</option>
                </select>
              `
    return child_select_form;
  }

  // 表示された選択フォームタグにオプションを追加
  function add_Option(children) {
    let option_html = `
                      <option value=${children.id}>${children.name}</option>
                      `
    return option_html;
  }

  // 孫要素を選択するフォームタグ
  function add_grandchildSelect_tag(){
    let grandchild_select_form = `
                <select name="item[category_id]" id="item_category_id" class="grandchild_category_id category__selectbox__contents">
                <option value="">カテゴリを選択</option>
                </select>
              `
    return grandchild_select_form
  }



  //親カテゴリを選択後にjQuery発火
  $("#category_form").on("change", function() {
    // 選択した親の値を取得
    let parentValue = $("#category_form").val();
    // 初期値以外を選択でajax開始
    if (parentValue.length !== 0) {
      $.ajax({
        url: '/items/search_category',
        type: 'GET',
        // コントローラーにparamsをparent_idで送る
        data: { parent_id: parentValue},
        dataType: 'json'
      })
      .done(function (data){
        // 親カテゴリ変更で子、孫を消す
        $(".child_category_id").remove();
        $(".grandchild_category_id").remove();
        // フォームタグを生成してビューにappend
        let child_select_form = add_childSelect_tag
        $(".category__selectbox").append(child_select_form);
        // jbuilderから取得したデータを１件ずつオプションにappend
        data.forEach(function(d){
          let option_html = add_Option(d)
          $(".child_category_id").append(option_html);
        });
      })
      .fail(function (){
        alert("カテゴリ取得に失敗しました");
      });
    }else{ // 親カテゴリ初期値選択でリセット
      $(".child_category_id").remove();
      $(".grandchild_category_id").remove();  
    }
  });

  // 子カテゴリを選択後にjQuery発火
  $(document).on("change", ".child_category_id", function(){
    // 選択した子の値を取得
    let childValue = $(".child_category_id").val();
    // 初期値以外を選択でajax開始
    if (childValue.length !=0){
      $.ajax({
        url: '/items/search_category',
        type: 'GET',
        // コントローラーにparamsをchildren_idで送る
        data: { children_id: childValue},
        dataType: 'json'
      })
      .done(function (gc_data){
        // 子カテゴリ変更で孫カテゴリを消す
        $(".grandchild_category_id").remove();
        // フォームタグを生成してビューにappend
        let grandchild_select_form = add_grandchildSelect_tag
        $(".category__selectbox").append(grandchild_select_form);
        // jbuilderから取得したデータを１件ずつオプションにappend
        gc_data.forEach(function (gc_d){
          let option_html = add_Option(gc_d);
          $(".grandchild_category_id").append(option_html);
        });
      })
      .fail(function (){
        alert("カテゴリ取得に失敗しました");
      });
    }else{ // 親カテゴリ初期値選択でリセット
      $(".child_category_id").remove();
      $(".grandchild_category_id").remove();  
    }
  });
});