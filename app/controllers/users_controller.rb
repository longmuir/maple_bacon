class UsersController < ApplicationController
  before_action :signed_in_user, only: [:create, :index, :destroy, :edit, :update, :show]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url if @user.nil?
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user, true)
      flash[:success] = "Welcome to Maple Bacon!"
      redirect_to @user
    else
      render 'new'
    end
  end

private
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
