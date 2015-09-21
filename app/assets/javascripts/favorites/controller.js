function FavoritesController(){}
FavoritesController.prototype.favorite = function(eventTarget){
  DreamCatcher.send({data: Obj.fromDCLink(eventTarget),
                    callback: FavoriteView.showFavorite,
                    params: eventTarget});
};
FavoritesController.prototype.unFavorite = function(eventTarget){
  DreamCatcher.send({data: Obj.fromDCLink(eventTarget),
                    callback: FavoriteView.removeFavorite,
                    params: eventTarget});
};