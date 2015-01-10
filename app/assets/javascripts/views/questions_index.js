OkStupid.Views.QuestionsIndex = Backbone.View.extend({
  template: JST["questions/index"],

  initialize: function(){
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function(){
    console.log(this.collection);
    this.collection.each(function(quest){
      console.log(quest);
    });
    var content = this.template({
      questions: this.collection
    });

    this.$el.html(content);

    return this;
  }
})
