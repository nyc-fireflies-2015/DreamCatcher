var CommentsView = {
  showComment: function(el, newComment){
    $("[data-div=new-comment]").append(newComment);
    $("[data-form=new-comment]").hide();
    $("[data-form=new-comment]").trigger("reset");
    $("[data-form=new-comment]").fadeIn("slow");
  },
  showEditForm: function(eventTarget){
    var editCommentDiv = $(eventTarget).closest("[data-div=edit-comment]");
    $(editCommentDiv).find("[data-li=comment]").empty();
    $(editCommentDiv).find("[data-form=edit-comment]").fadeIn("slow");
  },
  showSavedComment: function(eventTarget, savedComment){
    var savedCommentDiv = $(eventTarget).closest("[data-div=edit-comment]");
    $(savedCommentDiv).find("[data-form=edit-comment]").hide();
    $(savedCommentDiv).find("[data-li=comment]").prepend(savedComment);
  }
};
