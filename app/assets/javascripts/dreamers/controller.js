function DreamersController(){}
DreamersController.prototype.updateDreamer = function(eventTarget){
  DreamCatcher.send({data: Obj.fromForm({form: eventTarget, type: "PUT"}),
                     callback: DreamerView.showProfile});
};
DreamersController.prototype.getProfileForm = function(eventTarget){
  DreamCatcher.send({callback: DreamerView.showEditForm});
};