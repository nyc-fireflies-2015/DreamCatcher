var ConversationsRunner = {
  index: function(){
    var ctrl = new ConversationsController();
    Binder.bind({event: "click",
                selector: "[data-link=delete-conversation]",
                callback: ctrl.destroyConversation});
  }
};