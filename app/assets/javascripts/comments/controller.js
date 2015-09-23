function CommentsController(){}
CommentsController.prototype.postComment = function(eventTarget){
    DreamCatcher.send(event: "submit",
                      selector: "[data-form=new-comment]",
                      callback: CommentsView.showComment);
};