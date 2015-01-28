OkStupid.Views.UsersForm = Backbone.View.extend({
  template: JST["users/form"],

  initialize: function(options){
    this.listenTo(this.model, "sync change", this.render);
  },

  events: {
    "submit form": "submit",
    "change input#user_avatar": "fileSelect"
  },

  render: function(){
    var content = this.template({
      user: this.model
    });
    this.$el.html(content);
    return this;
  },

  submit: function(event){
    event.preventDefault();

    var $form = $(event.currentTarget);
    var userData = $form.serializeJSON().user;
    console.log(userData);
    var that = this;

    this.model.save(userData, {
      success: function(){
        console.log(that.model);
        OkStupid.currentUser.fetch({
          success: function(){
            OkStupid.users.add(that.model, { merge: true });
            delete that.model.attributes.avatar;
            Backbone.history.navigate("", { trigger: true });
          }
        });
      },
      error: function(data){
        alert("You're not foolin' anyone skippy!");
      }
    });
  },

  fileSelect: function(event){
    var that = this;
    var imageFile = event.currentTarget.files[0];
    console.log(imageFile);
    var reader = new FileReader();

    reader.onloadend = function(){
      that.model.set("avatar", this.result);
      console.log(that.model);
      that._updatePreview(this.result);
    }

    if(imageFile){
      reader.readAsDataURL(imageFile);
    } else {
      this._updatePreview("");
    }
  },

  _updatePreview: function(imageData){
    this.$el.find("#post-image-preview").attr("src", imageData);
  }
});
