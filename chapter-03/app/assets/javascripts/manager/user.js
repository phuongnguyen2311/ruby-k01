function User(options) {
  var module = this;
  var defaults = {
    template: {},
    api: {},
    data: {}
  };
  module.settings = $.extend({}, defaults, options);
  
  module.search = function(){
    $('.btn_search').on('click', function(){
      email = $('.email').val();
      location.href = "/users?email=" + email
    });
  };
  
  module.init = function(){
    module.search();
  };
}
  
  $(document).ready(function(){ 
    user = new User;
    user.init();
  });