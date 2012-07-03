module PageWithPostList
  include Gizmo::PageMixin

  def posts
    page.all(".post").collect do |item|
      {
        :title => item.find(".title").text,
        :content => item.find(".summary").text
      }
    end
  end

  def has_post? post
    !post.nil? && posts.any? {|item|item[:title] == post.title && item[:content] == post.content}
  end
end
