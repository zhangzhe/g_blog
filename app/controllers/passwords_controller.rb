class PasswordsController < ApplicationController
  def edit
    @password = Password.first
  end

  def update
    @password = Password.first.update_attributes(params[:password])
    redirect_to "/"
  end
end
