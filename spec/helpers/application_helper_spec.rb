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
       @g_textile_expect_output = %(no cheat sheet anymore<br/>\n\r<br/>\n\r<img style=\"float:right\" src=\"http://s3.amazonaws.com/recordings.idapted.com/upload_files/6/cheat_sheet.jpg\"><br/>\n\rAll the times I used cheat sheet to struggle my bad memory. <br/>\n\r<br/>\n\r<ul><li><font color='#FF2D2D'>RAILS sheet</font></li><li><font color='#FF2D2D'>MYSQL sheet</font></li><li><font color='#FF2D2D'>PROTOTYPE sheet</font></li></ul><br/>\n\rNo need anymore!!! <br/>\n\r<br/>\n\r<span style=\"font-size:17px\"><a target=\"_blank\" style=\"color:\#2828FF\" href=http://cheat.errtheblog.com>cheat</a></span> Comes.<br/>\n\r<br/>\n\r<b>install</b><br/>\n\rsudo gem install cheat<br/>\n\r<br/>\n\r<div class=\"CodeRay\">\n  <div class=\"code\"><pre><span class=\"r\">def</span> <span class=\"fu\">test</span>\n   puts <span class=\"s\"><span class=\"dl\">&quot;</span><span class=\"k\">sss</span><span class=\"dl\">&quot;</span></span>\n  <span class=\"r\">end</span></pre></div>\n</div>\n<br/>\n\r<br/>\n\r<b>use</b><br/>\n\rcheat <sheet name><br/>\n\r<br/>\n\r<b>check all</b><br/>\n\rcheat sheets<br/>\n\r<br/>\n\r<div class=\"CodeRay\">\n  <div class=\"code\"><pre><span class=\"r\">def</span> <span class=\"fu\">test</span>\n   puts <span class=\"s\"><span class=\"dl\">&quot;</span><span class=\"k\">sss</span><span class=\"dl\">&quot;</span></span>\n  <span class=\"r\">end</span></pre></div>\n</div>\n<br/>\n\r<br/>\n\r<b>help</b><br/>\n\rcheat cheat<br/>\n\r)
  end
  
  # FIXME
  # describe "g_textile(text)" do 
  #   it "should do gary textile right" do 
  #     g_textile(@g_textile_input).should == @g_textile_expect_output
  #   end
  # end
  
  # describe "recent(num)" do 
  #   it "should return 3 of recent blog_groups" do 
  #     blogs = []
  #     3.times do |i|
  #       bg = BlogGroup.create
  #       blog = English.create(:title => i)
  #       blogs << blog
  #       bg.blogs << blog
  #     end
  #     ids = blogs.map(&:id)
  #     recent(3).should == "<ul><li><a href=\"/blogs/#{ids[0]}-0\" title=\"0\">0</a></li><li><a href=\"/blogs/#{ids[1]}-1\" title=\"1\">1</a></li><li><a href=\"/blogs/#{ids[2]}-2\" title=\"2\">2</a></li></ul>"
      
  #   end
  # end
end
