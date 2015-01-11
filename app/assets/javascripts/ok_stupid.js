window.OkStupid = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    OkStupid.currentUser = new OkStupid.Models.User();
    OkStupid.userAnswers = new OkStupid.Collections.UserAnswers();
    OkStupid.questions = new OkStupid.Collections.Questions();
    OkStupid.answers = new OkStupid.Collections.Answers();
    OkStupid.details = new OkStupid.Collections.Details();
    OkStupid.users = new OkStupid.Collections.Users();
    OkStupid.profiles = new OkStupid.Collections.Profiles();
    OkStupid.messages = new OkStupid.Collections.Messages();
    OkStupid.preferences = new OkStupid.Collections.Preferences();
    OkStupid.matches = new OkStupid.Collections.Matches();
    OkStupid.likes = new OkStupid.Collections.Likes();
    new OkStupid.Routers.Router({
      $rootEl: $("#content")
    });
    $.ajax({
      url: "/api/session",
      type: "GET",
      success: function(data){
        Backbone.history.start();
        if(data){
          OkStupid.currentUser.set(data);
        }
      }
    })
  }
};

$(document).ready(function(){
  OkStupid.initialize();
});
