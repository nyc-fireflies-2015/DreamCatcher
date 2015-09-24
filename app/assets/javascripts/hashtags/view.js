var HashtagView = {
  hideHashTag: function(eventTarget){
    $(eventTarget).closest("[data-span=hashtag]").remove();
  }
};