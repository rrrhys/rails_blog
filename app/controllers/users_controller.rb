class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User was created."
      redirect_to @user
    else
      flash[:error] = "User not created."
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
  end
  def check_signin
    @user = User.find_by_email(params[:user][:email].to_s)
    if @user && @user.authenticate(params[:user][:password])
      flash[:notify] = "OK!"
      sign_in(@user)
      redirect_to(@user)
    else
      flash[:notify] = "hmm"
      redirect_to signin_path
    end
  end
  def signin

  end

  def signout
  end
end
