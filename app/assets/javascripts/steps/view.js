var StepView = {};
StepView.showDreamForm = function(eventTarget){
  var step = $(eventTarget).closest("[data-li=step]");
  $(step)
  .find("[data-form=edit-step]").fadeIn("slow");
  $(step)
  .find("[data-div=step-info]").empty();
};

