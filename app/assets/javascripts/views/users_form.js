OkStupid.Views.UsersForm = Backbone.View.extend({
  template: JST["users/form"],

  initialize: function(options){
    this.listenTo(this.model, "sync change", this.render);
  },

  events: {
    "submit form": "submit"
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

    this.model.set(userData);
    this.model.save({}, {
      success: function(){
        OkStupid.currentUser.fetch({
          success: function(){
            OkStupid.users.add(that.model, { merge: true });
            Backbone.history.navigate("", { trigger: true });
          }
        });
      },
      error: function(data){
        alert("You're not foolin' anyone skippy!");
      }
    });
  }
});
