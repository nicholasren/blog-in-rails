module PageWithPostDetail
  include Gizmo::PageMixin

  def posts
  page.all("body") .collect do |item|
    {
        :title => item.find("div.title").text,
        :content => item.find("div.content").text,
        :created_at => item.find("div.createdAt").text
    }
    end
  end

  def has_post? post
    puts "post is of class #{post.class}"
    !post.nil? && posts.any? do |item|
      item[:title] == post.title && item[:content] == post.content && item[:created_at] == "Created at #{post.created_at}"
    end
  end
end
