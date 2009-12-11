module ApplicationHelper
  def parse_coderay(text)  
    text.scan(/(\[code\:([a-z].+?)\](.+?)\[\/code\])/m).each do |match|  
      text.gsub!(match[0], CodeRay.scan(match[2].strip, match[1].to_sym).div(:line_numbers => :table,:css => :class))  
    end  
    return text  
  end 
  
  def g_textile(text)
    if text
      result = ""
      if text =~ /(\[code\:([a-z].+?)\](.+?)\[\/code\])/m
        while text =~ /(\[code\:([a-z].+?)\](.+?)\[\/code\])/m
          result << FormatString.new($`).html_format + $& 
          text = $'
        end
      end
      result << FormatString.new(text).html_format
      parse_coderay(result) 
    end
  end
end
