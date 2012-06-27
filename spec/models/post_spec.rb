require "spec_helper"

describe Post do
  it "should lock optimistically" do
    p1 = Post.create
    p2 = Post.find(p1.id)

    p1.title = "title"
    p2.title = "another title"
    
    p1.save.should be_true
    expect{p2.save}.to raise_error(ActiveRecord::StaleObjectError)
  end
end
