OkStupid.Models.Profile = Backbone.Model.extend({
  urlRoot: "api/profiles",

  parse: function(jsonResp){
    if(jsonResp.profiles){
      OkStupid.profiles.set(jsonResp.profiles);
      delete jsonResp.profiles;
    }
    return jsonResp;
  }
});
