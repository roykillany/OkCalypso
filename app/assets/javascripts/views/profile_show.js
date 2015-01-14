OkStupid.Views.ProfileShow = Backbone.View.extend({
  template: JST["profiles/show"],

  initialize: function(){
    this.listenTo(this.model, "sync", this.render)
    this.listenTo(OkStupid.users, "sync add", this.render)
  },

  events: {
    "blur textarea.profile-edit": "editProfile"
  },

  render: function(){
    // console.log(profile);
    // var profile = this.collection.findWhere({ user_id: this.id });
    var content = this.template({
      profiles: this.collection,
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
  }
})
