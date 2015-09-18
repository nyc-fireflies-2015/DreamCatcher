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
   if(args.type !== undefined){
    formData.type = $(args.form).attr("method");
    }
   if(args.url !== undefined){
   formData.url = $(args.form).attr("action");
    }
   if(args.data !== undefined){
   formData.data = $(args.form).serialize();
    }
   return formData;
};
Obj.fromLink = function(link){
  return $(link).attr("href");
};

var DreamCatcher = {};
DreamCatcher.send = function(args){
  $.ajax(args.data).done(function(element){
    args.callback(element);
  });
};