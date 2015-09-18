function CommentController(){
  this.view = new CommentView();
}
CommentController.prototype = {
  getFormData: function(form){
   var formData = {};
   formData.type = $(form).attr("method");
   formData.url = $(form).attr("action");
   formData.data = $(form).serialize();
   return formData;
  },
  getNewCommentForm: function(eventTarget){
    var that = this;
    $.ajax($(eventTarget).attr("href")).done(function(newQuestionDiv){
      that.view.renderNewCommentForm({target: eventTarget, newDiv: newQuestionDiv});
    });
  },
  saveComment: function(eventTarget){
    var that = this;
    var formData = this.getFormData(eventTarget);
    $.ajax(formData).done(function(savedCommentDiv){
      that.view.replaceWithSavedComment({target: eventTarget, newDiv: savedCommentDiv})
    })
  }
};