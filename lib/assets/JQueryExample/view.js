function CommentView(){

}
CommentView.prototype = {
  renderNewCommentForm: function(args){
    var targetParent = $(args.target).closest(".comment_handler");
    $(args.newDiv).insertAfter(targetParent);
  },
  replaceWithSavedComment: function(args){
    target = args.target;
    div = args.newDiv;
    var commentDiv = $(document).find(args.target).closest(".comment_div");
    $(document).find(commentDiv).html(args.newDiv);
  }
};