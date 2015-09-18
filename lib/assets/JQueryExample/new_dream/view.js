var NewDreamView = {};
NewDreamView.show = function(newDreamForm){
  $("[data-river=dreams]").prepend(newDreamForm);
};

