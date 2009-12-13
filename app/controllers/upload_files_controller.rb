class UploadFilesController < ApplicationController
  def create
    @upload_file = UploadFile.create(params[:upload_file].merge(:blog_group_id => params[:blog_group_id]))
    responds_to_parent do
      render(:update) do |page|
        page.insert_html :bottom, "files", :partial => "show", :locals => { :upload_file => @upload_file }
      end
    end
  end

  def index
    @blog_group = BlogGroup.find(params[:blog_group_id])
    @upload_files = @blog_group.upload_files
  end
end
