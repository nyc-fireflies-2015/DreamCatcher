var NewDreamView = {};
NewDreamView.showDream = function(newDreamForm){
  $("[data-river=dreams]").prepend(newDreamForm);
};
NewDreamView.hideDream = function(dreamShow){
  $("[data-form=dream]").replaceWith(dreamShow);
};

