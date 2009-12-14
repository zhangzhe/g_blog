class EnglishsController < ApplicationController
  def index
    save_locale(:en)
    @blogs = English.paginate(:all, :page => params[:page], :per_page => 5, :order => "created_at DESC")
  end
end
