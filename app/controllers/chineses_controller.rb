class ChinesesController < ApplicationController
  def index
    save_locale(:zh)
    redirect_to :back
  end
end
