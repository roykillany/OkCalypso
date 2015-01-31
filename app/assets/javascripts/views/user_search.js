OkStupid.Views.UserSearch = Backbone.View.extend({
  template: JST["users/index"],

  events: {
  },

  initialize: function(){
    this.listenTo(this.collection, "sync add", this.render)
  },

  render: function(){
    console.log(this.collection.length);
    var content = this.template({
      users: this.collection
    });

    this.$el.html(content);

    return this;
  }
})
