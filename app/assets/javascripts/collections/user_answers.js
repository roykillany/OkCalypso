OkStupid.Collections.UserAnswers = Backbone.Collection.extend({
  url: "api/users/:user_id/user_answers",
  model: OkStupid.Models.UserAnswer,

  getOrFetch: function(id){
    var userAnswer = this.get(id);
    var that = this;

    if(userAnswer){
      userAnswer.fetch();
    } else {
      userAnswer = new OkStupid.Models.UserAnswer({ id: id })
      userAnswer.fetch({
        success: function(){
          that.add(userAnswer);
        }
      })
    }
    return userAnswer;
  }
})
