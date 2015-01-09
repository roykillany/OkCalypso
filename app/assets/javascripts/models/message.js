OkStupid.Models.Message = Backbone.Model.extend({
  urlRoot: "api/messages",

  parse: function(jsonResp){
    if(jsonResp.profiles){
      OkStupid.profiles.set(jsonResp.profiles);
      delete jsonResp.profiles;
    }
    return jsonResp;
  }
});
