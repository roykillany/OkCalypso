OkStupid.Views.MatchesIndex = Backbone.View.extend({
  template: JST["matches/index"],

  initialize: function(){
    this.listenTo(OkStupid.matches, "add sync remove reset", this.render);
    this.createMatches();
  },

  render: function(){
    var content = this.template({
      matches: this.collection
    });

    this.$el.html(content);

    return this;
  },

  createMatches: function(){
    var that = this;
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
});
