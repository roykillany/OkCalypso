OkStupid.Views.SignIn = Backbone.View.extend({
  initialize: function(options){
    this.callback = options.callback;
    this.listenTo(OkStupid.currentUser, "signIn", this.signInCallback);
  },

  events: {
    "submit form": "submit",
    "click a#guest-login": "guestLogin"
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

    $("#guest-login").addClass("loading");
    $("div.loading").removeClass("loading");

    $.ajax( '/api/guestuser', {
      type: 'POST',
      success: function(){
        console.log("Welcome, guest!");
        OkStupid.currentUser.fetch({
          success: function(){
            OkStupid.users.add(OkStupid.currentUser, { merge: true });
            Backbone.history.navigate("", { trigger: true });
          }
        })
      }
    });
  }
});
