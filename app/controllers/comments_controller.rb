class CommentsController < ApplicationController
  def create
    unless params[:comment][:name].blank? or params[:comment][:content].blank?
      @comment = Comment.create(params[:comment].merge(:blog_id => params[:blog_id]))
    end
    redirect_to :back
  end
end

