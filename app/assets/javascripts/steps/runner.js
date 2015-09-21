$(document).ready(function(){
  ctrl = new StepsController();
  Binder.bind({event: "click",
            selector: "[data-link=edit-step]",
            callback: ctrl.getEditDreamForm });
});

