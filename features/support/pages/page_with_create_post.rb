module PageWithCreatePost
  include Gizmo::PageMixin

  def create post_attributes
    post_attributes.each do |key, value|
      fill_in(key, :with => value)
    end
    page.find("input[type='submit']").click()
  end

end
