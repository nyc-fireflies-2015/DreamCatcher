$(document).ready(function(){
  ctrl = new StepsController();
  Binder.bind({event: "click",
            selector: "[data-link=edit-step]",
            callback: ctrl.getEditDreamForm });  
  Binder.bind({event: "submit",
            selector: "[data-form=remove-step]",
            callback: ctrl.removeStep });
});

