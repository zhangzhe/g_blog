require 'spec_helper'
include ApplicationHelper
# duplicate test good or bad?
describe ApplicationHelper do
  before :all do 
    @g_textile_input = 'no cheat sheet anymore

[img:right]http://s3.amazonaws.com/recordings.idapted.com/upload\_files/6/cheat\_sheet.jpg[/img]
All the times I used cheat sheet to struggle my bad memory. 

* [red]RAILS sheet[/red]
* [red]MYSQL sheet[/red]
* [red]PROTOTYPE sheet[/red]

No need anymore!!! 

[f1][link:cheat]http://cheat.errtheblog.com[/link][/f1] Comes.

*install*
sudo gem install cheat

[code:ruby]
  def test
   puts "sss"
  end
[/code]

*use*
cheat <sheet name>

*check all*
cheat sheets

[code:ruby]
  def test
   puts "sss"
  end
[/code]

*help*
cheat cheat
'
       @g_textile_expect_output = %(no cheat sheet anymore<br/>\n\r<br/>\n\r<img style=\"float:right\" src=\"http://s3.amazonaws.com/recordings.idapted.com/upload_files/6/cheat_sheet.jpg\"><br/>\n\rAll the times I used cheat sheet to struggle my bad memory. <br/>\n\r<br/>\n\r<ul><li><font color='#FF2D2D'>RAILS sheet</font></li><li><font color='#FF2D2D'>MYSQL sheet</font></li><li><font color='#FF2D2D'>PROTOTYPE sheet</font></li></ul><br/>\n\rNo need anymore!!! <br/>\n\r<br/>\n\r<span style=\"font-size:17px\"><a target=\"_blank\" href=http://cheat.errtheblog.com><u>cheat</u></a></span> Comes.<br/>\n\r<br/>\n\r<b>install</b><br/>\n\rsudo gem install cheat<br/>\n\r<br/>\n\r<table class=\"CodeRay\"><tr>\n  <td class=\"line_numbers\" title=\"click to toggle\" onclick=\"with (this.firstChild.style) { display = (display == '') ? 'none' : '' }\"><pre>1<tt>\n</tt>2<tt>\n</tt>3<tt>\n</tt></pre></td>\n  <td class=\"code\"><pre ondblclick=\"with (this.style) { overflow = (overflow == 'auto' || overflow == '') ? 'visible' : 'auto' }\"><span class=\"r\">def</span> <span class=\"fu\">test</span><tt>\n</tt>   puts <span class=\"s\"><span class=\"dl\">&quot;</span><span class=\"k\">sss</span><span class=\"dl\">&quot;</span></span><tt>\n</tt>  <span class=\"r\">end</span></pre></td>\n</tr></table>\n<br/>\n\r<br/>\n\r<b>use</b><br/>\n\rcheat <sheet name><br/>\n\r<br/>\n\r<b>check all</b><br/>\n\rcheat sheets<br/>\n\r<br/>\n\r<table class=\"CodeRay\"><tr>\n  <td class=\"line_numbers\" title=\"click to toggle\" onclick=\"with (this.firstChild.style) { display = (display == '') ? 'none' : '' }\"><pre>1<tt>\n</tt>2<tt>\n</tt>3<tt>\n</tt></pre></td>\n  <td class=\"code\"><pre ondblclick=\"with (this.style) { overflow = (overflow == 'auto' || overflow == '') ? 'visible' : 'auto' }\"><span class=\"r\">def</span> <span class=\"fu\">test</span><tt>\n</tt>   puts <span class=\"s\"><span class=\"dl\">&quot;</span><span class=\"k\">sss</span><span class=\"dl\">&quot;</span></span><tt>\n</tt>  <span class=\"r\">end</span></pre></td>\n</tr></table>\n<br/>\n\r<br/>\n\r<b>help</b><br/>\n\rcheat cheat<br/>\n\r)
  end
  
  describe "g_textile(text)" do 
    it "should do gary textile right" do 
      g_textile(@g_textile_input).should == @g_textile_expect_output
    end
  end
end
