var Binder = {};
Binder.bind = function(args){
  $(document).on(args.event, args.selector, function(e){
    e.preventDefault();
    args.callback(e.target);
  });
};


var Obj = {};
Obj.fromForm = function(args){
   var formData = {};
   if(args.type === undefined){
      args.type = $(args.form).attr("method");
    } 
   if(args.url === undefined){
      args.url = $(args.form).attr("action");
   }
   if(args.data === undefined){
      args.data = $(args.form).serialize();
   }
   return args;
};
Obj.fromLink = function(link){
  return $(link).attr("href");
};
Obj.fromDCLink = function(link){
  var linkData = {};
  linkData.type = $(link).data("method");
  linkData.url = $(link).data("href");
  return linkData;
};

var DreamCatcher = {};
DreamCatcher.send = function(args){
  if(args.params === undefined){
    args.params = "";
  }
  $.ajax(args.data).done(function(element){
    args.callback(args.params, element);
  });
  if(args.data === undefined){
    args.callback(args.params);
  }
};