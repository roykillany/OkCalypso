OkStupid.Collections.Preferences = Backbone.Collection.extend({
  url: "api/preferences",
  model: OkStupid.Models.Preference,

  getOrFetch: function(id){
    var preference = this.get(id);
    var that = this;

    if(preference){
      preference.fetch();
    } else {
      preference = new OkStupid.Models.Preference({ id: id });
      preference.fetch({
        success: function(){
          that.add(preference);
        }
      })
    }
    return preference;
  }
});
