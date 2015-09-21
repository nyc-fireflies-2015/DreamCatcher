DreamsController = function(){}
DreamsController.prototype.postDream = function(eventTarget){
  DreamCatcher.send({data: Obj.fromForm(eventTarget),
                    callback: DreamView.showNewDream});
};
DreamsController.prototype.updateDream = function(eventTarget){
  DreamCatcher.send({data: Obj.fromForm(eventTarget),
                    callback: DreamView.showUpdatedDream,
                    params: eventTarget});
};
DreamsController.prototype.getNewDreamForm = function(){
  DreamCatcher.send({callback: DreamView.showNewDreamForm});
};
DreamsController.prototype.getEditDreamForm = function(eventTarget){
  DreamCatcher.send({callback: DreamView.showEditDreamForm,
                      params: eventTarget});
};