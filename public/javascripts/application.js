// Common JavaScript code across your application goes here.

jQuery.ajaxSetup({
    'beforeSend': function(xhr) { xhr.setRequestHeader("Accept", "text/javascript") }
});

$(document).ready(function() {
    $("a.remote_interested").click(function() {
      $("#indicator").show();
      $.post(this.pathname, $(this).serialize(), null, "script");
      $("#indicator").hide("slow");
      return false;
    });
});

