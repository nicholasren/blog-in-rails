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
  on_page_with :post_list do
    matched_post = posts.collect do |post|
      post[:title] == @created_post.title && post[:content] == @created_post.content
    end
    matched_post.should_not be_nil
  end
end