OkStupid.Views.MessagesIndex = Backbone.View.extend({
  template: JST["messages/index"],

  events: {
    "click li.msg-option.received": "receivedMessages",
    "click li.msg-option.sent": "sentMessages",
    "click ul.sent-msg": "viewMessages",
    "click ul.received-msg": "viewMessages"
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
    var options = $("ul.message-options");
    options.find(".selected").removeClass("selected");
    options.find(".revealed").removeClass("revealed").addClass("hidden");

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
    var options = $("ul.message-options");
    options.find(".selected").removeClass("selected");
    options.find(".revealed").removeClass("revealed").addClass("hidden");

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
  },

  viewMessages: function(event){
    var id = parseInt($(event.currentTarget).attr("data-id"))
    var options = $("ul.message-options");

    options.find(".selected").removeClass("selected");
    options.find(".hidden")
      .removeClass("hidden")
      .addClass("revealed")
      .addClass("selected")

    var container = $("ul.messages");
    container.empty();

    var msgFrom = this.collection.where({ sender_id: id });
    var msgTo = this.collection.where({ receiver_id: id });
    var correspondence = msgFrom.concat(msgTo);
    var messages = new OkStupid.Collections.Messages();

    correspondence.forEach(function(msg){
      messages.add(msg);
    })
    messages.comparator = function(a, b){
      return a.get("created_at") > b.get("created_at") ? -1 : 1;
    }
    messages.sort();

    var content = JST["messages/conversation"]({
      messages: messages
    })

    container.html(content);

    return this;
  }
})
