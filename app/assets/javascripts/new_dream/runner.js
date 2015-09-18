$(document).ready(function(){
  var ctrl = new NewDreamController();
  Binder.bind({event: "click", 
              selector: "[data-link=new-dream]", 
              callback: ctrl.getDreamForm })
});