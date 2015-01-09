OkStupid.Views.ProfileShow = Backbone.View.extend({
  template: JST["profiles/show"],

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
  },

  render: function(){
    console.log(this.model);
    var content = this.template({
      profile: this.model
    });
    this.$el.html(content);
    return this;
  },


})
