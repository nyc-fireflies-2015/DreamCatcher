$(document).ready(function(){
  Binder.bind({event: "click", 
              selector: "[data-link=new-dream]", 
              callback: function(){alert("woo");}})
});