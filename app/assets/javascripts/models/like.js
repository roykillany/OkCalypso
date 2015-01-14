OkStupid.Models.Like = Backbone.Model.extend({
  urlRoot: "api/likes",

  parse: function(jsonResp){
    if(jsonResp.liker){
      this.liker().set(jsonResp.liker);
      delete jsonResp.liker
    }
    if(jsonResp.likee){
      this.likee().set(jsonResp.likee);
      delete jsonResp.likee
    }
    
    return jsonResp;
  },

  liker: function(){
    if(!this._liker){
      this._liker = new OkStupid.Models.User();
    }

    return this._liker;
  },

  likee: function(){
    if(!this._likee){
      this._likee = new OkStupid.Models.User();
    }

    return this._likee;
  }
});
