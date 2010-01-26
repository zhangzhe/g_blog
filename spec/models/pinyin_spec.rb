# -*- coding: utf-8 -*-
require 'spec_helper'
describe PinYin do
  describe "to_permlink" do 
    it do
      PinYin.instance.to_permlink("你好").should == "ni-hao"
    end
  end
  
  describe "to_pinyin" do 
    it do
      PinYin.instance.to_pinyin("你好").should == "ni hao"
    end
  end
end
