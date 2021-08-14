function Micropost(options) {
    var module = this;
    var defaults = {
      template: {},
      api: {},
      data: {}
    };
    module.settings = $.extend({}, defaults, options);
    
    module.size_image = function(){
        $('#micropost_image').bind('change', function() {
          var size_in_megabytes = this.files[0].size/1024/1024;
            if (size_in_megabytes > 0.01) {
              alert('Maximum file size is 5MB. Please choose a smaller file.');
          }
    });
  };
    module.comment = function(){
      $('a.reply').click(function(){
        $("div.comment ").hide();
        el = $(this).closest("li");
        el.find("div.comment").show();
      });
  };
    
    module.init = function(){
      module.size_image();
      module.comment();
    };
  }
    
    $(document).ready(function(){ 
      micropost = new Micropost;
      micropost.init();
    });
