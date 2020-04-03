$(document).on("turbolinks:load", function() {
  function addUser(user) {
    let html = `
      <div class="student-user">
        <p class="student-user__name">${user.last_name}${user.first_name}</p>
        <div class="student-user-add student-user-add-btn" data-user-id="${user.id}" data-user-name="${user.last_name}${user.first_name}">追加</div>
      </div>
    `;
    $("#student-member__search__result").append(html);
  }

  function addNoUser() {
    let html = `
      <div class="student-user">
        <p class="student-user__name">ユーザーが見つかりません</p>
      </div>
    `;
    $("#student-member__search__result").append(html);
  }
  function addDeleteUser(name, id) {
    let html = `
    <div class="student-user" id="${id}">
      <p class="student-user__name">${name}</p>
      <div class="student-user-remove student-user-remove-btn" data-user-id="${id}" data-user-name="${name}">削除</div>
    </div>`;
    $("#student-member__select__relsut").append(html);
  }
  function addMember(userId) {
    let html = `<input value="${userId}" name="student[user_ids][]" type="hidden" id="student_user_ids_${userId}" />`;
    $(`#${userId}`).append(html);
  }

  if( document.URL.match(/students/) && ((document.URL.match(/new/)) || (document.URL.match(/edit/))) ) {

    $("#student-member-box__select__field").on("keyup", function() {
      let input = $("#student-member-box__select__field").val();
      $.ajax({
        type: "GET",
        url: "/users",
        data: { keyword: input },
        dataType: "json"
      })
        .done(function(users) {
          $("#student-member__search__result").empty();
          if (users.length !== 0) {
            users.forEach(function(user) {
              addUser(user);
            });
          } else if (input.length == 0) {
            return false;
          } else {
            addNoUser();
          }
        })
        .fail(function() {
          alert("通信エラーです。ユーザーが表示できません。");
        });
    });
    $(document).on("click", ".student-user-add-btn", function() {
      const userName = $(this).attr("data-user-name");
      const userId = $(this).attr("data-user-id");
      console.log(this)
      $(this)
        .parent()
        .remove();
      addDeleteUser(userName, userId);
      addMember(userId);
    });
    $(document).on("click", ".student-user-remove-btn", function() {
      $(this)
        .parent()
        .remove();
    });

  }

});