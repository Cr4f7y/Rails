class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def show
    if signed_in?
    @user = User.find(params[:id])
    else
    redirect_to root_path
    flash[:danger] = "Please, sign in!"
    end
  end
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      sign_in @user
      redirect_to @user
      flash[:success] = "Welcome to the Sample App!"
      # Handle a successful save.
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
