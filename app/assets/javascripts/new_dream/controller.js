NewDreamController = function(){
  this.view = new NewDreamView
}


NewDreamController.prototype.getDreamForm = function(eventTarget){
  var that = this;
  $.ajax($(eventTarget).attr("href")).done(function(newDreamform){
    that.view.show(newDreamForm);
  });
};