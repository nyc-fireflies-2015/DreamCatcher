DreamView = {};
DreamView.setTimeStamp = function(selector){
  var d = new Date();
  $(selector).data("timestamp", d.getTime().toString());
};
DreamView.showNewDream = function(el, newDreamSummary){
  $("[data-river=dreams]").empty();
  $("[data-river=dreams]").prepend(newDreamSummary);
  $("[data-form=new]").hide();
  $("[data-form=new]").find("form").trigger("reset");
  $("[data-link=add-dream]").fadeIn("slow");
  $(".trend-river").fadeIn("slow");
  $(".popular-dreams-title").fadeIn("slow");
};
DreamView.showUpdatedDream = function(eventTarget, updatedDreamInfo){
  $("[data-form=edit]").hide();
  $("[data-div=dream]").html(updatedDreamInfo);
};
DreamView.showNewDreamForm = function(){
  $("[data-form=new]").fadeIn("slow");
  $("[data-link=add-dream]").hide();
  $(".trend-river").hide();
  $(".popular-dreams-title").hide();
};
DreamView.showEditDreamForm = function(){
  $("[data-form=edit]").fadeIn("slow");
  $("[data-div=dream]").empty();
};
DreamView.appendNewDream = function(newDreams){
  var d = new Date();
  $("[data-river=dreams]").html(newDreams);
  $("[data-info=timestamp]").data("timestamp", d.getTime().toString());
};
