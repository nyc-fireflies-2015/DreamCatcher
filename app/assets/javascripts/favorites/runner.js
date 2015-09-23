var FavoritesRunner = {};
FavoritesRunner.index = function(){
  var ctrl = new FavoritesController();
  Binder.bind({event: "click",
             selector: "[data-form=favorite]",
             callback: ctrl.favorite });
  Binder.bind({event: "click",
             selector: "[data-form=unfavorite]",
             callback: ctrl.unFavorite });
};


