OkStupid.Views.SignIn = Backbone.View.extend({
  initialize: function(options){
    this.callback = options.callback;
    this.listenTo(OkStupid.currentUser, "signIn", this.signInCallback);
  },

  events: {
    "submit form": "submit",
    "click button#guest-login": "guestLogin"
  },

  template: JST["shared/sign_in"],

  render: function(){
    this.$el.html(this.template());

    return this;
  },

  submit: function(event){
    event.preventDefault();
    console.log("submit")
    var $form = $(event.currentTarget);
    var formData = $form.serializeJSON().user;

    OkStupid.currentUser.signIn({
      username: formData.username,
      password: formData.password,
      success: function(){
        Backbone.history.navigate("", { trigger: true })
      },
      error: function(){
        alert("Wrong username/password combination. Please try again.");
      }
    });
  },

  signInCallback: function(event){
    if(this.callback){
      this.callback();
    } else {
      Backbone.history.navigate("", { trigger: true });
    }
  },

  guestLogin: function(event){
    event.preventDefault();
    $("input.username").attr("value", "guest");
    $("input.password").attr("value", "guest");

    var timer = window.setTimeout( function() {
      OkStupid.currentUser.signIn({
        username: "guest",
        password: "guest",
        success: function(){
          Backbone.history.navigate("", { trigger: true })
        }
      });
    }, 175);
  }
});
