OkStupid.Views.LikeIndex = Backbone.View.extend({
  template: JST["likes/index"],

  initialize: function(){
    this.listenTo(this.collection, "sync add", this.render)
  },

  events: {
    "click li.likes": "visitProfile",
  },

  render: function(){
    var content = this.template({
      likes: this.collection
    });

    this.$el.html(content);

    return this;
  },

  visitProfile: function(event){
    event.preventDefault();

    var id = $(event.currentTarget).data("id");

    Backbone.history.navigate("#profiles/" + id, { trigger: true });
  }
})
