class Admin::PostsController < ApplicationController

  def create
    Post.create(params[:post])
    redirect_to :admin_posts
  end

  def new

  end

  def index

  end
end
