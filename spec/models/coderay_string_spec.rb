require 'spec_helper'
describe CoderayString do
  before :all do 
    @coderay_input = "
[code:ruby]
  def test
   puts 'sss'
  end
[/code]"
    @coderay_expect_output = "\n<div class=\"CodeRay\">\n  <div class=\"code\"><pre><span class=\"r\">def</span> <span class=\"fu\">test</span>\n   puts <span class=\"s\"><span class=\"dl\">'</span><span class=\"k\">sss</span><span class=\"dl\">'</span></span>\n  <span class=\"r\">end</span></pre></div>\n</div>\n"
  end
  
  describe "format" do 
    it "should format code as Coderay" do
      CoderayString.new(@coderay_input).format.should ==  @coderay_expect_output
    end 
  end
end
