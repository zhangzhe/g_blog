class EnglishsController < ApplicationController
  def index
    save_locale(:en)
    redirect_to :back
  end
end
