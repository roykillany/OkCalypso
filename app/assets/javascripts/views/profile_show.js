OkStupid.Views.ProfileShow = Backbone.View.extend({
  template: JST["profiles/show"],

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
  },

  render: function(){
    var content = this.template({
      profile: this.model
    });
    this.$el.html(content);
    return this;
  },


})
