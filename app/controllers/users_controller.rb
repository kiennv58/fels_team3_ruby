class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
  	@user = User.new user_params
    if @user.save
      /redirect_to login_path/
      log_in @user
      flash[:success] = "Success! Welcome to Japan!"
      redirect_to profile_path
    else
      render 'new'
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end
  private
  def user_params
  	params.require(:user).permit :name,:email,:password,:password_confirmation
  end
end
