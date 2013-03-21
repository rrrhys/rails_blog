class PostsController < ApplicationController
  def index
  Post.order("created_at desc")
    @posts = Post.all()
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	auth_check

  end
  def edit
  	@post = Post.find(params[:id])
  	render 'new'
  end
  def update
  	auth_check

  	#check user can edit this post.
  	@post = Post.find(params[:id])
  	if @post.update_attributes(params[:post])
	  	redirect_to post_path(@post.id)
	  else
	  	render 'edit'
	  end
  end
  def create
  	@post = Post.new(params[:post])
  	@post.user_id = current_user.id
  	if @post.save
  		flash[:notice] = "New post was saved!"
  		redirect_to post_path(@post.id)
  	else
  		render 'new'
  	end
  end
end
