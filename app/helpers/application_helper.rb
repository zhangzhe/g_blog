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
  
  def recent(num = 3)
    @blogs = English.find(:all, :limit => num, :order => "created_at DESC")
    result = "<ul>"
    @blogs.each do |blog|
      result << "<li>#{link_to(truncate(blog.title, :length => 28), blog_path(blog), :title => blog.title)}</li>"
    end
    result << "</ul>"
  end
end
