function HashtagsController(){}
HashtagsController.prototype.destroyHashtag = function(eventTarget){
    DreamCatcher.send({data: Obj.fromDCLink(eventTarget),
                      callback: HashtagView.hideHashTag,
                      params: eventTarget});
};
