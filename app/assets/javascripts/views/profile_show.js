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
        console.log("successful like!")
        that.render();
      }
    })
  },

  unlikeUser: function(event){
    event.preventDefault();
    var that = this;
    var formData = $("form.unlike").serializeJSON().like;

    var like = 80085
  }
})
