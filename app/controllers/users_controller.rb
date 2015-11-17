class UsersController < ApplicationController
  before_action :logged_in_user,  only: [:edit, :update]
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json { render json: @users.select(:id, :name, :email).to_json }
    end
  end

  def new
    @user = User.new
    respond_to do |format|

      format.html # show.html.erb
      format.json { render json: @user }

     end
  end

  def create
  	@user = User.new user_params

    respond_to do |format|
      if @user.save
        log_in @user
        format.html do
          flash[:success] = "Success! Welcome to Japan!"
          redirect_to profile_path
        end
        format.json {render json: {user: @user.as_json}, status: :ok}
      else
        format.html{render 'new'}
        format.json{render json: {message: @user.errors.full_messages}, status: 401}
      end
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

  def logged_in_user
      unless  logged_in?
        flash[:danger]  = "Please log in."
        redirect_to login_url
      end
  end
end
