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
  },

  getMatchPercent: function(otherUserAns){
    var that = this;
    var totalMatchedQ = 0;
    var totalMatchedA = 0;

    this.each(function(ans){
      if(otherUserAns.where({ answer_id: ans.get("answer_id") }).length > 0){
        totalMatchedA += 1;
        totalMatchedQ += 1;
      } else if (otherUserAns.where({ question_id: ans.get("question_id") }).length > 0){
        totalMatchedQ += 1;
      }

      if(totalMatchQ === 0){
        return 0;
      } else {
        return (totalMatchA / totalMatchQ);
      }
    });
  }
})
