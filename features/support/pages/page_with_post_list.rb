module PageWithPostList
  include Gizmo::PageMixin

  def posts
    page.all(".post").collect do |item|
      {
        :title => item.find("h3").text,
        :content => item.find("p").text
      }
    end
  end

  def has_post? post
    !post.nil? && posts.any? {|item|item[:title] == post.title && item[:content] == post.content}
  end
end
