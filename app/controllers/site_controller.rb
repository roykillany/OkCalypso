class SiteController < ApplicationController
  before_action :ensure_logged_in

  def root
    @current_user = current_user
  end
end
