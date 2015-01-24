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
    // save user
    // generate profile
    // generate preference
    event.preventDefault();

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

    // var orientation = ["Straight", "Gay", "Bisexual", "Demisexual",
    // "Heteroflexible", "Homoflexible", "Lesbian", "Pansexual", "Queer",
    // "Questioning", "Sapiosexual"];
    // var gender = ["Woman", "Man", "Agender", "Androgynous", "Bigender",
    //  "Cis Man", "Cis Woman", "Genderfluid", "Genderqueer", "Gender Nonconforming",
    //   "Hijira", "Intersex", "Non-binary", "Other", "Pangender", "Transfeminine",
    //   "Transgender", "Transmasculine", "Transsexual", "Trans Man", "Trans Woman",
    //   "Two Spirit"];
    //
    // var guestOrientation = orientation[Math.floor(Math.random() * orientation.length)];
    //
    // var guestGender = gender[Math.floor(Math.random() * gender.length)];
    //
    // var guestName = faker.name.userName();
    // while(OkStupid.users.pluck("username").includes(guestName)){
    //   var guestName = faker.name.userName();
    // };
    // var guestPass = faker.internet.password(6);
    //
    // $("input.username").attr("value", guestName);
    // $("input.password").attr("value", guestPass);
    // var userData = {
    //   username: guestName,
    //   email: faker.internet.email(),
    //   password: guestPass,
    //   orientation: guestOrientation,
    //   gender: guestGender,
    //   country: faker.address.country(),
    //   zip_code: faker.address.zipCode(),
    //   avatar: faker.internet.avatar(),
    //   is_guest: true,
    //   searchable: true,
    // }
    //
    // var guest = new OkStupid.Models.User;
    //
    // var timer = window.setTimeout(function(){
    //   guest.save(userData), {
    //     success: function(){
    //       OkStupid.currentUser.fetch({
    //         success: function(){
    //           OkStupid.users.add(guest, { merge: true });
    //           Backbone.history.navigate("", { trigger: true });
    //         }
    //       })
    //     }
    //   }
    // }, 275);
  }
});
