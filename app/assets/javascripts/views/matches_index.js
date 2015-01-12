OkStupid.Views.MatchesIndex = Backbone.View.extend({
  template: JST["matches/index"],

  initialize: function(){
    this.listenTo(OkStupid.userAnswers, "sync add", this.createMatches);
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
    console.log(1)
    var that = this;
    event.preventDefault();

    // check for currentUser and users collections being populated
    if(OkStupid.currentUser.length === 0 || OkStupid.users.length === 0){
      return;
    } else {
      OkStupid.matches.fetch({
        success: function(){
          console.log(2)
          var currentUserAnswers = OkStupid.userAnswers.where({ user_id: OkStupid.currentUser.id });
          // for each userAnswer of the currentUser
          // and for each user
          // if there exists a userAnswer where the answer id matches the
          // answer id of the currentUser's userAnswer and where the user id
          // matches the user id of the currentUser's userAnswer
          currentUserAnswers.forEach(function(ans){
            OkStupid.users.forEach(function(user){
              if(user.id === OkStupid.currentUser.id){
                return false;
              }
              console.log(typeof OkStupid.userAnswers.where({answer_id: ans.get("answer_id")}, {user_id: user.get("id")}) !== "undefined");
              console.log(typeof OkStupid.matches.findWhere({matcher_id: OkStupid.currentUser.get("id")}) === "undefined");
              if(typeof OkStupid.userAnswers.where({answer_id: ans.get("answer_id")}, {user_id: user.get("id")}) !== "undefined" && typeof OkStupid.matches.findWhere({matcher_id: OkStupid.currentUser.get("id")}) === "undefined"){
                var model = new OkStupid.Models.Match()
                model.save({matcher_id: OkStupid.currentUser.id, matchee_id: user.id }, {
                  success: function(){
                    console.log(4)
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
