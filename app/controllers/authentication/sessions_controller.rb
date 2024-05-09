class Authentication::SessionsController < ApplicationController
  skip_before_action :protect_pages, only: %i[new create destroy]

  def new; end

  def create
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to(root_path, notice: 'Welcome')
    else
      redirect_to(new_authentication_session_path, alert: 'Wrong Credentials')
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to(new_authentication_session_path, notice: 'Logged out')
  end
end
