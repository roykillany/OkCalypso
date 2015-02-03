OkStupid.Views.ProfileShow = Backbone.View.extend({
  template: JST["profiles/show"],

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "blur textarea.profile-edit": "editProfile",
    "click i.profile": "showEdit",
    "click button.like": "likeUser",
    "click button.unlike": "unlikeUser",
    "click button.change-avatar": "changeAvatar",
    "change input.change-avatar": "fileSelect",
    "click i.avatar-edit": "showAvatarEdit",
    "click a.messaging": "showMessageModal",
    "click i.close": "closeMessageModal",
    "click i.minimize": "minimizeMessageModal",
    "click i.maximize": "maximizeMessageModal",
    "submit form#message-modal": "sendMessage"
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

    type = event.currentTarget.id
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
          function replaceAll(find, replace, str)
        {
          while( str.indexOf(find) > -1)
          {
            str = str.replace(find, replace);
          }
          return str;
        };

        var txt = $("textarea.profile-edit").val();
        txt = replaceAll("\r\n", "<br />", txt);
        txt = replaceAll("\n", "<br />", txt);
        txt = replaceAll("\r", "<br />", txt);
        txt = replaceAll("\t", "&nbsp;", txt);
        txt = replaceAll("  ", " &nbsp;", txt);
        $("textarea.profile-edit").remove();
        console.log(txt)
        $("p." + type).append(txt).append("<div>" + txt + "</div>");
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
    var id = formData.likee_id;

    OkStupid.likes.fetch({
      success: function(){
        console.log(that.model);
        var like = OkStupid.likes.get(that.model.get("like_id"))
        console.log(like)

        like.destroy();
        $("form.like").removeClass("clicked");
        $("form.unlike").addClass("clicked");
      }
    })
  },

  changeAvatar: function(event){
    event.preventDefault();
    var that = this;

    $("form#change-avatar").addClass("hidden");

    console.log({ avatar: OkStupid.currentUser._avatar });
    $.ajax({
      type: "PATCH",
      url: "/api/users/" + OkStupid.currentUser.id,
      dataType: "json",
      data: { user: { avatar: OkStupid.currentUser._avatar } },
      success: function(){
        OkStupid.currentUser.fetch();
      }
    })
  },

  fileSelect: function(event){
    var that = this;
    var imageFile = event.currentTarget.files[0];
    var reader = new FileReader();

    reader.onloadend = function(){
      that._updatePreview(reader.result);
      OkStupid.currentUser._avatar = reader.result;
      console.log(this.result)
      console.log(OkStupid.currentUser)

    }

    if(imageFile){
      reader.readAsDataURL(imageFile);
    } else {
      this._updatePreview("");
    }
  },

  showAvatarEdit: function(event){
    console.log("SUNK MY BATTLESHIP")
    $("form#change-avatar").removeClass("hidden");
  },

  showMessageModal: function(event){
    event.preventDefault();

    $("form#message-modal").removeClass("hidden");
  },

  closeMessageModal: function(event){
    event.preventDefault();

    $("form#message-modal").addClass("hidden");
  },

  minimizeMessageModal: function(event){
    event.preventDefault();

    $("form#message-modal").addClass("minimized");
    $("i.minimize").addClass("hidden");
    $("i.maximize").removeClass("hidden");
    $("img.tinypicture").addClass("hidden");
  },

  maximizeMessageModal: function(event){
    event.preventDefault();

    $("form#message-modal").removeClass("minimized");
    $("i.maximize").addClass("hidden");
    $("i.minimize").removeClass("hidden");
    $("img.tinypicture").removeClass("hidden");
  },

  sendMessage: function(event){
    event.preventDefault();

    var formData = $(event.currentTarget).serializeJSON().message;
    var that = this;
    var message = new OkStupid.Models.Message();
    message.save(formData, {
      success: function(){
        OkStupid.messages.add(that.model, { merge: true });
        that.render();
      }
    });
  },

  _updatePreview: function(imageData){
    this.$el.find("#profile-image-preview").attr("src", imageData);
  }
})
