window.OkStupid = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    OkStupid.profiles = new OkStupid.Collections.Profiles();
    OkStupid.messages = new OkStupid.Collections.Messages();
    OkStupid.preferences = new OkStupid.Collections.Preferences();
    OkStupid.matches = new OkStupid.Collections.Matches();
    OkStupid.likes = new OkStupid.Collections.Likes();
    new OkStupid.Routers.Router({
      $rootEl: $("#content")
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  OkStupid.initialize();
});
