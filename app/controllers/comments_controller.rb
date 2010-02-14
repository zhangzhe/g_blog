class CommentsController < ApplicationController
  def create
    unless params[:comment][:name].blank? or params[:comment][:content].blank?
      @comment = Comment.create(params[:comment].merge(:blog_id => params[:blog_id]))
    end
    redirect_to :back
  end
  
  def index
    @comments = Comment.paginate(:all, :page => params[:page], :per_page => 20)
  end
  
  def destroy
    authorize
    Comment.find(params[:id]).destroy
    redirect_to :back
  end
end

