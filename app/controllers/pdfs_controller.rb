class PdfsController < ApplicationController
  def new 
    authorize
    @pdf = Pdf.new
  end
  
  def create
    authorize
    @pdf = Pdf.create(params[:pdf])
    redirect_to "/"
  end
end
