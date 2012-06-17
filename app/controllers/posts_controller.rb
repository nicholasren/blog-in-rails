class PostsController < ApplicationController

  def create
    Post.create(params[:post])
    redirect_to :posts
  end

  def new

  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
end
