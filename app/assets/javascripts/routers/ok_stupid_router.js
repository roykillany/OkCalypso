OkStupid.Routers.Router = Backbone.Router.extend({
  initialize: function(options){
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "profiles/:id": "userProfile"
  },

  userProfile: function(id){
    var profile = OkStupid.profiles.getOrFetch(id);

    var profileView = new OkStupid.Views.ProfileShow({
      model: profile
    });

    this._swapView(profileView);
  },

  _swapView: function(view){
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
})
