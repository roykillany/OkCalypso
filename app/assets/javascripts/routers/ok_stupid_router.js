OkStupid.Routers.Router = Backbone.Router.extend({
  initialize: function(options){
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "root",
    "profiles/:id": "profileShow",
    "messages": "messagesIndex",
    "message/new": "messageNew",
    "messages/:id": "messageShow",
    "matches": "matchesIndex",
    "matches/:id": "matchShow",
    "likes/:id": "likeShow",
    "questions": "questionsIndex",
  },

  root: function(){
    var rootView = new OkStupid.Views.RootView();
    this._swapView(rootView);
  },

  questionsIndex: function(){
    var that = this;
    OkStupid.answers.fetch();

    OkStupid.questions.fetch({
      success: function(){
        var newQuestionsIndexView = new OkStupid.Views.QuestionsIndex({
          collection: OkStupid.questions,
        });

        that._swapView(newQuestionsIndexView);
      }
    });
  },

  profileShow: function(id){
    var that = this;
    OkStupid.profiles.fetch({
      success: function(){
        var profile = OkStupid.profiles.findWhere({ user_id: OkStupid.currentUser.id });
        var profileView = new OkStupid.Views.ProfileShow({
          collection: OkStupid.profiles,
          id: id,
          model: profile
        });

        that._swapView(profileView);
      }
    });
  },

  messageNew: function(){
    var message = new OkStupid.Models.Message({
      sender_id: OkStupid.currentUser.id
    });
    var that = this;
    OkStupid.users.fetch({
      success: function(){
        var messageNewView = new OkStupid.Views.MessageNew({
          model: message,
          collection: OkStupid.users
        });
        that._swapView(messageNewView);
      }
    });
  },

  messagesIndex: function(){
    var that = this;
    OkStupid.messages.fetch({
      success: function(){
        var messageIndexView = new OkStupid.Views.MessagesIndex({
          collection: OkStupid.messages,
        });

        that._swapView(messageIndexView);
      }
    });
  },

  messageShow: function(id){
    var message = OkStupid.messages.getOrFetch(id);

    var messageShowView = new OkStupid.Views.MessageShow({
      model: message
    });

    this._swapView(messageShowView);
  },

  matchesIndex: function(){
    var that = this;
    OkStupid.userAnswers.fetch();
    OkStupid.currentUser.fetch();
    OkStupid.users.fetch();
    OkStupid.matches.fetch({
      success: function (){
        var newMatchIndexView = new OkStupid.Views.MatchesIndex({
          collection: OkStupid.Matches
        });

        that._swapView(newMatchIndexView);
      }
    });
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
});
