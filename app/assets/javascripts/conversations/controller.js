function ConversationsController(){}
ConversationsController.prototype.destroyConversation = function(eventTarget){
  DreamCatcher.send({data: Obj.fromDCLink(eventTarget),
                    callback: ConversationsView.removeConversation,
                    params: eventTarget});
};
ConversationsController.prototype.postMessage = function(eventTarget){
  DreamCatcher.send({data: Obj.fromForm({form: eventTarget}),
                    callback: ConversationsView.showMessage});
};
ConversationsController.prototype.updateMessages = function(eventTarget){
  DreamCatcher.send({data: Obj.fromElement("[data-info=timestamp]"),
                    callback: ConversationsView.appendNewMessage});
};
