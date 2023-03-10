class CommentController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @comment = Comment.new
  end

  def create
    comment = Comment.new(params.require(:comment).permit(:text))
    comment.author_id = current_user.id
    post_id = Post.find(params[:post_id]).id
    comment.post_id = post_id
    if comment.save
      flash[:success] = 'New post successfully added!'
      redirect_to user_post_path(user_id: current_user.id, id: post_id)
    else
      redirect_to user_index_path, notice: 'Post creation failed'
    end
  end
end
