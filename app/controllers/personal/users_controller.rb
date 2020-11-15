class Personal::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to personal_user_path(@user)
  end
  
  
  private
   def user_params
    params.require(:user).permit(:name, :description, :profile_image)
   end
end
