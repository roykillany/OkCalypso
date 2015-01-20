window.OkStupid = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.currentUser = new OkStupid.Models.CurrentUser();
    // this.currentUser = new OkStupid.Models.User();
    this.userAnswers = new OkStupid.Collections.UserAnswers();
    this.questions = new OkStupid.Collections.Questions();
    this.answers = new OkStupid.Collections.Answers();
    this.details = new OkStupid.Collections.Details();
    this.users = new OkStupid.Collections.Users();
    this.profiles = new OkStupid.Collections.Profiles();
    this.messages = new OkStupid.Collections.Messages();
    this.preferences = new OkStupid.Collections.Preferences();
    this.matches = new OkStupid.Collections.Matches();
    this.likes = new OkStupid.Collections.Likes();
    this.header = new OkStupid.Views.Header({
      el: "#header"
    });
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
