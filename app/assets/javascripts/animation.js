
$(function(){ 
  // ロード
  window.onload = function() {
    const spinner = document.getElementById('loading');
    spinner.classList.add('loaded');
  }
  // 初期画面
  $(function() {
    setTimeout(function(){
      $('.start #start-logo').fadeIn(1600);
    },1000); //1秒後にロゴをフェードイン!
    setTimeout(function(){
      $('.start').fadeOut(500);
    },3000); //4秒後にロゴ含め真っ白背景をフェードアウト！
  });
  // ボタンを押したときのアクション
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
// フェードイン
  $(function(){
    var effect_pos = 300; // 画面下からどの位置でフェードさせるか(px)
    var effect_move = 50; // どのぐらい要素を動かすか(px)
    var effect_time = 800; // エフェクトの時間(ms) 1秒なら1000

    // フェードする前のcssを定義
    $('.scroll-fade').css({
        opacity: 0,
        transform: 'translateY('+ effect_move +'px)',
        transition: effect_time + 'ms'
    });

    // スクロールまたはロードするたびに実行
    $(window).on('scroll load', function(){
        var scroll_top = $(this).scrollTop();
        var scroll_btm = scroll_top + $(this).height();
        effect_pos = scroll_btm - effect_pos;

        // effect_posがthis_posを超えたとき、エフェクトが発動
        $('.scroll-fade').each( function() {
            var this_pos = $(this).offset().top;
            if ( effect_pos > this_pos ) {
                $(this).css({
                    opacity: 1,
                    transform: 'translateY(0)'
                });
            }
        });
    });
});

});