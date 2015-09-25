function CommentsController(){}
CommentsController.prototype.postComment = function(eventTarget){
    DreamCatcher.send({data: Obj.fromForm({form: eventTarget}),
                      callback: CommentsView.showComment});
};
CommentsController.prototype.destroyComment = function(eventTarget){
    DreamCatcher.send({data: Obj.fromDCLink(eventTarget),
                      callback: CommentsView.removeComment,
                      params: eventTarget});
};
