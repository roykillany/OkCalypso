class Api::SearchesController < ApplicationController
  def index
    print "hits searches controller"

    @search_results = User
      .search_by_attr(params[:query])
      .page(params[:page])

    print "#{@search_results}"
  end
end
