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
  
  def recent(num = 8)
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
  
  def tag_links(type = Blog)
    if type == Blog
      tags = type.tag_counts.map(&:name)
      result = "<ul>"
      tags.each do |t|
        result << "<li style='border-bottom: 1px;'>#{link_to(t, tag_path(t))}</li>"
      end
      result << "</ul>"
    else
      result = "tags: "
      type.tag_list.each do |t|
        result << "#{link_to(t, tag_path(t))} "
      end
    end
    return result
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
end
