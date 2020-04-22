// ボタンを押したときのアクション
$(function(){
  $('#NewRecordBtn').click(function(){
    $('#NewRecord').fadeIn();
  });

  $('.Cancel').click(function(){
    $('#NewRecord').fadeOut();
  });

  $('#EditBtn').click(function(){
    $('#EditRecord').fadeIn();
  });

  $('.Cancel').click(function(){
    $('#EditRecord').fadeOut();
  });

  $('#CalenderIcon').click(function(){
    $('#Calender-show').fadeIn();
  });

  $('.Cancel').click(function(){
    $('#Calender-show').fadeOut();
  });

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

});