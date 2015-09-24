function DreamsController(){}
DreamsController.prototype.postDream = function(eventTarget){
  DreamCatcher.send({data: Obj.fromForm({form: eventTarget}),
                    callback: DreamView.showNewDream});
};
DreamsController.prototype.updateDream = function(eventTarget){
  DreamCatcher.send({data: Obj.fromForm({form: eventTarget}),
                    callback: DreamView.showUpdatedDream,
                    params: eventTarget});
};
DreamsController.prototype.getNewDreamForm = function(){
  DreamCatcher.send({callback: DreamView.showNewDreamForm});
};
DreamsController.prototype.getEditDreamForm = function(eventTarget){
  DreamCatcher.send({callback: DreamView.showEditDreamForm});
};
DreamsController.prototype.updateDreamRiver = function(){
  DreamCatcher.base({data: Obj.fromElement("[data-info=timestamp]"),
                    callback: DreamView.appendNewDream});
};
