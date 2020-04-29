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

  $(function () {
    var idNo = 1;
    $('#Menu_add_btn').click(function() {
      $("div#Menu_TemplateForm")
      .clone(true)
      .removeAttr("id")
            // 非表示解除
            .removeClass("hide")
            // テキストボックスのID追加
            // .find("input[name=templateTextbox]")
            // .attr("id", "textbox_" + idNo)
            // .end()
            // 情報表示
            // .find("span.dispInfo")
            // .text("id[" + idNo + "] TextBox_ID[" + "textbox_" + idNo + "] Button_ID:[" + "button_" + idNo + "]")
            // .end()
            // 追加処理
            .appendTo("div#kokoniikitai");
  
        // ID番号加算
        // idNo++;
    });
  });

  // $(function () {
  //   $('#Menu_sets_add_btn').click(function() {
  //     $(".Menu_addform").clone().appendTo('#Menu_form_hide');
  //   });
  // });

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