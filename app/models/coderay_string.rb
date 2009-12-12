class CoderayString < String
  def format
    content = self 
    content.scan(/(\[code\:([a-z].+?)\](.+?)\[\/code\])/m).each do |match|  
      content.gsub!(match[0], CodeRay.scan(match[2].strip, match[1].to_sym).div(:line_numbers => :table,:css => :class))  
    end  
    return content
  end
end
