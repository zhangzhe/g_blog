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
  
  def recent
    @blog_groups = BlogGroup.find(:all, :limit => 3, :order => "created_at DESC")
    result = "<ul>"
    @blog_groups.each do |blog_group|
      result << "<li>#{link_to(blog_group.title, blog_group_path(blog_group))}</li>"
    end
    result << "</ul>"
  end
end
