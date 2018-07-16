class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #include Error::ErrorHandler

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate
    redirect_to '/login' unless current_user
  end

   def an_admin
    redirect_to '/login' unless @current_user.is_admin
  end

end
