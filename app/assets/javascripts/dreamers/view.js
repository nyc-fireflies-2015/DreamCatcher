DreamerView = {};
DreamerView.showProfile = function(p, newProfile){
  $("[data-div=profile]").html(newProfile);
  $("[data-form=profile]").hide();
  $("[data-field=password]").val("");
  $("[data-div=profile]").fadeIn("slow");
};
DreamerView.showEditForm = function(){
  $("[data-div=profile]").empty();
  $("[data-form=profile]").fadeIn("slow");
};