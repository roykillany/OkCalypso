OkStupid.Views.RootView = Backbone.View.extend({
  template: JST["root"],
  
  render: function(){
    var content = this.template();
    this.$el.html(content);
    return this;
  }
})
