class BlogGroupsController < ApplicationController
  def index
    @blog_groups = BlogGroup.paginate(:all, :page => params[:page], :per_page => 3, :order => "created_at DESC")
  end

  def destroy
    authorize
    BlogGroup.find(params[:id]).destroy
    redirect_to :back
  end
end
