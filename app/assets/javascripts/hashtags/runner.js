var HashtagsRunner = {
  show: function(){
    var ctrl = new HashtagsController();
    Binder.bind({event: "click",
                selector: "[data-link=hashtag-delete]",
                callback: ctrl.destroyHashtag})
  }
};