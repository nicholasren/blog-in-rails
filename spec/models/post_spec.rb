require "spec_helper"
require 'database_cleaner'


describe Post do

  context "Validator must verify that Post " do
    before(:each) do
      @post = FactoryGirl.create(:post)
    end
    it "has a valid factory " do
      @post.should be_valid
    end

    it "is invalid without title " do
      @post.title = ""
      @post.should_not be_valid
    end

    it "is invalid without content " do
      @post.content = ""
      @post.should_not be_valid
      end

    it "is invalid with content more than 1000 characters " do
      @post.content = "a" * 1001
      @post.should_not be_valid
    end

    it "is invalid without content more than 1000 characters " do
      @post.title = "a" * 101
      @post.should_not be_valid
    end
  end
  it "should lock optimistically" do
    p1 = FactoryGirl.create(:post)
    p2 = Post.find(p1.id)

    p1.title = "title"
    p2.title = "another title"
    
    p1.save.should be_true
    expect{p2.save}.to raise_error(ActiveRecord::StaleObjectError)
  end
end
