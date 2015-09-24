var StepsRunner = {};
StepsRunner.index = function(){
  ctrl = new StepsController();
  Binder.bind({event: "click",
            selector: "[data-link=new_step]",
            callback: ctrl.getNewDreamForm});
  Binder.bind({event: "submit",
            selector: "[data-form=new_step] form",
            callback: ctrl.postStep});
  Binder.bind({event: "click",
            selector: "[data-form=remove-step]",
            callback: ctrl.removeStep });
  Binder.bind({event: "click",
            selector: "[data-info=add-step]",
            callback: ctrl.addStep})

};

