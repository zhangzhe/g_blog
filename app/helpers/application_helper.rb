# -*- coding: utf-8 -*-
module ApplicationHelper
  def g_textile(text)
    if text
      result = ""
      while text =~ /(\[code\:([a-z].+?)\](.+?)\[\/code\])/m
        result << FormatableString.new($`).to_html_format + $&
        text = $'
      end
      result << FormatableString.new(text).to_html_format
      return CoderayString.new(result).format
    end
  end
  
  def recent_articles(num = 8)
    blog_type = case I18n.locale
                when :en
                  English
                when :zh
                  Chinese
                else
                  Blog
                end
    @blogs = blog_type.find(:all, :conditions => "title is not null", :limit => num, :order => "created_at DESC")
    result = "<ul>"
    @blogs.each do |blog|
      result << "<li>#{link_to(truncate(blog.title, :length => 28), blog_path(blog), :title => blog.title)}</li>"
    end
    result << "</ul>"
  end
  
  def recent_comments(num = 8)
    @comments = Comment.find(:all, :limit => num, :order => "created_at DESC")
    result = "<ul>"
    @comments.each do |c|
      result << "<li>#{link_to(truncate(c.name + ": " + c.content, :length => 28), blog_path(c.blog), :title => c.blog.title)}</li>"
    end
    result << "</ul>"
  end
  
  def e_book
    if book = Pdf.last
      link_to book.filename, book.s3_url
    end
  end
  
  def tag_links(type = Blog)
    result = "tags: "
    type.tag_list.each do |t|
      result << "#{link_to(t, tags_url(:q => t))}, "
    end
    return result[0..-4]
  end
  
  def is_zh?
    is_locale?(:zh)
  end
  
  def is_en?
    is_locale?(:en)
  end
  
  def is_locale?(locale)
    "current_locale" if I18n.locale == locale
  end
  
  def tags
    cloud_tag(tag_url_hash)
  end
  
  def tag_url_hash 
    returning r = { } do 
      Blog.tag_counts.map(&:name).each do |t|
        r[t] = CGI.unescape(tags_url(:q => t))
      end
    end
  end
  
  def title
    if @blogs
      "Keep it simple"
    else
      @blog.try(:title) || "Keep it simple"
    end
  end
  
  def share_to_renren
    %(<a href="javascript:window.open('http://share.renren.com/share/buttonshare.do?title='+encodeURIComponent(document.title.substring(0,76))+'&amp;link='+encodeURIComponent(location.href)+'&amp;content=','_blank','scrollbars=no,width=600,height=450,left=75,top=20,status=no,resizable=yes'); void 0" style="color: rgb(255, 255, 255); text-decoration: none; font-size: 12px; font-weight: normal;">
<span style="padding: 5px 5px 0px; font-size: 12px; margin-left: 10px; cursor: pointer;">
<img alt=#{("share to renren")} src="http://s.xnimg.cn/favicon-rr.ico" align="absMiddle" border="0">&nbsp;#{t("share to renren")}</span></a>)
  end
end
