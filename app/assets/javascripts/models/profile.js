OkStupid.Models.Profile = Backbone.Model.extend({
  url: function(){
    return "api/profiles/" + this.get("user_id")
  },

  parse: function(jsonResp){
    if(jsonResp.user){
      this.user().set(jsonResp.user);
      delete jsonResp.user;
    }
    return jsonResp;
  },

  user: function(){
    if(!this._user){
      this._user = new OkStupid.Models.User();
    }

    return this._user;
  }
});
