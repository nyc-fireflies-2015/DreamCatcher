function CommentsController(){}
CommentsController.prototype.postComment = function(eventTarget){
    DreamCatcher.send({data: Obj.fromForm({form: eventTarget}),
                      callback: CommentsView.showComment});
};
CommentsController.prototype.getCommentForm = function(eventTarget){
    DreamCatcher.send({callback: CommentsView.showEditForm,
                      params: eventTarget})
}