require 'spec_helper'

describe "posts", :type => :request, :js => true do

  it "should show post list" do
    visit posts_path
    page.should have_selector(".header-inner", :text => "Posts")
  end

  it "could create post" do
    blog_attributes = {"title" => "my first blog", "content" => "I will tell you a long long story"}

    visit new_admin_post_path

    blog_attributes.each do |key, value|
      fill_in(key, :with => value)
    end

    page.find("input[type='submit']").click()

    visit posts_path
    on_page_with :post_list do |page|
      page.has_post?(Post.new(blog_attributes)).should be_true
    end
  end

  def save_and_open_page
    require 'capybara/util/save_and_open_page'
    Capybara.save_and_open_page(body)
  end
end
