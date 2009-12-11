
class UploadFilesController < ApplicationController
  def create
    @upload_file = UploadFile.create(params[:upload_file].merge(:blog_id => params[:blog_id]))
    responds_to_parent do
      render(:update) do |page|
        page.insert_html :bottom, "files", "#{@upload_file.public_filename.gsub("_", "\\_")}"
      end
    end
  end

  # in partial link_to_function image_tag(upload_file.public_filename, :size => "120x100"), "alert('[img]#{upload_file.public_filename.gsub("_", "\\\\\\_")}[/img]')"
  
  def index
    @upload_files = UploadFile.all
  end
end
