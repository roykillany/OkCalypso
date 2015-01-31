OkStupid.Views.MessagesIndex = Backbone.View.extend({
  template: JST["messages/index"],

  events: {
    "click li.msg-option.received": "receivedMessages",
    "click li.msg-option.sent": "sentMessages",
  },

  initialize: function(){
    this.listenTo(this.collection, "sync", this.render)
  },

  render: function(){
    var content = this.template({
      messages: this.collection,
    });

    this.$el.html(content);

    return this;
  },

  receivedMessages: function(event){
    $("ul.message-options").find(".selected").removeClass("selected");
    $(event.currentTarget).addClass("selected");
    var container = $("ul.messages");
    container.empty();

    var receivedMessages = this.collection.where({ receiver_id: OkStupid.currentUser.id })
    if(receivedMessages.length === 0){
      container.html("<ul class='received-msg'>You don't seem to have any messages.</ul>")
    } else {
      var content = JST["messages/received_messages"]({
        messages: receivedMessages
      });

      container.html(content);

      return this;
    }
  },

  sentMessages: function(event){
    $("ul.message-options").find(".selected").removeClass("selected");
    $(event.currentTarget).addClass("selected");
    var container = $("ul.messages");
    container.empty();
    var sentMessages = this.collection.where({ sender_id: OkStupid.currentUser.id })
    if(sentMessages.length === 0){
      container.html("<ul class='sent-msg'>You haven't sent any messages</ul>")
    } else {
      var content = JST["messages/sent_messages"]({
        messages: sentMessages
      });

      container.html(content);

      return this;
    }
  }
})
