window.OkStupid = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    OkStupid.profiles = new OkStupid.Collections.Profiles();
    new OkStupid.Routers.Router({
      $rootEl: $("#content")
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  OkStupid.initialize();
});
