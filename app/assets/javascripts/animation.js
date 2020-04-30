// ボタンを押したときのアクション
$(function(){ 
  jQuery(function($) {
    var topBtn = $('#btn_scroll_top');
    topBtn.hide();
    $(window).scroll(function() {
        if( $(this).scrollTop() > 100 ) {
            topBtn.fadeIn();
        } else {
            topBtn.fadeOut();
        }
    });
    topBtn.click(function() {
        $('body,html').animate({
            scrollTop: 0
        }, 500);
        return false;
    });

  });

  // タブ切り替え
  $(function() {
    //クリックしたときのファンクションをまとめて指定
    $('.tab li').click(function() {
  
      //.index()を使いクリックされたタブが何番目かを調べ、
      //indexという変数に代入します。
      var index = $('.tab li').index(this);
  
      //コンテンツを一度すべて非表示にし、
      $('.content li').css('display','none');
  
      //クリックされたタブと同じ順番のコンテンツを表示します。
      $('.content li').eq(index).css('display','block');
  
      //一度タブについているクラスselectを消し、
      $('.tab li').removeClass('select');
  
      //クリックされたタブのみにクラスselectをつけます。
      $(this).addClass('select')
    });
  });

});