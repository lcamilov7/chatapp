class Authentication::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
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
