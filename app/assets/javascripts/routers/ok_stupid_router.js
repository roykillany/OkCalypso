OkStupid.Routers.Router = Backbone.Router.extend({
  initialize: function(options){
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "root",
    "profiles/:id": "profileShow",
    "messages": "messagesIndex",
    "messages/:id": "messageShow",
    "matches/:id": "matchShow",
    "likes/:id": "likeShow",
  },

  root: function(){
    var rootView = new OkStupid.Views.RootView();
    this._swapView(rootView);
  },

  profileShow: function(id){
    var profile = OkStupid.profiles.getOrFetch(id);

    var profileView = new OkStupid.Views.ProfileShow({
      model: profile
    });

    this._swapView(profileView);
  },

  messagesIndex: function(){
    var messages = OkStupid.messages.fetch();

    var messageIndexView = new OkStupid.Views.MessagesIndex({
      collection: messages
    });

    this._swapView(messageIndexView);
  },

  messageShow: function(id){
    var message = OkStupid.messages.getOrFetch(id);

    var messageShowView = new OkStupid.Views.MessageShow({
      model: message
    });

    this._swapView(messageShowView);
  },

  matchShow: function(id){
    var match = OkStupid.matches.getOrFetch(id);

    var matchShowView = new OkStupid.Views.MatchShow({
      model: match
    });

    this._swapView(matchShowView);
  },

  likeShow: function(id){
    var like = OkStupid.likes.getOrFetch(id);

    var likeShowView = new OkStupid.Views.LikeShow({
      model: like
    });

    this._swapView(likeShowView);
  },

  _swapView: function(view){
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
})
