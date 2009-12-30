# -*- coding: utf-8 -*-
desc 'Create data for blogs'
namespace :data do
  task :prepare => :environment do
    `rake db:migrate:reset`
    (1..20).each do |i|
      p "prepare blog #{i}"
      blog_group = BlogGroup.create 
      blog_group.blogs << Chinese.create(:title => "张哲的博客测试第#{i}篇", :content => "张哲的博客测试第#{i}篇"*50)
      blog_group.blogs << English.create(:title => "zhangzhe's blog test number #{i}", :content => "zhangzhe's blog test number #{i}"*50)
    end
  end
end
