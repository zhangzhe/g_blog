# -*- coding: utf-8 -*-
require 'spec_helper'

describe BlogGroup do
  before :all do 
    @blog_group = BlogGroup.create
  end
  
  describe "title" do
    it "should generate a mix of chinese title and english title" do 
      @blog_group.chinese = Chinese.create(:title => "我强壮")
      @blog_group.english = English.create(:title => "I am strong")
      @blog_group.title.should == "我强壮(I am strong)"
    end
  end
end
