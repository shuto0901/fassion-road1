class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
    redirect_to personal_post_path(post)
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to personal_post_path(@post)
  end
  
  private
    def post_params
     params.require(:post).permit(:title, :description, :post_image)
    end
end
