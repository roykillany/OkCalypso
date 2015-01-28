OkStupid.Models.User = Backbone.Model.extend({
  urlRoot: "api/users",

  parse: function(response){
    if(response.users){
      OkStupid.users.set(response.users);
      delete response.users;
    }
    return response;
  },

  toJSON: function(){
    var attributes = _.clone(this.attributes);
    return { user: attributes }
  },

  profile: function(){
    if(!this._profile){
      this._profile = new OkStupid.Collections.Profiles([], {
        user: this
      });
    }
    return this._profile;
  },

  matches: function(){
    if(!this._matches){
      this._matches = new OkStupid.Collections.Matches([], {
        user: this
      });
    }
    return this._matches;
  },

  likes: function(){
    if(!this._likes){
      this._likes = new OkStupid.Collections.Likes([],{
        user: this
      });
    }
    return this._likes;
  },

  userAnswers: function(){
    if(!this._userAnswers){
      this._userAnswers = OkStupid.Collections.UserAnswers([], {
        user: this
      });
    }
    return this._userAnswers;
  }
});

OkStupid.Models.CurrentUser = OkStupid.Models.User.extend({
  url: "api/session",

  intialize: function(options){
    this.listenTo(this, "change", this.fireSessionEvent);
  },

  isSignedIn: function(){
    return !this.isNew();
  },

  signIn: function(options){
    console.log("signIn");
    var model = this;
    var credentials = {
      "user[username]": options.username,
      "user[password]": options.password
    };

    $.ajax({
      url: this.url,
      type: "POST",
      data: credentials,
      dataType: "json",
      success: function(data){
        model.set(data);
        options.success && options.success();
      },
      error: function(){
        options.success && options.error();
      }
    });
  },

  signOut: function(options){
    var model = this;

    console.log("signOut");

    $.ajax({
      url: this.url,
      type: "DELETE",
      dataType: "json",
      success: function(data){
        console.log("successful signOut")
        model.clear();
        options.success && options.success();
      }
    });
  },

  fireSessionEvent: function(){
    if(this.isSignedIn()){
      this.trigger("signIn");
    } else {
      this.trigger("signOut");
    }
  }
});
