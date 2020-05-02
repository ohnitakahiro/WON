$(function() {
  function addUser(user) {
    var html = `
      <table>
        <tr>
          <td>  <img src="${user.image.url}" class="Content__MyImg"> </td>
          <td>  ${user.name} </td>
          <td><a href="/users/${user.id}">詳細</a></td>
        </tr>
      </table>
    `;
    $("#user-search-result").append(html);
  }

  function addNoUser() {
    var html = `
      <div class="chat-group-user clearfix">
        <p class="chat-group-user__name">ユーザーが見つかりません</p>
      </div>
    `;
    $("#user-search-result").append(html);
  }
    // 初期HTML記述をセット
  var defaultHTML;
  function DefaultSave() {
    defaultHTML = document.body.innerHTML;
  }
  

  $("#user-search-field").on("keyup", function() {
    var input = $("#user-search-field").val();
    $.ajax({
      type: "GET",
      url: "/users",
      data: { keyword: input },
      dataType: "json"
    })
      .done(function(users) {
        $("#user-search-result").empty();
        $("#User-all").hide();

        if (users.length !== 0) {
          users.forEach(function(user) {
            addUser(user);
          });
        } else if (input.length == 0) {
          $("#User-all").fadeIn();
        } else {
          addNoUser();
        }
      })
      .fail(function() {
        alert("通信エラーです。ユーザーが表示できません。");
      });
  });
  
});