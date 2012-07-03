class Admin::PostsController < ApplicationController

  def create
    Post.create(params[:post])
    redirect_to :admin_posts
  end

  def new

  end

  def index
    @posts = Post.all
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to admin_posts_path
  end
end
