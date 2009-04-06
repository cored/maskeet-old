// Common JavaScript code across your application goes here.

//jQuery.ajaxSetup({
 //   'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
//});

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

    $("#answer_form").submit(function() {
        $("#indicator").show();
        $.post($(this).attr("action"), $(this).serialize(), //null, "script", 
          function(data) {
            $("#add_answer").html(data)
          }
        );
        $("#indicator").hide('slow');
        return false;
    });
})

