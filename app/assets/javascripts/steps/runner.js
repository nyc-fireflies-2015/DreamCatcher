$(document).ready(function(){
  ctrl = new StepsController();
  Binder.bind({event: "click",
            selector: "[data-link=edit-step]",
            callback: ctrl.getEditDreamForm });  
  Binder.bind({event: "click",
            selector: "[data-form=remove_step]",
            callback: ctrl.removeStep });
});

