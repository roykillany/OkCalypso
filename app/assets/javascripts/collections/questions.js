OkStupid.Collections.Questions = Backbone.Collection.extend({
  url: "api/questions",
  model: OkStupid.Models.Question,

  getOrFetch: function(id){
    var question = this.get(id);
    var that = this;

    if(question){
      question.fetch();
    } else {
      question = new OkStupid.Models.Question({ id: id });
      question.fetch({
        success: function(){
          that.add(question);
        }
      })
    }
    return question;
  },

  comparator: function(question){
    return question.get("id")
  }
})
