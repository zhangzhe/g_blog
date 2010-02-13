# -*- coding: utf-8 -*-
class AboutsController < ApplicationController
  def index
    about_en = "My name is Gary Zhang(zhangzhe). I live in BeiJing, China.

I am a programmer, right now work for [link:idapted]http://www.idapted.com[/link].
I love my job and believe that my work is good for people and will make the world better.
I love beautiful code and am trying to write them to my best. 

In spare time I like exercises. basketball is my favorite. I also like cycling, running and swimming. I took part in two marathons, one triathlon, one ironman and lots of other sport games.

I worked since 2007. Right now I am using Ruby On Rails building the [link:best e-learning system]www.eqenglish.com[/link].

Visit [link:here]http://github.com/zhangzhe[/link] to see more about my apps. Anything unclean please email me at gary20071226@gmail.com.

I will share in this blog about most of technique things I met and part of my personal life. Enjoy:)"
    blank = "<br><br><br><br><br>"
    about_zh = "我叫张哲。居住在中国，北京。

我是一个程序员，目前为 [link:一德]http://www.idapted.com[/link] 工作。
我热爱我的工作，坚信我们正在做的事情是很有意义的。我喜爱优美的代码并一直在尽最大的努力编程。

闲暇时间我很爱运动。篮球是我的最爱。同时我也喜欢游泳，跑步和骑自行车。我参加过两次马拉松，一次奥林匹克铁人赛，一次70.3铁人赛。我很享受这些运动和比赛。 

我2007年开始工作。现在使用 Ruby On Rails 开发最好的在线英语学习系统：[link:EQ英语]www.eqenglish.com[/link]。

可以访问[link:我的 github 账户]http://github.com/zhangzhe[/link]了解我写的代码。我的邮箱地址是： gary20071226@gmail.com。

我会在这个博客上记录大部分技术问题，以及部分生活中有趣的事：）"
    
    if @template.is_en? 
      @about = about_en
    elsif @template.is_zh? 
      @about = about_zh
    else
      @about = about_en + blank + about_zh
    end
    respond_to do |format|
      format.html

      format.pdf do
        render :pdf => "file_name",
        :layout => "application.html",
        :template => "abouts/index.html.erb",
        :margin => {:top => 0, 
          :bottom  => 0, 
          :left  => 0, 
          :right  => 0},
        :toc => {
          :disable_links => false}
      end
    end
  end
end
