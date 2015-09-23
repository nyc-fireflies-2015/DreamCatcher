function CommentsController(){}
CommentsController.prototype.postComment = function(eventTarget){
    DreamCatcher.send({data: Obj.fromForm({form: eventTarget}),
                      callback: CommentsView.showComment});
};