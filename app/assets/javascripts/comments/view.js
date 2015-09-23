var CommentsView = {
  showComment: function(el, newComment){
    $("[data-div=new-comment]").append(newComment);
    $("[data-form=new-comment]").hide();
    $("[data-form=new-comment]").trigger("reset");
    $("[data-form=new-comment]").fadeIn("slow");
  }
};
