// Common JavaScript code across your application goes here.

$(document).ready(function() {
    $("a.remote_interested").click(function() {
      $("#indicator").show();
      var question_id = this.rel;
      $.get
        (this.href, '', 
         function(data) { $("#mark_"+question_id).text(data); });
        $this.text('interested!');
      $("#indicator").hide("slow");
      return false;
    });
});

