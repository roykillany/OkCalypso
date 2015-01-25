OkStupid.Views.QuestionsIndex = Backbone.View.extend({
  template: JST["questions/index"],

  initialize: function(){
    this.listenTo(this.collection, "sync add", this.render);
    console.log("initialize questions index");
  },

  events: {
    "submit form": "createUserAnswer"
  },

  render: function(){
    console.log(this.collection)
    var content = this.template({
      questions: this.collection
    });

    this.$el.html(content);

    return this;
  },

  createUserAnswer: function(event){
    event.preventDefault();
    var that = this;

    var formData = $(event.currentTarget).serializeJSON().userAnswer;
    var model = new OkStupid.Models.UserAnswer();
    console.log(formData);
    console.log(model);
    model.save(formData, {
      success: function(){
        OkStupid.userAnswers.add(model, { merge: true });
        OkStupid.questions.fetch({
          success: function(){
            that.render();
          }
        })
      }
    });
  }
})
