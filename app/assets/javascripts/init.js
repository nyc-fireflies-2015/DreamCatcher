$(document).ready(function(){
  if($("#dream-index").length >= 0){
    DreamsRunner.index();
    FavoritesRunner.index();
  }
  if($("#dream-show").length >= 0){
    DreamsRunner.show();
  }
  if($("#step-index").length >= 0){
    StepsRunner.index();
  }
  if($("#dreamers-profile").length >= 0){
    DreamersRunner.profile();
  }
});
