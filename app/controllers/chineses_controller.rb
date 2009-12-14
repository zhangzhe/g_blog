class ChinesesController < ApplicationController
  def index
    save_locale(:zh)
    @blogs = Chinese.paginate(:all, :page => params[:page], :per_page => 5, :order => "created_at DESC")
  end
end
