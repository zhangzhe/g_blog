require File.dirname(__FILE__) + '/../spec_helper'
describe Blog do
  before :each do
    @page = Blog.create
  end
  
  describe "test" do 
    it "should work" do 
      1.should == 1
    end
  end
end

