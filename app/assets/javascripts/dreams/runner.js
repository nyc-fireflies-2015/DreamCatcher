$(document).ready(function(){
  var ctrl = new DreamsController();
  Binder.bind({event: "submit",
                selector: "[data-form=new] form",
                callback: ctrl.postDream });
  Binder.bind({event: "submit",
                selector: "[data-form=edit] form",
                callback: ctrl.updateDream })
  Binder.bind({event: "click",
                selector: "[data-link=add-dream]",
                callback: ctrl.getNewDreamForm });
  Binder.bind({event: "click",
                selector: "[data-link=edit-dream]",
                callback: ctrl.getEditDreamForm });
  Binder.setInterval({interval: 1000,
                callback: ctrl.updateDreamRiver });
});
