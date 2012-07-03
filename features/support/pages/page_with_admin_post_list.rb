module PageWithAdminPostList
  include Gizmo::PageMixin

  def delete post
    page.find("##{post.id} .delete").click
  end
end
