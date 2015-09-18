NewDreamController = function(){}
NewDreamController.prototype.getDreamForm = function(eventTarget){
  DreamCatcher.send({data: Obj.fromLink(eventTarget), 
                    callback: NewDreamView.showNewDream });
};
NewDreamController.prototype.postDreamForm = function(eventTarget){
  DreamCatcher.send({data: Obj.fromForm(eventTarget),
                    callback: NewDreamView.hideDream,
                    params: eventTarget});
};
NewDreamController.prototype.getEditDreamForm = function(eventTarget){
  DreamCatcher.send({data: Obj.fromLink(eventTarget),
                    callback: NewDreamView.showEditDream,
                    params: eventTarget });
}
