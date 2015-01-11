OkStupid.Models.User = Backbone.Model.extend({
  urlRoot: "api/users",

  parse: function(response){
    if(response.users){
      OkStupid.users.set(response.users);
      delete response.users;
    }
    return response;
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
})
