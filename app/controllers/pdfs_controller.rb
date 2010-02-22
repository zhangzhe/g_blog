class PdfsController < ApplicationController
  before_filter :authorize, :only => [:new, :create]

  def new 
    @pdf = Pdf.new
  end
  
  def create
    @pdf = Pdf.create(params[:pdf])
    redirect_to "/"
  end
end
