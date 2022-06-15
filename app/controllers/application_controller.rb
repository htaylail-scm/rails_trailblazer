class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?, :admin?, :user?

  before_action :set_cache_headers

  private
  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Mon, 01 Jan 1990 00:00:00 GMT"
  end
  
  def current_user
    # User.find_by(id: cookies.signed[:user_id])
    User.find_by(id: session[:user_id])
  end

  def admin?
    current_user.role.to_i.zero? if current_user
  end

  def user?
    current_user.role.to_i == 1 if current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/welcome' unless logged_in?
  end

  def AdminAuthorized
    redirect_to '/welcome' unless admin?
  end
  
  def check_resource(resource)
    if resource 
      true
    else 
      render :file => Rails.root.join('public', '404.html'),  :status => 404
    end
  end
end