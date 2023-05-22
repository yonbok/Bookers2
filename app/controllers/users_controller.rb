class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.all
    @user.update
    redirect_to books
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
