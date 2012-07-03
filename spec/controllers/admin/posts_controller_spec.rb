require "spec_helper"

describe Admin::PostsController do
  it "should destroy specified post" do
    post_id = "2"
    Post.should_receive(:find).with(post_id).and_return(mock(Post, :destroy => true))
    delete :destroy, :id => post_id
  end
end
