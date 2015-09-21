DreamsController = function(){}
DreamsController.prototype.postDream = function(eventTarget){
  DreamCatcher.send({data: Obj.fromForm(eventTarget),
                    callback: DreamView.showNewDream});
}