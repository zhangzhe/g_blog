class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end
  
  def show
    @blog = Blog.find(params[:id])
    format.html
    format.xml 
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
    @example = "*b* =&gt; <b>b</b><br><i> </i> +i+ =&gt; <i>i</i><br><u> </u> _u_ =&gt; <u>u<br></u># h # =&gt; h<br>[red]red[/red] => <font color='#ff0000'>red<br></font>[blue]blue[/blue] => <font color='#0000ff'>blue</font><font color='#ff0000'><br></font>[green]green[/green] => <font color='#088a4b'>green</font><br>* list1<u><br></u>* list2<br>* list3 =&gt;<u><br></u><ul><li>list1</li><li>list2</li><li>list3</li></ul>picture: <br>[img:right]http://s3.amazonaws.com/recordings.idapted.com/upload_files/4/emacs.gif[/img] <br>link:<br>[link:i am strong]http://www.idapted.com[/link]"
  end
end

