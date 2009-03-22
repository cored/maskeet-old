// Common JavaScript code across your application goes here.

//jQuery.ajaxSetup({
   // 'beforeSend': function(xhr) { xhr.setRequestHeader("Accept", "text/javascript") }
//})

$(document).ready(function() {
    $(".remote").click(function() {
      $("#indicator").show();
      alert("Hello!");
      $("#indicator").hide("slow");
      return false;
    };)
};)

