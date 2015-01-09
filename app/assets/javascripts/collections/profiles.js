OkStupid.Collections.Profiles = Backbone.Collection.extend({
  model: OkStupid.Models.Profile,
  url: "api/profiles",

  getOrFetch: function(user_id){
    var profile = this.findWhere({user_id: user_id});
    var that = this;

    if(!profile){
      profile = new OkStupid.Models.Profile({ user_id: user_id });
      profile.fetch({
        success: function(){
          that.add(profile, { merge: true });
        }
      });
    } else {
      profile.fetch();
    }
    return profile;
  }
});
