OkStupid.Models.Match = Backbone.Model.extend({
  urlRoot: "api/matches",

  parse: function(jsonResp){
    if(jsonResp.profiles){
      OkStupid.profiles.set(jsonResp.profiles);
      delete jsonResp.profiles;
    }
    return jsonResp;
  }
});
