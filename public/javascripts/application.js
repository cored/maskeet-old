// Common JavaScript code across your application goes here.


$(document).ready(function() {
    $("a.remote_interested").click(function() {
      $("#indicator").show();
      var question_id = this.rel
      $.get(this.href, '', 
        function(data) {
          $("#block_"+question_id).html(data);
        }
      );
      $("#indicator").hide("slow");
      return false;
    });

    $("a.login_form").click(function() {
      if ( $("#login").is(":hidden") ) {
        $("#login").slideDown("slow");
      }
      return false;
    });

    $("a.cancel_login").click(function() {
      $("#login").slideUp("slow");
    });
});

