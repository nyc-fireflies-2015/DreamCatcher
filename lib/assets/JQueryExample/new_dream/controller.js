NewDreamController = function(){}
NewDreamController.prototype.getDreamForm = function(eventTarget){
      DreamCatcher.send({data: Obj.fromLink(eventTarget), 
                        callback: NewDreamView.show });
};
