OkStupid.Views.MatchesIndex = Backbone.View.extend({
  template: JST["matches/index"],

  initialize: function(){
    this.createMatches();
  },

  render: function(){
    console.log(this.collection)
    var content = this.template({
      matches: this.collection
    });

    this.$el.html(content);

    return this;
  },

  createMatches: function(){
    var that = this;

    OkStupid.currentUser.fetch({
      success: function(){
        $.ajax({
          url: "/api/matches",
          type: "POST",
          success: function(data){
            OkStupid.matches.fetch({
              success: function(){
                that.render();
              }
            })
          }
        });
      }
    })
  }
});
