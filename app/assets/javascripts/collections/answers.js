OkStupid.Collections.Answers = Backbone.Collection.extend({
  url: "api/collections",
  model: OkStupid.Models.Answer,

  getOrFetch: function(id){
    var answer = this.get(id);
    var that = this;

    if(answer){
      answer.fetch();
    } else {
      answer = new OkStupid.Models.Answer({ id: id });
      answer.fetch({
        success: function(){
          that.add(answer);
        }
      })
    }
    return answer;
  }
})
