var CommentsView = {
  showComment: function(el, newComment){
    incrementCount("[data-header=comments-count]");
    $("[data-div=new-comment]").append(newComment);
    $("[data-form=new-comment]").hide();
    $("[data-form=new-comment]").trigger("reset");
    $("[data-form=new-comment]").fadeIn("slow");
  },
  removeComment: function(eventTarget){
    decrementCount("[data-header=comments-count]");
    $(eventTarget).closest("[data-li=destroy-comment]").remove();
  }
};
function incrementCount(selector){
  var val = Number($(selector).text());
  val += 1;
  $(selector).text(val.toString());
}
function decrementCount(selector){
  var val = Number($(selector).text());
  val -= 1;
  $(selector).text(val.toString());
}
