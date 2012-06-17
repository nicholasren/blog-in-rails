module PageWithPostList
  include Gizmo::PageMixin

  def posts
    page.all(".posts ul li")[1..-1].collect do |item|
      {
        :title => item.find(".title").text,
        :content => item.find(".content").text
      }
    end
  end
end
