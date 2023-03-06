class PostController < ApplicationController
    def index
        @posts = Post.all
    end
    def show
        @post = Post.find(params[:id])
        @comments = Comment.where(post_id: params[:id])
    end
end