module PageWithPostDetail
  include Gizmo::PageMixin

  def post_details
  page.all("body") .collect do |item|
    {
        :title => item.find("h3.title").text,
        :content => item.find("div.content").text,
        :created_at => item.find("div.createdAt").text
    }
    end
  end
  def has_title? title
    !title.nil? && post_details.any? do |item|
      item[:title] == title
    end
  end
  def has_content? content
    !content.nil? && post_details.any? do |item|
      item[:content] == content
    end
  end
  def created_between? time_before, time_after
    !time_before.nil? && post_details.any? do |item|
      time_on_page = Time.parse(item[:created_at].sub!("Created at ", ""))
      time_on_page >= time_before && time_on_page <= time_after
    end
  end
end
