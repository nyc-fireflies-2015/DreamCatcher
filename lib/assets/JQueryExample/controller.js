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
    $.ajax($(Obj.fromLink(eventTarget)).done(function(newQuestionDiv){
      that.view.renderNewCommentForm({target: eventTarget, newDiv: newQuestionDiv});
    });
  },
  saveComment: function(eventTarget){
    var that = this;
    var formData = Obj.fromForm(eventTarget);
    $.ajax(formData).done(function(savedCommentDiv){
      that.view.replaceWithSavedComment({target: eventTarget, newDiv: savedCommentDiv})
    })
  }
};

// You can use the Obj utility to either get data from a form or from a link
// for ajax calls

//Obj.fromForm(formName)
//Obj.fromLink(linkName)

// var Obj = {};
// Obj.fromForm = function(args){
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

// Obj.fromLink = function(link){
//   return $(link).attr("href")
// }
