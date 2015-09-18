##DreamCatcher

required in our application.js is a javascript file called dreamutils.js

dreamutils.js contains 2 useful functions:

Binder.bind allows you to bind your controller events to specific actions in the DOM

Obj.fromForm and Obj.fromLink allow you to get the relevant ajax data from the corresponding DOM elements.

DreamCatcher.send accepts a data attribute representing the relevant ajax data and callback for the view action to be performed

You can see examples of their use and the DC framework in lib/assets/JQueryExample

The framework is comprised of a runner.js a controller.js and a view.js

The runner uses Binder.bind to bind controller actions.

The controller handles all ajax calls and passes the results to the view

This is handled as a nested call inside of the ajax function to prevent issues with asynchronous calls.

The view takes the html data from the ajax call and uses it to manipulate the DOM accordingly.

The view should be a singleton object to avoid issues inside of the ajax call with 'this'

