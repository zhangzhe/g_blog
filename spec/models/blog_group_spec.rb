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
  
  describe "content" do
    it "should generate a mix of chinese content and english content" do 
      @blog_group.chinese = Chinese.create(:title => "我强壮", :content => "强壮的内容")
      @blog_group.english = English.create(:title => "I am strong", :content => "strong's content")
      @blog_group.content.should == "我强壮/n/n强壮的内容/n/n/nI am strong/n/nstrong's content"
    end
  end
end
