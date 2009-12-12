require 'spec_helper'
describe CoderayString do
  before :all do 
    @coderay_input = "
[code:ruby]
  def test
   puts 'sss'
  end
[/code]"
    @coderay_expect_output = "\n<table class=\"CodeRay\"><tr>\n  <td class=\"line_numbers\" title=\"click to toggle\" onclick=\"with (this.firstChild.style) { display = (display == '') ? 'none' : '' }\"><pre>1<tt>\n</tt>2<tt>\n</tt>3<tt>\n</tt></pre></td>\n  <td class=\"code\"><pre ondblclick=\"with (this.style) { overflow = (overflow == 'auto' || overflow == '') ? 'visible' : 'auto' }\"><span class=\"r\">def</span> <span class=\"fu\">test</span><tt>\n</tt>   puts <span class=\"s\"><span class=\"dl\">'</span><span class=\"k\">sss</span><span class=\"dl\">'</span></span><tt>\n</tt>  <span class=\"r\">end</span></pre></td>\n</tr></table>\n"
  end
  
  describe "format" do 
    it "should format code as Coderay" do
      CoderayString.new(@coderay_input).format.should ==  @coderay_expect_output
    end 
  end
end
