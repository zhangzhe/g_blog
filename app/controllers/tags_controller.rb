# -*- coding: utf-8 -*-
class TagsController < ApplicationController
  def index
    @blogs = Blog.tagged_with(params[:q], :on => :tags).by_created_at
  end 
end




