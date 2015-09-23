var DreamersRunner = {};
DreamersRunner.profile = function(){
  var ctrl = new DreamersController();
  Binder.bind({event: "submit",
                selector: "[data-form=dreamer]",
                callback: ctrl.updateDreamer});
  Binder.bind({event: "click",
                selector: "[data-link=edit-profile]",
                callback: ctrl.getProfileForm});
}
