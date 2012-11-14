module PageWithAdminPostList
  include Gizmo::PageMixin

  def delete post
    page.find("##{post.id}.delete").click
  end

  def create post_attributes
    post_attributes.each do |key, value|
      fill_in(key, :with => value)
    end
    page.find("input[type='submit']").click()
  end
end
