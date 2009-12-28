class BlogGroupsController < ApplicationController
  def index
    @blog_groups = BlogGroup.paginate(:all, :page => params[:page], :per_page => 5, :order => "created_at DESC")
  end

  def list
    @blog_groups = BlogGroup.all
  end
  
  def destroy
    BlogGroup.find(params[:id]).destroy
    redirect_to :back
  end
  
  def all_content
  end
end
