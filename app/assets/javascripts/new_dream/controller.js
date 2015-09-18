NewDreamController = function(){}
NewDreamController.prototype.getDreamForm = function(eventTarget){
      DreamCatcher.send({data: Obj.fromLink(eventTarget), 
                        callback: NewDreamView.showDream });
};
NewDreamController.prototype.postDreamForm = function(eventTarget){
      DreamCatcher.send({data: Obj.fromForm(eventTarget),
                        callback: NewDreamView.hideDream })
};
