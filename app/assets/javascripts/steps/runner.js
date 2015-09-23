var StepsRunner = {};
StepsRunner.index = function(){
  ctrl = new StepsController();
  Binder.bind({event: "click",
            selector: "[data-link=new_step]",
            callback: ctrl.getNewDreamForm});
  Binder.bind({event: "submit",
            selector: "[data-form=new_step] form",
            callback: ctrl.postStep});
  Binder.bind({event: "submit",
            selector: "[data-form=edit-step] form",
            callback: ctrl.updateStep });
  Binder.bind({event: "click",
            selector: "[data-link=edit-step]",
            callback: ctrl.getEditDreamForm });
  Binder.bind({event: "submit",
            selector: "[data-form=remove-step]",
            callback: ctrl.removeStep });
};

