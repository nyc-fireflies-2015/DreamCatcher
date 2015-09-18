NewDreamController = function(){}
NewDreamController.prototype.getDreamForm = function(eventTarget){
  $.ajax(Obj.fromLink(eventTarget)).done(function(newDreamForm){
    NewDreamView.show(newDreamForm);
  });
};