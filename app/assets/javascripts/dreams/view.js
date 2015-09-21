DreamView = {};
DreamView.showNewDream = function(el, newDreamSummary){
  $("[data-river=dreams]").prepend(newDreamSummary);
  $("[data-form=new]").hide();
  $("[data-form=new]").find("form").trigger("reset");
  $("[data-link=add-dream]").fadeIn("slow");
  $(".trend-river").fadeIn("slow");
};
DreamView.showUpdatedDream = function(el, updatedDreamInfo){
  var dream = $(evenTarget).closest("[data-li=summary]");
  $(dream).find("[data-form=edit]").hide();
  $(dream).find("[data-div=info]")
  .html(updatedDreamInfo)
};
DreamView.showNewDreamForm = function(){
  $("[data-form=new]").fadeIn("slow");
  $("[data-link=add-dream]").hide();
  $(".trend-river").hide();
};