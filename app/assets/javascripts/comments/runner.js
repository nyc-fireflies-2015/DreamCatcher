var CommentsRunner = {};
CommentsRunner.show = function(){
  var ctrl = new CommentsController();
  Binder.bind({event: "submit",
              selector: "[data-form=new-comment]",
              callback: ctrl.postComment });
  Binder.bind({event: "click",
              selector: "[data-form=delete-comment]",
              callback: ctrl.destroyComment });


};