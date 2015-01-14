OkStupid.Views.LikeIndex = Backbone.View.extend({
  template: JST["likes/index"],

  initialize: function(){
    this.listenTo(this.collection, "sync add", this.render)
  },

  render: function(){
    var content = this.template({
      likes: this.collection
    });

    this.$el.html(content);

    return this;
  }
})
