var StepView = {
  showNewDreamForm: function(eventTarget){
    $("[data-form=new_step]").fadeIn("slow");
    $("[data-link=new_step]").hide();
    $(".popular-steps-river").hide();
    $(".popular-title").hide();
  },
  removeStepDiv: function(eventTarget){
    $(eventTarget).closest("[data-li=step]").remove();
  },
  showNewStep: function(eventTarget, newStep){
    if($("#step-show").length > 0){
      $(eventTarget).closest("[data-info=add-step]").hide();
      alert("Step has been added!");
    } else {
    $("[data-river=recipe_steps]").prepend(newStep);
    $("[data-form=new_step]").hide();
    $("[data-form=new_step]").find("form").trigger("reset");
    $("[data-link=new_step]").fadeIn("slow");
    $(".popular-steps-river").fadeIn("slow");
    $(".popular-title").fadeIn("slow");
    }
  }
};
