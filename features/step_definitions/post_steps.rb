Given /^the blogger is on creating post page$/ do
  visit new_admin_post_path
end

When /^the blogger create blog with the following detail:$/ do |detail|
  blog_attributes = detail.rows_hash
  @created_post = Post.new(blog_attributes)
  blog_attributes.each do |key, value|
    fill_in(key, :with => value)
  end
  page.find("input[type='submit']").click()
end

Then /^the created blog should be shown on blog list page$/ do
  visit posts_path
  on_page_with :post_list do |page|
    page.has_post?(@created_post).should be_true
  end
end

Given /^the blogger has a post with the following details:$/ do |attributes|
  @created_post = Post.create(attributes.rows_hash) 
end

When /^the blogger delete the blog with title "(.*?)"$/ do |title|
  visit admin_posts_path
  on_page_with :admin_post_list do |page|
    post = Post.find_by_title title
    page.delete post
  end
end

Then /^there will not be a post with title "(.*?)" on blog list page$/ do |title|
  visit posts_path
  on_page_with :post_list do |page|
    page.has_post?(@created_post).should be_false
  end
end

