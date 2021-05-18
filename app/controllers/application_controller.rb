class ApplicationController < ActionController::Base

  include SessionsHelper

  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def counts(user)
    @counts_collections = user.collections.count
    @counts_favorites = user.likes.count
  end

end
