OkStupid.Collections.Matches = Backbone.Collection.extend({
  url: "api/matches",
  model: OkStupid.Models.Match,

  getOrFetch: function(id){
    var match = this.get(id);
    var that = this;

    if(match){
      match.fetch();
    } else {
      match = new OkStupid.Models.Match({ id: id });
      match.fetch({
        success: function(){
          that.add(match);
        }
      })
    }
    return match;
  }
});
