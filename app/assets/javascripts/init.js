$(document).ready(function(){
  if($("#dream-index").length > 0){
    DreamsRunner.index();
  }
  if($("#dream-show").length > 0){
    DreamsRunner.show();
    FavoritesRunner.index();
    CommentsRunner.show();
    HashtagsRunner.show();
  }
  if($("#step-index").length > 0){
    StepsRunner.index();
  }
  if($("#dreamers-profile").length > 0){
    DreamersRunner.profile();
  }
  if($("#conversation-index").length > 0){
    ConversationsRunner.index();
  }
  if($("#conversation-show").length > 0){
    ConversationsRunner.show();
  }
  if($("#hashtag-search").length > 0){
    FavoritesRunner.index();
  }
});
