OkStupid.Views.ProfileShow = Backbone.View.extend({
  template: JST["profiles/show"],

  initialize: function(){
    this.listenTo(this.collection, "sync", this.render)
  },

  render: function(){
    // console.log(profile);
    // var profile = this.collection.findWhere({ user_id: this.id });
    var content = this.template({
      profiles: this.collection,
      user_id: this.id
    });
    this.$el.html(content);
    return this;
  },


})
