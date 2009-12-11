class VersionsController < ApplicationController
  def update
    @version = Version.find(params[:id])
    if @version.update_attributes(params[:version])
      flash[:notice] = 'Blog was successfully updated.'
      redirect_to(@version.blog)
    else
      render :back
    end
  end
end
