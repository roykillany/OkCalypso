OkStupid.Views.MatchesIndex = Backbone.View.extend({
  template: JST["matches/index"],

  initialize: function(){
    this.listenTo(OkStupid.userAnswers, "sync", this.createMatches);
    this.listenTo(OkStupid.matches, "add sync remove reset", this.render);
    this.listenTo(OkStupid.users, "sync", this.render);
  },

  events: {
    "click .create-matches": "createMatches"
  },

  render: function(){
    var content = this.template({
      matches: this.collection
    });

    this.$el.html(content);

    return this;
  },

  createMatches: function(event){
    // need matcher and matchee id to create Match
    // match if thisUserAnswer.answer_id === otherUserAnswer.answer_id
    var that = this;
    event.preventDefault();
    if(OkStupid.currentUser.length === 0 || OkStupid.users.length === 0){
      return;
    } else {
      OkStupid.matches.fetch({
        success: function(){
          var currentUserAnswers = OkStupid.userAnswers.where({ user_id: OkStupid.currentUser.id });
          currentUserAnswers.forEach(function(ans){
            OkStupid.users.forEach(function(user){
              if(user.id === OkStupid.currentUser.id){
                return false;
              }

              if(OkStupid.userAnswers.where({answer_id: ans.get("answer_id")}, {user_id: user.id} > 0)){
                var model = new OkStupid.Models.Match({matcher_id: OkStupid.currentUser.id, matchee_id: user.id })
                model.save({
                  success: function(){
                    OkStupid.matches.add(model, { merge: true });
                    that.render();
                  }
                })
              }
            })
          })
        }
      });
    }
  }
})
