require File.dirname(__FILE__) + '/../spec_helper'
describe Blog do
  describe "to_param" do 
    it "should return (id + title) as params" do 
      blog = Blog.create(:title => "test to param")
      blog.to_param.should match /(\d+)-test-to-param/
    end
  end
  
  describe "brother" do 
    it "should return the brohter english version blog" do 
      @page_group = BlogGroup.create
      @english = English.create
      @chinese = Chinese.create
      @page_group.blogs << @english
      @page_group.blogs << @chinese
      @english.brother.should == @chinese
      @chinese.brother.should == @english
    end
  end
end
