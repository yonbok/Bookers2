class UsersController < ApplicationController

  def show
  end


  def edit
    @user = User.find(params[:id])
    @user.edit
    if @user.save
      redirect_to books_url
    else
      redirect_to edit
    end
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