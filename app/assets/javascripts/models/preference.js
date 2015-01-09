OkStupid.Models.Preference = Backbone.Model.extend({
  urlRoot: "api/preferences",

  parse: function(jsonResp){
    if(jsonResp.profiles){
      OkStupid.profiles.set(jsonResp.profiles);
      delete jsonResp.profiles;
    }
    return jsonResp;
  }
});
