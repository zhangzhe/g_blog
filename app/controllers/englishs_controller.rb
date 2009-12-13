class EnglishsController < ApplicationController
  def index
    @blogs = English.all
  end
end
