OkStupid.Collections.SearchResults = Backbone.Collection.extend({
  url: "api/searches",

  model: function(attrs){
    var type = attrs._type;
    delete attrs._type;

    return new OkStupid.Models.User(attrs);
  },

  parse: function(resp){
    this._page = resp._page;

    return resp.results;
  },

  comparator: function(user){
    return user.escape("username");
  }
})
