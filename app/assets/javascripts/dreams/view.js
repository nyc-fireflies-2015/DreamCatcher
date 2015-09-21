DreamView = {};
DreamView.showNewDream = function(el, newDreamSummary){
  $("[data-river=dreams]").prepend(newDreamSummary);
  $("[data-form=new]").hide();
  $("[data-form=new]").find("form").trigger("reset");
  $("[data-link=add-dream]").fadeIn("slow");
  $(".trend-river").fadeIn("slow");
}