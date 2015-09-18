var NewDreamView = {};
NewDreamView.showNewDream = function(newDreamForm){
  $("[data-river=dreams]").prepend(newDreamForm);
};
NewDreamView.showEditDream = function(editDreamForm, eventTarget){
  $(eventTarget).replaceWith(editDreamForm);
};
NewDreamView.hideDream = function(dreamShow){
  $("[data-form=dream]").replaceWith(dreamShow);
};

