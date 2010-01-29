class BlogsController < ApplicationController
  def index
    if @template.is_zh?
      @blogs = blogs_with_type(Chinese)
    elsif @template.is_en?
      @blogs = blogs_with_type(English)
    else
      @blogs = blogs_with_type(Blog)
    end
  end
  
  def blogs_with_type(type)
    type.paginate(:all, :conditions => "title is not null", :page => params[:page], :per_page => 5, :order => "created_at DESC")
  end
  
  def list
    @blogs = Blog.all
  end
  
  def show
    @blog = Blog.find(params[:id])
  rescue
    redirect_to blog_groups_path
  end

  def new
    authorize
    @blog_group = BlogGroup.create
    @blog = Blog.create
    @blog_group.blogs << @blog
  end

  def edit
    authorize
    @blog = Blog.find(params[:id])
    @tags = @blog.tag_list
    if @blog.content.blank?
      @blog.content = @blog.brother.content
    end
  end

  def update
    if admin?
      @blog = Blog.find(params[:id])
      if @blog.update_attributes(params[:blog])
        @blog.tag_list = params[:tag]; @blog.save!
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
    else
      authorize
    end
  end
  
  def example
    @example = "*b* =&gt; <b>b</b><br><i> </i> +i+ =&gt; <i>i</i><br><u> </u> _u_ =&gt; <u>u<br></u># h # =&gt; h<br>[red]red[/red] => <font color='#ff0000'>red<br></font>[blue]blue[/blue] => <font color='#0000ff'>blue</font><font color='#ff0000'><br></font>[green]green[/green] => <font color='#088a4b'>green</font><br>* list1<u><br></u>* list2<br>* list3 =&gt;<u><br></u><ul><li>list1</li><li>list2</li><li>list3</li></ul>picture: <br>[img:right]http://s3.amazonaws.com/recordings.idapted.com/upload_files/4/emacs.gif[/img] <br>link:<br>[link:i am strong]http://www.idapted.com[/link]"
  end
  
  def reset_locale
    I18n.locale = :all
    save_locale(:all)
    redirect_to "/"
  end
end

