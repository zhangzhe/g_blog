# -*- coding: utf-8 -*-
class AboutsController < ApplicationController
  def index
    @about = "My name is 张哲(Gary Zhang, zhangzhe). I live in BeiJing, China.

I am a programmer, right now work for [link:idapted]http://www.idapted.com[/link].
I love my job and believe that my work is good for people and will make the world better.
I love beautiful code and am trying to write them to my best. 

In spare time I like exercises. basketball is my favorite. I also like cycling, running and swimming. I took part in two marathons, one triathlon, one ironman and lots of other sport games.

I worked since 2007. Right now I am using Ruby On Rails building the [link:best e-learning system]www.eqenglish.com[/link].

Visit [link:here]http://github.com/zhangzhe[/link] to see more about my apps. Anything unclean please email me at gary20071226@gmail.com.

I will share in this blog about most of technique things I met and part of my personal life. Enjoy:)"
  end
end
