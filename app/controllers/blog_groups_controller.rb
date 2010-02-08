class BlogGroupsController < ApplicationController
  def index
    @blog_groups = BlogGroup.all(:order => "created_at DESC", :limit => 30)
    render :layout => "print"
  end

  def destroy
    authorize
    BlogGroup.find(params[:id]).destroy
    redirect_to :back
  end
end
