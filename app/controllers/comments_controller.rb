class CommentsController < ApplicationController
  def create
    @comment = Comment.create(params[:comment].merge(:blog_id => params[:blog_id]))
    redirect_to :back
  end
end
