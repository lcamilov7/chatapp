class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :protect_pages

  private

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id] # find_by para que no levante expecion
  end

  def protect_pages
    redirect_to(new_authentication_session_path, alert: 'Not Logged In') unless Current.user
  end
end
