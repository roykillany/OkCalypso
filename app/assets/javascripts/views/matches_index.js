OkStupid.Views.MatchesIndex = Backbone.View.extend({
  template: JST["matches/index"],

  initialize: function(){
    this.createMatches();
    this.matches = new OkStupid.Collections.Matches();
    this.listenTo(this.collection, "sort", this.renderMatches);
    this.listenTo(this.matches, "sort", this.renderSearchMatches);
  },

  events: {
    "click button.like": "likeUser",
    "click button.unlike": "unlikeUser",
    "change select#sorting-hat": "sortMatches",
    "change select#filter-hat": "filterMatches",
    "change select#sorting-bat": "sortFilterMatches"
  },

  render: function(){
    var content = this.template({
      matches: this.collection
    });

    this.$el.html(content);

    return this;
  },

  renderMatches: function(collection){
    collection = collection || this.collection

    console.log(collection)
    var content = JST["matches/matches_list"]({
      matches: collection
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
                that.collection.sort();
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
    var option = $("select#sorting-hat option:selected").val();
    var menu = $("select#sorting-hat");

    switch(option){
      case "username":
        menu.children(".username").attr("selected", true)
        this.collection.comparator = function(a, b){
          return a.matchee().escape("username") > b.matchee().escape("username") ? 1 : -1
        }
        this.collection.sort();
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
  },

  filterMatches: function(event){
    event.preventDefault();
    var mainMenu = $("select#sorting-hat");
    var filterMenu = $("select#sorting-bat");
    var option = $("select#filter-hat option:selected").val();
    if(option === "anywhere"){
      this.render();
      mainMenu.removeClass("hidden");
      filterMenu.addClass("hidden");
    } else {
      filterMenu.removeClass("hidden");
      mainMenu.addClass("hidden");

      var that = this;

      $.ajax( '/api/filteruser', {
        type: 'GET',
        data: { distance: option },
        dataType: "json",
        success: function(data){
          console.log("filtered")
          console.log(data)

          that.matches = new OkStupid.Collections.Matches();
          data.forEach(function(matchData){
            var match = that.collection.findWhere({ matchee_id: matchData.user_id })
            that.matches.add(match, { merge: true })
          })
          if(that.matches.length === 0){
            that.$("ul.matches").html("<strong>There doesn't seem to be anyone here...</strong>")
          } else {
            that.renderMatches(that.matches);
          }
        }
      });
    }
  },

  sortFilterMatches: function(event){
    event.preventDefault();
    var option = $("select#sorting-bat option:selected").val();
    var menu = $("select#sorting-bat");
    console.log("SORTING FILTERED MATCHES BEEPBOOP")
    console.log(option)

    switch(option){
      case "username":
        menu.children(".username").attr("selected", true)
        this.matches.comparator = function(a, b){
          return a.matchee().escape("username") > b.matchee().escape("username") ? 1 : -1
        }
        console.log(this.matches)
        this.matches.sort();
        break;
      case "high-match-percent":
        menu.children(".high-match-percent").attr("selected", "true")
        this.matches.comparator = function(a, b){
        return a.get("match_percent") < b.get("match_percent") ? 1 : -1;
        };
        console.log(this.matches)
        this.matches.sort();
        break;
      case "low-match-percent":
        menu.children(".low-match-percent").attr("selected", true)
        this.matches.comparator = "match_percent";
        console.log(this.matches)
        this.matches.sort();
        break;
      case "liked":
        this.matches.comparator = function(a, b){
          return b.get("current_user_liked") ? 1 : -1;
        };
        console.log(this.matches)
        this.matches.sort();
        break;
      case "not-liked":
        this.matches.comparator = "current_user_liked"
        console.log(this.matches)
        this.matches.sort();
        break;
    }
  },

  renderSearchMatches: function(){
    console.log("RENDERING FILTERED MATCHES")
    console.log(this.matches.length)
    if(this.matches.length === 0){
      this.$("ul.matches").html("<strong>There doesn't seem to be anyone here...</strong>")
    } else {
      this.renderMatches(this.matches);
    }
  },
});
