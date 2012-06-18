Given /^the blogger is on creating post page$/ do
  visit new_post_path
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
  on_page_with :post_list do |page|
    page.posts.any? {|post| post[:title] == @created_post.title && post[:content] == @created_post.content}.should be_true
  end
end
