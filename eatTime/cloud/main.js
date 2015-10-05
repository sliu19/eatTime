var authentication = require('cloud/authentication.js')
var events = require('cloud/events.js')
var notification = require('cloud/notification.js')
var users = require('cloud/users.js')
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", function(request, response) {
  response.success("Hello world");
});

Parse.Cloud.define("logged_in", function(request, response) {
  response.success("Logged in");
});


//Push Notification
//After save a Comment Object
Parse.Cloud.define("PushNotification", function(request,response) {
  // Our "Comment" class has a "text" key with the body of the comment itself
  var commentText = request.params.text;
 
  var pushQuery = new Parse.Query(Parse.Installation);
  pushQuery.equalTo('deviceType', 'ios');
    
  Parse.Push.send({
    where: pushQuery, // Set our Installation query
    data: {
      alert: "New comment: " + commentText
    }
  }, {
    success: function() {
      console.log("push success")
    },
    error: function(error) {
      throw "Got an error " + error.code + " : " + error.message;
    }
  });
  response.success("Finish Send request");
});