var StepView = {};
StepView.showDreamForm = function(eventTarget){
  var step = $(eventTarget).closest("[data-li=step]");
  $(step)
  .find("[data-form=edit-step]").fadeIn("slow");
  $(step)
  .find("[data-div=step-info]").empty();
};
StepView.removeStepDiv = function(eventTarget){
  $(eventTarget).closest("[data-li=step]").remove();
};
StepView.showNewStep = function(eventTarget, newStep){
  $("[data-river=recipe_steps]")
  .prepend(newStep);
  $("[data-form=new_step]").hide();
  $("[data-form=new_step]").find("form").trigger("reset");
  $("[data-link=new_step]").fadeIn("slow");
};
StepView.showUpdatedStep = function(eventTarget){
  $(eventTarget).closest("[data-li=step]").remove();
};

