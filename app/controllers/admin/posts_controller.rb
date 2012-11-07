class Admin::PostsController < ApplicationController

  def create
    Post.create(params[:post])
    redirect_to :admin_posts
  end

  def new

  end

  def edit
    @post = Post.find(params[:post_id])
  end

  def update
    Post.find(params[:id]).update_attributes(params[:post])
    redirect_to :admin_posts
  end

  def index
    @posts = Post.all
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to admin_posts_path
  end
end
