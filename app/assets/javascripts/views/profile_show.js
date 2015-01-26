OkStupid.Views.ProfileShow = Backbone.View.extend({
  template: JST["profiles/show"],

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "blur textarea.profile-edit": "editProfile",
    "click i.fa-pencil-square-o": "showEdit",
    "click button.like": "likeUser",
    "click button.unlike": "unlikeUser",
    "click button.change-avatar": "changeAvatar"
  },

  render: function(){
    var content = this.template({
      user_id: this.id,
      profile: this.model
    });
    this.$el.html(content);
    return this;
  },

  showEdit: function(event){
    event.preventDefault();
    console.log(event);
    console.log(event.target);
    console.log($(event.currentTarget).data("field"));

    var type = event.currentTarget.id
    var id = $(event.currentTarget).data("field");
    $input = $("<textarea class='profile-edit' rows='8' cols='40' name='profile[" + type + "]'>" + id + "</textarea>")
    $("p." + type).html($input);
    $(event.currentTarget).addClass("hidden");
    $input.focus();
  },

  editProfile: function(event){
    event.preventDefault();
    var that = this;

    var formData = $("form.profile-edit").serializeJSON();
    this.model.save(formData, {
      success: function(){
        that.render();
      }
    })
  },

  likeUser: function(event){
    event.preventDefault();
    var that = this;
    var formData = $("form.like").serializeJSON().like;

    var like = new OkStupid.Models.Like();
    like.save(formData, {
      success: function(){
        console.log("successful like!");
        $("form.like").addClass("clicked");
        $("form.unlike").removeClass("clicked");
        that.model.fetch();
      }
    })
  },

  unlikeUser: function(event){
    event.preventDefault();
    var that = this;
    var formData = $("form.unlike").serializeJSON().like;
    console.log(formData);
    var id = formData.likee_id;
    console.log(id);
    console.log(this.id);

    OkStupid.likes.fetch({
      success: function(){
        console.log(OkStupid.likes);
        var like = OkStupid.likes.get(that.model.get("like_id"))
        console.log(like)

        like.destroy();
        $("form.like").removeClass("clicked");
        $("form.unlike").addClass("clicked");
      }
    })
    // var like = OkStupid.Collections.Likes.getOrFetch(id)
  },

  changeAvatar: function(event){
    event.preventDefault();
    var that = this;
    var formData = $("form#change-avatar").serializeJSON().user;

    $.ajax( '/api/users/' + OkStupid.currentUser.id, {
      type: 'GET',
      dataType: 'json',
      contentType: false,
      data: formData,
      success: function(resp){
        console.log(resp);
        console.log(formData);
        that.render();
      },
      error: function(){
        alert("BEEPBOOP THAT DIDN'T WORK")
      }
    });
  }
})
