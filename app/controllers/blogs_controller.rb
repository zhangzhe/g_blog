class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.create
    CONFIG["version_types"].each do |version_type|
      @blog.versions.send("create_#{version_type}")
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(params[:blog])
      flash[:notice] = 'Blog was successfully updated.'
      redirect_to(@blog) 
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to(blogs_url) 
  end
  
  def example
    render :text => "chinese:

title:
title here

content:
content here

=====

english:

title:
title here

content:
content here"
  end
end

