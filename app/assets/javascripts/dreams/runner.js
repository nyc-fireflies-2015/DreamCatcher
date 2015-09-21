$(document).ready(function(){
  var ctrl = new DreamsController();
  Binder.bind({event: "submit",
                selector: "[data-form=edit] form",
                callback: ctrl.updateDream }); 
  Binder.bind({event: "submit",
                selector: "[data-form=new] form",
                callback: ctrl.postDream });
});