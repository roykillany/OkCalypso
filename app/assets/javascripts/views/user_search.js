OkStupid.Views.UserSearch = Backbone.View.extend({
  template: JST["users/index"],

  events: {
    "change sorting-hat": "sortResults"
  },

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
