OkStupid.Views.UserSearch = Backbone.View.extend({
  template: JST["users/index"],

  initialize: function(){
    this.listenTo(this.collection, "sync add", this.render)
  },

  render: function(){
    var content = this.template({
      users: this.collection
    });

    this.$el.html(content);

    return this;
  }
})
