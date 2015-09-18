//Example Controller

//The controller is where you call all of your ajax events.
//Call your view inside of your ajax events to avoid problems.
//Don't forget to assign this to a variable or use .bind

function CommentController{
  //Declare instance of your view
  this.view = new CommentView();
}
CommentController.prototype = {
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
//You can inherit the getFormData function from the Comment object into
//your controller like so: 
CommentController.prototype.getFormData = Controller.getFormData

// var Controller = {};
// Controller.getFormData = function(args){
//    var formData = {};
//    if(args.type !== undefined){
//     formData.type = $(args.form).attr("method");
//     }
//    if(args.url !== undefined){
//    formData.url = $(args.form).attr("action");
//     }
//    if(args.data !== undefined){
//    formData.data = $(args.form).serialize();
//     }
//    return formData;
// }

