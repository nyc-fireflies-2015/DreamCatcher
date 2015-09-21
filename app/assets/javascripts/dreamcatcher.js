var Binder = {};
Binder.bind = function(args){
  $(document).on(args.event, args.selector, function(e){
    e.preventDefault();
    args.callback(e.target);
  });
};

var Obj = {};
Obj.fromForm = function(form){
   var formData = {};
   formData.type = $(form).attr("method");
   formData.url = $(form).attr("action");
   formData.data = $(form).serialize();
   return formData;
};
Obj.fromLink = function(link){
  return $(link).attr("href");
};

var DreamCatcher = {};
DreamCatcher.send = function(args){
  if(args.params === undefined){
    args.params = "";
  }
  $.ajax(args.data).done(function(element){
    args.callback(element, args.params);
  });
  if(args.data === undefined){
    args.callback(args.params)
  }
};