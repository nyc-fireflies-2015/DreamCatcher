DreamView = {};
DreamView.showNewDream = function(el, newDreamSummary){
  $("[data-river=dreams]").prepend(newDreamSummary);
  $("[data-form=new]").hide();
  $("[data-form=new]").find("form").trigger("reset");
  $("[data-link=add-dream]").fadeIn("slow");
  $(".trend-river").fadeIn("slow");
  $(".popular-dreams-title").fadeIn("slow");
};
DreamView.showUpdatedDream = function(eventTarget, updatedDreamInfo){
  var dream = $(eventTarget).closest(document);
  $(dream).find("[data-form=edit]").hide();
  $(dream).find(".dream")
  .html(updatedDreamInfo)
};
DreamView.showNewDreamForm = function(){
  $("[data-form=new]").fadeIn("slow");
  $("[data-link=add-dream]").hide();
  $(".trend-river").hide();
  $(".popular-dreams-title").hide();
};
DreamView.showEditDreamForm = function(eventTarget){
   var dream = $(eventTarget).closest(document);
  $(dream)
  .find("[data-form=edit]").fadeIn("slow");
  $(dream)
  .find(".dream").empty();
};
