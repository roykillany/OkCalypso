OkStupid.Views.LikeShow = Backbone.View.extend({
  template: JST["messages/show"],

  render: function(){
    var content = this.template({
      like: this.model
    });

    this.$el.html(content);

    return this;
  }
})
