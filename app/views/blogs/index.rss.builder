# -*- coding: utf-8 -*-
xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "张哲的博客(zhangzhe's blogs)"
    xml.description "张哲的博客(zhangzhe's blogs)"
    xml.link blogs_url(:rss)
    for blog in @blogs
      xml.item do
        xml.title blog.title
        xml.description g_textile(blog.content)
        xml.pubDate blog.created_at.to_s(:rfc822)
        xml.link blog_url(blog)
        xml.guid blog_url(blog, :rss)
      end
    end
  end
end
