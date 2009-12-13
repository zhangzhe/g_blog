class ChinesesController < ApplicationController
  def index
    @blogs = Chinese.all
  end
end
