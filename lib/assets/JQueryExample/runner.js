//Example Runner with Binder

//The Runner is where you bind all of your controller 
//methods to specific events

$(document).ready(function(){
  var ctrl = new CommentController();
    Example.Binder.bind({event: "click", 
                      selector: ".add_comment", 
                      callback: ctrl.getNewCommentForm});

    Example.Binder.bind({event: "submit",
                        selector: ".comment_form",
                        callback: ctrl.savecomment});
});
// var Binder = {};
// Binder.bind = function(args){
//   $(document).on(args.event, args.selector, function(e){
//     e.preventDefault();
//     args.callback(e.target);
//   });
// }

//Binder.bind is available in the utilsDJ.js

//Binder.bind takes 3 arguments in an object.  
//1. The type of event to bind to,
//2. The selecter of the event to bind to,
//3. The callback action to be performed
