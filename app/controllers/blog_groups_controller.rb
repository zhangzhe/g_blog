class BlogGroupsController < ApplicationController
  def index
    @blog_groups = BlogGroup.all
  end

  def show
    @blog_group = BlogGroup.find(params[:id])
  end

  def new
    @blog_group = BlogGroup.create
    @blog_group.blogs << English.create
    @blog_group.blogs << Chinese.create
  end

  def edit
    @blog_group = BlogGroup.find(params[:id])
  end

  def update
    @blog_group = BlogGroup.find(params[:id])
    if @blog_group.update_attributes(params[:blog])
      flash[:notice] = 'BlogGroupy was successfully updated.'
      redirect_to(@blog_group) 
    else
      render :action => "edit"
    end
  end
end