class PostsController < ApplicationController

  def create
    Post.create(params[:post])
  end

  def new

  end

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
end
