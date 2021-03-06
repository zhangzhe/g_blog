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
  
  describe "content_blank?" do
    it "should be true if either title or content is blank" do 
      @blog = Blog.create
      @blog.content_blank?.should == true
      @blog.update_attributes(:title => "title", :content => "content")
      @blog.content_blank?.should == false
    end
  end 
end
