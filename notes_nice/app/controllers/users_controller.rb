class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index,:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  def index
    @users = User.paginate(page: params[:page],per_page: 3)
  end

  def new
    @user = User.new
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end


  def show
     @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      sign_in @user
      redirect_to @user
      flash[:success] = "Welcome to the Note App!"
      # Handle a successful save.
    else
      render 'new'
    end
  end

  def edit

  end

  def update

    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
#Before filters
  def signed_in_user
      unless signed_in?
      store_location
      redirect_to signin_url
      flash[:danger] = "Please, sign in."
      end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user == @user

  end
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
