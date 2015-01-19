OkStupid.Views.ProfileShow = Backbone.View.extend({
  template: JST["profiles/show"],

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "blur textarea.profile-edit": "editProfile",
    "click button.like": "likeUser",
    "click button.unlike": "unlikeUser"
  },

  render: function(){
    var content = this.template({
      user_id: this.id,
      profile: this.model
    });
    this.$el.html(content);
    return this;
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
  }
})
