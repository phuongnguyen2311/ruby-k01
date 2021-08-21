function Micropost(options) {
    var module = this;
    var defaults = {
      template: {
        'comment' : $('#list-comment-template'),
        'friends' : $('#story-micro-template'),
      },
      api: {
        'loves': '/api/v1/love',
        'comment': '/api/v1/comment',
        'friends': '/api/v1/users/friends',
        'token': Cookies.get("api_token"),
      },
      data: {}
    };
    module.settings = $.extend({}, defaults, options);
    
    module.size_image = function(){
        $('#micropost_image').bind('change', function() {
          var size_in_megabytes = this.files[0].size/1024/1024;
            if (size_in_megabytes > 5) {
              alert('Maximum file size is 5MB. Please choose a smaller file.');
          }
    });
  };
    module.comment = function(){
      $('a.reply').click(function(){
        $("span.comment ").hide();
        el = $(this).closest("li");
        el.find("span.comment").show();
      });
  };

  module.clickLike = function(){
    $('.btn-loves').on('click', function(){
      el = $(this);
      micropost_id = $(el).closest('li').attr('id').split('-')[1];
      console.log(micropost_id);
      $.ajax({
        url: module.settings.api.loves,
        headers: {
          'Api-Token': module.settings.api.token
        },
        type: 'POST',
        data: { micropost_id: micropost_id },
        dataType: 'json',
        success: function(data) {
          if (data.code == 200) {
            liked = data.data.split(",").join("\n")
            $(el).prop('title', liked);
            $(el).addClass("red-color");
          } else {
            console.log("error")
          }
        },
        error: function() {}
      });
    });
  }

  module.eventEnterComment = function(){
    $('.in-comment').keypress(function (e) {
     console.log(111);
      if (event.keyCode == 13) {
        ele = $(this).closest("li");
        ele.find("span.comment").show();
        comment = $(ele).find(".in-comment").val();
        micropost_id = $(ele).attr('id').split('-')[1];
        console.log(micropost_id);
        $.ajax({
          url: module.settings.api.comment,
          headers: {
            'Api-Token': module.settings.api.token
          },
          type: 'POST',
          data: { comment: comment, micropost_id: micropost_id },
          dataType: 'json',
          success: function(data) {
            if (data.code == 200) {
              var template_comment = Handlebars.compile(module.settings.template.comment.html());
              $(ele).find(".list-comment").append(template_comment({
                avatar: data.data.avatar,
                comment: data.data.comment
              }));
              $(el).val("");
            } else {
              console.log("error")
            }
          },
          error: function() {}
        });
      }
    });
  }

  module.eventClickViewComment = function(){
    $('.view_more').on('click', function(){
        $("span.list-comment ").hide();
        $("span.view_more").show();
        el = $(this).closest("li");
        el.find("span.list-comment").show();
        el.find("span.view_more").hide();
    });
  }

  module.clickNextFriend = function(){
    $('.next_right').on('click', function(){
      console.log(111111111)
      el = $(this);
      page = parseInt($(el).attr("data-next-page"));
      total = parseInt($(el).attr("data-total-pages"));
      console.log(page);
      $.ajax({
        url: module.settings.api.friends,
        headers: {
          'Api-Token': module.settings.api.token
        },
        type: 'GET',
        data: { page: page },
        dataType: 'json',
        success: function(data) {
          if (data.code == 200) {
            console.log("success" + module.settings.api.friends)
            var template_friends = Handlebars.compile(module.settings.template.friends.html());
            $("#header-story").html("");
            $("#header-story").append(template_friends({
              users: data.data.users
            }));
            page_next = parseInt(data.data.next_page);
            if (page_next >= (total + 1)){
              page_next = 1;
            }
            $(el).attr("data-next-page", page_next);
          } else {
            console.log("error" + module.settings.api.friends)
          }
        },
        error: function() {}
      });
    });
  }
    module.init = function(){
      module.size_image();
      module.comment();
      module.clickLike();
      module.eventEnterComment();
      module.eventClickViewComment();
      module.clickNextFriend();
    };
  }
    
    $(document).ready(function(){ 
      micropost = new Micropost;
      micropost.init();
    });
