require 'spec_helper'

describe "posts", :type => :request, :js => true do

  it "should show post list" do
    visit posts_path
    page.should have_selector(".header-inner", :text => "Posts")
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
end
