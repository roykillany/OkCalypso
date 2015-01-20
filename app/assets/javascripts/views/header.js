OkStupid.Views.Header = Backbone.View.extend({
  template: JST["shared/header"],

  initialize: function(options){
    this.listenTo(OkStupid.currentUser, "signIn signOut change", this.render);
    this.render();
  },

  events: {
    "click #sign-out-link": "signOut"
  },

  render: function(){
    var that = this;

    OkStupid.currentUser.fetch({
      success: function(){
        var content = that.template({
          currentUser: OkStupid.currentUser
        });
        that.$el.html(content);

        return that;
      }
    });
  },

  signOut: function(event){
    event.preventDefault();
    OkStupid.currentUser.signOut({
      success: function(){
        Backbone.history.navigate("session/new", { trigger: true });
      }
    });
  }
});
