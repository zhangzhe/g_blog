# -*- coding: utf-8 -*-
class TagsController < ApplicationController
  def show
    @blogs = Blog.tagged_with(params[:id], :on => :tags)
  end
end
