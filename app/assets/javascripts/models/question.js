OkStupid.Models.Question = Backbone.Model.extend({
  urlRoot: "api/questions",

  parse: function(jsonResp){
    if(jsonResp.answers){
      // console.log(jsonResp.answers.length)
      // jsonResp.answers.forEach(function(a){
      //   console.log(a);
      // });
      var that = this;
      var count = jsonResp.answers.length;
      // console.log(jsonResp.answers[0])
      // console.log(this.answers(count).to_a)
      var i = 0;
      this.answers(count).forEach(function(a){
        a.set(jsonResp.answers[i]);

        i++;
      })

      delete jsonResp.answers;
    }

    return jsonResp;
  },

  answers: function(ansCount){
    var res = [];
    if(!this._answers){
      this._answers = new OkStupid.Collections.Answers();
      for(var i = 0; i < ansCount; i++){
        this._answers.add(new OkStupid.Models.Answer());
      }
    }

    return this._answers;
  }
})
