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
  DreamCatcher.send({callback: DreamView.showEditDreamForm,
                      params: eventTarget});
};
DreamsController.prototype.updateDreamRiver = function(){
  var data = {type: "get", url: "/shortpoll", data: {"timestamp": Date.now().toString()} }
  DreamCatcher.base({data: data});
};
Obj.fromElement("[data-info=timestamp]");
