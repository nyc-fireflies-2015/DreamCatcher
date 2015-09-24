var ConversationsView = {
  removeConversation: function(eventTarget){
    $(eventTarget).closest("[data-li=conversation]").remove();
  },
  showMessage: function(eventTarget, newMessage){
    $("[data-ul=messages]").append(newMessage);
    $("[data-form=reply]").trigger("reset");
  },
  setTimeStamp: function(selector){
  var d = new Date();
  $(selector).data("timestamp", d.getTime().toString());
  },
  appendNewMessage: function(eventTarget, newMessages){
      $("[data-ul=messages]").html(newMessages);
      var d = new Date();
      $("[data-info=timestamp]").data("timestamp", d.getTime().toString());
  }
};
