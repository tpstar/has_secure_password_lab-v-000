class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
#    return head(:forbidden) unless @user.authenticate(params[:password])
    if user_params[:password] == user_params[:password_confirmation]
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
