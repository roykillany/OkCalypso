OkStupid.Views.MessagesIndex = Backbone.View.extend({
  template: JST["messages/index"],

  render: function(){
    console.log(this.sentCollection);
    console.log(this.receivedCollection);
    var content = this.template({
      sentMessages: this.sentCollection,
      receivedMessages: this.receivedCollection
    });

    this.$el.html(content);

    return this;
  }
})
