OkStupid.Models.Message = Backbone.Model.extend({
  urlRoot: "api/users/user_id/messages",

  parse: function(jsonResp){
    if(jsonResp.sender){
      this.sender().set(jsonResp.sender);
      delete jsonResp.sender
    }
    if(jsonResp.receiver){
      this.receiver().set(jsonResp.receiver);
      delete jsonResp.receiver
    }

    return jsonResp;
  },

  sender: function(){
    if(!this._sender){
      this._sender = new OkStupid.Models.User();
    }

    return this._sender;
  },

  receiver: function(){
    if(!this._receiver){
      this._receiver = new OkStupid.Models.User();
    }

    return this._receiver;
  }
});
