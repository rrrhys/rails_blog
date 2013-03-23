class UsersController < ApplicationController
  def new
    @users = User.all
    if @users.length > 0
      #for personal blog disable signup
      flash[:error] = "Only 1 user allowed currently."
      redirect_to :root
    end
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
      redirect_to :signin
    end
  end
  def signin

  end

  def signout
    sign_out()
    redirect_to :signin
  end
  def posts
  @user_id = params[:id].to_i
    @posts = Post.find(:all, :conditions => {:user_id => @user_id})
    render :partial => "layouts/relevant_posts"
  end
end
