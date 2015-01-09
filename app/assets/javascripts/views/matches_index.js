OkStupid.Views.MatchesIndex = Backbone.View.extend({
  template: JST["matches/index"],

  render: function(){
    var content = this.template({
      matches: this.collection
    });

    this.$el.html(content);

    return this;
  }
})
