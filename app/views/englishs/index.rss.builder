xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "zhangzhe's blogs"
    xml.description "zhangzhe's blogs"
    xml.link blogs_url(:rss)
    for blog in @blogs
      xml.item do
        xml.title blog.title
        xml.description g_textile(blog.content)
        xml.pubDate blog.created_at.to_s(:rfc822)
        xml.link blog_url(blog)
      end
    end
  end
end




        # xml.title article.name
        # xml.description article.content
        # xml.pubDate article.created_at.to_s(:rfc822)
        # xml.link formatted_article_url(article, :rss)
        # xml.guid formatted_article_url(article, :rss)
