OkStupid.Routers.Router = Backbone.Router.extend({
  initialize: function(options){
    this.$rootEl = options.$rootEl;
    OkStupid.users.fetch();
  },

  routes: {
    "": "ownProfileShow",
    "session/new": "signIn",
    "profiles/:id": "profileShow",
    "messages": "messagesIndex",
    "message/new": "messageNew",
    "messages/:id": "messageShow",
    "matches": "matchesIndex",
    "matches/:id": "matchShow",
    "likes": "likeIndex",
    "questions": "questionsIndex",
    "users": "userSearch",
    "users/new": "newUser"
  },

  ownProfileShow: function(){
    console.log("my little profile")
    var callback = this.ownProfileShow.bind(this);
    if (!this._requireSignedIn(callback)){ return; }

    var that = this;

    OkStupid.profiles.fetch({
      success: function(){
        var profile = OkStupid.profiles.getOrFetch(OkStupid.currentUser.id);
        var profileView = new OkStupid.Views.ProfileShow({
          id: OkStupid.currentUser.id,
          model: profile
        });

        that._swapView(profileView);
      }
    })
  },

  questionsIndex: function(){
    var callback = this.questionsIndex.bind(this);
    if (!this._requireSignedIn(callback)){ return; }
    var that = this;

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
    var callback = this.profileShow.bind(this);
    if (!this._requireSignedIn(callback)){ return; }

    var that = this;
    var profile = OkStupid.profiles.getOrFetch(id);
    var profileView = new OkStupid.Views.ProfileShow({
      id: id,
      model: profile
    });

    that._swapView(profileView);
  },

  messageNew: function(){
    var callback = this.messageNew.bind(this);
    if (!this._requireSignedIn(callback)){ return; }
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
    var callback = this.messagesIndex.bind(this);
    if (!this._requireSignedIn(callback)){ return; }

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
    var callback = this.matchesIndex.bind(this);
    if (!this._requireSignedIn(callback)){ return; }

    var that = this;
    OkStupid.matches.fetch({
      success: function (){
        OkStupid.matches.sort();
        var newMatchIndexView = new OkStupid.Views.MatchesIndex({
          collection: OkStupid.matches
        });

        that._swapView(newMatchIndexView);
      }
    });
  },

  matchShow: function(id){
    var callback = this.matchShow.bind(this);
    if (!this._requireSignedIn(callback)){ return; }

    var match = OkStupid.matches.getOrFetch(id);

    var matchShowView = new OkStupid.Views.MatchShow({
      model: match
    });

    this._swapView(matchShowView);
  },

  likeIndex: function(){
    var callback = this.likeIndex.bind(this);
    if (!this._requireSignedIn(callback)){ return; }

    var that = this;

    OkStupid.likes.fetch({
      success: function(){
        var likesIndexView = new OkStupid.Views.LikeIndex({
          collection: OkStupid.likes
        });

        that._swapView(likesIndexView);
      }
    });
  },

  userSearch: function(){
    var callback = this.userSearch.bind(this);
    if (!this._requireSignedIn(callback)){ return; }

    var that = this;

    OkStupid.users.fetch({
      success: function(){
        var userSearchView = new OkStupid.Views.Search();

        that._swapView(userSearchView);
      }
    })
  },

  newUser: function(){
    if(!this._requireSignedOut()){ return; }

    var model = new OkStupid.users.model();
    var newUserView = new OkStupid.Views.UsersForm({
      collection: OkStupid.users,
      model: model
    });

    this._swapView(newUserView);
  },

  signIn: function(callback){
    if(!this._requireSignedOut(callback)){ return; }

    var signInView = new OkStupid.Views.SignIn({
      callback: callback
    });

    this._swapView(signInView);
  },

  _requireSignedIn: function(callback){
    if(!OkStupid.currentUser.isSignedIn()){
      callback = callback || this._goHome.bind(this);
      this.signIn(callback);
      return false;
    }

    return true;
  },

  _requireSignedOut: function(callback){
    if(OkStupid.currentUser.isSignedIn()){
      callback = callback || this._goHome.bind(this);
      callback();
      return false;
    }

    return true;
  },

  _goHome: function(){
    Backbone.history.navigate("", { trigger: true });
  },

  _swapView: function(view){
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
