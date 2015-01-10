OkStupid.Views.MessageNew = Backbone.View.extend({
  template: JST["messages/new"],

  events: {
    "submit form": "sendMessage"
  },

  sendMessage: function(event){
    event.preventDefault();
    var formData = $(event.currentTarget).serializeJSON().message;
    var that = this;
    this.model.save(formData, {
      success: function(){
        OkStupid.messages.add(that.model, { merge: true });
        Backbone.history.navigate("#messages", { trigger: true })
      }
    });
  },

  render: function(){
    var content = this.template({
      message: this.model,
      users: this.collection
    });
    this.$el.html(content);
    return this;
  }
})
