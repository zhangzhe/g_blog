class BlogsController < ApplicationController
  def show
    @blog = Blog.find(params[:id])
  rescue
    redirect_to blog_groups_path
  end

  def new
    @blog_group = BlogGroup.create
    @blog = Blog.create
    @blog_group.blogs << @blog
  end

  def edit
    @blog = Blog.find(params[:id])
    if @blog.content.blank?
      @blog.content = @blog.brother.content
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(params[:blog])
      if @blog["type"].nil? # means the first time create
        if @blog.title =~ /[\xa0-\xff]/
          @blog.type = "Chinese"
          @blog.blog_group.english = English.create
        else
          @blog.type = "English"
          @blog.blog_group.chinese = Chinese.create 
        end
        @blog.save!; @blog.reload
      end
      redirect_to blog_path(@blog) 
    else
      render :action => "edit"
    end
  end
  
  def example
    render :text => "
** => b
_ _ => i
+ + => u
*  => list
[img:right]url[/img]
[f1] [/f1]
[red][/red]
[link:i am strong]http://www.idapted.com[/link]"
  end
end

