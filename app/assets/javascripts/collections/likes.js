OkStupid.Collections.Likes = Backbone.Collection.extend({
  url: "api/likes",
  model: OkStupid.Models.Like,

  getOrFetch: function(id){
    var like = this.get(id);
    var that = this;

    if(like){
      like.fetch();
    } else {
      like = new OkStupid.Models.Like({ id: id });
      like.fetch({
        success: function(){
          that.add(like);
        }
      })
    }
    return like;
  }
});
