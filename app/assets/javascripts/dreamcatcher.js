var Binder = {};
Binder.bind = function(args){
  $(document).on(args.event, args.selector, function(e){
    e.preventDefault();
    args.callback(e.target);
  });
};

Binder.setInterval = function(args){
  setInterval(args.callback, args.interval);
};

var Obj = {};
Obj.fromForm = function(args){
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
Obj.fromElement = function(selector){
  var elementData = {};
  elementData.type = $(selector).data("method");
  elementData.url = $(selector).data("action");
  var key = $(selector).data("info");
  elementData.data = {};
  elementData.data[key] = $(selector).data("timestamp");
  return elementData;
};

var DreamCatcher = {};
DreamCatcher.send = function(args){
  if(args.params === undefined){
    args.params = "body";
  }
  $.ajax(args.data).done(function(element){
    args.callback(args.params, element);
  }).fail(function(error){
    if(error.status == 306){
    var errorDiv = $(args.params).find("[data-handler=errors]");
    $(errorDiv).html(error.responseText);
    }
  });
  if(args.data === undefined){
    args.callback(args.params);
  }
};
DreamCatcher.base = function(args){
  $.ajax(args.data).done(function(element){
    args.callback(element);
  }).fail(function(error){
    if(error.status == 306){
    var errorDiv = $(args.params).find("[data-handler=errors]");
    $(errorDiv).html(error.responseText);
    }
  });
};


