var ConversationsView = {
  removeConversation: function(eventTarget){
    $(eventTarget).closest("[data-li=conversation]").remove();
  },
  showMessage: function(eventTarget, newMessage){
    $("[data-ul=messages]").append(newMessage);
  }
};