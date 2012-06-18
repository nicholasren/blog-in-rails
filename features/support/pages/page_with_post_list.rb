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
end
