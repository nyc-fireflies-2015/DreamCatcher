FavoriteView = {};
FavoriteView.showFavorite = function(eventTarget){
  var dream = $(eventTarget).closest("[data-div=favorite]");
  $(dream).find("[data-favorite=destroy]").show();
  $(dream).find("[data-favorite=new]").hide();
};
FavoriteView.removeFavorite = function(eventTarget){
  var dream = $(eventTarget).closest("[data-div=favorite]");
  $(dream).find("[data-favorite=new]").show();
  $(dream).find("[data-favorite=destroy]").hide();
};
