xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Blogs"
    xml.description "zhangzhe's blogs"
    xml.link blog_groups_url(:rss)
    
    for blog_group in @blog_groups
      xml.item do
        xml.title blog_group.title
        xml.content blog_group.content
        xml.pubDate blog_group.created_at.to_s(:rfc822)
        xml.link blog_group_url(blog_group, :rss)
        xml.guid blog_group_url(blog_group, :rss)
      end
    end
  end
end
