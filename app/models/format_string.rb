  class FormatString < String
    def html_format
      content = self
      self.class.subclasses.each do |rule|
        content = rule.constantize.new(content).convert
      end
      return content.gsub("\n", "<br/>\n\r").gsub("\t", "&nbsp;&nbsp;")
    end
  end
  
  class FormatFontSize < FormatString
    def convert
      content = self
      content.gsub!(/\[f1\](.+)\[\/f1\]/,'<span style="font-size:17px">\1</span>')
      return content
    end
  end
  
  class FormatStringColor < FormatString
    def convert
      content = self
      content.gsub!(/\[green\](.+?)\[\/green\]/, '<font color="#33CC00">\1</font>')
      content.gsub!(/\[red\](.+?)\[\/red\]/, '<font color="#FF2D2D">\1</font>')
      content.gsub!(/\[blue\](.+?)\[\/blue\]/, '<font color="#2828FF">\1</font>')
      return content
    end
  end
  
  class FormatImage < FormatString
    def convert
      content = self
      content.gsub!(/\[img(:*.*)\](.+?)\[\/img\]/,'<img style="float\1" src="\2">')
      return content
    end
  end
  
  class FormatStringUrl < FormatString
    def convert
      content = self
      content.gsub!(/\[link:(.+?)\](.+?)\[\/link\]/, '<a target="_blank" href=\2><u>\1</u></a>')
      return content
    end
  end
  
  class FormatStringRule < FormatString
    @content = ""
    def convert
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
      CONFIG["rules"]['tag'].each do |key, value|
        while (@content =~ /#{"\\"+key}(.+?)#{"\\"+key}/m and $& !~ /#{"\\"+key}([A-Z]+?)\%/ and @content =~ /#{"\\"+key}(.+?)#{"\\"+key}/m)
          if !$&.include?(key+key)
            @content = $` + value.delete("/") + $1 + value + $'
          else
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
      CONFIG["rules"]['tag'].each_key do |key|
        un_escape_rule << [Kernel.rand.to_s, key]
      end
      return un_escape_rule
    end
    
    def generate_escape_rule(un_escape_rule)
      escape_rule = un_escape_rule.map{|rule| ["\\"+rule[1],rule[0]]}
      return escape_rule
    end
    
    def escape(escape_rules)
      escape_rules.each { |escape_rule| @content.gsub!(escape_rule[0],escape_rule[1]) }
    end
  end

  #importent to put it in the end
  class FormatStringList < FormatString
    def convert
      content = self + "\n"
      content.gsub!(/(^\* [^\n]+\n)+/) { |ul| "<ul>#{ul.gsub!(/\* [^\n]+\n/){|li| "<li>#{li[2..-2]}</li>"} }</ul>" }
      return content
    end
  end
