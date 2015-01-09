window.OkStupid = {
  Models: {},
  Collections: {},
  Routers: {},
  Views: {},

  initialize: function(){
    new OkStupid.Routers.OkStupidRouter({

    });
    Backbone.history.start();
  }
};

$(OkStupid.initialize);
