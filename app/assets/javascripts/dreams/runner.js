$(document).ready(function(){
  var ctrl = new DreamsController();
  Binder.bind({event: "submit",
                selector: "[data-form=edit]",
                callback: ctrl.updateDream }); 
  Binder.bind({event: "submit",
                selector: "[data-form=new]",
                callback: ctrl.postDream });
});