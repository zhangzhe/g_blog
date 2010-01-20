require 'spec_helper'
# describe FormatableString do
#   describe "to_html_format" do 
#     it "should call it's subclasses and format itself to html format(FIXME)" do
#       string = FormatableString.new("*b*c\n* 11\n* 22\naa[f1]bb[/f1]cc[red]r[/red][img]www.gary.com[/img][link:gary]www.gary.com[/link]") 
#       string.to_html_format.should == "<b>b</b>c<br/>\n\r<ul><li>11</li><li>22</li></ul>aa<span style=\"font-size:17px\">bb</span>cc<font color='#FF2D2D'>r</font><img style=\"float\" src=\"www.gary.com\"><a target=\"_blank\" style=\"color:#2828FF\" href=www.gary.com>gary</a>"
#     end 
#   end
# end

# describe NString do
#   describe "format" do 
#     it "should convert \n to <br/>\n\r" do
#       n_string = NString.new("\na\tb\n")
#       n_string.format.should == "<br/>\n\ra&nbsp;&nbsp;b<br/>\n\r"
#     end 
#   end
# end

# describe FontSizeString do
#   describe "format" do 
#     it "should format font size" do
#       font_size_string = FontSizeString.new("aa[f1]bb[/f1]cc")
#       font_size_string.format.should == 'aa<span style="font-size:17px">bb</span>cc'
#     end 
#   end
# end

# describe FontColorString do
#   describe "format" do 
#     it "should format font color" do
#       font_color_string = FontColorString.new("[green]g[/green][red]r[/red][blue]b[/blue]")
#       font_color_string.format.should == "<font color='#33CC00'>g</font><font color='#FF2D2D'>r</font><font color='#2828FF'>b</font>"
#     end 
#   end
# end

# describe ImageString do
#   describe "format" do 
#     it "should format image input into html image" do
#       image_string = ImageString.new("[img]www.gary.com[/img]")
#       image_string.format.should == '<img style="float" src="www.gary.com">'
#       image_string = ImageString.new("[img:right]www.gary.com/gary.gif[/img]")
#       image_string.format.should == '<img style="float:right" src="www.gary.com/gary.gif">'
#     end 
#   end
# end

describe UrlString do
  describe "format" do 
    it "should format url input into html url" do
      url_string = UrlString.new("[link:gary]www.gary.com[/link]")
      url_string.format.should == '<a target="_blank" style="color:#2828FF" href=www.gary.com>gary</a>'
     end 
  end
end

describe RuleString do
  describe "format" do 
    it "should format rules" do
      rule_string = RuleString.new("*b*_i_+u+")
      rule_string.format.should == "<b>b</b><i>i</i><u>u</u>"
     end 
    
    it "should escape \\" do
      rule_string = RuleString.new("*b*_i_+u+1\+1=2* \\*\\* *")
      rule_string.format.should == "<b>b</b><i>i</i><u>u</u>1+1=2<b> ** </b>"
     end
  end
end

describe ListString do
  describe "format" do 
    it "should format list" do
      list_string = ListString.new("* 11\n* 22\n *nn")
      list_string.format.should == "<ul><li>11</li><li>22</li></ul> *nn"
     end 
  end
end
