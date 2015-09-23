var StepView = {};
StepView.showNewDreamForm = function(eventTarget){
  $("[data-form=new_step]").fadeIn("slow");
  $("[data-link=new_step]").hide();
  $(".popular-steps-river").hide();
  $(".popular-title").hide();
};
StepView.removeStepDiv = function(eventTarget){
  $(eventTarget).closest("[data-li=step]").remove();
};
StepView.showNewStep = function(eventTarget, newStep){
  $("[data-river=recipe_steps]").prepend(newStep);
  $("[data-form=new_step]").hide();
  $("[data-form=new_step]").find("form").trigger("reset");
  $("[data-link=new_step]").fadeIn("slow");
  $(".popular-steps-river").fadeIn("slow");
  $(".popular-title").fadeIn("slow");
};

