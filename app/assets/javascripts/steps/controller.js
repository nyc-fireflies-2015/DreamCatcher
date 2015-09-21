StepsController = function(){}
StepsController.prototype.getEditDreamForm = function(eventTarget){
  DreamCatcher.send({callback: StepView.showDreamForm,
                    params: eventTarget});
};