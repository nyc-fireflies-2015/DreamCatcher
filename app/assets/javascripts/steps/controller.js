StepsController = function(){}
StepsController.prototype.getEditDreamForm = function(eventTarget){
  DreamCatcher.send({callback: StepView.showDreamForm,
                    params: eventTarget});
};
StepsController.prototype.removeStep = function(eventTarget){
  DreamCatcher.send({data: Obj.fromForm(eventTarget),
                    callback: StepView.removeStepDiv,
                    params: eventTarget});
};