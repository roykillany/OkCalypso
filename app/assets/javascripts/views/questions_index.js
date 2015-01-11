OkStupid.Views.QuestionsIndex = Backbone.View.extend({
  template: JST["questions/index"],

  initialize: function(){
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function(){
    var content = this.template({
      answers: OkStupid.answers,
      questions: this.collection
    });

    this.$el.html(content);

    return this;
  }
})
