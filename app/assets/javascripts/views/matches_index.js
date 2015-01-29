OkStupid.Views.MatchesIndex = Backbone.View.extend({
  template: JST["matches/index"],

  initialize: function(){
    this.createMatches();
  },

  events: {
    "click button.like": "likeUser",
    "click button.unlike": "unlikeUser",
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
  },

  likeUser: function(event){
    event.preventDefault();
    var that = this;
    var id = $(event.currentTarget).data("id")
    var form = $("form#" + id + ".like")
    var formData = form.serializeJSON().like;

    var like = new OkStupid.Models.Like();

    like.save(formData, {
      success: function(){
        OkStupid.likes.add(like, { merge: true });
        console.log("liked!")
        form.addClass("clicked");
        $("form#" + id + ".unlike").removeClass("clicked");
        OkStupid.matches.fetch({
          success: function(){
            that.render();
          }
        })
      }
    })
  },

  unlikeUser: function(event){
    event.preventDefault();
    var that = this;
    var like_id = $(event.currentTarget).data("like-id");
    var id = $(event.currentTarget).data("id")
    var form = $("form#" + id + ".unlike");
    var formData = form.serializeJSON().like;

    OkStupid.likes.fetch({
      success: function(){
        console.log("unliked!")
        var like = OkStupid.likes.get(like_id)

        like.destroy();

        form.addClass("clicked");
        $("form#" + id + ".like").removeClass("clicked");
      }
    })
  }
});
