OkStupid.Views.MatchShow = Backbone.View.extend({
  template: JST["matches/show"],

  render: function(){
    var content = this.template({
      match: this.model
    });

    this.$el.html(content);

    return this;
  }
})
