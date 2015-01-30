OkStupid.Views.MatchesIndex = Backbone.View.extend({
  template: JST["matches/index"],

  initialize: function(){
    this.createMatches();
    this.listenTo(this.collection, "sort", this.renderMatches);
  },

  events: {
    "click button.like": "likeUser",
    "click button.unlike": "unlikeUser",
    "change select#sorting-hat": "sortMatches"
  },

  render: function(){
    var content = this.template({
      matches: this.collection
    });

    this.$el.html(content);

    return this;
  },

  renderMatches: function(){
    console.log("renderMatches")
    var content = JST["matches/matches_list"]({
      matches: this.collection
    });

    this.$("ul.matches").html(content);
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
  },

  sortMatches: function(event){
    event.preventDefault();
    var option = $("form.sorting option:selected").val()
    var menu = $("select#sorting-hat")

    switch(option){
      case "username":
        menu.children(".username").attr("selected", true)
        this.collection.comparator = function(a, b){
          return a.matchee().escape("username") > b.matchee().escape("username") ? 1 : -1
        }
        this.collection.sort();
        console.log("sort by username")
        break;
      case "high-match-percent":
        menu.children(".high-match-percent").attr("selected", "true")
        this.collection.comparator = function(a, b){
          return a.get("match_percent") < b.get("match_percent") ? 1 : -1;
        };
        this.collection.sort();
        break;
      case "low-match-percent":
        menu.children(".low-match-percent").attr("selected", true)
        this.collection.comparator = "match_percent";
        this.collection.sort();
        break;
      case "liked":
        this.collection.comparator = function(a, b){
          return b.get("current_user_liked") ? 1 : -1;
        };
        this.collection.sort();
        break;
      case "not-liked":
        this.collection.comparator = "current_user_liked"
        this.collection.sort();
        break;
    }
  }
});
