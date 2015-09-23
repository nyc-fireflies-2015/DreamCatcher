$(document).ready(function(){
  if($("#dream-index").length){
    DreamRunner.index();
    FavoritesRunner.index();
  }
  if($("#dream-show").length){
    DreamsRunner.show();
  }
  if($("#step-index")){
    StepsRunner.index();
  }

});
