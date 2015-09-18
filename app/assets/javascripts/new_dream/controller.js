NewDreamController = function(){
}


NewDreamController.prototype.getDreamForm = function(eventTarget){
  $.ajax($(eventTarget).attr("href")).done(function(newDreamForm){
    NewDreamView.show(newDreamForm);
  });
};