OkStupid.Models.Match = Backbone.Model.extend({
  urlRoot: "api/matches",

  parse: function(jsonResp){
    if(jsonResp.matcher){
      this.matcher().set(jsonResp.matcher);
      delete jsonResp.matcher;
    }
    if(jsonResp.matchee){
      this.matchee().set(jsonResp.matchee);
      delete jsonResp.matchee
    }
    return jsonResp;
  },

  matcher: function(){
    if(!this._matcher){
      this._matcher = new OkStupid.Models.User();
    }

    return this._matcher;
  },

  matchee: function(){
    if(!this._matchee){
      this._matchee = new OkStupid.Models.User();
    }

    return this._matchee;
  }
});
