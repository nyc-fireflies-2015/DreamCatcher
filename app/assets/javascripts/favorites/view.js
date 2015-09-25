FavoriteView = {};
FavoriteView.showFavorite = function(eventTarget){
  var dream = $(eventTarget).closest("[data-div=favorite]");
  $(dream).find("[data-favorite=destroy]").show();
  $(dream).find("[data-favorite=new]").hide();
   incrementFavorite("[data-span=unfavorites-count]");
   incrementFavorite("[data-span=favorites-count]");
};
FavoriteView.removeFavorite = function(eventTarget){
  var dream = $(eventTarget).closest("[data-div=favorite]");
  $(dream).find("[data-favorite=new]").show();
  $(dream).find("[data-favorite=destroy]").hide();
  decrementFavorite("[data-span=favorites-count]");
  decrementFavorite("[data-span=unfavorites-count]")
};
function incrementFavorite(selector){
  var val = Number($(selector).text());
  val += 1;
  $(selector).text(val.toString());
}
function decrementFavorite(selector){
  var val = Number($(selector).text());
  val -= 1;
  $(selector).text(val.toString());
}