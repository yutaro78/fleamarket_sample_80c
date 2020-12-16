$(document).ready(function () {
  // 非同期にてヘッダーのカテゴリーを表示
  function childBuild(children) {
    let child_category = `
                        <li class="category_child">
                          <a href="/categories/${children.id}"><input class="child_btn" type="button" value="${children.name}" name= "${children.id}">
                          </a>
                        </li>
                        `
    return child_category;
  }

  function grandchildBuild(children) {
    let grandchild_category = `
                        <li class="category_grandchild">
                          <a href="/categories/${children.id}"><input class="gc_btn" type="button" value="${children.name}" name= "${children.id}">
                          </a>
                        </li>
                        `
    return grandchild_category;
  }

  // 親カテゴリーを表示
  $('#categoryBtn').hover(function (e) {
    e.preventDefault();
    e.stopPropagation();
    timeOut = setTimeout(function () {
      $('#tree_menu').show();
      $('.categoryTree').show();
    }, 500)
  }, function () {
    clearTimeout(timeOut)
  });

  // 子カテゴリーを表示
  $('.parent_btn').hover(function () {
    $('.parent_btn').css('color', '');
    $('.parent_btn').css('background-color', '');
    let categoryParent = $(this).attr('name');
    timeParent = setTimeout(function () {
      $.ajax({
          url: '/categories/search_category',
          type: 'GET',
          data: {
            parent_id: categoryParent
          },
          dataType: 'json'
        })
        .done(function (data) {
          $(".categoryTree-grandchild").hide();
          $(".category_child").remove();
          $(".category_grandchild").remove();
          $('.categoryTree-child').show();
          data.forEach(function (child) {
            let child_html = childBuild(child)
            $(".categoryTree-child").append(child_html);
          })
          $('#tree_menu').css('max-height', '490px');
        })
        .fail(function () {
          alert("カテゴリーを選択してください");
        });
    }, 400)
  }, function () {
    clearTimeout(timeParent);
  });

  // 孫カテゴリーを表示
  $(document).on({
    mouseenter: function () {
      $('.child_btn').css('color', '');
      $('.child_btn').css('background-color', '');
      let categoryChild = $(this).attr('name');
      timeChild = setTimeout(function () {
        $.ajax({
            url: '/categories/search_category',
            type: 'GET',
            data: {
              children_id: categoryChild
            },
            dataType: 'json'
          })
          .done(function (grandchild_data) {
            $(".category_grandchild").remove();
            $('.categoryTree-grandchild').show();
            grandchild_data.forEach(function (grandchild) {
              let grandchild_html = grandchildBuild(grandchild)
              $(".categoryTree-grandchild").append(grandchild_html);
              let parcol = $('.categoryTree').find(`input[name="${grandchild.root}"]`);
              $(parcol).css('color', 'white');
              $(parcol).css('background-color', '#b1e9eb');
            });
            $('#tree_menu').css('max-height', '490px');
          })
          .fail(function () {
            alert("カテゴリーを選択してください");
          });
      }, 400)
    },
    mouseleave: function () {
      clearTimeout(timeChild);
    }
  }, '.child_btn');

  // 孫カテゴリーを選択時
  $(document).on({
    mouseenter: function () {
      let categoryGc = $(this).attr('name');
      timeGc = setTimeout(function () {
        $.ajax({
            url: '/categories/search_category',
            type: 'GET',
            data: {
              grandchildren_id: categoryGc
            },
            dataType: 'json'
          })
          .done(function (grandchild_result) {
            let childcol = $('.categoryTree-child').find(`input[name="${grandchild_result[0].parent}"]`);
            $(childcol).css('color', 'white');
            $(childcol).css('background-color', '#b1e9eb');
            $('#tree_menu').css('max-height', '490px');
          })
          .fail(function () {
            alert("カテゴリーを選択してください");
          });
      }, 400)
    },
    mouseleave: function () {
      clearTimeout(timeGc);
    }
  }, '.gc_btn');


  // カテゴリー一覧ページのボタン
  $('#all_btn').hover(function (e) {
    e.preventDefault();
    e.stopPropagation();
    $(".categoryTree-grandchild").hide();
    $(".categoryTree-child").hide();
    $(".category_grandchild").remove();
    $(".category_child").remove();
  }, function () {
    // あえて何も記述しないことで親要素に外れた際のアクションだけを伝搬する
  });
  // カテゴリーを非表示(カテゴリーメニュから0.8秒以上カーソルを外したら消える)
  let timeClosed;
  $(document).on({
    mouseleave: function (e) {
      e.stopPropagation();
      e.preventDefault();
      timeClosed = setTimeout(function () {
        $(".categoryTree-grandchild").hide();
        $(".categoryTree-child").hide();
        $(".categoryTree").hide();
        $(this).hide();
        $('.parent_btn').css('color', '');
        $('.parent_btn').css('background-color', '');
        $(".category_child").remove();
        $(".category_grandchild").remove();
      }, 800);
    },
    mouseenter: function () {
      clearTimeout(timeClosed);
    }
  }, '#tree_menu');
  let timeOpened;
  // カテゴリーボタンの処理
  $(document).on({
    mouseenter: function (e) {
      e.stopPropagation();
      e.preventDefault();
      timeOpened = setTimeout(function () {
        $('#tree_menu').show();
        $('.categoryTree').show();
      }, 500);
    },
    mouseleave: function (e) {
      e.stopPropagation();
      e.preventDefault();
      clearTimeout(timeOpened);
      $(".categoryTree-grandchild").hide();
      $(".categoryTree-child").hide();
      $(".categoryTree").hide();
      $("#tree_menu").hide();
      $(".category_child").remove();
      $(".category_grandchild").remove();
    }
  }, '.listsLeft__first');
});
