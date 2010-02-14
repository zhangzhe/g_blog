class AdminsController < ApplicationController
  def index
    authorize
  end
end
