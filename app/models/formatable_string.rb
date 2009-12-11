  class FormatableString < String
    def to_html_format
      content = self 
      self.class.subclasses.each do |formatable_string|
        content = formatable_string.constantize.new(content).format
      end
      return content
    end
  end
  
  class NString < FormatableString
    def format
      return self.gsub("\n", "<br/>\n\r").gsub("\t", "&nbsp;&nbsp;")
    end
  end

  class FontSizeString < FormatableString
    def format
      return self.gsub(/\[f1\](.+)\[\/f1\]/,'<span style="font-size:17px">\1</span>')
    end
  end
  
  class FontColorString < FormatableString
    COLORS = {"green" => "#33CC00", "red" => "#FF2D2D", "blue" => "#2828FF"}
    def format
      content = self
      COLORS.each do |key, value|
        content.gsub!(/\[#{key}\](.+?)\[\/#{key}\]/, '<font color=\'' + value + '\'>\1</font>')
      end
      return content
    end
  end
  
  class ImageString < FormatableString
    def format
      return self.gsub(/\[img(:*.*)\](.+?)\[\/img\]/,'<img style="float\1" src="\2">')
    end
  end
  
  class UrlString < FormatableString
    def format
     return self.gsub(/\[link:(.+?)\](.+?)\[\/link\]/, '<a target="_blank" href=\2><u>\1</u></a>')
    end
  end
  
  class RuleString < FormatableString
    RULES = {"*" => "</b>", "_" => "</i>", "+" => "</u>"}
    def format
      @content = self
      unescape_rule = generate_unescape_rule
      escape_rule = generate_escape_rule(unescape_rule)
      escape(escape_rule)
      convert_with_tag
      escape(unescape_rule)
      return @content
    end
    
    private
    def convert_with_tag
      escape_rules =[]
      RULES.each do |key, value|
        while (@content =~ /#{"\\"+key}(.+?)#{"\\"+key}/m and $& !~ /#{"\\"+key}([A-Z]+?)\%/ and @content =~ /#{"\\"+key}(.+?)#{"\\"+key}/m)
          if !$&.include?(key + key)
            @content = $` + value.delete("/") + $1 + value + $'
          else#?
            if @content =~ /#{"\\"+key}(.+)#{"\\"+key}/m
              escape_rule = [Kernel.rand.to_s, $&]
              escape_rules << escape_rule
              @content = $` + escape_rule[0] + $' 
            end
          end
        end
      end
      escape_rules.each do |escape_rule|
        @content.gsub!(escape_rule[0],escape_rule[1])
      end
    end
    
    def generate_unescape_rule
      un_escape_rule = []
      RULES.each_key do |key|
        un_escape_rule << [Kernel.rand.to_s, key]
      end
      return un_escape_rule
    end
    
    def generate_escape_rule(un_escape_rule)
      escape_rule = un_escape_rule.map{|rule| ["\\" + rule[1], rule[0]]}
      return escape_rule
    end
    
    def escape(escape_rules)
      escape_rules.each { |escape_rule| @content.gsub!(escape_rule[0], escape_rule[1]) }
    end
  end

  #importent to put it in the end
  class ListString < FormatableString
    def format
      content = self + "\n" # add \n
      content.gsub!(/(^\* [^\n]+\n)+/) {|ul| "<ul>#{ul.gsub!(/\* [^\n]+\n/){|li| "<li>#{li[2..-2]}</li>"} }<\/ul>"}
      return content[0..-2] # remove \n
    end
  end
