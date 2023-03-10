class PostController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    post = Post.new(params.require(:post).permit(:title, :text))
    post.author_id = current_user.id
    if post.save
      flash[:success] = 'New post successfully added!'
      redirect_to user_post_index_path(current_user.id)
    else
      redirect_to user_index_path, notice: 'Post creation failed'
    end
  end
end
