class Authentication::UsersController < ApplicationController
  skip_before_action :protect_pages, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to(new_authentication_user_path, notice: 'User created')
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
