class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.category_id = params[:id]
    if @post.save
      redirect_to show_path(params[:id], @post)
    else
      render :new
    end
  end

  def show
    # @category =
    @post = Post.find params[:post_id]
    p @post
  end

  private
    def post_params
      params.require(:post).permit(:title, :description, :email, :price, :category_id)
    end
end
