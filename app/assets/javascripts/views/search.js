OkStupid.Views.Search = Backbone.View.extend({
  initialize: function(){
    this.searchResults = new OkStupid.Collections.SearchResults();
    this.listenTo(this.searchResults, "sync", this.renderSearchResults);
  },

  events: {
    "click .search": "search",
    "click .next-page": "nextPage"
  },

  template: JST["shared/search"],

  render: function(){
    var content = this.template({
      collection: this.searchResults
    });

    this.$el.html(content);

    return this;
  },

  renderSearchResults: function(){
    var container = this.$(".search-results");

    this.searchResults.each(function(model){
      var template;
      template = JST["users/list_item"]

      container.append(template({
        model: model
      }));
    });
  },

  search: function(event){
    event.preventDefault();
    console.log("hits search function")
    this.searchResults._query = this.$(".query").val();
    console.log(this.searchResults._query)
    this.searchResults.fetch({
      data: {query: this.searchResults._query}
    });
  },

  nextPage: function(event){
    this.searchResults.fetch({
      data: {
        query: this.searchResults._query,
        page: (this.searchResults._page || 1) + 1
      }
    });
  }
})
