xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Blogs"
    xml.description "Lots of blogs"
    xml.link blogs_url(:rss)
    
    for blog in @blogs
      xml.item do
        xml.title blog.title_of_versions
        xml.pubDate blog.created_at.to_s(:rfc822)
        xml.link blog_url(blog)
        xml.guid blog_url(blog, :rss)
      end
    end
  end
end
