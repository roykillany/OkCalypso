OkStupid.Models.Like = Backbone.Model.extend({
  urlRoot: "api/likes",

  parse: function(jsonResp){
    if(jsonResp.profiles){
      OkStupid.profiles.set(jsonResp.profiles);
      delete jsonResp.profiles;
    }
    return jsonResp;
  }
});
