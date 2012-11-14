require 'spec_helper'

describe "posts", :type => :request, :js => true do

  after (:each) do
    @posts = Post.all
    visit admin_posts_path
    @posts.each do |post|
      on_page_with :admin_post_list do |page|
        page.delete post
      end
    end
  end

  it "should show post list" do
    visit posts_path
    page.should have_selector(".brand", :text => "Blog on Rails")
  end

  it "could create post" do
    post_attributes = {"title" => "my first blog", "content" => "I will tell you a long long story"}

    visit new_admin_post_path
    on_page_with :create_post do |page|
      page.create post_attributes 
    end

    visit posts_path
    on_page_with :post_list do |page|
      page.has_post?(Post.new(post_attributes)).should be_true
    end
  end

  it "should view details of a created post" do
    post_attributes = {"title" => "my test post", "content" => "This is content of the test post"}

    visit new_admin_post_path
    on_page_with :create_post do |page|
      page.create post_attributes
    end

    test_post = Post.find_by_title("my test post")
    visit "/posts/#{test_post.id}"
    on_page_with :post_detail do |page|
      page.has_content?("This is content of the test post").should be_true
    end
  end
end
