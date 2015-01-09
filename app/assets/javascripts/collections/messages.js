OkStupid.Collections.Messages = Backbone.Collection.extend({
  url: "api/messages",
  model: OkStupid.Models.Message,

  getOrFetch: function(id){
    var message = this.get(id);
    var that = this;

    if(message){
      message.fetch();
    } else {
      message = new OkStupid.Models.Message({ id: id });
      message.fetch({
        success: function(){
          that.add(message);
        }
      })
    }
    return message;
  }
});
