$(document).ready(function(){
  ctrl = new StepsController();
  Binder.bind({event: "click",
            selector: "[data-link=edit-dream]",
            callback: ctrl.getEditDreamForm });
});

// NewDreamController.prototype.postDreamForm = function(eventTarget){
//   DreamCatcher.send({data: Obj.fromForm(eventTarget),
//                     callback: NewDreamView.hideDream,
//                     params: eventTarget});
// };